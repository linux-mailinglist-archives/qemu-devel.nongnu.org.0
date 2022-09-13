Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132E65B70F0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 16:35:47 +0200 (CEST)
Received: from localhost ([::1]:37658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY70r-0002HM-MZ
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 10:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY6tn-0003pP-Pw
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:28:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY6tk-0006xk-9A
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:28:26 -0400
Received: by mail-wm1-x335.google.com with SMTP id o5so5541899wms.1
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=qmA5GFqrfBWnZ0AaIBtOilm8q63N0xZOj0jmOP28AFs=;
 b=pu/7KHeB/ycKrKBystx/AWDNlloZ7nSBpXajO40yYWbYj1wX8tndeRnfYdLMJIgm4G
 81cwghPrW8vaL8GcPH1vUFN93RegPpjcQLFpXftInAHFqjTN4V1dYH74jkfFknvNBSHT
 YX/ixbSUxN8JAFfynSsVF2HCGV45+YggCR4UYcGWSe1UtKh1PbqlTPoAQlISZNaRPl70
 VlQxnMDjgALEu21eFFBXbFmFAnydK9ba1r/8YAwNvHmfSXFny9X6qUNEX8bKHeUZcPZ0
 eb1DSD3fV2mvmDPB6PetKwPhwn1SjXr236fXm6ehRFJPtyffbaJA/npKOcmbtJQeF5Qd
 ZQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=qmA5GFqrfBWnZ0AaIBtOilm8q63N0xZOj0jmOP28AFs=;
 b=pFlAPAqHqiZMjpP4W++KBsQiP+F3tz28mpC8AFK5AMHlON4iQ+u+xiCtui0Ih8pMo3
 a9Do4S2RNNWovM0bO4eEgcVei3y0GFqtopDJUUGhBhZtdU2MX8/n1D0iOes9AE+eu9i6
 VCT1M7HsXAk1vjv4N1mY/p8EKTOToxJl3yPffpLPjsOWl68L+B6QiKDRjy3GrPVFS3TL
 JnhQgnODSS7KsAwu+XNJbK9XITrD9NddEidyg+ZV6IfFjHVVR5RvdXGW9HJzh9GQ5HRZ
 xJiac+uUwo2sR1rgZQG7TYzrGvwbeqUzx/1Th+u4HGwxy3bsn7l3Lls5aAGnztemngeE
 KHPw==
X-Gm-Message-State: ACgBeo3Qypkz8dqJzpXwTQ8t2keYILleS/H+OKTc4cg8naItvBj7MEA9
 z4v07oJR+SOi4iX0tsChPL0s4w/PowFGmjWK
X-Google-Smtp-Source: AA6agR7VU04C2qMPiuRl9Ge3OtvMEDkJVkGxK9lODclJHQmI/AkDrdpmLrgZpYsUCW+TpaNth4OZuA==
X-Received: by 2002:a1c:ed0e:0:b0:3b4:5ead:59ac with SMTP id
 l14-20020a1ced0e000000b003b45ead59acmr2727793wmh.105.1663079302710; 
 Tue, 13 Sep 2022 07:28:22 -0700 (PDT)
Received: from stoup.. ([89.101.193.68]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d5951000000b00228dc37ce2asm10673165wri.57.2022.09.13.07.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:28:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/2] target/m68k: fix two writes to %sr
Date: Tue, 13 Sep 2022 15:28:16 +0100
Message-Id: <20220913142818.7802-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The second was described by Mark in the lobby of KVM Forum.
The first was found by inspection of other uses of gen_helper_set_sr.

r~

Richard Henderson (2):
  target/m68k: Fix MACSR to CCR
  target/m68k: Perform writback before modifying SR

 target/m68k/translate.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

-- 
2.34.1


