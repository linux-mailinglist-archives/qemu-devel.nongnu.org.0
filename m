Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919CA4B67F9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:44:36 +0100 (CET)
Received: from localhost ([::1]:58852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuNv-0007B3-Ih
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCL-000492-6L
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:37 -0500
Received: from [2a00:1450:4864:20::530] (port=33474
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCJ-0008RY-M8
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:36 -0500
Received: by mail-ed1-x530.google.com with SMTP id b13so31192149edn.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jhFwU72yaHp33P0rYq3jYT3GqJJNnFHjydTeOFAFulA=;
 b=P3sxJ5MH2Sh/CzICXIg55OV+pCZhY/8/7AQWnYC3MhKFAl0UlYevLpZxEJzoIkMRpM
 vAF0s44aHYa7/NZGQ1VY+5N/cvmlTAMYLRDd2U2I9ku3/Cg/q6WMEC8SbMNyjgk3XK0R
 SSqnCI3aEP/yD1FJNvpd9qtdOymPiUHnxv2hnG0oy9B5ibPQOp0Ae+fHwWiejzo/Q/ya
 qmjFQXe/V7RDAgJDWaXYR3ZQjyFC4hwCLHockbqxnAuWp31dd4H0895cAvw6yjoP8irX
 cY/ZJyykspod04fX4epwYva3Yx5KkraOiLggO3NN5Bh1ZqyNPKD4YqFieq4d03Tan3W5
 Ff6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jhFwU72yaHp33P0rYq3jYT3GqJJNnFHjydTeOFAFulA=;
 b=Rz5CbJ2W/G3TMyYAnxWYo0ayStIJxH/QGGS7Af7L0I2hRrTA0kKfNuyq+n9fJ0bnJ+
 xZXNl5OWps6kq0Wim2vxp5oESYgoml1wwvltiosdlIM/U19xBR9vHGxP51KECnLLj5Cm
 wGvCSMNiuFmk5LNmhi4YvwIUSnYiKTcz4GJvNeIEAFjQwvuy5cWgZBUtFTYSwDU0pSn5
 0ETTnvKVxNsuzlh0KCL+d437eyguJ0ZldjZ2lmqyO2Fm7CZ1HEZxv4iu+08yWofUnQWO
 cjux6OIzqUsQV2rBZRG7fie4HY8anAXJwibg7JpccC4+o3dQhpYUoUjUJ4qc+XEw24pd
 eHPA==
X-Gm-Message-State: AOAM533jSAJpJ2u5ty4RKQ6HmrhWK4ozD6gvcLhG/mTMKhtJkKzgtPGU
 NpY+76zNkTfS6F9f+E+SDDKctWN/1u8=
X-Google-Smtp-Source: ABdhPJxRDQQcSnN+P9VKnPK9mukUbemxjckJO6KJ6aXYg/K2PCt9xjOPC/c0HtGyh1p7+fXEUjphlw==
X-Received: by 2002:a05:6402:1d49:: with SMTP id
 dz9mr2872121edb.238.1644917554479; 
 Tue, 15 Feb 2022 01:32:34 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] meson: define qemu_cflags/qemu_ldflags
Date: Tue, 15 Feb 2022 10:32:07 +0100
Message-Id: <20220215093223.110827-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare for moving more compiler tests to Meson.  If the full set
of compiler flags is needed in a cc.compiles/cc.links test, it will
be handy to have a variable analogous to QEMU_CFLAGS.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 031bbf468c..c520d6af68 100644
--- a/meson.build
+++ b/meson.build
@@ -163,6 +163,10 @@ endif
 # Compiler flags #
 ##################
 
+qemu_cflags = config_host['QEMU_CFLAGS'].split()
+qemu_cxxflags = config_host['QEMU_CXXFLAGS'].split()
+qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
+
 # Specify linker-script with add_project_link_arguments so that it is not placed
 # within a linker --start-group/--end-group pair
 if get_option('fuzzing')
@@ -198,12 +202,9 @@ if get_option('fuzzing')
   endif
 endif
 
-add_global_arguments(config_host['QEMU_CFLAGS'].split(),
-                     native: false, language: ['c', 'objc'])
-add_global_arguments(config_host['QEMU_CXXFLAGS'].split(),
-                     native: false, language: 'cpp')
-add_global_link_arguments(config_host['QEMU_LDFLAGS'].split(),
-                          native: false, language: ['c', 'cpp', 'objc'])
+add_global_arguments(qemu_cflags, native: false, language: ['c', 'objc'])
+add_global_arguments(qemu_cxxflags, native: false, language: ['cpp'])
+add_global_link_arguments(qemu_ldflags, native: false, language: ['c', 'cpp', 'objc'])
 
 if targetos == 'linux'
   add_project_arguments('-isystem', meson.current_source_dir() / 'linux-headers',
-- 
2.34.1



