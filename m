Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792FA6242FB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:11:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7LE-0006vE-Fs; Thu, 10 Nov 2022 08:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot7L0-0006pr-Qf
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:11:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot7Ky-0005Ye-AT
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668085879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=v3gw2G1IKycHc6COf+xO6RDQKjVqpoUfJQ2fqEx2HX8=;
 b=Cwm7r2ZpHZaqgLBjgfORGgEBYDdFEcm6BhpsK5M+wTjQ6A3X+VBg+2vSAH5QAsvtYvlzr8
 eLx3QSyqsCXnNiP7vhRGTRkWqJ7Ly8F2+F6xcF34x98HNbP9qXOFDiWhSlas+hBu1bjfA5
 m5OMGaFznh+XXYywqDKEY1eGb414yUE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-N_uLEFG8OYiWQI8ezntmog-1; Thu, 10 Nov 2022 08:11:15 -0500
X-MC-Unique: N_uLEFG8OYiWQI8ezntmog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBB5B1C05AE8;
 Thu, 10 Nov 2022 13:11:14 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D63E3112131B;
 Thu, 10 Nov 2022 13:11:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org, mrezanin@redhat.com,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH] libdecnumber/dpd/decimal64: Fix compiler warning from Clang 15
Date: Thu, 10 Nov 2022 14:11:12 +0100
Message-Id: <20221110131112.104283-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Clang 15 from Fedora 37 complains:

 ../libdecnumber/dpd/decimal64.c:620:8: error: variable 'n' set but
 not used [-Werror,-Wunused-but-set-variable]
   Int  n;                     /* output bunch counter */
        ^
 1 error generated.

Remove the unused variable to silence the compiler warning.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 libdecnumber/dpd/decimal64.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/libdecnumber/dpd/decimal64.c b/libdecnumber/dpd/decimal64.c
index 4816176410..290dbe8177 100644
--- a/libdecnumber/dpd/decimal64.c
+++ b/libdecnumber/dpd/decimal64.c
@@ -617,7 +617,6 @@ static const uInt multies[]={131073, 26215, 5243, 1049, 210};
 #endif
 void decDigitsToDPD(const decNumber *dn, uInt *targ, Int shift) {
   Int  cut;		      /* work */
-  Int  n;		      /* output bunch counter */
   Int  digits=dn->digits;     /* digit countdown */
   uInt dpd;		      /* densely packed decimal value */
   uInt bin;		      /* binary value 0-999 */
@@ -676,7 +675,7 @@ void decDigitsToDPD(const decNumber *dn, uInt *targ, Int shift) {
     bin=0;			   /* [keep compiler quiet] */
   #endif
 
-  for(n=0; digits>0; n++) {	   /* each output bunch */
+  while (digits > 0) {             /* each output bunch */
     #if DECDPUN==3		   /* fast path, 3-at-a-time */
       bin=*inu;			   /* 3 digits ready for convert */
       digits-=3;		   /* [may go negative] */
-- 
2.31.1


