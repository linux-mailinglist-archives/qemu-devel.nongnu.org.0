Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B424F9F8A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 00:19:34 +0200 (CEST)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncwx2-0002O3-VH
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 18:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.zhang2@samsung.com>)
 id 1ncwux-0001cU-6r
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 18:17:23 -0400
Received: from mailout2.w2.samsung.com ([211.189.100.12]:13787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.zhang2@samsung.com>)
 id 1ncwuu-00043j-TV
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 18:17:22 -0400
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20220408221712usoutp023384d1b2b9e043e01995fe95afbd837a~kC7RZ4NZZ0503205032usoutp02G;
 Fri,  8 Apr 2022 22:17:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20220408221712usoutp023384d1b2b9e043e01995fe95afbd837a~kC7RZ4NZZ0503205032usoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649456232;
 bh=1ZjvoENIycjky5C3cXuao6J9XyheLQrjNGLqV80MRCw=;
 h=From:To:CC:Subject:Date:References:From;
 b=lg0dD54EAINgJD6dVIa3KU9UNqej0M0QJrRkf4w5vIikzZ1i54SRr8T10E6h8QVQW
 VNYVYz2Ax3lOhA0+iKu9ofT6IXYCjk7dhvzMZYWuYxYnX86NZcdlgAwY3J8OOvVFEL
 iymKMgxfnh75Pz/zHFXKSese0gRJZhuNe6YYe3qQ=
Received: from ussmges2new.samsung.com (u111.gpu85.samsung.co.kr
 [203.254.195.111]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220408221712uscas1p2eabd510fb75e173a34976d930516e80e~kC7Q_IT-n1844518445uscas1p2v;
 Fri,  8 Apr 2022 22:17:12 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges2new.samsung.com (USCPEMTA) with SMTP id 7C.96.09642.864B0526; Fri, 
 8 Apr 2022 18:17:12 -0400 (EDT)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220408221711uscas1p2d64b2adae902cc51d328882980fbc50b~kC7Qq3g2w2064620646uscas1p2X;
 Fri,  8 Apr 2022 22:17:11 +0000 (GMT)
X-AuditID: cbfec36f-bfdff700000025aa-87-6250b46851c6
Received: from SSI-EX2.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id B2.36.09672.764B0526; Fri, 
 8 Apr 2022 18:17:11 -0400 (EDT)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX2.ssi.samsung.com (105.128.2.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2242.4; Fri, 8 Apr 2022 15:17:11 -0700
Received: from SSI-EX2.ssi.samsung.com ([fe80::2149:7df2:31b5:d9a0]) by
 SSI-EX2.ssi.samsung.com ([fe80::719f:92d1:f17f:5400%4]) with mapi id
 15.01.2242.008; Fri, 8 Apr 2022 15:17:11 -0700
From: Tong Zhang <t.zhang2@samsung.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 "David Hildenbrand" <david@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH] hw/dma: fix crash caused by race condition
Thread-Topic: [PATCH] hw/dma: fix crash caused by race condition
Thread-Index: AQHYS5ZkVMtIe81jHEmRve4sseIikw==
Date: Fri, 8 Apr 2022 22:17:10 +0000
Message-ID: <20220408221701.9081-1-t.zhang2@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGvTPDdEDbDBXtEYjBaqJQW5conURjiPJQfVCMMSTEBAqM7AVb
 Ky4ExOCGuCX2wbpgkSLSIoQ2BAQLLbiAilsAadxqcEEMSyJbtVXoYMLb/+d855z/nlwKF+r8
 gqk01UFWrVJmiskAov7R2AtpqjUmcW3Nl/nMWI0bZ57U2XGmpd7rx1hbxnnM4/MNBNPx4wUZ
 RSpavxt4ikb9e56iv8eCKYZt3WQMERewOZnNTDvEqtdsSQhIvfErPcfif9hQLjiO+njFyJ8C
 egO8PNNFFKMASkjfRfDVU4tx5iQGRabn6D9lHXjm00K6GkF1ex4HjSBw9V7kcaYFwbXmFh9F
 0ivBfbaMnCkE0S4EgxcqyZkCThfAlSkrNqMX0ptA12TwNQTRUXB/eBDjtAysRo/fjCboFXCy
 4YdP82kGGnQ1Ph7Ri2Gi04xxM0Xg7C/FuKiBUHatGef0YvDed5GcXgYfJwZ4HC+Dt7ors3kk
 UGEYxLn5gdBxtZ/g+CVgr3zrOwzQNygwtjdPN1PTJhpab9IcEwKe9xWzewvgqnMScXwJAnN7
 zeyFN4H7YfPsYgF43J8RN4cPZ04JLyGxfs4T9HPi6efE08+JdwsRVUik1WiyUljNehWbK9Mo
 szRaVYosKTurDk3/nKfetuwG1OsclTkQRiEHAgoXB/GZxJhEIT9ZeeQoq86OV2szWY0DhVCE
 WMSvSKtVCukU5UE2g2VzWPX/Kkb5Bx/HcHu0OdmoGrGYvAmTI1G5wSUCaWh+dvyjJkFM/ryM
 bz2WHegBuzRae/nWif2hp8gvAiYvNrDbFHu7uIpvXf277fevNumdUuvYgonciBMHyicagzHj
 15feB9ffEB2Pt5eKPhXZbfJRwc5JzCZXLZI45eG0re/vmp1mXVhEmIMZc2Y4Qy2u4cJXdE/f
 RpcrMvPD6YHGqu48x7vxe5KePVp5f9ifrnTpw3ND7r22bSZXpO3Q7pLOOI9hq73r2Pbqj/Z2
 7VKzdIPdtMsevsqzFYpUf8tEC48URveFFi5v3Xczd0o3bgzZZfj0OjmpoGnoj1chSZzaFndB
 LkE/P98uFROaVOW6CFytUf4De6JX76gDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWS2cA0UTd9S0CSwb5FxhZf1/9itjix6SCz
 xf5t/1gttuz/xm5xvHcHi8XJV+fZHNg8DrxYyO6xc9Zddo8n1zYzebzfd5UtgCWKyyYlNSez
 LLVI3y6BK2Pul6yCzZwVC5fwNTDeZO9i5OSQEDCR2PLyDGMXIxeHkMBqRokpex5BOR8YJVbM
 msYC4exnlHjw7h1YC5uAusSvzkVsIAkRgfuMEo92T2UGSTAL1EtM+bmFCcQWFrCWmLp7ISOI
 LSLgILHr/WsmCFtPYsvSv6wgNouAikTrjldgNq+AhcSOqevB6hkFxCS+n1rDBDFTXOLWk/lM
 ELcKSCzZc54ZwhaVePn4HyuErShx//tLdoh6PYkbU6ewQdjaEssWvmaGmC8ocXLmExaIekmJ
 gytusExgFJ2FZMUsJO2zkLTPQtK+gJFlFaN4aXFxbnpFsVFearlecWJucWleul5yfu4mRmCk
 nf53OHoH4+1bH/UOMTJxMB5ilOBgVhLhtUgKSBLiTUmsrEotyo8vKs1JLT7EKM3BoiTO+zJq
 YryQQHpiSWp2ampBahFMlomDU6qBaVbDIoujyayXWl2XKP5gX8Ad4G+bIzHRJ9+u4IPT5kkB
 nZeN15g+uxpzz9Tyq9tEkbX+RfxCr8refC5ec/7yVq7Z7fka/W2rLlSfCmgILb+UucwhxUTE
 5uMLqXlfTskYTNAvnX31iHzd9wwnFotTb/im+HYYN/+Nv3+jb+3ioA7ei08DOdcr9Z20MwyP
 59b7+CXqxA/dSRsXL/go+39r+RKW3DzdT1OaeqtfesivvJrwYaVo0rl3XXFxU39WXDl1uSAi
 k01nUZq85+ZfUw9+K8/nWlnk/7eeQeGzATvH4ikzazq/CW399rJDYdmhk2Vi20s2SX57XL+j
 8E7avxc5snFLeNREq+TYLk7m5/z6XYmlOCPRUIu5qDgRAKU34O4jAwAA
X-CMS-MailID: 20220408221711uscas1p2d64b2adae902cc51d328882980fbc50b
CMS-TYPE: 301P
X-CMS-RootMailID: 20220408221711uscas1p2d64b2adae902cc51d328882980fbc50b
References: <CGME20220408221711uscas1p2d64b2adae902cc51d328882980fbc50b@uscas1p2.samsung.com>
Received-SPF: pass client-ip=211.189.100.12; envelope-from=t.zhang2@samsung.com;
 helo=mailout2.w2.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "ztong0001@gmail.com" <ztong0001@gmail.com>,
 Francisco Londono <f.londono@samsung.com>, Tong Zhang <t.zhang2@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

assert(dbs->acb) is meant to check the return value of io_func per
documented in commit 6bee44ea34 ("dma: the passed io_func does not
return NULL"). However, there is a chance that after calling
aio_context_release(dbs->ctx); the dma_blk_cb function is called before
the assertion and dbs->acb is set to NULL again at line 121. Thus when
we run assert at line 181 it will fail.

  softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.

Reported-by: Francisco Londono <f.londono@samsung.com>
Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
---
 softmmu/dma-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7820fec54c..cb81017928 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
     aio_context_acquire(dbs->ctx);
     dbs->acb =3D dbs->io_func(dbs->offset, &dbs->iov,
                             dma_blk_cb, dbs, dbs->io_func_opaque);
-    aio_context_release(dbs->ctx);
     assert(dbs->acb);
+    aio_context_release(dbs->ctx);
 }
=20
 static void dma_aio_cancel(BlockAIOCB *acb)
--=20
2.25.1

