Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFEE3A67CD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 15:27:38 +0200 (CEST)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsmcr-0006vY-Cm
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 09:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsmb6-0005ny-Tn
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:25:48 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsmb2-0007SX-S8
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:25:48 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a11so14539010wrt.13
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 06:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeoT83Z71xGZFfGyI4rXAFI6gm6/7YCqOB2QEZ8Umro=;
 b=VHgs5b6uTLYfUT1Xwbh8aLK+roIpI8HHUV68DuwagcLcxGs13io8SqAqvNU9/w3Z/Z
 q2YSxh52IDC49yu4tYfzOblRdLolJesaRjhN6Pye5MKXW+drpbbZ/Sqel0x5gUHynPdz
 u9AXRzZmbftAprutgML/VflqXfMcHURJJ9wcA1LPnXeqKwiOuk3ZNINYah2upPFaZT2m
 Vh+PyMhfHQvjAbxLfE5gOg1hYIaCGbirPL0tUxxiC/wpoQdv6FqC4PNbT6un5deRuMks
 2vVEplrGtpaTt/+uR1Q0fUE0Bn6AY8zbxM73GlXsmN2IJRpow/4scQZAwS5WddpFHJZL
 e+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeoT83Z71xGZFfGyI4rXAFI6gm6/7YCqOB2QEZ8Umro=;
 b=rQgYe8Fz3pVhC3R768UCDNWOTihQh+dWOlzeQ3GbUhUIAUGuyiKz+aSKdjpris63F0
 cx5aHbswOMFUczCuxEpwshgbuBKHn7kdFGD2QOEM80f4SaYmjiVorJBKL+8KN6srn+mE
 wgIgQ3cVIONXGPEBLiOQuv3gI8JoQaoKmmIwdEI2D51JUFwBQDXEQ60KmHHWYzPKrbU3
 o5Bt6w2fKqDm9k3pU1xx74KuN++SeTWlFCa69OeWl3EQZqZ1+pTT6Ng9rIPzmtaHWNAp
 D1K/iL0ZqmuryzLbhMJJjcQQfhs3oYoFl4bv9ZYcuxYZon0PiA3cPMV9/pAL3XfHqz//
 Tg4A==
X-Gm-Message-State: AOAM533wTTtdNoyc7hwpXfqHKEXWZjWsdbvtbzZmxV8mZqh5w3361LLK
 sYMuJfzNNZGMTj7WE4tFbLvIiQ==
X-Google-Smtp-Source: ABdhPJxHgPycqHQ0ssEt7gGhHp0iHZpeTzkt8eX5dZTjqqaIbyxYSWSDeJ7Vq6JpkZhaPB4Wp2SCqw==
X-Received: by 2002:adf:f90e:: with SMTP id b14mr19240995wrr.248.1623677142977; 
 Mon, 14 Jun 2021 06:25:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm20684769wmj.47.2021.06.14.06.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 06:25:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF7581FF7E;
 Mon, 14 Jun 2021 14:25:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/trace-events: fix minor type in format string
Date: Mon, 14 Jun 2021 14:25:36 +0100
Message-Id: <20210614132536.1657-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/trace-events b/linux-user/trace-events
index 1ec0d11ee3..e7d2f54e94 100644
--- a/linux-user/trace-events
+++ b/linux-user/trace-events
@@ -11,7 +11,7 @@ user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx
 user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
 user_force_sig(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
 user_handle_signal(void *env, int target_sig) "env=%p signal %d"
-user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d("
+user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d)"
 user_queue_signal(void *env, int target_sig) "env=%p signal %d"
 user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t env_psw_addr) "env=%p frame psw.addr 0x%"PRIx64 " current psw.addr 0x%"PRIx64
 
-- 
2.20.1


