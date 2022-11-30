Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C78763DACD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 17:36:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Q2w-0003jk-ND; Wed, 30 Nov 2022 11:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Q2r-0003ga-8D
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 11:34:52 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Q2l-0008RR-57
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 11:34:48 -0500
Received: by mail-wr1-x433.google.com with SMTP id z4so28024793wrr.3
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 08:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=drtb5gGliDsZedmGK5zPJtU/IK4CqfoDuBl+wux4fJU=;
 b=KR9f57aX1p74fNTnASVX2UmunmVx7+Hnz97B8uk2kGRXmLD3IOpDxJ+9caJc1GFQQD
 X/inahr/QfMZyVJ55DwgNjHb6hcPwvV67S0UJaHA6zKlSOzGXNlRfxPt5g9knlxkx5c1
 ns/MDgqxO3IvemQVBPyEkPdGM95r+JyAYSy00ClDCnWe18eusi4vrqT6kfys0skQ2p//
 IgEdLw0yoYH5L/5pJ40AIwG2kO8DNYTWzJy4npHc1U5sIYB+XcDNGiQ4OYkFoyc/T8qC
 lms1LKKx8akJDppXXvld6JDvnF2AnPVNDITnonmmYcZO36DbqKs/c3q0BAa0t3hkOKZq
 chwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=drtb5gGliDsZedmGK5zPJtU/IK4CqfoDuBl+wux4fJU=;
 b=lS3+26ifTT13TBtCM4L0OQVNnMYMrWDm1U3ZLbqkOiWjgMCaCGnKG9gaz5ko9xjVjC
 QE76nuHVXA4eNS8GGKIqodVgbbgArm0vcWUKEk4d8HBhu9xpKtQSE+6Z6oFKgYSWrbP3
 10nqEk6WY3KJL1SBLD+BoZ63RJnMS0k7kx2caTW7XtKDD8AJRKmj79RSlMwcMsOCVmxE
 4J6RTsM9xCMC9NPxO2LP0dK2NOYeZ37S34AxUk+nUbyo0ExH1t2ENQ7psgMz0uXCpmkb
 RGX4MAZGiBQVp9ZMlzx0hRRLgY+k+LwW5EceU0DeRtZbnhRkftiJ5M2+6i6Ppq85FVh+
 lc5g==
X-Gm-Message-State: ANoB5plI0k2ftgZc2P3jnuc6LhOdjyfESQn5ssEWhK7MgSEWpAg3Hj77
 xUnPAhLVQTKzt8LoruhM6U1GNMG6mL63GzOo
X-Google-Smtp-Source: AA0mqf7lFAGlvMnUrbuqHnPjjMtsNwn+W/AvFKo2vY/fut2CFVnMMjggC/K7YZm1+BAC5f+2h9N1/w==
X-Received: by 2002:a05:6000:83:b0:242:4a6:5baa with SMTP id
 m3-20020a056000008300b0024204a65baamr16932845wrx.102.1669826079013; 
 Wed, 30 Nov 2022 08:34:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h40-20020a05600c49a800b003b3365b38f9sm2361096wmp.10.2022.11.30.08.34.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 08:34:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alessandro Di Federico <ale@rev.ng>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 0/2] target/tcg: Use TCGv_i64 with tcg_temp_new_i64()
Date: Wed, 30 Nov 2022 17:34:34 +0100
Message-Id: <20221130163436.87687-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Although on 64-bit targets TCGv is defined as TCGv_i64,
clarify using the correct type for tcg_temp_new_i64().

Philippe Mathieu-Daudé (2):
  target/s390x: Replace TCGv by TCGv_i64 in op_mov2e()
  target/sparc64: Replace TCGv by TCGv_i64 in gen_op_multiply()

 target/s390x/tcg/translate.c | 2 +-
 target/sparc/translate.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.38.1


