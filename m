Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C746B5E6B2F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:44:54 +0200 (CEST)
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRBt-0001DQ-Te
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBK-0002GB-Pf
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:14 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBG-0005Tz-Ar
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n10so16378754wrw.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=L95wwHp5RV6cXArMSmbL8Hcv0LZd0gpd8eOHxANOlTY=;
 b=T4WuxWu4T+efzCv8zFpGd9SXJYRNyS4n/SHP63xgXMNVFMseumXdX9Nf5DLrYgaUO2
 YNAhg3/hx4CyD4jfWNXyP3VrtvPfMMrytVVrLb/oIxaiY5D16Zt3IbLCFUDS8/JAgFoU
 2gHdQtcEBffmN/SJ+ZkSXZhHRagOhIFSnFsuFCD1q/rJi44V/E7uW0Un89i/eJFfZ0Kq
 NZGb1palhVXFA0a1kTn443iFzp/OK1Soq4srk58bLMxFjrM4FdToG83N6unAkZficdrR
 3UwmW4Zxd1zKnKMuaOR5uh1F1EJMSejbeRXYZ+SLBisVsbD6W4xwuQICrrOA4N7fXOw3
 yrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=L95wwHp5RV6cXArMSmbL8Hcv0LZd0gpd8eOHxANOlTY=;
 b=zD9kH0dEdLyDKlssp1IjY1HlTj504Ye8kVlQbA4ZUz2zPXO53qgAvTBTPvclYXptAX
 XlBxR8nO+UYmwHZAT/RivySZLLP3o9MwWG6x/N77YgWZKiOX+qdovrZbSCfNS/LXkfp0
 VrfQj0uQsu4z4+PXSC5TCb4KiVd4TMgIZbJNx7sLiS8UcWHJRyphU0AuN4gsiirLUJ8R
 YiDSONbURExizCcIV/TbaMp+OTkwYJ9J5rZliFpmxNBUsbLpEgwDG6zN2sIsj2rKG+ep
 dgFNJJYy0hbvX58niHAlVmO2BpwZDfvLJaUREQgSe1OVxpaXIWIlkujcnpZLKXKJEJUm
 ZnBw==
X-Gm-Message-State: ACrzQf2BTaR9F279PpU/UyRVsZwWby01gZrlrzZkUSHcg1Kg1H6yAV9K
 Og+KAwGPc8I5SQ5Xe7eN2HPXXINLk8jK1g==
X-Google-Smtp-Source: AMsMyM51kCNrvJnki77/fN9l29E7SC+ux30KrKSEIGsoniec5WL7nGuzrZp0QBuqYt9mq3LlQKnc7g==
X-Received: by 2002:adf:a50e:0:b0:22a:ede1:57e with SMTP id
 i14-20020adfa50e000000b0022aede1057emr2542517wrb.63.1663864563111; 
 Thu, 22 Sep 2022 09:36:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.36.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:36:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/39] configure: Avoid use of 'local' as it is non-POSIX
Date: Thu, 22 Sep 2022 17:35:36 +0100
Message-Id: <20220922163536.1096175-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220825150703.4074125-8-peter.maydell@linaro.org
---
 configure | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index b39561b2ed7..cc4ecd6008b 100755
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
@@ -2065,7 +2065,6 @@ probe_target_compiler() {
     : ${container_cross_strip:=${container_cross_prefix}strip}
   done
 
-  local t try
   try=cross
   case "$target_arch:$cpu" in
     aarch64_be:aarch64 | \
@@ -2078,8 +2077,8 @@ probe_target_compiler() {
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


