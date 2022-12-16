Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E9564F41D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:29:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Irr-0001WS-QG; Fri, 16 Dec 2022 17:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Irp-0001Vy-SM
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:07:46 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iro-00065Z-7C
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:07:45 -0500
Received: by mail-ej1-x632.google.com with SMTP id u19so9255108ejm.8
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F8aJDmXaJ45RwFgpaAMRLc5en+AzGpJRkJS1lv4bVUU=;
 b=Un7xZStzCgeJwfbzFGvvuKI64oQoTAYOaj4nDuFHdDv8fch6sdsHmzN1m3ysk9Vfmy
 mwM6FdoCkSqbArN4DmhjifBAKf1zLtdaE0qIpBufGVDg9dTMwR7p1TUGB6+95M2Xikk6
 DNtxSZ29wd3+Kd6isoJw6WzdrNnFh6Yi730rLfaU5A3hkQQ8TsZixgg6ixImURn22uMh
 4M7zD9Vlj402Kb2Wyb7MeJmPKVlQfTr8SWiVroT2kQuajrJJav6qSFO/mdSjNlqZeF5/
 Alu1fMH51kFwtWOhC+6zawL8AbTDBsqKrGtbrBKDzu6HixFH4IwbUFSAdMfZQyRjtbmj
 O89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F8aJDmXaJ45RwFgpaAMRLc5en+AzGpJRkJS1lv4bVUU=;
 b=nv2Soe8Y5XPwKguz17lSm5N760HFZnrHj7BOfhXj5Y0TZd65e7xCwUpk0LCP0wECZs
 GjhWrH6Z7PzzrOBpwcMXU0bKhxv+5wMRWGlsN+Lx4OJult1a1bIPAD4sC+d1yu4sCDoW
 G2qP1RPNE8lBcV1ZDNOwHBZrQ+EHRwZhAq/Gl4RSuPjRlXj5WMn9upgQgsIRcKG7scZc
 g6xzi1QstyV9rienialauo9hLvrmathMngg6gm2N1mXr7IRz/p61wZ9WV/YjrI/SsuGF
 H469bQb4hWu8rfO2Y0XqFQOdBssLm61eQ5O62s6TmnvmKHyyhJH+ZvtbYrEf2cEsyw8G
 8dIw==
X-Gm-Message-State: ANoB5plivZh/PTUtBZyzCG8ht3m8B5Se+P/MhwzSV/8PeypCdgCub64Z
 IsLd/Wj8GsErPVz4a3Z+Il3/N0OtgfP6osvMz5U=
X-Google-Smtp-Source: AA0mqf77vAvGiZ9Kd5R3p7qXCE2gyNrK+9EPQTV5PoFhN0NSvB0665+jYPW5Y+BZc+XOF6szbDoXyQ==
X-Received: by 2002:a17:906:2506:b0:7af:1139:de77 with SMTP id
 i6-20020a170906250600b007af1139de77mr30684332ejb.4.1671228461556; 
 Fri, 16 Dec 2022 14:07:41 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a170906088b00b007c11e5ac250sm1298642eje.91.2022.12.16.14.07.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:07:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] sysemu/kvm: Header cleanups around "cpu.h"
Date: Fri, 16 Dec 2022 23:07:36 +0100
Message-Id: <20221216220738.7355-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

These patches are part of a big refactor cleanup
around "cpu.h". Most changes should be trivial IMHO.

Philippe Mathieu-Daudé (2):
  sysemu/kvm: Remove CONFIG_USER_ONLY guard
  sysemu/kvm: Reduce target-specific declarations

 include/sysemu/kvm.h | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

-- 
2.38.1


