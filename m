Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583846AA094
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 21:27:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYByL-0006Uc-3f; Fri, 03 Mar 2023 15:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYByJ-0006U3-07
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 15:25:43 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYByH-0006bn-9B
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 15:25:42 -0500
Received: by mail-pj1-x1033.google.com with SMTP id kb15so3793736pjb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 12:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677875139;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=d6XXMtWdEovdJh8tgGrxV/Hfw8vpbYY1tq98vF5SzkU=;
 b=VphQR7d0MDi0wJfs9y18vvgWtwAi83z2BVznqaCzvR9LvKkmBfpxcFZzudMQQOwP0R
 sDU2usN19LaJmD7rbXO5VEGMIkanNf2frGf8JiouOIsrIPJoZ6rjmtN2Xjs9u7qYdsm8
 rUTvAeXW0ZdR5xElUP6obnf0cELo+aItyGM6EO3n/Ft8kT3JwpiDVZqeRWKqaXjm6xEX
 shO17eFwFmQhV9FWEGFW0euZynXjsvss/sCSKeM6bsAqJGhsG/OdtsM1qJBF8nnS/ZWw
 JWja8KAgPElultlUnGsC/sQU2xTD1reBQcXRHJ+vSg+3e6PT853UXXS+g6SM0fbjgI6+
 CzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677875139;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d6XXMtWdEovdJh8tgGrxV/Hfw8vpbYY1tq98vF5SzkU=;
 b=VfEeLVj+2nGa9YOKfE6XVakRJlPb46QxcnQBgJu5Nu7DPKIMMw4rvzQbfV8fqN3kmm
 HSo20MNR2F1WV0kNP3exlQBOPzPe/5ZZay/LUuEDM9OuCmkAziE2THiiV602cHpGsgHf
 uqr3lb86fkoHvx83oh4I0ufynLVbwEVEoCH9qAoh+PKRGTNFenBa3xA/fNW1UdDj3XnN
 1ZeHBVigVC1/8UyhOx5FPTGtHE0cY/N0b+d679y+MxM3eP/Q4b/g3HMUJfagPFtxmNnI
 OqDzObdGS+ZFT4505GNgB12PTJmzBoH9hXEmEnVmK3P7tizjJdkPhWSJjQBYMcIGnXp4
 NMsw==
X-Gm-Message-State: AO0yUKUf4jz9WHLtfrEtlWzEiT9a8qp2Q1HBygkcshkxGpHlusYAGx1M
 e5Qx/yOMTbrYe0ZE1qbiNXMIkg==
X-Google-Smtp-Source: AK7set+pNy75bqVk1MrFRu0R0caVoJN+FRStKvufVSyUufCwKUkxk0+BVHCjenAzZQnDyBjlzG2CKQ==
X-Received: by 2002:a17:903:22cc:b0:19c:ff35:35d1 with SMTP id
 y12-20020a17090322cc00b0019cff3535d1mr3736228plg.6.1677875139614; 
 Fri, 03 Mar 2023 12:25:39 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 ku4-20020a170903288400b001943d58268csm1901589plb.55.2023.03.03.12.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 12:25:39 -0800 (PST)
Subject: [PATCH v2 0/2] Fix the OpenSBI CI job and bump to v1.2
Date: Fri,  3 Mar 2023 12:24:46 -0800
Message-Id: <20230303202448.11911-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Bin Meng <bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

I missed the second-stage OpenSBI job when debugging the v1.  It turns
out that the Docker update dropped python3, so this adds it back in via
apt.

I ran the whole CI this time (via push-ci-now from the docs) and I'm
getting two errors:

    clang-system:
        46/96 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_timer-test           ERROR           1.14s   exit status 1 4321
    
    pages:
        htags: Negative exec line limit = -4825 37

As far as I can tell those aren't failing upstream, but they also don't look
related.  I'm not sure if this has something to do with my fork, I'll try and
poke around a bit but figured I'd send it out in case someone else has seen
something similar.


Changes since v1 <20230224212543.20462-1-palmer@rivosinc.com>:

* Installs python3, which OpenSBI depends on (via kconfiglib).

Link: https://gitlab.com/palmer-dabbelt/qemu/-/pipelines/795696098
Link: https://gitlab.com/qemu-project/qemu/-/pipelines/795635851
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>



