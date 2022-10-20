Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD8606301
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:27:53 +0200 (CEST)
Received: from localhost ([::1]:50954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWWV-0000vb-5v
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:27:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWHT-0000ys-25
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDO-0000Z4-AX
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:59:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDL-00050F-0j
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:59:57 -0400
Received: by mail-wr1-x431.google.com with SMTP id i9so837062wrv.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUQ6aWo+0ebt3EjilzErJ9ygU5AofdO9dMDmTcEwi6Q=;
 b=RcOx56Ek6IOVPbvla021kX5mILMjLI0Uj2ogIfv8o3r2wCbghQHqYWzyWI08rt/4lf
 eEUWTbQDWm3HJWBKcXqrUuoeUd8UlL7DH6ZBeaD/ba6a+xOSeHCx0V5P1h0C3gJ6lvKB
 UmeKgH/rzEvT739lWphy7BjK5tFpuK7Pyze5PxAlegLTFns79dntVGZ1ITxPmBGPvLda
 a5kDw3P7Pc8FoE4+lSJBvNtZnYdr61vW4IY7hD0uZz/81q/I3GnNVP2oLvbQ0/4IOi+r
 5mgump15ljUiNCUmDpB6rFsxkpN4gnqdS4T6KT82KdFXBLsI8vPlL+Ihy55dprrHN+l8
 gz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SUQ6aWo+0ebt3EjilzErJ9ygU5AofdO9dMDmTcEwi6Q=;
 b=TbCuuCWjM0TYt3kFe3QPDDGAk/W/IGb99aEtVKrr+mCJFJNdDKI0FNFhpm/8OC8n0v
 yBpWXWopT9OZkmCMStiJb41VKNVKFbPQzp+3a1pHLkxt7qNPlV6uwfZa6+JB1FKSLqJt
 Uclag+CiFIUqsEfMVDrJ4JdWVFB+XzlA4T5mHpvEnhOJJwBXR2OzryL1SB2apBpmdq49
 26d0dNqsgGaG//a8QGbCCWQUe+1NikQrL6WsyyfIDHE/EE/Ai3RzD4/ahE6Hi91FqwaX
 iRnb1Qqp7eemgra6tK5/qeg751+6vfaM1QG0Taok9ufYd0u8qO8I9EU1RaFp8u07Xzfz
 05yA==
X-Gm-Message-State: ACrzQf1SOH8v36dLK6Me5YPYJbXpjQ8uNRP3XRTRYx6ZVxGRZlu1XVsI
 CkVS35G+K1XwmVPiQZ7FGYqkXQyXFDvI2A==
X-Google-Smtp-Source: AMsMyM7Hr5rvsy2TGautm/QU9Wvm1YdEx+jlnxQKkVq18MYsgFIX0GF4VBqUl6g7xCBcuQt2t6dbvQ==
X-Received: by 2002:adf:d1cc:0:b0:22e:6359:f999 with SMTP id
 b12-20020adfd1cc000000b0022e6359f999mr8249360wrd.667.1666267192817; 
 Thu, 20 Oct 2022 04:59:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c19ce00b003c7084d072csm2821169wmq.28.2022.10.20.04.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D27F1FFC8;
 Thu, 20 Oct 2022 12:52:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 17/26] MAINTAINERS: fix-up for check-tcg Makefile changes
Date: Thu, 20 Oct 2022 12:52:00 +0100
Message-Id: <20221020115209.1761864-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f4c50e8eb..1b41daba88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3727,8 +3727,7 @@ Guest Test Compilation Support
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
-F: tests/tcg/Makefile
-F: tests/tcg/Makefile.include
+F: tests/tcg/Makefile.target
 
 Integration Testing with the Avocado framework
 W: https://trello.com/b/6Qi1pxVn/avocado-qemu
-- 
2.34.1


