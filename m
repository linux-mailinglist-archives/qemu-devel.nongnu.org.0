Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C545AA84
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:47:40 +0100 (CET)
Received: from localhost ([::1]:59816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZtL-0007xT-Gc
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkR-0004l3-Ud
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:27 -0500
Received: from [2a00:1450:4864:20::42d] (port=34773
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkQ-000526-FA
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:27 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j3so2590426wrp.1
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BZTFEWkCcq7QoVstw7Mtl+bBngHaigSh+UQzae6el5A=;
 b=tWs39q42/vFaYtFNFQArMNOWOziIduahqsqWnetRTQGjLP1avimrgzNOT+iEnoby2S
 e0MWqpY8BK5olNOFIPlk7+AgPtpsCkNWQVoHM2f4fEoPjIxep0sVoUeCauuIvsOqNq7K
 Qq6RjgNsMWAowa6oGtiaaMU7VOHC12wNxd8/KNwr5AlxIxlN66r6v8VChq4iJmPOWEvq
 6gfL5HC35zoURLlX0L9IOKfHBJbvqBDAFJfVoSJUznU6COV5JOUDa1mBBAjSH8No2lTT
 mYZJPg8fpTmDCW0IuVG38CG81DqYbYnoP5sArguKbdB7SXEsawxDDGVuHWijMUPyGhIr
 04LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZTFEWkCcq7QoVstw7Mtl+bBngHaigSh+UQzae6el5A=;
 b=k2WRQUO0rkpvnR44eX8cDb2u6OZ83CcZcTSfuv43/0sYbxK7Va6uIn7pzpeYdKp1Sa
 dF6DS4BkqPcnW4VlYKuGeEKvC3FkKXHZO0xDhiUGj6MBhjIP/52/gqscm6yvnqBWMV8Q
 NDRjwqKi4L5M0SUm0pk6xcqtClSjMbpOAa4qCF1ZWVFALC2KsF7emf4g91x6L3cMziMy
 6H9N8E8NP4E3bhLBxOL+Q16eq4ajK5YObJrYCkJaegkQm6yGI812e1ogilvfdfbamtE8
 mkqi3j+t44mDREy0yjtFO5mcZxryCJWinlkyKKbCt9MljZQQ6cgMU1wygrqmZyD/kMKm
 G3yQ==
X-Gm-Message-State: AOAM533RwCHqR7fzilXh/mhd70tm2w+5B3X191F9yvj8o5pY3E+XB0G4
 C8SsqMzhRt+seoADO+q4F9mpeFV5QS1cTi26bUI=
X-Google-Smtp-Source: ABdhPJy8r7/6DO5jum19gzS9o2awXGsE6ti9Z0kwfvCgpZ4r/mMddrrq8c7mLNwOnJXeOCOC2HxqcQ==
X-Received: by 2002:adf:8b1e:: with SMTP id n30mr3727445wra.75.1637689105230; 
 Tue, 23 Nov 2021 09:38:25 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 15/16] meson: Move linux_user_ss to linux-user/
Date: Tue, 23 Nov 2021 18:37:58 +0100
Message-Id: <20211123173759.1383510-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123173759.1383510-1-richard.henderson@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have no need to reference linux_user_ss outside of linux-user.
Go ahead and merge it directly into specific_ss.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build            | 3 ---
 linux-user/meson.build | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index cd97b154bd..bf7af382de 100644
--- a/meson.build
+++ b/meson.build
@@ -2370,7 +2370,6 @@ common_user_ss = ss.source_set()
 crypto_ss = ss.source_set()
 hwcore_ss = ss.source_set()
 io_ss = ss.source_set()
-linux_user_ss = ss.source_set()
 qmp_ss = ss.source_set()
 qom_ss = ss.source_set()
 softmmu_ss = ss.source_set()
@@ -2621,8 +2620,6 @@ subdir('linux-user')
 
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
-
 common_user_ss = common_user_ss.apply(config_all, strict: false)
 common_user = static_library('common-user',
                              sources: common_user_ss.sources(),
diff --git a/linux-user/meson.build b/linux-user/meson.build
index fcf7d40f23..b89534c49c 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -2,6 +2,8 @@ if not have_linux_user
    subdir_done()
 endif
 
+linux_user_ss = ss.source_set()
+
 common_user_inc += include_directories('host/' / config_host['ARCH'])
 common_user_inc += include_directories('.')
 
@@ -42,3 +44,5 @@ subdir('sh4')
 subdir('sparc')
 subdir('x86_64')
 subdir('xtensa')
+
+specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
-- 
2.25.1


