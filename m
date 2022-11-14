Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A969628F32
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:29:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouj2I-0005F0-GV; Mon, 14 Nov 2022 18:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouj2F-0005A5-OG
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:38:39 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouj2E-0006oa-3Y
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:38:39 -0500
Received: by mail-pg1-x52c.google.com with SMTP id v3so11659699pgh.4
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 15:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mN8/NfbhMAOnIlI/VFyZNaBe5P0U6l9vdKD4u34CJww=;
 b=JD1/LLVWV1Tp/a+pWyaaSAOelm7b6AJFAYPCcqCU8Jo/NECoAXMn48ZPGk+fFhY9rV
 GU31oCobnn6G/skwPXuV9rEcu+vHeuq7ZgCjkTU5DI4YsQepi9hujBKNNuaCXrJdt99u
 kTwUXdqIMOMLv9SJh2SNwhWRY0VfIzmfLC0DzRJdiKPxD/vjUJgIzBEdnW/qsfGqmJB7
 Y1Ce2DEr7EfAttveseQ3bK9B6so31PpsinBSvOTrMImETqFlJjDVSou3kKj2cI8DGwme
 RGuS8657wTzhq7YvwKk0BQaXCe17HC8Hcx4MFompRSKfFzf9V9GV3x8M7G2IepnTZ/lq
 gyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mN8/NfbhMAOnIlI/VFyZNaBe5P0U6l9vdKD4u34CJww=;
 b=3qk3qJOa76Sp+vjLZkarQQUp/ul/cJljxX/rSGFjCnNOmzwtEbioJATWRgTBT7lnDY
 51BcliswXZfb7ij1ljeSAQxBNhQGM7TJAw+bbssyMJt4CCH+FsGb9+/xKUM9bOOXzCWH
 Fio7VHtiYPwRpZ9sc3v+vlw4mG0sYEShbGDNTebFgoft46m90V7y6djTlwr/YlJwaTGv
 3sOme4Lbxrf4hCUiOHi+QvNRxa6cFgCMZ2WM4KoIFA2khAPNcyaW8nEIby1ddtmVoozk
 JGC8FAqmuC+ksgszGeGaGwNl/gqq1GR6+iP+CZJPs4FzcAoh3Ag2N2bIJjZaVTw2Dfoe
 rNyg==
X-Gm-Message-State: ANoB5pnvACNwTTsZgaxAGIEX/cq4N9U2cW/FzoRFWZXSBVzBBZ7GgCvO
 IptprGrOtawCViOLdCbI4/UKZjgyVUF6RjIi
X-Google-Smtp-Source: AA0mqf7XHUz7tFeDi9jDgmHwh4pguU1BB9L43g4gR8LjjwixEaFb1QDTBRBgqlu6xTRMMD/GFxt75w==
X-Received: by 2002:a65:5a02:0:b0:449:8676:833f with SMTP id
 y2-20020a655a02000000b004498676833fmr13328450pgs.126.1668469115385; 
 Mon, 14 Nov 2022 15:38:35 -0800 (PST)
Received: from stoup.. (119-18-35-77.771223.bne.static.aussiebb.net.
 [119.18.35.77]) by smtp.gmail.com with ESMTPSA id
 cp16-20020a170902e79000b00176dc67df44sm8120268plb.132.2022.11.14.15.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 15:38:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PULL 0/2] target/i386: fix cmpxchgl, lahf, sahf
Date: Tue, 15 Nov 2022 09:38:27 +1000
Message-Id: <20221114233829.3329805-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

The following changes since commit 98f10f0e2613ba1ac2ad3f57a5174014f6dcb03d:

  Merge tag 'pull-target-arm-20221114' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-11-14 13:31:17 -0500)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-x86-20221115

for you to fetch changes up to 35d95e4126d83c0bb0de83007494d184f6111b3d:

  target/i386: hardcode R_EAX as destination register for LAHF/SAHF (2022-11-15 09:34:42 +1000)

----------------------------------------------------------------
Fix cmpxchgl writeback to rax.
Fix lahf/sahf for 64-bit

----------------------------------------------------------------
Paolo Bonzini (2):
      target/i386: fix cmpxchg with 32-bit register destination
      target/i386: hardcode R_EAX as destination register for LAHF/SAHF

 target/i386/tcg/translate.c      | 86 +++++++++++++++++++++++++++-------------
 tests/tcg/x86_64/cmpxchg.c       | 42 ++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target |  1 +
 3 files changed, 101 insertions(+), 28 deletions(-)
 create mode 100644 tests/tcg/x86_64/cmpxchg.c

