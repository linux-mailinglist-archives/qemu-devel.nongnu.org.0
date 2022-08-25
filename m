Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD15A1545
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:10:25 +0200 (CEST)
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREUx-0000eN-GW
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERp-0003uJ-P1
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERo-0002Lc-4F
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:09 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d16so19714753wrr.3
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=pSiIncZzGjaZMw10X5ARXYatNwiGYudeI44xdrbIrvk=;
 b=MaRhmdpGAmEBbI+6X7BYQ6K2LuDaBsuUYTdnZQSGvuiJ8gYXxVnse1d/cVw54BMitb
 dgbkTTZqYuhMhwzJm32JF71Y+arBNKN9Y+/nOO0Z1PFOq1UEIlyjcleqP4QpRGSG3E5K
 8cA9yATTinGDHjcxiwJQ9XZsQ9vSXXeq394kxeQKBhalLXmmuwNNN7pgAu35L564w+ME
 7n8csX6XgH6g0dhiYD40+WcLW6NOiHr/+4pGp4Dm4FKiy+dsDbX48DpKxxUeLVsDQ4/z
 MtboU7nG8lYhIDxYWfZPgmRge++2kExhqQ6w1QJS45GE7/IZPasborModCCzUGMB2ioa
 lt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=pSiIncZzGjaZMw10X5ARXYatNwiGYudeI44xdrbIrvk=;
 b=8FT8SpU6MwZqWNz3a4XFXfYxzFKuWZuhnxPpxInF8pso0az2d0splfsj6UrFqc3yA7
 swEDlVfUJbEpVWDR3PMXmdDUGzKmz57rFZRtMZJK/G1ORsn4X8za0Ow93iLajznETwSP
 J5SUgns+w+6leUWLFRfqB+Yatn+XTTySxrcV0+iI/hEV8jX/hX8qym2yt5sRnBLvPIA+
 XGwOAofjnziRpiUJXHpgDMj1ESKAJABj5D7n5G9r1xzlhVOfhxtW5kNHKJ5XZvCuwqzs
 eF1szA6l9ey9KAMTlsCYkX9R3h2/iHP+VtoLOrYLzaX7TbTrEKsM+0bom1SvYdI1xMcB
 E48w==
X-Gm-Message-State: ACgBeo2VKng4xoagI4MSIOpk/Zitmom3b5EXrGL2V6wLINxK8fm6wnOu
 SzcvXuy27UbIq7ind64/I+BTfFZ79VBsnA==
X-Google-Smtp-Source: AA6agR7sPWNWGUAMxb6HFObqDhusEkXlRmDlNpwIAxf41HmPocOAhEB4LFbk04vzxvGVNp0VmPDvFQ==
X-Received: by 2002:a5d:684a:0:b0:225:4363:c4e9 with SMTP id
 o10-20020a5d684a000000b002254363c4e9mr2511896wrw.309.1661440026067; 
 Thu, 25 Aug 2022 08:07:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bo20-20020a056000069400b0022585f6679dsm1064638wrb.106.2022.08.25.08.07.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 08:07:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] configure: fix misc shellcheck warnings
Date: Thu, 25 Aug 2022 16:06:56 +0100
Message-Id: <20220825150703.4074125-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Currently if you run shellcheck on our configure script it
generates a ton of warnings. This patchset fixes some of the
easier ones. I wasn't aiming for completeness or consistency;
I just wanted to zap some of the ones where the fix is clear
and didn't take long to write and is hopefully easy to review.
We can always come back and take another swing at it later.

thanks
-- PMM

Peter Maydell (7):
  configure: Remove unused python_version variable
  configure: Remove unused meson_args variable
  configure: Add missing quoting for some easy cases
  configure: Add './' on front of glob of */config-devices.mak.d
  configure: Remove use of backtick `...` syntax
  configure: Check mkdir result directly, not via $?
  configure: Avoid use of 'local' as it is non-POSIX

 configure | 82 ++++++++++++++++++++++++++-----------------------------
 1 file changed, 38 insertions(+), 44 deletions(-)

-- 
2.25.1


