Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8942A665EE7
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 16:18:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFcqY-0004sW-J1; Wed, 11 Jan 2023 10:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFcqV-0004rN-KF
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:16:55 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFcqT-0001O3-Lf
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:16:55 -0500
Received: by mail-il1-x12d.google.com with SMTP id f8so1948025ilj.5
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 07:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XNhhzRjgQesGyQCx5O91c3808No3znJRbVrW1W7V6x0=;
 b=zkh5k4IzzbADSwJ+bXENx89MmhK4AVt8O6zpuDh3a4XEWmpiiyhHCX//cubDEFW+M2
 Fi/qxV3EANTc3aPYSimqvUfV+9gTS9WzrRMXaI5pnZLlbcAjxgkWr05Z0UJS0A26U8oL
 012AuTbvWAvUoJTiVR7GUazdjKqTxTKLj2qV1c7G7jzqxYnWb4APMWdO71LeWv0tl/ww
 QXlmKyf+9aa8liMkGfIFxmFNEeOaYR95nUVpiU3l2kc7sWtbmMUKlO4ofHvbneUnmnXm
 KFvMNOuOGKprWc48eyDI4YGCs83t0OMe+xU/K95MK242wTQ90KDj9EuXebdM6b0U0/3B
 J3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XNhhzRjgQesGyQCx5O91c3808No3znJRbVrW1W7V6x0=;
 b=fJPbnJ1/QXRBwfQciiUYgmSXmjYPuTAym0Z3x8cSoFifH99km657CoBzVwZel9HwUH
 ybBjTLgjmFcG3jE16nSHYFkbczcECEwMvtaUZmSbmcOMLuMW2PQoa0zj4bj5SB3TyTg1
 LQq1SHz8vE435NBVkjIluhO6hvHo7BcJyuik02WNRdbg3+mc6DPUvmWCXyezkbuqmJBF
 6WGdPosf99UjAUOCb43Wv3EJyd5J1OVcjW8ivZLKfJfL3XQNRWZ2RfEX5HcarQI8DQBm
 kQ6pGUS+HMgA8UoKpqBjD7Td+AKMtDoAX7QQe5Usm8LdUQ5A1sPMJlqqw8aJF+SIDYS5
 Pu4g==
X-Gm-Message-State: AFqh2kq70Nw88KMmZqsOouV+TqtdG/ImW5UFLwUuf8OLF9OGJMX2GWmr
 Vu9/vjKrbyBOPuAIEY3ovhzuV+4ZFhZcU5rbkEc=
X-Google-Smtp-Source: AMrXdXvFh9C+5GvLvDlPUqf89BHDUVxrsEXVI2yBX4+TgsjL+El7jXwmWIWsMVaH8QA8nJ1KfZYipQ==
X-Received: by 2002:a92:2c0d:0:b0:30b:e56f:f2f7 with SMTP id
 t13-20020a922c0d000000b0030be56ff2f7mr54813603ile.24.1673450212043; 
 Wed, 11 Jan 2023 07:16:52 -0800 (PST)
Received: from localhost ([37.19.210.30]) by smtp.gmail.com with ESMTPSA id
 p190-20020a0229c7000000b0039e2c253e68sm4555638jap.11.2023.01.11.07.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:16:51 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v3 0/5] tsan fixes
Date: Wed, 11 Jan 2023 10:16:23 -0500
Message-Id: <20230111151628.320011-1-cota@braap.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::12d;
 envelope-from=cota@braap.org; helo=mail-il1-x12d.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Changes since v2:

- Add R-b's
- patch 4/5: Fix incompatible pointer type errors
- patch 4/5: Remove leftover helper

Thanks,
		Emilio



