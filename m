Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AD2626758
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 07:12:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjjr-0005vr-Bx; Sat, 12 Nov 2022 01:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjjp-0005v8-N8
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 01:11:33 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjjn-0000v5-TF
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 01:11:33 -0500
Received: by mail-pl1-x62c.google.com with SMTP id j12so5872632plj.5
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 22:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hwv1gfZ24hvaucqLJCDayuViSTWMtRd0Sz1yk3hYUlU=;
 b=DuoRDoXSrdNvjF1OYB8258S5PvGitm32OF3wyxfXmZHRzQEf0NEJ240UXfZgzgUQds
 7OMRmEh3p5pIyLDaYY1JNHgvjNK1UkjcwhwZwFa8+7f8crZrvj6bjVuzSZoRg1s5IFZX
 RRm7oUYhNCskW3XBgnc7/1XrvGKDYyAm8aCXYeKn7a9e2TFsOzyKUA+u3fwZ+1qVR1pp
 recXKzGiwhx5d7SyHrzYscPEgswQ5hi0GVTaxo671kcq1JJT9n6DHV8EGjVEVY4nX8/f
 Vh5tSqsAZGaUtlBuL1qOe+AXl/PLlDA39XYQkhe6SLHWXJL/DnpWEiTncrqVnm0YPEHS
 UVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hwv1gfZ24hvaucqLJCDayuViSTWMtRd0Sz1yk3hYUlU=;
 b=3KAP9k35lO3+iUsv66oViTIbnZy2/5+p93/Nx7EaACkGa07EO2FBTPVgdGnDoZzExh
 fA0MKpVqZA/1GHDriy+v+bIR3PiqZWLgbIeAYsrCQrKWLj4EAcskEtIuzDFMeGF24zhi
 Iz3nX5IJv1Uw9Hlq4jOVLu70oTSzJ9c7tSh8Se0pTrril8p0gJcIiWTqoSlh72Noeqtd
 k6w3FUEmzUYAqL9D9JtNNJJ932cHYW3fyaofwKvgn3SqOEUH59NvhQbLrZY8KgnoiqKj
 m2QMnuJRG2kwYF08In4eYr3U+WetHAKiQgIZjd8OAH9kJGNtI8Vu/p8JPSTIYqXHCLnQ
 dosQ==
X-Gm-Message-State: ANoB5pkodTHofksCHOcnELogJvEKrC1NrpeRDjdSKnI+HWsfuy89b84N
 E8glGXSZYaY7s1+MZdP0fXqNPsbRdSI/s4kB
X-Google-Smtp-Source: AA0mqf4ORrFs1vXKGce/w3EFfpvV6xGDLHD34vQrd3dI9FWESd8v56b4BZ6IHJzFfKOXFtBkyKMamg==
X-Received: by 2002:a17:902:db01:b0:186:6d69:6e01 with SMTP id
 m1-20020a170902db0100b001866d696e01mr5482111plx.160.1668233489457; 
 Fri, 11 Nov 2022 22:11:29 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 nm13-20020a17090b19cd00b0020087d7e778sm5790163pjb.37.2022.11.11.22.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 22:11:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@gibson.dropbear.id.au,
	danielhb413@gmail.com,
	qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 0/1] target/ppc: Use tcg_gen_atomic_cmpxchg_i128
Date: Sat, 12 Nov 2022 16:11:21 +1000
Message-Id: <20221112061122.2720163-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Use the new common function and avoid rolling our own helper(s).

r~

Based-on: 20221111074101.2069454-1-richard.henderson@linaro.org
("tcg: Support for Int128 with helpers")

Richard Henderson (1):
  target/ppc: Use tcg_gen_atomic_cmpxchg_i128 for STQCX

 target/ppc/helper.h     |   2 -
 target/ppc/mem_helper.c |  44 -----------------
 target/ppc/translate.c  | 102 ++++++++++++++++++----------------------
 3 files changed, 47 insertions(+), 101 deletions(-)

-- 
2.34.1


