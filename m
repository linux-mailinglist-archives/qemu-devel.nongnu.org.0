Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5489512CD1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:29:34 +0200 (CEST)
Received: from localhost ([::1]:37136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyaj-000572-TL
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy20-0008Vv-Va
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:41 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy1z-00054u-AU
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:40 -0400
Received: by mail-ed1-x52d.google.com with SMTP id e23so4381312eda.11
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8FmLaIa8GYANcisBi9dnMAUzKkNvik7or0XA37is0A0=;
 b=jeDOrqc3fvECGqvemYdwLfQPp4vmHHwPOOf0ZkouefoB+64bUtY73MYrndOxA4RbAI
 aRHwaBtZXRx6muNk7UTf189tXuF5x9ENYy28rKOoIv0naowPxcSZp3CdMNeyLdqg8wgR
 k5QbuExTqutkk1Uh1CbG0PsZJ01f+7N7+ZtNj52OWsRTP5NpPgQlBsxXjQrZQB0NJGaC
 T5ySUAe2a/+A1x+6YvYkfjaHPEo9M7U4csJBuMTxIGUD1XZygi6dGg2tOkMCj3Z8CroD
 OJJzElCJTwYj1vH1hug3wEIOzctLYQ7vW5u/Hz8NZX3daSVnR0NGNVCJlyloqXkoWP8o
 31Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8FmLaIa8GYANcisBi9dnMAUzKkNvik7or0XA37is0A0=;
 b=QB3/uP+LYDeho0ry0QJh+J2k0YW9Nn2bUtd7UOuHVgAVFwVjnIVupThCF2gsUgGhes
 d5jQzZCmil3kB+nEjMnPnVFogqH3v5ibBIcEnYMYr57aHORZIDNY2K+3n1Em/QHzSgZC
 HDiEP2dSRUqQczFHG9GEGy/t1+FnOYp0SrxDACjxvWmuN3JUyCfPiU1wtmQQVO/AeW6V
 FFy68TRQ+mXS+47So8Ow7Y5mTP1AVBu/FaCI+HKoVQQqrln3+9AvnQZJ1ENImF4/RTkt
 P50F8HZW9aAJSl7S8vBUrVyK4Wq6Va2MYYBgaKH+88pVPxta22Lh1ajfAwtawriQ7Opf
 nWBA==
X-Gm-Message-State: AOAM532qkq2k5EjPdJtpcuv7P+0RMNFmKdqZZ/HFzMA7UbypCeDYWfmn
 MVm1MpejJVScMfIle2x6h7zaddUm+5ftHA==
X-Google-Smtp-Source: ABdhPJx22uIqjkpganHYkpfn9Vi9tr4ElR9T0c+2SiJBWsOuYQH69v7aCgmo9DzNqPBknNTuS7o/0w==
X-Received: by 2002:aa7:d609:0:b0:425:d94b:4119 with SMTP id
 c9-20020aa7d609000000b00425d94b4119mr23746612edr.282.1651128817744; 
 Wed, 27 Apr 2022 23:53:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/18] error-report: fix g_date_time_format assertion
Date: Thu, 28 Apr 2022 08:53:18 +0200
Message-Id: <20220428065335.189795-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Haiyue Wang <haiyue.wang@intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Haiyue Wang <haiyue.wang@intel.com>

The 'g_get_real_time' returns the number of microseconds since January
1, 1970 UTC, but 'g_date_time_new_from_unix_utc' needs the number of
seconds, so it will cause the invalid time input:

(process:279642): GLib-CRITICAL (recursed) **: g_date_time_format: assertion 'datetime != NULL' failed

Call function 'g_date_time_new_now_utc' instead, it has the same result
as 'g_date_time_new_from_unix_utc(g_get_real_time() / G_USEC_PER_SEC)';

Fixes: 73dab893b569 ("error-report: replace deprecated g_get_current_time() with glib >= 2.62")
Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220424105036.291370-1-haiyue.wang@intel.com>
---
 util/error-report.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/error-report.c b/util/error-report.c
index dbadaf206d..5edb2e6040 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -173,7 +173,7 @@ static char *
 real_time_iso8601(void)
 {
 #if GLIB_CHECK_VERSION(2,62,0)
-    g_autoptr(GDateTime) dt = g_date_time_new_from_unix_utc(g_get_real_time());
+    g_autoptr(GDateTime) dt = g_date_time_new_now_utc();
     /* ignore deprecation warning, since GLIB_VERSION_MAX_ALLOWED is 2.56 */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
-- 
2.35.1



