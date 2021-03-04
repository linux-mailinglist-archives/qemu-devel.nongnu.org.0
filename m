Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D097932D1A5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:19:55 +0100 (CET)
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHm1K-0006lT-UG
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lHlzI-0005ti-V6
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:17:48 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lHlzH-0003yN-65
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:17:48 -0500
Received: by mail-wm1-x32d.google.com with SMTP id n22so7682901wmc.2
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 03:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nEvq3zCUGEMnaqz6FiGYyto4ewbJo+45jcuvmd2iy3s=;
 b=Lnig2z/j/rUkrG00x3EO7QRaV9xbfeGQjjVGboO138YUbD8uKXmTW8HKPw+npl0AuO
 7dFlrUP4Vh8Fo0RBfKVwd81m68/AOCFhcjAzSG3YlrNLOYK2/pDzuzu6na+Y++QQ2ubE
 Y4j9cD/HeVmIpUQIVmrkMXjL57EWLuWyldCGg7GI++wQvswR3Ccq4zJTtDdv2TVdlRos
 fXhHNClaVoAGmyZg023774EOOd6oKiaMQIN1s9wZpFpT8+W8LxfUozUosE0wrOF5TnZN
 KUoJIEcALstNBNsvbSmPKEJ10jEprDy9shNauGUQC1SNBUAfBTET8iesijVLpVYdgkzs
 YVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nEvq3zCUGEMnaqz6FiGYyto4ewbJo+45jcuvmd2iy3s=;
 b=N6ZIj0kUf9VRimLUwXuN5kd53Z3HkvOODpDduPpn4TFy1rqkisTs5CRMkXEME+4+0N
 +HHtWNBtC5gSppTCAu5dBtN+IWrjCQmiI64J8xp+yqMrAxyOjdgHqnnAgHG1sth3pivG
 UkMXJk58VoRjrBK9hf1xSEDo2GngIqrgkQBNvtXS4pJGfBH61KGVMgqlPagOjs2YSbOk
 5ukD5QWFmb1Cmc47t1ctC68SNHFA8jntx9Swr1Z7yCDtuIRDRB1++g9sUmra6dHYmTGG
 LJeh+IZg2jzbxWqydp+r/hayTDXGVGJqF3mxxtojO1YCvMTNHnMCt2scM5O5en4XXeo5
 Xxiw==
X-Gm-Message-State: AOAM533u7VX/FE6d65+DMGxYyHXxzhNYhW0A7zZERAXtBnGhZxKJTENL
 N5auZai2fMF3PAE2dJjZvO7YlT251EU=
X-Google-Smtp-Source: ABdhPJzBWoFI6/W31nS3F5AnngwsRFwIke85AcS2eyhQxPmZX7PYRaJ0G1ArcEwUK1lfp/47vzxsvw==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr3529156wmi.34.1614856665126;
 Thu, 04 Mar 2021 03:17:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 12sm9058921wmw.43.2021.03.04.03.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 03:17:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qemu-option: do not suggest using the delay option
Date: Thu,  4 Mar 2021 12:17:43 +0100
Message-Id: <20210304111743.118752-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "delay" option was a hack that was introduced to allow writing "nodelay".
We are adding a "nodelay" option to be used as "nodelay=on", so recommend it
instead of "delay".

This is quite ugly, but a proper deprecation of "delay"
cannot be done if QEMU starts suggesting it.  Since it's the
only case I opted for this very much ad-hoc patch.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst | 6 ++++++
 util/qemu-option.c         | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index fcf0ca4068..cfabe69846 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -134,6 +134,12 @@ Boolean options such as ``share=on``/``share=off`` could be written
 in short form as ``share`` and ``noshare``.  This is now deprecated
 and will cause a warning.
 
+``delay`` option for socket character devices (since 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The replacement for the ``nodelay`` short-form boolean option is ``nodelay=on``
+rather than ``delay=off``.
+
 ``--enable-fips`` (since 6.0)
 '''''''''''''''''''''''''''''
 
diff --git a/util/qemu-option.c b/util/qemu-option.c
index 40564a12eb..9678d5b682 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -785,7 +785,11 @@ static const char *get_opt_name_value(const char *params,
             }
             if (!is_help && warn_on_flag) {
                 warn_report("short-form boolean option '%s%s' deprecated", prefix, *name);
-                error_printf("Please use %s=%s instead\n", *name, *value);
+                if (g_str_equal(*name, "delay")) {
+                    error_printf("Please use nodelay=%s instead\n", prefix[0] ? "on" : "off");
+                } else {
+                    error_printf("Please use %s=%s instead\n", *name, *value);
+                }
             }
         }
     } else {
-- 
2.29.2


