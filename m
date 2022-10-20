Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1CE606208
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:43:39 +0200 (CEST)
Received: from localhost ([::1]:58842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVph-0007Vx-Ds
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:43:37 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV9P-0005uk-Fv
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU61-0002dT-8w
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU5v-0000nd-4b
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w18so33982804wro.7
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTmZioBHomlpJDRXUv3StRRoYOLWVw0UemeKw+NtcTA=;
 b=os4l0wMssUM528MPVwaRW2CHGjVhaylClzMz52gWKwAM8AfeYQk+1mBLvs4TFBQQDK
 vkzCeBGxRrnuDUQG9f0Wrd+Xpxay14Z6dki6OLN5ajxKvtrB8s5sUz/OClSAENeIfVAE
 k5vd/fCXE0eQmhaDmqDQ6E391uhkyFZ0WzuQ41RQXvV4QEM1VZ3dKeQY7PAIY70PuaxJ
 xmefraRa/7X6dSRlwdTE9/NVy4y9PGr4cL3y7+fBOoTTbD4ZrVnDJdKYhYIQNXXl+4eh
 2DKzAL08MP9kNT5jIAU2ueCIomTgr85eXWmMNJZ1bOzPAHh9fJXxA+2tn9+XweJt3uQa
 QsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eTmZioBHomlpJDRXUv3StRRoYOLWVw0UemeKw+NtcTA=;
 b=Vt+HXvzBdAr0jRRIO8NkBsm4+RHs38Q83lZSMh6PKoOzRNGhF2lMfA1wMgKCKUVOjN
 fPfauYOak5I4TE2UiE1bEBnp8rpZhBYOdKxeWj6XY3Qcghpyix66a9uYoCzYF0swOijh
 BlRUHyEQkewiJ+wdZN0GIV6gMusYbjtDFVoguCUYLL9ILRIietktdIeuKm8tWEgUInME
 zz+2b6g0DeqlUdHbJga6Onzm10KThm6RRDOB6yT35JcHcovl2NPh4fkHPXQ9u4UhtVoF
 2XEU1wW89U4TC1QbyZfoqoFEZxCqToufhmP1LjyeDCLISErpgXMyAIVAx+LWQujTMdRM
 UfTg==
X-Gm-Message-State: ACrzQf0R5ptHUMrMh/ZqUSeOpYh73lMZfNEz4jCKSAUjmmznuWqeX3gx
 xGHO/RdZZl0gmeCY6qipxk0+Tg==
X-Google-Smtp-Source: AMsMyM7/eIkIUA91v1QrzL+njTRNHqi9jWrIkidHFkyCa5e/Q5n6kOt5rp4WMg/shp6+Y3QVskPKDg==
X-Received: by 2002:a5d:6683:0:b0:22c:dcc5:abb2 with SMTP id
 l3-20020a5d6683000000b0022cdcc5abb2mr8157504wru.85.1666266733888; 
 Thu, 20 Oct 2022 04:52:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m8-20020adfe0c8000000b0022efc4322a9sm16207372wri.10.2022.10.20.04.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D95A1FFBC;
 Thu, 20 Oct 2022 12:52:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 04/26] configure: don't enable cross compilers unless in
 target_list
Date: Thu, 20 Oct 2022 12:51:47 +0100
Message-Id: <20221020115209.1761864-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

This avoids the unfortunate effect of always builds the pc-bios blobs
for targets the user isn't interested in.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/configure b/configure
index 81561be7c1..dd6f58dcde 100755
--- a/configure
+++ b/configure
@@ -1877,6 +1877,15 @@ probe_target_compiler() {
   container_cross_ranlib=
   container_cross_strip=
 
+  # We shall skip configuring the target compiler if the user didn't
+  # bother enabling an appropriate guest. This avoids building
+  # extraneous firmware images and tests.
+  if test "${target_list#*$1}" != "$1"; then
+      break;
+  else
+      return 1
+  fi
+
   target_arch=${1%%-*}
   case $target_arch in
     aarch64) container_hosts="x86_64 aarch64" ;;
-- 
2.34.1


