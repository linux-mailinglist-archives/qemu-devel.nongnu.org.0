Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B2547FDD8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 15:42:33 +0100 (CET)
Received: from localhost ([::1]:60988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1rCp-0000T8-OQ
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 09:42:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.kazmin@partner.samsung.com>)
 id 1n1pT6-0002Qo-5O
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 07:51:12 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.kazmin@partner.samsung.com>)
 id 1n1pT2-0005rW-IT
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 07:51:11 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211227125058euoutp025934657174a4864a14e9a6b33358af93~EnZwrwCPO2860428604euoutp02c
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 12:50:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211227125058euoutp025934657174a4864a14e9a6b33358af93~EnZwrwCPO2860428604euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1640609458;
 bh=P1jnLjMFIPHl7R+pVsMAsZ5x/hJ/ni538KaFVznOeTI=;
 h=From:To:Subject:Date:References:From;
 b=bdEmsgQukIv/79QfeM7g9fPtKBFMdhbjRiSuqBymT1WQw0w3xu7syJkihEsm/Esw5
 K87zDxkPZqjyapR4HogR6LelZl8KE5QnAQmVkPtqAe6hPhwoI1Gc9IgsYDF/VL2b7q
 bsbXXBprDA3pSzBmj6oR9Amu5CR4/fNVPAm5NYvc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211227125058eucas1p240ca9bfe6a7988169ee4231a30e5bca0~EnZwa6SZN2207122071eucas1p2P;
 Mon, 27 Dec 2021 12:50:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D6.DA.10260.2B6B9C16; Mon, 27
 Dec 2021 12:50:58 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211227125057eucas1p14ebd7c0d73df4a25abc40bfa3fe0c3f2~EnZwGl1hq2933129331eucas1p1a;
 Mon, 27 Dec 2021 12:50:57 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211227125057eusmtrp20278e83596d95b7c9cc77382d8d2e1d5~EnZwGB-Vg1787817878eusmtrp2E;
 Mon, 27 Dec 2021 12:50:57 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-09-61c9b6b2efde
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D3.F3.09404.1B6B9C16; Mon, 27
 Dec 2021 12:50:57 +0000 (GMT)
Received: from akazmin.rnd.samsung.ru (unknown [106.109.128.7]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211227125057eusmtip1be81d9ff70d44d4b95caa918e26189bd~EnZvymKxt1890118901eusmtip1W;
 Mon, 27 Dec 2021 12:50:57 +0000 (GMT)
From: Andrey Kazmin <a.kazmin@partner.samsung.com>
To: a.kazmin@partner.samsung.com, qemu-devel@nongnu.org
Subject: [PATCH] linux-user/syscall.c: fix missed flag for shared memory in
 open_self_maps
Date: Mon, 27 Dec 2021 15:50:48 +0300
Message-Id: <20211227125048.22610-1-a.kazmin@partner.samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsWy7djP87qbtp1MNFgwl9Ni7+5lbBbHe3ew
 ODB5PLm2mcnj4Ls9TAFMUVw2Kak5mWWpRfp2CVwZbx9/ZCs4xlExbdIktgbGx6xdjJwcEgIm
 Els//GTsYuTiEBJYwSjxe/43FgjnC6PExz3/oDKfGSWOLp7HAtOy8thnqMRyRolb6yexw7Vc
 e7SQHaSKTcBI4uOUU2AdIgLmEttaNoDFhQViJM72tzOC2CwCqhIn1u5h62Lk4OAVcJSYN0cK
 YoG8xOoNB5hBZkoIbGOXeLv1CDNEwkXi6LYb7BC2sMSr41ugbBmJ/zvnM0HY1RLrFxxhh2hu
 YZTovnEH6mx7ia77Dewgy5gFNCXW79KHCDtK3Fr2lgUkLCHAJ3HjrSBImBnInLRtOjNEmFei
 o00IolpL4umV3WwQtoTEwe3HoTo9JD7PBisREoiV2HvsE+sERtlZCKsWMDKuYhRPLS3OTU8t
 Ns5LLdcrTswtLs1L10vOz93ECIzR0/+Of93BuOLVR71DjEwcjIcYJTiYlUR4fy08kSjEm5JY
 WZValB9fVJqTWnyIUZqDRUmcNzlzQ6KQQHpiSWp2ampBahFMlomDU6qByYhlpbJ61pa7fXOv
 +iUmuF1p+7fu9mxpf4OL/y6dnNWx+ebr/WuTDdiepTj+/hO8YrPWjg6lL8cT1SRnZqQdDPzj
 X3n1u3KEktuDo/PXhsrs/svR3z5x39ZHoYc3N+i0BCv9OlwnsPPD9cgcznWMQk8Zyg9e/OZy
 Kiamty9xj9LXMy+970+Vi9c58O5i6BPNiu9Xvn5antfHVT3pf8HHtEKNXTnKB+osGByPyM3/
 VJfPaXF68ZXJCp9FquoOKT8/w+iwbmXRHVOPVXwHAtJEfwU+y7rasfze03d/nnQVl1/Je/xV
 fImZnn1X2+qnVceqRBrW7I7rtG8Pursq63bUx7o1Jh58j9/NuX1MMvnWglQlluKMREMt5qLi
 RACUbJVBQAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmluLIzCtJLcpLzFFi42I5/e/4Xd2N204mGry7aGKxd/cyNovjvTtY
 HJg8nlzbzORx8N0epgCmKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTub
 lNSczLLUIn27BL2Mt48/shUc46iYNmkSWwPjY9YuRk4OCQETiZXHPjN2MXJxCAksZZTYfvEo
 C0RCQuJhy26oImGJP9e62CCKPjFKrD52ihkkwSZgJPFxyimgBg4OEQFLickrPUHCwgJRElf+
 XwbrZRFQlTixdg8bSAmvgKPEvDlSECPlJVZvOMA8gZF7ASPDKkaR1NLi3PTcYiO94sTc4tK8
 dL3k/NxNjMDQ2Hbs55YdjCtffdQ7xMjEwXiIUYKDWUmE99fCE4lCvCmJlVWpRfnxRaU5qcWH
 GE2B1k1klhJNzgcGZ15JvKGZgamhiZmlgamlmbGSOK9nQUeikEB6YklqdmpqQWoRTB8TB6dU
 A5Or8Ymk7wHvgrzNlohJd/Ukh8VGip11v8HaFdzIJLK2OcO949MptlJbz1s6P8VWtN3YebTi
 yrpJrrWrT5/Y51TNtHDeVv4vy5InXE+qXx510oxvxd3ZogYG5XYhXCsr2EUcbsqr92++H7/Y
 sOWo4LGV3gu0OazCLyvt4/P8xbFrsp5l6qWIYAGfzR25HwMfiT8Q5i2YHapYr/AqK8Z07nEr
 u5VZF7WY1z3zevF1Wth2jnVnlmyVfrdowoQIzRTXHYEZd5Y9a3HeXnIoXCRg/uFWxqgU95LP
 cavKuAX2y52xYPfgv3ui1/7jQ98FLcxNnmJXijzUnFJtCi4kxJ+Qfn3xjdtaqVzvvDX/F7se
 V2Ipzkg01GIuKk4EALJtaQKWAgAA
X-CMS-MailID: 20211227125057eucas1p14ebd7c0d73df4a25abc40bfa3fe0c3f2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211227125057eucas1p14ebd7c0d73df4a25abc40bfa3fe0c3f2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211227125057eucas1p14ebd7c0d73df4a25abc40bfa3fe0c3f2
References: <CGME20211227125057eucas1p14ebd7c0d73df4a25abc40bfa3fe0c3f2@eucas1p1.samsung.com>
Received-SPF: pass client-ip=210.118.77.12;
 envelope-from=a.kazmin@partner.samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.575,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 27 Dec 2021 09:39:25 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The possible variants for region type in /proc/self/maps are either
private "p" or shared "s". In the current implementation,
we mark shared regions as "-". It could break memory mapping parsers
such as included into ASan/HWASan sanitizers.

Signed-off-by: Andrey Kazmin <a.kazmin@partner.samsung.com>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 56a3e17183..2199a98725 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7790,7 +7790,7 @@ static int open_self_maps(void *cpu_env, int fd)
                             (flags & PAGE_READ) ? 'r' : '-',
                             (flags & PAGE_WRITE_ORG) ? 'w' : '-',
                             (flags & PAGE_EXEC) ? 'x' : '-',
-                            e->is_priv ? 'p' : '-',
+                            e->is_priv ? 'p' : 's',
                             (uint64_t) e->offset, e->dev, e->inode);
             if (path) {
                 dprintf(fd, "%*s%s\n", 73 - count, "", path);
-- 
2.17.1


