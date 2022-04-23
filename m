Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BB750CA70
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:14:45 +0200 (CEST)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFb2-0005dA-8y
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFm-0007QH-ES
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:46 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFk-0005CP-PF
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:46 -0400
Received: by mail-ej1-x62b.google.com with SMTP id y20so21163184eju.7
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQoLEOza6oin0UplM7zhm/vdtebAXQRlMQwMKQhtfh8=;
 b=dDPLHwZnTpcstT8gPSjzSXkcKTJOaJZR9c3MdPUXDHlGtK/pksNv5tkiNoI4XYXXD+
 tWGWvRotswuQP5WPhjzReS32+VQk69f+ReLB9JoaTJoyaywboMAXf6nkpDAd77W/rjCz
 mBg7ECkBr1RjP0rb4Af+7mFCKKRIT9NDR7RsLVsvRGsnLtd/R4S00uVzBGq9YMtR7q6B
 o6gb1SSxrULWP63JZ/LxubZp7jaSBGN1Swe6pUQXhfPe+ciTFKih0Vjg1mN6CQMXNXE5
 bTIVH2PKy8MNZlkS4CYmDHpi5fx2LdlgasYEXpgoCmvytXVYhdA8YBdMDZWAGD8hyKtR
 s2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TQoLEOza6oin0UplM7zhm/vdtebAXQRlMQwMKQhtfh8=;
 b=mioBf4YSnBKhnT/cNaGoxm0Kl8JP9dXri2zEcof+q/nFnbPaWoBJvj3ZDqDg3GyJaw
 LMpXARtFsfIdX7Cg27DxbhFzBn1OoxbUrtRrXQcGBSWOJpdC5TJMxvt2M8aIN/njdHrZ
 HpGkIf8urAkH20AsG5fIEkEZWoBXroMGoD0OhjfHQ15vMjRBMx96DjuwqclD9IjryGP2
 xHn6+UuOefpYRigWNDO++KfD2UFwhM6R1tMmbs1J60xTiFQX0F3VYhJE1Z30wGzkNOgb
 wV+ZtYKT50A/aNm5LDaqH1juk5MvkWUVHE4VBiNyoFlP1Gd1L5dRVg+kPwUsobc0KJwq
 8SVA==
X-Gm-Message-State: AOAM530P/AoSoEwjriHGQsv04prGlyqF1pYWgA8ys12B2m37o8uq8FOo
 EoBvmMQt9WeXMr1GR3llbIhHf0TJuXygBw==
X-Google-Smtp-Source: ABdhPJyBrX96PW4/63WwQy7XWtj/LfhJkLauMdMn+OJsDIKa9coZmEGI+YcqdgiixQ89yHLQ/pJTKA==
X-Received: by 2002:a17:906:2991:b0:6cf:6b24:e92f with SMTP id
 x17-20020a170906299100b006cf6b24e92fmr8221041eje.748.1650718363581; 
 Sat, 23 Apr 2022 05:52:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/34] meson: always combine directories with prefix
Date: Sat, 23 Apr 2022 14:51:40 +0200
Message-Id: <20220423125151.27821-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson allows directories such as "bindir" to be relative to the prefix.  Right
now configure is forcing an absolute path, but that is not really necessary:
just make sure all uses of the directory variables are prefixed appropriately.
Do the same also for the options that are custom for QEMU, i.e. docdir and
qemu_firmwarepath.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meson.build b/meson.build
index 1fdc74c86a..cdbdb1ef8b 100644
--- a/meson.build
+++ b/meson.build
@@ -1618,7 +1618,7 @@ config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
 config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
-config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
+config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
 config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
 config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') / qemu_icondir)
 config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
@@ -3626,20 +3626,20 @@ endif
 summary_info = {}
 summary_info += {'Install prefix':    get_option('prefix')}
 summary_info += {'BIOS directory':    qemu_datadir}
-summary_info += {'firmware path':     get_option('qemu_firmwarepath')}
-summary_info += {'binary directory':  get_option('bindir')}
-summary_info += {'library directory': get_option('libdir')}
+summary_info += {'firmware path':     get_option('prefix') / get_option('qemu_firmwarepath')}
+summary_info += {'binary directory':  get_option('prefix') / get_option('bindir')}
+summary_info += {'library directory': get_option('prefix') / get_option('libdir')}
 summary_info += {'module directory':  qemu_moddir}
-summary_info += {'libexec directory': get_option('libexecdir')}
-summary_info += {'include directory': get_option('includedir')}
-summary_info += {'config directory':  get_option('sysconfdir')}
+summary_info += {'libexec directory': get_option('prefix') / get_option('libexecdir')}
+summary_info += {'include directory': get_option('prefix') / get_option('includedir')}
+summary_info += {'config directory':  get_option('prefix') / get_option('sysconfdir')}
 if targetos != 'windows'
-  summary_info += {'local state directory': get_option('localstatedir')}
-  summary_info += {'Manual directory':      get_option('mandir')}
+  summary_info += {'local state directory': get_option('prefix') / get_option('localstatedir')}
+  summary_info += {'Manual directory':      get_option('prefix') / get_option('mandir')}
 else
   summary_info += {'local state directory': 'queried at runtime'}
 endif
-summary_info += {'Doc directory':     get_option('docdir')}
+summary_info += {'Doc directory':     get_option('prefix') / get_option('docdir')}
 summary_info += {'Build directory':   meson.current_build_dir()}
 summary_info += {'Source path':       meson.current_source_dir()}
 summary_info += {'GIT submodules':    config_host['GIT_SUBMODULES']}
-- 
2.35.1



