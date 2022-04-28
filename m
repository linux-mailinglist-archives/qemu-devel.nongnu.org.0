Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD3D512CD2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:30:00 +0200 (CEST)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyb9-00065b-H7
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy24-0000Bf-5D
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:44 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy22-00055V-Jx
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:43 -0400
Received: by mail-ed1-x531.google.com with SMTP id a21so4411090edb.1
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ac2CzGb/67yyLXxUqxt9hRvc6wlmfyVIexf28Q5NYII=;
 b=qVlSCLmDj7iABnbZUgswPYhySNN9AsBo2Fkg91zIR2v8+ZpMbYJf8qUoTyFPmgWBC0
 lCbTJ2QSAzLv5qnqeF/zTwnFsHbeTlF+Kbb7UVm0eZOMjkzJmzvtyV+POUN9s8Mh1v/V
 KMtQzlU/KbIJuzUcqaX9ItHLu6BE8tGVLoIKFk2j3yGDW2QUyd849V9KH+csKdx8w5UI
 orw54lIcvijIVtY5oJ8RtfXAIlvgANy+54t/yqse2ByL7d1C1f6dyb8Hna+ZCns7yaFx
 CQOMq4kWnAAbdc6TCAmaoy4KY6ykWD4IMHf0MvJaC6g2MgmofRNMqHqdGTepdSUHxqLN
 XC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ac2CzGb/67yyLXxUqxt9hRvc6wlmfyVIexf28Q5NYII=;
 b=DiYfwqFm3fTTIzo5uHb+MTPEvHfnY4sPQNNoxCnIBFGp1KsBWC0J6n71lGhxL/X3f0
 ircB+yK7TsO7yABAgbTubSNeOkK3YqfG5xxO1o5yt3wxGUVAFTzq7ipWfCUDXm0qqrrm
 T+elmgcwYnIHi67JZe8sJFGGxg6WApnPThRCHc2VnaXqVhwe1AHxXnJdTcPU8GVzwVG5
 GWZfPBtFjnG1Z0jTkKQA5hqHJAG5TSN2ivLy/BaG+gnIvagIVRz1B35xURVL+1dNIdcy
 5Nuajje531rjalzi4SqQDCGY21s4VXPs/JSmICTMC/76rcMtMwQf1rbP/i+GNLIQdn/1
 sVyw==
X-Gm-Message-State: AOAM530XlOrKKeLOvnJL5W/sIDKqpfH9B2lQcL5dBC8jqqIxC32GHqws
 c3kMWwScSwn29wjuZfrFzyMFLSlX31Hx0A==
X-Google-Smtp-Source: ABdhPJyHbp8aYcngRohovEVI3VJMXsqeQWU9s3xBtQoYkvzEonCI0DpxXlTkigVROCpw+MkN6GpecA==
X-Received: by 2002:a05:6402:2804:b0:420:caf1:961c with SMTP id
 h4-20020a056402280400b00420caf1961cmr34696564ede.280.1651128821042; 
 Wed, 27 Apr 2022 23:53:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/18] meson: show final set of compiler flags
Date: Thu, 28 Apr 2022 08:53:22 +0200
Message-Id: <20220428065335.189795-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The actual set of compiler flags can grow beyond what is found by the configure
script, for example if gprof is used.  Show the full set in the summary.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 0c38e491f4..9beca38ebb 100644
--- a/meson.build
+++ b/meson.build
@@ -3535,10 +3535,10 @@ link_args = get_option(link_language + '_link_args')
 if link_args.length() > 0
   summary_info += {'LDFLAGS':         ' '.join(link_args)}
 endif
-summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
-summary_info += {'QEMU_CXXFLAGS':     config_host['QEMU_CXXFLAGS']}
-summary_info += {'QEMU_OBJCFLAGS':    config_host['QEMU_OBJCFLAGS']}
-summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
+summary_info += {'QEMU_CFLAGS':       ' '.join(qemu_cflags)}
+summary_info += {'QEMU_CXXFLAGS':     ' '.join(qemu_cxxflags)}
+summary_info += {'QEMU_OBJCFLAGS':    ' '.join(qemu_objcflags)}
+summary_info += {'QEMU_LDFLAGS':      ' '.join(qemu_ldflags)}
 summary_info += {'profiler':          get_option('profiler')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
 summary_info += {'PIE':               get_option('b_pie')}
-- 
2.35.1



