Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12AB63D757
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:58:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NaA-0001r1-EE; Wed, 30 Nov 2022 08:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NZv-0001q0-GG
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:56:49 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NZt-0004Oy-KZ
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:56:47 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h11so19929038wrw.13
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7poDGPwoXJh3hQWSRQU8PLVJElCYIIFScCf3O9y5iq4=;
 b=vyWRfqprfxRXStJHph9c5z6lYVWjHd4juQ3v3pNZo/4jTbF62A8fq9eBeySVd691ha
 0vXUvYZ5niT1wd6zO68C7JpVsdR9rt56Zy7hDMp08hWlzsLLYgj0UiyUSuQ2jEMDFLx2
 KIvNKAFTTqcIKLlQyPYldcGu25N5U4sDaH59WcCQowOduBBOXMuUDn60CVbaFzYW3IOX
 vBx8fIY3R/KqxbL1rDlLBq4dJ/gwblNiNS//XnQbehfNHnbBNTaRm5H6mCjBR+gbqOqP
 +8g+3B2XfYnaICPWgaYpr4wAP85cs/2ldMoRpN/2qwy0m4CpkQKyKIK7WVd+WTaRnSCu
 MpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7poDGPwoXJh3hQWSRQU8PLVJElCYIIFScCf3O9y5iq4=;
 b=6BqUKycfyZ53m617zc1i4cEOqGTtnuEJo+RtUh62tT31f2+cZIpKSvZ/jnNhSdAw3/
 lYve0rS6AtdpbUQ6KuomHaJOEo1/9TxLMEGbVVaBrsr1f5UMAdrnfX0Nmyf+kkqC2OGH
 5WVrxcO+7c7jjQO2sQjCnsrJha7kR1lE/wLX9gcTMgbu0lSbC71gX9mmr9+MRuZMv1mR
 k2zoImGObkDSi6jfrXyhnfObZepmV5HfxH8MZbNv82KzrGhFqnd0lDcvjdAKUW+eUMGM
 F3skQpAaZSifK/unqcQ1D28kwatJG4z47drYrJy7a7G5hzjpSs2ZbwA1kbeIsqqZAhZl
 Fn2g==
X-Gm-Message-State: ANoB5pnaXrJ1S01CIhxCCUH7z8CRbDHyzPkkKItYDx0szUliG9oltLcN
 7wlfO6dS73/1EsufztSyoqjm/r9inr5QRQwN
X-Google-Smtp-Source: AA0mqf5nJufzsztLlnGlEeklVlNOhABAs+m+QwSTVVFj9e6/KtpDk9EvccpWj6SP1OtdJOiNe2w4IA==
X-Received: by 2002:a5d:595c:0:b0:242:763:34b1 with SMTP id
 e28-20020a5d595c000000b00242076334b1mr16099456wri.235.1669816603436; 
 Wed, 30 Nov 2022 05:56:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b003cfa81e2eb4sm2265152wmo.38.2022.11.30.05.56.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:56:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-8.0 0/2] hw: Reduce "qemu/accel.h" inclusion
Date: Wed, 30 Nov 2022 14:56:39 +0100
Message-Id: <20221130135641.85328-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Another trivial series, restricting "qemu/accel.h".

Philippe Mathieu-Daudé (2):
  typedefs: Forward-declare AccelState
  hw: Reduce "qemu/accel.h" inclusion

 hw/core/machine.c       | 1 +
 include/hw/boards.h     | 1 -
 include/qemu/accel.h    | 4 ++--
 include/qemu/typedefs.h | 1 +
 4 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.38.1


