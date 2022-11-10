Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C0E624476
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 15:36:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot8e7-0001Lf-AQ; Thu, 10 Nov 2022 09:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot8e2-0001LD-Le
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:35:06 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot8e0-0003Uk-Rm
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:35:06 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso3536537wme.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 06:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1AfoDkMtgT69D12IkU3xCT5pg1NDaVMdvOPGIYZ3rlo=;
 b=XAfB83O8m8niKRMxM2KqDzjJrGCphVK2jfBNP9oiYubGE7ARV7wbHKxLgrsB53dW1g
 p5OpHWiRg2a7Ubset8EU04DjYcrJoFk24UJJq/EKMmIbBdn8766QBbXwXXtPTovyq/YA
 6K+ep0ugT/CQU62kvSXC+DYl6/0ZdL12hj7ge0c4y4mjeabanVbs+XNtVW+6wmvpQItb
 MbdKUfDCDIviXLRwFbe/mRK135EWJg0zZBSTJ0NfrQ1ucue2SEORal7mzo3mRgdDD2ZX
 /xZGRGh3WS+IW4Wk3yifouBW3XRHk6MfTCWrXCFS6K3fx34H/aewC2cN23+oq/HK2n8d
 OfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1AfoDkMtgT69D12IkU3xCT5pg1NDaVMdvOPGIYZ3rlo=;
 b=NRZJRLOWKH/szX93gpk1uEEheHfTLbQaZ62i8KqrtetSjLFQxrjo0O+dLkWsc0wx2z
 9BZWgFMJOUScsbiF4WoVPA81PllngioWFlbtVlKqJLLz6o+g9zEBOnscLb/B3+49G9z/
 eEuCmRYHAyYx/897UmMjLwBhEOLqRGqcUzNC/6OHO5H2N3MEmtooxhekOV51vvs7z0O6
 yN4jglwWWOYiLwzG+XmEMGPUzozNKTl8hEhQkxeSFBAZYXY+UCBO2XlRa2W5soxPtHno
 awUOLOBUxLKr+oiwnw5sNsJH5eV+PnabagqUaJq9DDeIQiTkmam7+D6uh4cliwSKJIUj
 K81w==
X-Gm-Message-State: ACrzQf1W1BLsKXimOJ+Q650tR2X1p4gzbBZJ6i8oU8MxLfc8VDIbZiyN
 AhqxmZ9eEWQMllePB11ENZPoeohQGbQx8Q==
X-Google-Smtp-Source: AMsMyM71BfxV5F4zaA0vyU8XV1Nub07hV6TuUzK+ILiJrI/pkDjlbLu2A+XdtXE1Yt5JGjzc4gOSxw==
X-Received: by 2002:a05:600c:689b:b0:3c2:fd6e:1fe5 with SMTP id
 fn27-20020a05600c689b00b003c2fd6e1fe5mr43402438wmb.99.1668090902227; 
 Thu, 10 Nov 2022 06:35:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bq21-20020a5d5a15000000b00231ed902a4esm16666803wrb.5.2022.11.10.06.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 06:35:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH for-8.0 0/2] hw/misc: Convert MOS6522 devices to 3-phase reset
Date: Thu, 10 Nov 2022 14:34:57 +0000
Message-Id: <20221110143459.3833425-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

This patchset converts the TYPE_MOS6522 class and its subclasses to
use 3-phase reset. This is part of the work I'm doing to clean up some
of the reset-related code by getting rid of the
device_class_set_parent_reset() function, which is used by
legacy-reset subclasses which want to chain to their parent's reset
function. There aren't very many of these devices in total, and if we
convert them all to 3-phase reset they can use the 3-phase-reset
equivalent (resettable_class_set_parent_phases()).  Eventually this
will then let us simplify the transitional code for handling old-style
device reset.

This is 8.0 material. Tested with 'make check' and 'make check-avocado'
for ppc and m68k builds.

thanks
--PMM

Peter Maydell (2):
  hw/misc/mos6522: Convert TYPE_MOS6522 to 3-phase reset
  hw/misc: Convert TYPE_MOS6522 subclasses to 3-phase reset

 include/hw/misc/mos6522.h |  2 +-
 hw/misc/mac_via.c         | 26 ++++++++++++++++----------
 hw/misc/macio/cuda.c      | 14 ++++++++------
 hw/misc/macio/pmu.c       | 14 ++++++++------
 hw/misc/mos6522.c         |  7 ++++---
 5 files changed, 37 insertions(+), 26 deletions(-)

-- 
2.25.1


