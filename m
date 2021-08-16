Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698023EDED1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 22:53:37 +0200 (CEST)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjbz-0001sq-Ue
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 16:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjZj-0007uw-Ax
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjZh-0002hF-2Z
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:15 -0400
Received: by mail-wr1-x435.google.com with SMTP id z9so25326740wrh.10
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YxeYQu9y96X5DRJcYtQMpiWx7AYwD7+ShH8LMNgEnG4=;
 b=N3UOXj6kLx/J3h+Y3eVTk5e2YdhwSXaQffPEkEovhWj6DwXEWQ3YOVOaA2VRE4MzgS
 y/AGn+a7iC7kPtBi/+r35fOLeR/P01FWykHRIuJX2LXXfUWQ8w/CxFTfuuP/BjY074x+
 R8m0TY88XXWf5Mmi3uTyXjPWdNNA8Qi4U/JlDx0kTjNAbd7dH16dtd8B5CKzhDagPLd5
 GKUpMs4hTjHG80Y2YBeFOhSunoEmNvXnqPzIO/gJHEyMIEvtJRnHtdw54h4zsM806obR
 CNBy2fdG+oZZnMPKIjR02LByUmjXue/9Y0iBo2YmnztV0U4+FfN44qALtRHgzSPmg1ix
 CJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=YxeYQu9y96X5DRJcYtQMpiWx7AYwD7+ShH8LMNgEnG4=;
 b=unAKsK9PGWFdNMriigiJKS8JW0hER9UBplk+zrvYwwCH+uRlEnQfaFqkZKRS/pDkHI
 9DmH7QuW4M5yAgSl8QJuFURscoQTrFgrXF+DRlAay4j1IDRvJL1rmTZb9/5VqLhBvtpC
 h80xNGXH6qt6Um9Ga5fljxg4MoZvNB8neEbHCyPaLLkVgK2rAVIXKLP3mLZ3XfoAh4r0
 pA6Iq57kxgPBXvwPMPGRL0512A39OX2lAUismR29vg39ziqZlOErfI+sRmfDwr5m+R55
 eCUUJ9wCBu5MDlA58/QAt2TGUVdk9HfRT9qGYpNY2d2MKiaR3lqV4tOFklXSxTWoxLDU
 oKxQ==
X-Gm-Message-State: AOAM532KUTxYgeLP7gyWdxWy65DUqPc5NVBFYqOdKZmuWgsa8Ti3taXa
 JCEqkf7IMs2Ot78QXjoNBOhbjLOv8L8=
X-Google-Smtp-Source: ABdhPJx0kcgEmfCW15TcCtbeGPo8t2yYFel25ikGVjhxF5qs/qvaRiovgsS94myTtMJI/FsgpIeNWQ==
X-Received: by 2002:a5d:5409:: with SMTP id g9mr335740wrv.409.1629147070941;
 Mon, 16 Aug 2021 13:51:10 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b13sm290717wrf.86.2021.08.16.13.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:51:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] target/mips: Housekeeping in gen_helper() macros
Date: Mon, 16 Aug 2021 22:50:59 +0200
Message-Id: <20210816205107.2051495-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial patches:=0D
- Remove unused macros=0D
- Use tcg_constant_i32()=0D
- Inline the macros when few uses=0D
- Move macro definitions in translate.h=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  target/mips: Remove gen_helper_0e3i()=0D
  target/mips: Remove gen_helper_1e2i()=0D
  target/mips: Use tcg_constant_i32() in gen_helper_0e2i()=0D
  target/mips: Simplify gen_helper() macros by using tcg_constant_i32()=0D
  target/mips: Inline gen_helper_1e1i() call in op_ld_INSN() macros=0D
  target/mips: Inline gen_helper_0e0i()=0D
  target/mips: Use tcg_constant_i32() in generate_exception_err()=0D
  target/mips: Define gen_helper() macros in translate.h=0D
=0D
 target/mips/tcg/translate.h | 12 +++++++=0D
 target/mips/tcg/translate.c | 69 ++++---------------------------------=0D
 2 files changed, 19 insertions(+), 62 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

