Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEA0512420
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 22:52:49 +0200 (CEST)
Received: from localhost ([::1]:42510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njoeV-0006rJ-Mp
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 16:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.zhang2@samsung.com>)
 id 1njodH-0005UY-40
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 16:51:31 -0400
Received: from mailout2.w2.samsung.com ([211.189.100.12]:12947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.zhang2@samsung.com>)
 id 1njodE-0006L7-Of
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 16:51:30 -0400
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20220427205119usoutp02780d06f4ec838e0a4d42b97c23bfc7ae~p3As-lBsV1768317683usoutp02s;
 Wed, 27 Apr 2022 20:51:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20220427205119usoutp02780d06f4ec838e0a4d42b97c23bfc7ae~p3As-lBsV1768317683usoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651092679;
 bh=1ZjvoENIycjky5C3cXuao6J9XyheLQrjNGLqV80MRCw=;
 h=From:To:CC:Subject:Date:References:From;
 b=CQChLbzd83YRUZdhe9AZJ711a4jGgCUFl0WJrPulfUxb7uA0yBZuBZCXomRbj3FPZ
 EuFPU20UrQkS3PozzvNIKg4/8IMT7QOasuoXzcU252EuriDXgYOOvSUWo9Yey4kz/n
 RSfQRZW/Z9U+GOmFQF+PpnJr08+fGGehgU/wIJBo=
Received: from ussmges2new.samsung.com (u111.gpu85.samsung.co.kr
 [203.254.195.111]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220427205119uscas1p1696e3b8373d0b2c870d4ed654de1c438~p3Asxrvsd3007830078uscas1p1Z;
 Wed, 27 Apr 2022 20:51:19 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges2new.samsung.com (USCPEMTA) with SMTP id 17.12.09642.6CCA9626; Wed,
 27 Apr 2022 16:51:18 -0400 (EDT)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220427205118uscas1p25031437c0cdd4363c104be13033f366a~p3AsehjhJ0860508605uscas1p2K;
 Wed, 27 Apr 2022 20:51:18 +0000 (GMT)
X-AuditID: cbfec36f-bfdff700000025aa-fb-6269acc632c0
Received: from SSI-EX1.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id F9.2B.09672.6CCA9626; Wed,
 27 Apr 2022 16:51:18 -0400 (EDT)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX1.ssi.samsung.com (105.128.2.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.7; Wed, 27 Apr 2022 13:51:17 -0700
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.007; Wed,
 27 Apr 2022 13:51:17 -0700
From: Tong Zhang <t.zhang2@samsung.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 "David Hildenbrand" <david@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [RESEND PATCH] hw/dma: fix crash caused by race condition
Thread-Topic: [RESEND PATCH] hw/dma: fix crash caused by race condition
Thread-Index: AQHYWniKypkF9nYUvE6RL9M74aeBpw==
Date: Wed, 27 Apr 2022 20:51:17 +0000
Message-ID: <20220427205056.2522-1-t.zhang2@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djX87rH1mQmGbSstrL4uv4Xs8WJTQeZ
 LfZv+8dqsWX/N3aL4707WCxOvjrP5sDmceDFQnaPnbPusns8ubaZyeP9vqtsASxRXDYpqTmZ
 ZalF+nYJXBlzv2QVbOasWLiEr4HxJnsXIweHhICJxJx+4y5GTg4hgZWMEj97OLoYuYDsViaJ
 x8tPsIAkQGpOP1/PCJFYyyjx4dl0KOcjo8TGUwuZIZxljBKdTyYwg7SwCahL/OpcxAaSEBF4
 yCjxum8FG0iCWaBeYsrPLUwgtrCAk8T6uS1gtoiAu8SdY++gbD2JnqV7wepZBFQlzs6cwA5i
 8wpYSDy71QhmMwqISXw/tYYJYqa4xK0n85kgbhWUWDR7DzOELSbxb9dDNghbUeL+95fsEPV6
 EjemToG6R1ti2cLXzBDzBSVOznwC9bOkxMEVN6DsmRwSXc/rIGwXiV8LP0DNlJb4e3cZ1N56
 iZm3foCDRUKgh1FizZH17BAJa4lfR/dALeaT+PvrESMk4HklOtqEJjAqzULywiwk581Cct4s
 JOctYGRZxSheWlycm55abJSXWq5XnJhbXJqXrpecn7uJEZhwTv87nL+D8fqtj3qHGJk4GA8x
 SnAwK4nwftmdkSTEm5JYWZValB9fVJqTWnyIUZqDRUmcd1nmhkQhgfTEktTs1NSC1CKYLBMH
 p1QDk638aZOojjCpue4tWkmTmPOqp588ct79Fs+60+ki3tKSx+4eW84UlD7No8IyyvjFyq/T
 tpyrKWoJtnufrnJg0k1ulRQf3naH+lKDl7Vvj/1/EvtH4EXnv6gfuuv9I7+fXPCYuWtm+grH
 VR4bFbWe/op9M9380s4t/zOiNS/mrNqdzl69ft3r2lXv5oT5Kfeuz3tieHXnrPevy163sdpx
 3P3YJHZF/orQYvFZNa2vJ55lzJ7nYXRo/7tjbvO05NacPveFrezjySRbSwXxwJgzlj7LN+z+
 9v+VsY9X/ZSw1ux/jzVOKa4Xjc595fYn0f+G848tS0+UP3rhIL7Wek24bcauuSw6W07+LQr5
 4uvxT1GJpTgj0VCLuag4EQDeQAXapwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWS2cA0UffYmswkgw3L1Cy+rv/FbHFi00Fm
 i/3b/rFabNn/jd3ieO8OFouTr86zObB5HHixkN1j56y77B5Prm1m8ni/7ypbAEsUl01Kak5m
 WWqRvl0CV8bcL1kFmzkrFi7ha2C8yd7FyMkhIWAicfr5esYuRi4OIYHVjBIH/yxig3A+Mkrs
 Ov8NKrOMUWL6lj3MIC1sAuoSvzohqkQE7jNKPNo9FSzBLFAvMeXnFiYQW1jASWL93BYwW0TA
 XeLOsXdQtp5Ez9K9bCA2i4CqxNmZE8Du4BWwkHh2qxHMZhQQk/h+ag0TxExxiVtP5jNB3Cog
 sWTPeWYIW1Ti5eN/rBC2osT97y/ZIer1JG5MncIGYWtLLFv4mhlivqDEyZlPWCDqJSUOrrjB
 MoFRdBaSFbOQtM9C0j4LSfsCRpZVjOKlxcW56RXFRnmp5XrFibnFpXnpesn5uZsYgZF2+t/h
 6B2Mt2991DvEyMTBeIhRgoNZSYT3y+6MJCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8L6MmxgsJ
 pCeWpGanphakFsFkmTg4pRqYPL7c8p3Hn5X0yENUqPh4YNKOEwm80zRv3z6xJmH5Tvej9k3l
 oSt3h5fVnfvW7/eCQ1E38bl/+rrUSuGbVwyPsR12WLaJXzrtsfDDcq3/fRMDlZwrtZ5Mmc19
 lFvytKfKJmG1P2emvO3Vu9P1iqPHM8v3iU/ZKrX46A+cqUu3Lr4VIPL65pkLK1/x/Utb92hi
 Wg3fyTuMk7u/v/tvvmxvnfthmYnP3Mq9m3y2CWxckpCbn7ImxOzsRwbjw/9upai1Nk+PnemS
 53fl8aaMjS/Kbuyz4bTmZVguFrn5rvpy9wb2+sjZ6X/abWV9TTP8f+Zza6q1t8/xiz22yHNH
 WJpT1OIHLxl/RvK5G7EvkDdQYinOSDTUYi4qTgQA6PPzISMDAAA=
X-CMS-MailID: 20220427205118uscas1p25031437c0cdd4363c104be13033f366a
CMS-TYPE: 301P
X-CMS-RootMailID: 20220427205118uscas1p25031437c0cdd4363c104be13033f366a
References: <CGME20220427205118uscas1p25031437c0cdd4363c104be13033f366a@uscas1p2.samsung.com>
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

