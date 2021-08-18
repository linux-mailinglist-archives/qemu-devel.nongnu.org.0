Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A983F0CF2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:48:25 +0200 (CEST)
Received: from localhost ([::1]:49270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSU4-0003Ri-TI
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRv-0000Jl-76
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:12 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRq-00084N-SP
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:10 -0400
Received: by mail-pg1-x529.google.com with SMTP id q2so3563050pgt.6
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A8MrFrNpXpMW2dKWMWI/kqasdNNKSWLTRioFEa1O27E=;
 b=drnHgvgMSuvfg5FKjPOcBzXAEA3yILMAA+zRpZg7lgQjW24dgTwc/9xOlnHtuCwQBb
 VXkQYuN018CXN6Y1cbfCQqNS3euVcRy/DznnYIw9ixwjy8ZQuHSrNfilZtUGv8JMgKYS
 JjMArgHY54SWpLELlQ24ZUmUSgqVUXv9yJkgXc/aEeMzESHliPJfFYKdebjEwag5QORq
 ulOscFqnBHWNrajBOSSGDOU6MtYmnbD9Ff0/cj+zx1TcuDX+cciTHMDO1JMXSrKuqwws
 ARQh5CD9Xa9zHo/dKgDnM9OBULdH7yYy+DuqT3CAz7cFjpiZFme5nGApCytpKAqVhvHp
 CyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A8MrFrNpXpMW2dKWMWI/kqasdNNKSWLTRioFEa1O27E=;
 b=higPkj5udu1z9V7eqvr4RY7Ysb1iuBGuROIBZRkP3SzNWk6qZm3cBEg6MP4KaCYZ3i
 5lZ3s5Ws+sTjoxoPZHm9kECthQ7ewbXeqtJ1ObfEvI1SFBXdLA60+/RzcCkKwAMk5YWu
 wqdDtGVkfK49dk54Er7X/eeCW5yHhR76D8Sr0NVtaPlqq19d4slIJp3B8dLwMDT8NSIQ
 3D/Hz/9Zr/ZYRTrobSPeVJKcRsROlb/UP2jmQpOO0UsHw6wqj7J/1vRt7GqdU+62CYFu
 oth8vj4JO4XO3MIO1GAOP+/Ix8UOwagrPBz8tHRDgJqkNQimpGB09p6SsNTucUyodCHj
 M9Fg==
X-Gm-Message-State: AOAM5328oUL+oZw8W5HJPfyRDaAYm/KzQfuY/IJms6vlkU4eYZSsgnXn
 b1hhxCxDke1V+JSKA75Y7WjpYKHvuhdy1g==
X-Google-Smtp-Source: ABdhPJysuk15P4fuYuBusoi0416AXqyVogZC43vWQf2j5wmMU1WWSsCyBwKcqbYFoPVl25rGmFrAyg==
X-Received: by 2002:a63:1358:: with SMTP id 24mr5833586pgt.327.1629319565012; 
 Wed, 18 Aug 2021 13:46:05 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id 143sm739815pfz.13.2021.08.18.13.46.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:46:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] tcg/sparc: Unaligned access and other cleanup
Date: Wed, 18 Aug 2021 10:45:55 -1000
Message-Id: <20210818204602.394771-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210818191920.390759-1-richard.henderson@linaro.org>
("[PATCH v3 00/66] Unaligned access for user-only")

Important points:
  * Support unaligned accesses.
  * Improvements to tcg_out_movi:
    - Try a few 3-insn sequences,
    - Drop everything else into a constant pool.


r~


Richard Henderson (7):
  tcg/sparc: Drop inline markers
  tcg/sparc: Introduce tcg_out_mov_delay
  tcg/sparc: Add scratch argument to tcg_out_movi_int
  tcg/sparc: Improve code gen for shifted 32-bit constants
  tcg/sparc: Use the constant pool for 64-bit constants
  tcg/sparc: Add tcg_out_jmpl_const for better tail calls
  tcg/sparc: Support unaligned access for user-only

 tcg/sparc/tcg-target.c.inc | 509 ++++++++++++++++++++++++++++++++-----
 1 file changed, 447 insertions(+), 62 deletions(-)

-- 
2.25.1


