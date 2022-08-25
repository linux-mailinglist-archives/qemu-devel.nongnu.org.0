Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806095A1557
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:14:21 +0200 (CEST)
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREYm-0005mT-99
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERu-000410-JF
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:14 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERs-0002M4-W7
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:14 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n17so392278wrm.4
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=gxmhVjZ/U3QufOhpg/Sa9o1bzWISSCytFtK6UtKa9X8=;
 b=mlFGuZ5OjV2RVek6i01ZKdY8nX6XEU1A/hnnZkSNI/PLwUzz7F6jbGKU4VzilrjCXD
 ySGTTC5vnst6KrXbO6ZNsZLKQC7r7adpswLbV5JzyVZESOnX5MB/GJexe9Dk7g4BDNxy
 m226L6htJLAoCHCO7VTMT1kiBaZsWMMUK/T8Yp98EC6q7MqKQ2Lq/9YT842EsNGhYdVQ
 /DENxN7VKrKxf+e6/u4XCZ6cFW0TObBMHoBXWnmHC3V8wLwuJxSAkvyxfHDaQV7YvQ6z
 z13eyGueNq3TNuW0GmRuV58yXI6ksRkifGNvr+MRz9nAywtlhWYu4ExmjLbeFM13He/m
 e11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=gxmhVjZ/U3QufOhpg/Sa9o1bzWISSCytFtK6UtKa9X8=;
 b=BdVVjW/u7nsDote/ypRJ9pYhlj6Bpev2nTnGxZ8xmjVEhrp+ZlYYPDrfhEMZ15f/aS
 N7N/YnBR/c8Vko5D/cCTXRsp6lo+u1OtWnIaLVMBdrGy7ZjHhlbWj9MEYMGgoa4cx8jP
 Ey7R6O/AqVuaciLRoYt340uqYZf/434HGI3EIHr/QLjvj8OQL6IbvXvloSLkAgpJpCYT
 9c/GqMBR/gPEkVDiJNN3l7KSXq6XI5toQ/t7c5/XDS7lZJ5K9G/o0BKfomwt3ev4lcxD
 gImpkkCXfKBWmfww3UevAt6VGvkz+0QPUdvkZseqy6FYgkxHW2q0Vpoh7djs1KQpZpuL
 PSQA==
X-Gm-Message-State: ACgBeo24dL0H0Pklpuv3KSx3M692IEgOoMq3mWDxruEKlc2wmAzCZ/x5
 oI/R/D1TdqCgouHltmh1YUE6nkWN0eyIAg==
X-Google-Smtp-Source: AA6agR7rrp+u6fvDQ/ZHYJSJa5M93A7uPHg7z5108CRnaG+Ah/AZFYR5rbTaIJwzH3lgyCpGnZZilw==
X-Received: by 2002:a5d:49c6:0:b0:225:61c9:dd4e with SMTP id
 t6-20020a5d49c6000000b0022561c9dd4emr2480862wrs.445.1661440032138; 
 Thu, 25 Aug 2022 08:07:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bo20-20020a056000069400b0022585f6679dsm1064638wrb.106.2022.08.25.08.07.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 08:07:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] configure: Avoid use of 'local' as it is non-POSIX
Date: Thu, 25 Aug 2022 16:07:03 +0100
Message-Id: <20220825150703.4074125-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825150703.4074125-1-peter.maydell@linaro.org>
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We use the non-POSIX 'local' keyword in just two places in configure;
rewrite to avoid it.

In do_compiler(), just drop the 'local' keyword.  The variable
'compiler' is only used elsewhere in the do_compiler_werror()
function, which already uses the variable as a normal non-local one.

In probe_target_compiler(), $try and $t are both local; make them
normal variables and use a more obviously distinct variable name
for $t.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index f8d7270a60e..f2f793e3653 100755
--- a/configure
+++ b/configure
@@ -110,7 +110,7 @@ error_exit() {
 do_compiler() {
   # Run the compiler, capturing its output to the log. First argument
   # is compiler binary to execute.
-  local compiler="$1"
+  compiler="$1"
   shift
   if test -n "$BASH_VERSION"; then eval '
       echo >>config.log "
@@ -2071,7 +2071,6 @@ probe_target_compiler() {
     : ${container_cross_strip:=${container_cross_prefix}strip}
   done
 
-  local t try
   try=cross
   case "$target_arch:$cpu" in
     aarch64_be:aarch64 | \
@@ -2084,8 +2083,8 @@ probe_target_compiler() {
       try='native cross' ;;
   esac
   eval "target_cflags=\${cross_cc_cflags_$target_arch}"
-  for t in $try; do
-    case $t in
+  for thistry in $try; do
+    case $thistry in
     native)
       target_cc=$cc
       target_ccas=$ccas
-- 
2.25.1


