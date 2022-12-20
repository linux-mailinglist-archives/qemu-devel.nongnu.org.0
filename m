Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790656522CB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:37:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dij-0003gi-9U; Tue, 20 Dec 2022 09:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7diU-0003cN-Qv
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:35:43 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7diS-0000uV-M6
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:35:38 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so8943603wmb.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XMhNOxAat8eNdkiyGs2Ix1znKG/kXZPirOJB85LUlpI=;
 b=tuuTtptZkDdQy18iveDruU5wWLxJ6mNE/yT0lBCcCrqdm4wABFOo8dLKXQkDGTw7BX
 9hXd1cX4za77C69lsCw+xk3IHettYlv3hyiQHBqCRmdJYiNPi5780Valcxv4eT2DhwcU
 i55GnbL06FU6+zBl0NF3LVUgqrovzCTA/tihvRF5SipJYyp6xVScXhVB78oFlWCeMvNL
 tSSNgFnrlkv3BKKV8SMvMZmxScasaW8ffUBAWw5n09b2Bbw6c8ZerBdMMSj1uWMWE3U6
 CubFmqO7N3BF4eLsPVvHUxHRt80idvZkkDZY5KAPZ4LN88Lu7HomQwYnVnC7S3Csiw6x
 EENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XMhNOxAat8eNdkiyGs2Ix1znKG/kXZPirOJB85LUlpI=;
 b=qp7vb1TcVbFpwv/UUdihvzkwGdpufY3qr1HtW5RFRSf7e1gtn3yeFjVHWTd4wuK5y+
 6+BSYFuZSjWYeUDeObRHpRrxBS/D7K5ZMB/IgNagat5BQQP3wx1xegrQj0s2bDEK6jSD
 fSYjKmrOh0Xdq0BE/fXmidhyKPDK9W9tnJRtcQtiKd9q7JTW8ya2VTDs3IHClYw1Eg1Y
 R8Y5ZY/MEaH66YWOclEUnToBWsgzKCJEnF/MOOyopYO/16bgQB/xZAnc8TL056RqhMXa
 fNKIUDqOVHTBu3nD4VD6cY2agERc8OJ1ZbVX6XO13Tz3xpyb1kBkaTg7Myw8stjs8sHH
 YtFg==
X-Gm-Message-State: ANoB5plv8mNt+lgTWiZLApXCcdpvoNuv30Chk7i1jFJ8sBg27gmtqaPi
 nnthBpWEET5ByzeFQNJR+XQ8jUKk8wOa616Hb3s=
X-Google-Smtp-Source: AA0mqf5ML62RUlsRMzJwc1uHMgsOffxm1fGEha6ZD3GBjMuG3hi8X9xxmxuHJ7xNgGdwVXkq/13FAA==
X-Received: by 2002:a05:600c:20a:b0:3d2:7e0:3d51 with SMTP id
 10-20020a05600c020a00b003d207e03d51mr33818412wmi.17.1671546934177; 
 Tue, 20 Dec 2022 06:35:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a05600c221300b003a3170a7af9sm15867680wml.4.2022.12.20.06.35.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:35:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] accel: Silent few -Wmissing-field-initializers warning
Date: Tue, 20 Dec 2022 15:35:29 +0100
Message-Id: <20221220143532.24958-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Silent few -Wmissing-field-initializers warnings enabled by -Wextra.

Philippe Mathieu-Daudé (3):
  tcg: Silent -Wmissing-field-initializers warning
  accel/kvm: Silent -Wmissing-field-initializers warning
  softmmu: Silent -Wmissing-field-initializers warning

 accel/kvm/kvm-all.c | 4 ++--
 softmmu/vl.c        | 2 +-
 tcg/tcg-common.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.38.1


