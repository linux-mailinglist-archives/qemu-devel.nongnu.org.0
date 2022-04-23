Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2C450CA4B
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:02:28 +0200 (CEST)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFP9-000756-Bd
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFF4-0006RR-MC
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:02 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFF3-00053A-2F
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:02 -0400
Received: by mail-ej1-x632.google.com with SMTP id k23so21199824ejd.3
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KhMNiGQqmXEYFPC/2FWQjXDIZvCDcncp47pbV0qHXk4=;
 b=gwdMpgHvLxzf3olCcRZXpRP8jR0c3AtojmCKVLRctQ7APkCpY671XLLO7mjs7x7TOf
 gPgcNFASPPxpyDfDOz14F5GxkNhIde2cFqNQOQLNvuOAXsGOL1BHwdeglA60xvQvqPbt
 NW2M5eFL2it2J7CAg0zpoNi27DTW6UmbLKCewVttmN6ECgS5hJKvUl3ACC4rk0x7XtrJ
 simy7Yk7Ma+J1h6wbnfHudaV0Md9mmYFOXS0C/kIU+WLyUwQqC6pRiUPwpej367Q9Zq8
 A9okExaJgCqKreybcfG53lx6JMJtpqplGg9hAdik/gNcpAbbpb6sssEVyxI+e4tHuiZk
 FP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KhMNiGQqmXEYFPC/2FWQjXDIZvCDcncp47pbV0qHXk4=;
 b=C3ptFLbiuMWHS4YW0GsinAPCCtbWeW5G0wibXtqRCniXe/R2JQZy8ztRioNjeX5v/S
 n8IbScN+yUcv9ombp2LsrtqnAs7P8G2kwsgkc0+C+HY+wGFBP9gK+w0ymt1JySfEjO+n
 Mk4Yn0rtky0KaFt3y0rgJ+JL8qnfo8Wndxjl9q7zUe/l3fLQyedpIESeOBBp2vuog5rT
 B9o+9rZ0mwTyPYcMUZLuUrB4UJoH3ZdC851DuvD5hbAPTG0bBC9VkAL3yNtZMBAV3p1t
 0TFstUTU3VdTl5chgiPTHLpNw4fzjLgWyQw+5ulC+8RHiC3Y4vNYFeMpaN/SfmfGXxLx
 gfCw==
X-Gm-Message-State: AOAM533k/+XaAsNXCVxEUYAURvEAoNn4fuGFwE4yiPyIUzrk/T7CDs9g
 8Oj6wcDiJOji0IQV5l89hETLLQClzgKu+w==
X-Google-Smtp-Source: ABdhPJzGa8GMufnRkWb/26KYeDpOhUikPnpXgcKNl6USkIQ7tXpszsHAbV4V9Aa3Dvbv+DpT2nYmIA==
X-Received: by 2002:a17:907:9811:b0:6e8:a1ac:c4be with SMTP id
 ji17-20020a170907981100b006e8a1acc4bemr8719130ejc.188.1650718318639; 
 Sat, 23 Apr 2022 05:51:58 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:51:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/34] meson: show final set of compiler flags
Date: Sat, 23 Apr 2022 14:51:18 +0200
Message-Id: <20220423125151.27821-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
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

The actual set of compiler flags can grow beyond what is found by the configure
script, for example if gprof is used.  Show the full set in the summary.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index d083c6b7bf..a9949ee9e2 100644
--- a/meson.build
+++ b/meson.build
@@ -3533,10 +3533,10 @@ link_args = get_option(link_language + '_link_args')
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



