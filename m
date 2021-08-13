Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684F63EB457
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 13:03:24 +0200 (CEST)
Received: from localhost ([::1]:36060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEUyA-0003Yk-VX
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 07:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEUwm-0001oE-9a
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:01:56 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEUwj-0003cL-TU
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:01:56 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q6so1200231wrv.6
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 04:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W2t2M31T619rJLwX/hkgCfm37iwqTEHJWEbmarX7SFI=;
 b=Q9LVY9s+FkeA0NHFXa19G0uvmEZ7mQVtBQOBmvQYwq6NANzX678XFN8/ooUnACP9O1
 J5A4yl7m7mYSA+zxGSbGaBFXqvzkcr5dNSUyx+vCncB09/rOdJLoQ8zu0tacniAbVxAI
 AaVc6ckhfgt9oJmTVfRGN7gzOLTdR/iYytGwd7lAc/FU0vHLVfMUbX5FcYxEdPgW1Q9g
 sXRCsqRivm9yh9TDNKJdGRbGt8xxDaWyirQhVW2/vXevvaxFYBFebGkDdsKfKLEHCSww
 Ps8FIbvy/7iwogtTbnNNaPrwuFHZPfvMa0rgEnaE0mW3b6/DTWF9r9jQhIY88gIpidma
 6LZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=W2t2M31T619rJLwX/hkgCfm37iwqTEHJWEbmarX7SFI=;
 b=ToS/oO64JCXUzh1FHjN6pw1Gbi0VWDGznZdkin76lFifJF5ggxKQldFpGX+w7H9ygA
 Tyv7hH7Bcvt/iCs2Xf7p6Tr89LqUBJ9HzKVE1aK7YnL+D4CIzk1RrCM9sXG0cJM/PDeF
 YeSjwiOj+dcBRFGtsSUJnaHJnS00YpM5MPk/RxmKxN5BadSyGg0r5z+jBVLgf6nMTaXm
 u1IwnQKAzVy2xs9OBJbR8EPuBYpBkVJrFh6KtE0rp4L2dq1TYtBrqV8NgOOEC9kZ+o6f
 QtdZHxxvN6Y+OQZfo58Wo85L0RdtmnS480JTixq71lS+Sg2awIVem55cGmAJXff6yikA
 h3QQ==
X-Gm-Message-State: AOAM531tuaTt06abxUWzP3Y9AJs6f5pTpZVg8LXY/7lyFcoiWdKD8erF
 g3C3BP2EqUNW5bVkG5qFCFXupWxmK3Y=
X-Google-Smtp-Source: ABdhPJz6KXz0H+ItJhRu8qcOM9K0NkRk15rAY4jdtu0Ddx6xZyS/uFNZD5avfLvmwe6Q45DLOUkFNA==
X-Received: by 2002:adf:d194:: with SMTP id v20mr2380721wrc.126.1628852511388; 
 Fri, 13 Aug 2021 04:01:51 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b10sm1453513wrn.9.2021.08.13.04.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 04:01:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/mips: Allow Loongson 3A1000 to use up to 48-bit
 VAddr
Date: Fri, 13 Aug 2021 13:01:47 +0200
Message-Id: <20210813110149.1432692-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Raise Loongson-3A1000 SEGBITS from 40 to 48.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  target/mips: Document Loongson-3A CPU definitions=0D
  target/mips: Allow Loongson 3A1000 to use up to 48-bit VAddr=0D
=0D
 target/mips/cpu-defs.c.inc | 6 +++---=0D
 1 file changed, 3 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

