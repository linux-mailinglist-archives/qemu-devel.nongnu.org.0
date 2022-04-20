Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E8A508C51
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:39:55 +0200 (CEST)
Received: from localhost ([::1]:56646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCQs-00013R-Mc
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLR-000122-FT
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:17 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLO-0000t1-IQ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:15 -0400
Received: by mail-wm1-x330.google.com with SMTP id p189so1457358wmp.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8tkEVewhctd9//NgUzvVRR5ShxlRUXerOnNd4wGrF2I=;
 b=bG2RL2WqKdtsBRXmcFH8UOSUIHzVsoQsr7/DuNEsCnMq00B8EpjFeQZVZisGt+GgI1
 RrC6pp4bp36RHkrmEvvyRfUpWLiLklwYeRsRDq9pa2l3UoRKjGlBKSbVilkOKBl7m/zs
 yePkjUNvh61RhbCXhLHpcDYrDdqA63jl/LF06OwIdk5aXKaX98ujLvWOMpHBPpov7HDF
 Jmxo+0uoIymDZzjK0Sw9lVXXKRXtmlKxL+9Dh+ozR79/NUu7FRnguTLBqR+X9bEhNpYT
 8F+bQiqtperhcJwicef4ERjKtU3h3NkTvZ3Zoj8X8CYZ4AEnJHMG17od+7JHIKYJlpYY
 viBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8tkEVewhctd9//NgUzvVRR5ShxlRUXerOnNd4wGrF2I=;
 b=tvIFigTsjwOA2Uzi/gUKrpJ3DMyezwcCSH916zLoWZ/5W6NLhh336s/79dj4zlNEo1
 ewLVHl65STYa0VJeHnHosGZDM/IVY+HXeuPKG0qD5z0xmWFcNd55Bhs7GjklgJl/MqTV
 FX9vRkDSzHQdkXf14uCTBVsl1ktWj8Ac9FfU+CafyguhZUeWdl9se9XnmhFHJvbNGCj3
 lCfkNA/lTy7qmuFO9wszY4jVuAcBgbjTWMpgqPNV81xuOwmcu8d0Km9IrigXX0vreIPR
 q2gzQSLczcsgvvY/qeiACslrDFWnM+gsww9KYeITaNoFLA7TGUMFLW/CCYACRApd8z3d
 O1zQ==
X-Gm-Message-State: AOAM532prPIAUOk4rKMAyiS6ZwdTx53d8S1ExXkvGcioTwNfI3fI5PZ6
 kGdM0LpVctfdMuAfwOOHfLFasGwzgqBsYQ==
X-Google-Smtp-Source: ABdhPJxRo9OgBKfzKBgRa+M4aoZ9WGuBfItWEo1A6ojxOjDIxIJNYF2itThRKFHwquq9jgilJGWdxQ==
X-Received: by 2002:a05:600c:4e12:b0:391:18da:1883 with SMTP id
 b18-20020a05600c4e1200b0039118da1883mr4340018wmq.101.1650468852774; 
 Wed, 20 Apr 2022 08:34:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/34] meson: show final set of compiler flags
Date: Wed, 20 Apr 2022 17:33:34 +0200
Message-Id: <20220420153407.73926-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The actual set of compiler flags can grow beyond what is found by the configure
script, for example if gprof is used.  Show the full set in the summary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 6ba60950c8..cf3b1b39cf 100644
--- a/meson.build
+++ b/meson.build
@@ -3521,10 +3521,10 @@ link_args = get_option(link_language + '_link_args')
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



