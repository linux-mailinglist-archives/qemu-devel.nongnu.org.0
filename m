Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32AE6B4FBA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:04:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah5m-0001wZ-5H; Fri, 10 Mar 2023 13:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5h-0001tr-53
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:41 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5e-0004cU-Ph
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso4039130wmo.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3J48ZIlJty5SjEcqPh4KFI7+VToMJK08hOwjYrTsvw=;
 b=Ezwmw1WjrbkgBc/1/P6jjdNoHq0R0kL5sBWqPG567iZX1/bXEkjIbNg5E4EvYHYL1Y
 WOJG93VKP1eMGi7zqKEy7ek+LG/4S3ni4n3N6tAwGBb99Uk9qv3fsTKi+A5k6AICXoTn
 XPMtqqpr5DA31Tk6/0rFKbVnkbM2G/G/ANjtsjm2Bflj5HRYItJertQDnLVhHKv9TtWa
 eZE20hV+2dUtUy/FpTrb5ymAo6JOBvDo/w/wDJM5EeexpDSJd5KHSu2QEc99FzlOAWvA
 Uh7Cex+BODAZCiBRpEXNrGS1xCophx1x8LMyTBI88oLGEer+kB52FH9gtRhzgLRkXims
 jkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3J48ZIlJty5SjEcqPh4KFI7+VToMJK08hOwjYrTsvw=;
 b=HFODzTVa4A6qn8SwnFm5Z/w3Mh0ztn+50a5tKmCmQwNrpPlozsCWkp5w0iFV5w7KHk
 +Dpc8gA9mwsinCXBJBnqvFAP4pIGwHqr5frrwpZqkhGX+ZodPxFjjauErRLQhJFogxjN
 XW+Qkg5IUQjAeOYOUrIdnRy/EWdIjJNbJBJAyYk7Kw8rdWabbyDVzkZG8QE1CkEZeXY7
 ROdH4zqS/8mF0wiWBSicQv6b4drl0LIhleyf+SM3T4Hl/MQM/FoIPNEupFhrbtkMrOar
 KZtLae18j6FSgivNbD5q4WKkLScajYA0L7N7NRWPMWU2yUmG53/dCNTmiUyCtFK2JdKK
 6MPA==
X-Gm-Message-State: AO0yUKVB7lz2kv14gYIPY8AI3JfVePcSLAPVZMBvjDhUIWSR9xvTv221
 8j8xWjxhmlp6yEpJvxys3duzDBethQn18U14MLk=
X-Google-Smtp-Source: AK7set8sk7c4+6rNHxePzgoaacoNA3Lb+wueHpGx1aT4Z3xZtpBhRy9SLhSUpV+Y4upurMkZbK3kzA==
X-Received: by 2002:a05:600c:3151:b0:3eb:f664:b6e with SMTP id
 h17-20020a05600c315100b003ebf6640b6emr3539212wmo.24.1678471417154; 
 Fri, 10 Mar 2023 10:03:37 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a1c7403000000b003dc42d48defsm596041wmc.6.2023.03.10.10.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:03:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A09691FFC0;
 Fri, 10 Mar 2023 18:03:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Niccol=C3=B2=20Izzo?= <nizzo@rev.ng>,
 Paolo Montesel <babush@rev.ng>
Subject: [PATCH v2 08/10] contrib/gitdm: add revng to domain map
Date: Fri, 10 Mar 2023 18:03:30 +0000
Message-Id: <20230310180332.2274827-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310180332.2274827-1-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Not sure what the correct style should be, please advise.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anton Johansson <anjo@rev.ng>
Cc: Alessandro Di Federico <ale@rev.ng>
Cc: Niccolò Izzo <nizzo@rev.ng>
Cc: Paolo Montesel <babush@rev.ng>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index e678c23a9c..ee0804b6ed 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -36,6 +36,7 @@ oracle.com      Oracle
 proxmox.com     Proxmox
 quicinc.com     Qualcomm Innovation Center
 redhat.com      Red Hat
+rev.ng          revng
 rivosinc.com    Rivos Inc
 rt-rk.com       RT-RK
 samsung.com     Samsung
-- 
2.39.2


