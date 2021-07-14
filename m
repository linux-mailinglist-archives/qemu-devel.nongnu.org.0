Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDDD3C81F6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:45:05 +0200 (CEST)
Received: from localhost ([::1]:40084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bRw-00084O-G7
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKY-00032d-VQ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKX-0004fv-JL
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id i94so2395939wri.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1YFfcNF4LkvFeRrj0McNGwJ95momCe8V6bBvEw7Hvfw=;
 b=UqNGForLMMp19Lw5UIA4gWcyAfFmTBl643TKoPa029Kd5J43mWkJS7CJ55wO+QRRzq
 Tw0pWMug8PAkkes9lWu1i/tI5Gwmygb1SPx8Sq+Eq26p3vi+q3U6tEkFuVto3KtLLSfl
 bDM9gHY8laqQMVmWOlEMtKvbT6h0/WnuI99fsBIipH6tefFKUKNvGXh5HLULHNPbIdMU
 Zese1ScBX/YURUO29cS34UUAyzL+STHIpXns0nJSOBo4b8XuxIS92XgpjOl6u0nquH7o
 0lVGLy+j4SitxshAil3a2sBFNh8M/BO9sWq5kE0xBMLthFtlP/XuSzWcaB97R6i9fD5r
 lBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1YFfcNF4LkvFeRrj0McNGwJ95momCe8V6bBvEw7Hvfw=;
 b=b2cHY1xOun3jaiFJX6YJf7eQ2cQdDXBtsqEcnzVqSvLGytdeXFrN7iQ678J2F0iHdK
 Smp5ZLobsqTL0qmBKMkpCy/TNM5MWjGoy5ec2uEic5hxyXCRkr/qMnPjpbaO0J91VtsS
 WUyYAbuKGUYFmx0YsR/ldn+qgCztsS8AgFL7kFbCzdqLALwQlpjJ6bQOUP+c8r73Obhd
 Y8QFtTeE4DOamFFYSIFRBzaFK1lGA15xF1JJ3UqrZ8+QAOAl1qGEIyR+jkLODRQ8RuWu
 hupuxqZGBac/yqaRqd1KbDTLMmGkLnPUS+j2aMoQU80cvQOaYVFMyLO7Q3plCZPw1YQ6
 HjVg==
X-Gm-Message-State: AOAM531Qu2tMTRT45FDo+I4y61pQB22gzosmuF3Ve2BK6IL5GIu5W/Vp
 MBhDDqbLiVjwUieWHH4uN/Zw/Q==
X-Google-Smtp-Source: ABdhPJzWliUH+Ig0zMgvqWsw9so4wEKh08v8twphwmGtOk07vo4f5kO5h9cAjT4BjxSfAGNdEPW0Dg==
X-Received: by 2002:a5d:4a44:: with SMTP id v4mr11451804wrs.219.1626255444287; 
 Wed, 14 Jul 2021 02:37:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm1837495wrx.59.2021.07.14.02.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0782E1FF98;
 Wed, 14 Jul 2021 10:37:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 04/21] configure: remove needless if leg
Date: Wed, 14 Jul 2021 10:37:02 +0100
Message-Id: <20210714093719.21429-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was pointed out in review of the previous patch that the if leg
isn't needed as the for loop will not enter on an empty $device_archs.

Fixes: d1d5e9eefd ("configure: allow the selection of alternate config in the build")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index 4d0a2bfdd8..013f327f4a 100755
--- a/configure
+++ b/configure
@@ -5083,12 +5083,10 @@ if test "$skip_meson" = no; then
   echo "[properties]" >> $cross
 
   # unroll any custom device configs
-  if test -n "$device_archs"; then
-      for a in $device_archs; do
-          eval "c=\$devices_${a}"
-          echo "${a}-softmmu = '$c'" >> $cross
-      done
-  fi
+  for a in $device_archs; do
+      eval "c=\$devices_${a}"
+      echo "${a}-softmmu = '$c'" >> $cross
+  done
 
   test -z "$cxx" && echo "link_language = 'c'" >> $cross
   echo "[built-in options]" >> $cross
-- 
2.20.1


