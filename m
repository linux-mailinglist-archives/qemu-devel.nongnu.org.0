Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A1451DDA6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 18:32:44 +0200 (CEST)
Received: from localhost ([::1]:45086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn0sl-0001yW-4m
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 12:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.zhang2@samsung.com>)
 id 1nn0rP-0000Xp-FP; Fri, 06 May 2022 12:31:20 -0400
Received: from mailout1.w2.samsung.com ([211.189.100.11]:33609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.zhang2@samsung.com>)
 id 1nn0rN-0006NW-QY; Fri, 06 May 2022 12:31:19 -0400
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
 by mailout1.w2.samsung.com (KnoxPortal) with ESMTP id
 20220506163107usoutp01930c52429bf46083e9bf0fc19903b83f~skRF_Q1SV0869808698usoutp01b;
 Fri,  6 May 2022 16:31:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w2.samsung.com
 20220506163107usoutp01930c52429bf46083e9bf0fc19903b83f~skRF_Q1SV0869808698usoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651854667;
 bh=1ZjvoENIycjky5C3cXuao6J9XyheLQrjNGLqV80MRCw=;
 h=From:To:CC:Subject:Date:References:From;
 b=VwLfa3iUiQ9qpKKd0b4ZIq5GXwaMAegU9ElWXGL0V4NpYCK0zW/U40rq6qIjKQDGY
 YR8I8AdpM5/nuzRcLWlvLFlRVjp+K/zqjDOpBKi1dvDMYjUaXob1x1zVayZs/3627b
 jF/+3PKfQ0ifi/n0qKJHchxDPjlKoq9GaQcIbgFQ=
Received: from ussmges3new.samsung.com (u112.gpu85.samsung.co.kr
 [203.254.195.112]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220506163107uscas1p1255299366ad933575db61d7e2dc23178~skRFaS9yi3044830448uscas1p1B;
 Fri,  6 May 2022 16:31:07 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges3new.samsung.com (USCPEMTA) with SMTP id 58.97.09749.A4D45726; Fri, 
 6 May 2022 12:31:06 -0400 (EDT)
Received: from ussmgxs1new.samsung.com (u89.gpu85.samsung.co.kr
 [203.254.195.89]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220506163106uscas1p20aa8ba0a290a9b50be54df6ec4f9cee0~skRFDtAsx1463714637uscas1p2t;
 Fri,  6 May 2022 16:31:06 +0000 (GMT)
X-AuditID: cbfec370-a83ff70000002615-23-62754d4a7f7f
Received: from SSI-EX3.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs1new.samsung.com (USCPEXMTA) with SMTP id 1F.8D.52349.A4D45726; Fri, 
 6 May 2022 12:31:06 -0400 (EDT)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX3.ssi.samsung.com (105.128.2.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.7; Fri, 6 May 2022 09:31:05 -0700
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.007; Fri,
 6 May 2022 09:31:05 -0700
From: Tong Zhang <t.zhang2@samsung.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 "David Hildenbrand" <david@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "ztong0001@gmail.com" <ztong0001@gmail.com>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>, Tong Zhang <t.zhang2@samsung.com>, "Francisco
 Londono" <f.londono@samsung.com>
Subject: [RESEND PATCH] hw/dma: fix crash caused by race condition
Thread-Topic: [RESEND PATCH] hw/dma: fix crash caused by race condition
Thread-Index: AQHYYWauxUs3tXrAZkiwq8GTgHSRFw==
Date: Fri, 6 May 2022 16:31:05 +0000
Message-ID: <20220506163059.2517-1-t.zhang2@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djX87pevqVJBs/um1l8Xf+L2eLEpoPM
 Fvu3/WO12LL/G7vF8d4dLBZrz8xltTj56jybA7vHgRcL2T12zrrL7vHk2mYmj/f7rrIFsERx
 2aSk5mSWpRbp2yVwZcz9klWwmbNi4RK+Bsab7F2MnBwSAiYSp64/Z+5i5OIQEljJKNHb8YQJ
 wmllkmi8f4gNpmrRw42sILaQwFpGidv7nCDsD4wSC+9EQDQsZZQ4duMNC0iCTUBd4lfnIjaQ
 hIjAQ0aJ130rwBxmgR2MEmu+/gRbLizgJLF+bgsTiC0i4C5x59g7KFtP4vO/TkYQm0VARWJJ
 w3awOK+AhcSs5vlgNqOAmMT3U2vAbGYBcYlbTyDiEgKCEotm72GGsMUk/u16CPWCosT97y/Z
 Ier1JG5MncIGYWtLLFv4mhlivqDEyZlPWCDqJSUOrrjBAnK0hMBSDombU2+xQiRcJHZ8a4Qa
 Ki1x9fpUqGX1EjNv/WCEaOgB+vLIemgQW0v8OroHajOfxN9fj4CKOIDivBIdbUITGJVmIflh
 FpL7ZiG5bxaS+xYwsqxiFC8tLs5NTy02zkst1ytOzC0uzUvXS87P3cQITD+n/x0u2MF469ZH
 vUOMTByMhxglOJiVRHiFZ5UkCfGmJFZWpRblxxeV5qQWH2KU5mBREuddlrkhUUggPbEkNTs1
 tSC1CCbLxMEp1cCU99Nn+qYGx/5rk1T0qtqNlz/LTJ27csl+I6NTZzLqr1u9a7/l93ZqQ8Vz
 jcyWG7s8lhgFLjnRHDsjJWxbWsOUoJ5ZGx77r1++/4jwvT7LLeGtMi4X+asP/vywtTTgtf4h
 h/LTU4J+rq4Pe3D66arLO2+6TZ9/U1uuxMZv1qMKp/x9wjq6AWvOzA7dUM3mnxE1r8S77bOq
 rev8vZVuErGZuyceWLS0pNPBPCK26coxAUmFycZPz+ZXL1/mmR9p1e+zv8x0+90ndrOFfD75
 1sd7uauHuXkYF62X6lFYscHh2y+GXYtNZV+svW6eGeuTdKvQtvvjVuf7rTV+UxruH7+e+CaI
 rdlWyCRSxPPjqwAlluKMREMt5qLiRABKqMIDrgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsWS2cA0UdfLtzTJ4PRnZYuv638xW5zYdJDZ
 Yv+2f6wWW/Z/Y7c43ruDxWLtmbmsFidfnWdzYPc48GIhu8fOWXfZPZ5c28zk8X7fVbYAligu
 m5TUnMyy1CJ9uwSujLlfsgo2c1YsXMLXwHiTvYuRk0NCwERi0cONrF2MXBxCAqsZJe58v8QI
 4XxglNi2dBaUs5RRomnaYWaQFjYBdYlfnYvYQBIiAvcZJR7tnsoM4jAL7GCUWPP1J9hgYQEn
 ifVzW5hAbBEBd4k7x95B2XoSn/91MoLYLAIqEksatoPFeQUsJGY1zwezGQXEJL6fWgNmMwuI
 S9x6AhGXEBCQWLLnPDOELSrx8vE/VghbUeL+95fsEPV6EjemTmGDsLUlli18zQwxX1Di5Mwn
 LBD1khIHV9xgmcAoOgvJillI2mchaZ+FpH0BI8sqRvHS4uLc9Ipiw7zUcr3ixNzi0rx0veT8
 3E2MwKg7/e9w5A7Go7c+6h1iZOJgPMQowcGsJMIrPKskSYg3JbGyKrUoP76oNCe1+BCjNAeL
 kjivkOvEeCGB9MSS1OzU1ILUIpgsEwenVAPTRr4FakFhU31mRsSFJKy53l3e/H7H84D/G49Z
 sid1sPn8qb/NzH6k2sBQfruBpMEJ5ocBGcaSZpGlSz9nzjjClfP1WqvKtukVdnX6y99p9ku4
 vRW/tPpDfX7ma+3mE6btjYyxy0+vO9Il63NB2Wq3ue1xho2H85e+DdGe/ebWV11/q+/fl6ox
 WfffEkw4o3bxcdX3vjxmHZn3i7hYJ4tzcu+Ve87U1RJ/34jd/57R05lpv+3mvss8NDFeIMll
 xt+D19Z/qVukoPYs9OS3oAsbdy68Vy81UzPZ5xrDDeEveo0/rwnnb+QSmGagmlNUGMNT8t50
 GSfvRIdzPY5tuTfWNBgz3VFLfqgR4CotPkWJpTgj0VCLuag4EQA3JR/2KQMAAA==
X-CMS-MailID: 20220506163106uscas1p20aa8ba0a290a9b50be54df6ec4f9cee0
CMS-TYPE: 301P
X-CMS-RootMailID: 20220506163106uscas1p20aa8ba0a290a9b50be54df6ec4f9cee0
References: <CGME20220506163106uscas1p20aa8ba0a290a9b50be54df6ec4f9cee0@uscas1p2.samsung.com>
Received-SPF: pass client-ip=211.189.100.11; envelope-from=t.zhang2@samsung.com;
 helo=mailout1.w2.samsung.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

