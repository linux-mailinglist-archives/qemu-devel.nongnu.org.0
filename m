Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2F54739C1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:48:39 +0100 (CET)
Received: from localhost ([::1]:37070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvzi-0000yF-R6
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:48:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwveD-0008Nc-Bl
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:25 -0500
Received: from [2607:f8b0:4864:20::102d] (port=41695
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve9-0005Tg-KJ
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:25 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso14761111pjb.0
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BZTFEWkCcq7QoVstw7Mtl+bBngHaigSh+UQzae6el5A=;
 b=EVkZTRp6QchOFwzbG5utVxrpA3Z4rkRIW0deCBoQwjiozSoAByEaHvfsrzWKNj2gYC
 z/R2+6AbYqxyCK58I2YTzrAkz7jloEZnls7Zjq/Xs/0ZEj9vtHzduIgKCYpgZAAe5gvC
 V9U5M5Dz96yPraRBH0uySBUKYPDnrVQBw396EHHXPvmmemD57GbmpiayAC4m+MRbNS2v
 mtjYeS/1f2Z5kWZqAlLABzsKyZIiRiKu8DSsNK5NYEPRF6MH+4Jphe2JNMB5fUeLmZJE
 RA32b+FG0qdNmvxFGwPpBiljFe4DKHbF9kweas7cxOCZYEJscBA6Z5ofa0z17gwIb5f1
 Sy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZTFEWkCcq7QoVstw7Mtl+bBngHaigSh+UQzae6el5A=;
 b=xDBNlbtKY0V90/Vjef5n9v8OEAA72F55RnX0Lp0JH+b35YXLKzNm3Fe9deXcSjBjaj
 P6T9+xOcweL/QP0/sucLrmG4BCUiOSyeIIdec1f31YBLpP94Gs8u69G6M0XbabBiOy5P
 fAEbnVv12ziN7/3uxO45rydS1c+2LfrvB5DLuDU09jdB47p3fRYGXnnGLfUJnI3n9iSs
 iFZW3iOeA7CiYD/8uJ9c5q2XCbmN1mrl2B9x0i2ywFz4R05XS6S1r8D150OvPQ6+1u+D
 zSpkr/U4Fq0cKfBV/d/qAs79zqFVYAtiaJAeuXiDbKBIibHIEyTrQGQrN8LElux4UF0v
 +jxg==
X-Gm-Message-State: AOAM533z3IkauFSWzP0Wi/Z+oY7W+85te/lvSDE30C46+YhsPkVhiQbQ
 nDck/PPfhccdGKeOfvxAAscoXQ0TZyGGzA==
X-Google-Smtp-Source: ABdhPJxdyPCarm8r9FqC/2JMmQPJXRKQtco8dkm4pUEqD25eatMp8IBc74JMc64HjyPfLWBE1F9rqg==
X-Received: by 2002:a17:903:22cc:b0:142:d31:bd9 with SMTP id
 y12-20020a17090322cc00b001420d310bd9mr1665495plg.64.1639441579331; 
 Mon, 13 Dec 2021 16:26:19 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 14/15] meson: Move linux_user_ss to linux-user/
Date: Mon, 13 Dec 2021 16:26:03 -0800
Message-Id: <20211214002604.161983-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
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


