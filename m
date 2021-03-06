Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F132F995
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:05:44 +0100 (CET)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUkh-0005Bd-FD
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUa2-00062O-RD
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:43 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUa1-0008Fw-FX
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:42 -0500
Received: by mail-wr1-x432.google.com with SMTP id v15so5210682wrx.4
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VjWbU9F1bR2qHYj+qEoIBUYcBv2LGGcZtP6AOz5qKP0=;
 b=ukAGHSiWLe1imGZKCcm/Bs4u7unJORl6aQw/CZNMEty6LlCEmUA7Ikl2qNpLvSZm1Q
 pJiN+tDcFtIKFTAAnoHh085uWzq+TMtv7e1eYq6FcR0wJVzjJ6w9UlGgt4x+MrYX11eC
 52wtKf+CvvM9SH9HVkVW+mHVBGlNa6nIGYcgQvbPbemoBYyUAwN1vT/R25ubfZ0SCONR
 uG8bW/sSJ5LKbLGm965JphRx7Dqlfpogk2RlZw0jHB2npLdFLtiIbDbIZFjBuoltAMON
 95TcoWFPVSYh4ZDppjVJ0lSS2cQlaUe9suo3hV6kC4J/ixzqNNfnqL5qf8H6gta34aGT
 UvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VjWbU9F1bR2qHYj+qEoIBUYcBv2LGGcZtP6AOz5qKP0=;
 b=oOyMzgUhqY0cD9YdDdeJqfM/JRdwGObMT8IfQkZM4Leiq7pMpKmFnozYrCkgk0muWU
 QBp8jcw5YQ5Qc3+kYY9CPrqPUwYIONUdeYnI2HanupcEkSW+AJghJlLtQLcUYTQw0QWq
 fU7Ufcfqyip5ZgXBke4+fiGH8LAW9iSD/+bRdCR4OgsTB4Dka/voDRoM/YErbDOIinU7
 vkseFrxCk9w2mcU3yNujgEqLqwR1Z9GHFfOE//1liX4FjsBoCjqqKKVJYehG2y/eECIy
 ec70eljj/30558FYgeCPbpaGzqRnQzAuogXtpTHNaFmmNiLQrVJJ0EA6dd97iDktOkIE
 3g6Q==
X-Gm-Message-State: AOAM5309xB4vCn/eVs0ZhPgAG/h2GectoGsB5MWxb+ztee7Txl4Gp1K0
 kB8bCYWeluQ4BhQzaEdlG0Ya3mkqq0Q=
X-Google-Smtp-Source: ABdhPJwe7WLxsD3nhGN2XpBwq21/JdzhniNJOHGVeRMRvs0+FlLT6btM6VrwJ873prNiwXNLVL4Zng==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr14499274wrt.28.1615028080003; 
 Sat, 06 Mar 2021 02:54:40 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/23] meson: Stop if cfi is enabled with system slirp
Date: Sat,  6 Mar 2021 11:54:19 +0100
Message-Id: <20210306105419.110503-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

For CFI, we need to compile slirp as a static library together with qemu.
This is because we register slirp functions as callbacks for QEMU Timers.
When using a system-wide shared libslirp, the type information for the
callback is missing and the timer call produces a false positive with CFI.

With this patch, meson will stop if CFI is enabled with system-wide slirp.

In 6.1 we will introduce a new interface to slirp where the callback is
passed as an enum rather than a function pointer.

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-Id: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meson.build b/meson.build
index 07bc23129a..05fb125dc2 100644
--- a/meson.build
+++ b/meson.build
@@ -1574,6 +1574,18 @@ if have_system
   endif
 endif
 
+# For CFI, we need to compile slirp as a static library together with qemu.
+# This is because we register slirp functions as callbacks for QEMU Timers.
+# When using a system-wide shared libslirp, the type information for the
+# callback is missing and the timer call produces a false positive with CFI.
+#
+# Now that slirp_opt has been defined, check if the selected slirp is compatible
+# with control-flow integrity.
+if get_option('cfi') and slirp_opt == 'system'
+  error('Control-Flow Integrity is not compatible with system-wide slirp.' \
+         + ' Please configure with --enable-slirp=git')
+endif
+
 fdt = not_found
 fdt_opt = get_option('fdt')
 if have_system
-- 
2.29.2


