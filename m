Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFD3F0978
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 18:45:53 +0200 (CEST)
Received: from localhost ([::1]:47302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGOhL-0005QP-LL
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 12:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOf1-00035H-60
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:27 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOez-00040y-PM
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h13so4544009wrp.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zAKUeOkUESyJPa2B7kZch81NeqUx+Ccb1+bggUH3TvE=;
 b=ExA0JaLW4q6prKOEBe9w3wLtRxMf7E4krc3bSnkOoXjozs6iIXgeblJIYgp+y5oYWl
 ErDIeS5kWCWf+Szh1rML1f8u+VnGDI3IJ2HA/gsFCrcW79H9Z+4t7Z1S63LGYlwnXuyw
 A7DMJP5V4KQXB26g2bragqY8GuXf3RtbDU/3wL6k/4ySNcZGmwuQQcsVOpAAzLqVIW2Y
 KYleTbTuzUZOO96dLLmFIUK+g2+VRNf1B0IaLEewLffjTQVpdeixK31HnkxXhUMSVbDN
 Yb1ZX4ShvtGRtiSmCqnBOd8DD7Z0wONHIlZScUyyCSj8geHCvMjZdJyw5UnlyF7w9IQX
 2ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zAKUeOkUESyJPa2B7kZch81NeqUx+Ccb1+bggUH3TvE=;
 b=P+ngc+V/o7xHT/5sevgZmtZjYei/MCnqZUzh/p2Rytxt5deG2ZjhrYbg+zala10smP
 xsnUlqjwycLo0ujQbYLwUE0La1yBVM9FfAcqKdLjHMPnf4rkcFZArgWwVzyIf7gf766G
 r/RNIuePY2VO2ILaTUPhimbDm++NVgupt2qz6h7/s1DfVsblqBXvbKbJnWieG89H6i5j
 6z31p+tHd5lRDXMOef+rOSEsxlUvUYlyaw7ddHuiTvG7D1B+nZiz3WWVBBexk3aQQ8Bd
 VgvLFS6kDAGMyhGRPFY0P8mv1SXpTSSBuMOLRRZv1tjHHixY6fB3bTnVaBGJngLpFccJ
 g5Fg==
X-Gm-Message-State: AOAM533IIu/5UvkPkxLEzsdmW9gbGbMafIKb+aujCramxh4Mva6IjJ4Y
 FV15QmN/JdJex3hmRRB+LMQiPaPkxH8=
X-Google-Smtp-Source: ABdhPJz8kbwK4EBeLNW1JPTgD7OrYU5uHlYAh4cECVO/6h38ROLY5nGkVvXzne/gCNDA01VMGPtUXQ==
X-Received: by 2002:adf:e950:: with SMTP id m16mr827213wrn.58.1629305003699;
 Wed, 18 Aug 2021 09:43:23 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y13sm277718wmj.27.2021.08.18.09.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 09:43:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/mips: Replace TARGET_WORDS_BIGENDIAN by
 cpu_is_bigendian()
Date: Wed, 18 Aug 2021 18:43:16 +0200
Message-Id: <20210818164321.2474534-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIPS CPU store its endianess in the CP0 Config0 register.=0D
Use that runtime information instead of #ifdef'ry checking=0D
TARGET_WORDS_BIGENDIAN by introducing the cpu_is_bigendian()=0D
helper.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  target/mips: Replace GET_OFFSET() macro by get_offset() function=0D
  target/mips: Replace GET_LMASK() macro by get_lmask(32) function=0D
  target/mips: Replace GET_LMASK64() macro by get_lmask(64) function=0D
  target/mips: Store CP0_Config0 in DisasContext=0D
  target/mips: Replace TARGET_WORDS_BIGENDIAN by cpu_is_bigendian()=0D
=0D
 target/mips/tcg/translate.h              |   6 ++=0D
 target/mips/tcg/ldst_helper.c            | 120 +++++++++++++----------=0D
 target/mips/tcg/translate.c              |  71 +++++++-------=0D
 target/mips/tcg/nanomips_translate.c.inc |  20 ++--=0D
 4 files changed, 120 insertions(+), 97 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

