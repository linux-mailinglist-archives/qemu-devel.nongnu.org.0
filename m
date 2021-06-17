Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4306C3ABAFE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:57:50 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwGz-0000It-A5
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw8e-0001Sp-JY
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:49:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw8d-0004HD-3t
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:49:12 -0400
Received: by mail-wr1-x435.google.com with SMTP id c9so7732807wrt.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PpOsU0L6eyvQ4s8/2gy87Q6ZJH7Rpq7OdYezpMS5F8Q=;
 b=c8G4YXkDrp2+L43OMsxLru9oXyAWK67as2MZ3iS9bmMv/KLzZDHJl1MTAwT0BuP6jh
 A9WqYEBEousdg80TK4KCkBYcsx102TdMETSaP6UKGCmVXy43dLZlmHmPvjOex25kSvHq
 YZpdCEh605opyBKsp4YvkYqfCrwy5Oj3m2YcPV18eNCTRXlEwMKK/KdvM4AE2VOVJvNB
 2zSGpx/XQJ3rJeCv80nP9YEPloij40lIsvvoeGdBhkDGlFJNd7Ob/9D368IBKTE9X6Ev
 XBLW90wQAQ1+4YZMTsaSzRyj7NAkLXMaMetTcZGcZwTxz3FSHy549Wr1MsDcEXIc2Y+N
 9QDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PpOsU0L6eyvQ4s8/2gy87Q6ZJH7Rpq7OdYezpMS5F8Q=;
 b=hL7Ffu+FM7j5zCVNGnb7w5MXV9CHcOLZbzW4kLbMALXvWJnPR8vmP8hEQFe9+2R/Ch
 dAmXNDVPEnwVQtt/jRRLhgP2Q58BlX5hK8f3SMifK+XHQPvUolUzi9/DtyG0MJq9FqMr
 bQPscn9SZN8JhksUpIXq6tvSZnBmwyq6eD4ZeY8ID+V53jw5KDXj4TYWvzDJTA+jJe/z
 IKCckfyM2+iFIQ41U1cwN5FhGgw4pHszl0ue0GSINQmqdyhjx3Gx50er6S4G12zeKaDF
 rjkwOUYT7ikd+H7tgHu+snPuzsHiOBnYLQXCwFnvsF6qDNoU/Vxt2FKmn3pBtutZjZol
 uuzA==
X-Gm-Message-State: AOAM531fCUN+97BVEShDocP9jC3lEj04yHd5MloxV/Eosgk68gH2ogi5
 S5lS2SkFv1Zed+b1YugPiKR8YnKQkkRVig==
X-Google-Smtp-Source: ABdhPJwxktp17ZiULuGX9Jv40/WHgzomDoYCuxH/yvAeN7WzIg+SEw/GTVN6lBf8bWnfNtMKsa3ZBQ==
X-Received: by 2002:a5d:64ca:: with SMTP id f10mr7104865wri.331.1623952149309; 
 Thu, 17 Jun 2021 10:49:09 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o18sm9044587wmq.23.2021.06.17.10.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:49:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/mips: Extract microMIPS ISA and Code Compaction
 ASE apart
Date: Thu, 17 Jun 2021 19:49:03 +0200
Message-Id: <20210617174907.2904067-1-f4bug@amsat.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the microMIPS ISA and Code Compaction ASE translation=0D
routines to different source files. Patches rebased and already=0D
reviewed, except patch #1.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  target/mips: Add declarations for generic TCG helpers=0D
  target/mips: Extract Code Compaction ASE translation routines=0D
  target/mips: Extract the microMIPS ISA translation routines=0D
  target/mips: Add declarations for generic DSP TCG helpers=0D
=0D
 target/mips/tcg/translate.h               |   12 +=0D
 target/mips/tcg/translate.c               | 4363 +--------------------=0D
 target/mips/tcg/micromips_translate.c.inc | 3231 +++++++++++++++=0D
 target/mips/tcg/mips16e_translate.c.inc   | 1123 ++++++=0D
 4 files changed, 4382 insertions(+), 4347 deletions(-)=0D
 create mode 100644 target/mips/tcg/micromips_translate.c.inc=0D
 create mode 100644 target/mips/tcg/mips16e_translate.c.inc=0D
=0D
-- =0D
2.31.1=0D
=0D

