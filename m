Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09D2F8667
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:14:39 +0100 (CET)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VUU-0007K7-Ng
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VS9-0005l2-5q
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:13 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VS7-0008Eo-DF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:12 -0500
Received: by mail-wm1-x330.google.com with SMTP id v184so4428858wma.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gHZex6k8GCxXaOqT1PzH/6qShyOWhxu7bFY/0WSaBrs=;
 b=ENIT1wjH1cU5tSkWG4LK6gY5vuSJBVYXpcTw+SHY0+Dp9Qz+Z9dgAM+WuOG5GQ/wVc
 KzOiFD1h4w36VmT3Gr1FkWx6y+8XEoq63Kwb6Gjwl5sSgeXuLY5rIewWIY5Yeo1AgZv9
 Rmrc15tSN9/VSKqhCXYizwTv8Pt0AYJesI6ElGX47iWs2nm5OuLWhfOL6JscAK+xQVwf
 kl9axfz6clFeW3dFUmqP40iwu3cBPirnbaVvLeozwbbXxhQ9KLDUffURCQF/A6zHlk0N
 olpKGnvECXXEMnqG+Kg3OLYHasFZjHoP+ROp7uqUGuXl7a+kPrJSqXuNtyTdXJd9H7xE
 /6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gHZex6k8GCxXaOqT1PzH/6qShyOWhxu7bFY/0WSaBrs=;
 b=ooMHmlewlAEfbyoBqLUVYk8gsfUGd2Hy4o82fFlTDTjULXc5E66V8W1FXFwE1Sgysg
 yjzgU+BCOAwj1VNhiQaYwD2ICSJL5GVqZ9y7fx5x0qaXfZUDglFOMwcEKPM5mG2+/jjb
 X6RRbrMefg5MDhNwIXZcpnOGydlGAnJSZtLRz2txfnmDppJvi8OODxWsyLGs93arOFnm
 6lCiXj4n5b9xjSUhBTvD2lGOSuF1UhtrZZy3Yi3ZoR2KFbkJPKl92qdVhHbDNo9XWrAL
 1VX9GqTDMuOLknmHh0tnXjueZgs8+mqR8SWIS/zKd5o0UclmyhrPAzh1iNlDe2uBe694
 4hXg==
X-Gm-Message-State: AOAM532cc8i1iho4s3mOaF7eaR9tUIkoSeayn4f5zl6OsJYadvgWeFmh
 PONTTlFTvx6TJq5S7QhPdUdvfcuBIHFgDQ==
X-Google-Smtp-Source: ABdhPJzFtJWw7RjweZ7Sa1QwYZAYpqVNcoYk8Xr5ZzYhTAJPtXvkMMJ5s+IEHchAD7AQcUAtjP1EAA==
X-Received: by 2002:a7b:c757:: with SMTP id w23mr8631351wmk.135.1610741529118; 
 Fri, 15 Jan 2021 12:12:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] hw/m68k/next-cube: refactor to fix Coverity issue
Date: Fri, 15 Jan 2021 20:11:55 +0000
Message-Id: <20210115201206.17347-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the next-cube board code open-codes a lot of handling of
interrupts and some miscellaneous registers. This series refactors
that to move most of it into a proper QOM device. (The main motivation
here is to fix the Coverity issue CID 1421962 which is a trivial
memory leak of the memory returned by qemu_allocate_irqs().)
    
In the real hardware this functionality seems to be the responsibility
of the Peripheral Controller (PC) chip, so we name the device that.

To ease review, I structured the change as a sequence of commits:
the first commit creates the skeleton of the NeXTPC device with no
content, but with a backdoor pointer to the NeXTState machine's state
struct. That allows subsequent commits to move parts of the code and
still have refactored and non-refactored code using the same struct
data fields.  Eventually all the code and data fields can be
transferred to the new device, and we remove the backdoor pointer.

Tested with make check and make check-acceptance (which does have
a boot test for the board.)

thanks
-- PMM

Peter Maydell (11):
  hw/m68k/next-cube: Make next_irq() function static
  hw/m68k/next-cube: Move register/interrupt functionality into a device
  hw/m68k/next-cube: Move mmio_ops into NeXTPC device
  hw/m68k/next-cube: Move scr_ops into NeXTPC device
  hw/m68k/next-cube: Make next_irq take NeXTPC* as its opaque
  hw/m68k/next-cube: Move int_status and int_mask to NeXTPC struct
  hw/m68k/next-cube: Make next_irq GPIO inputs to NEXT_PC device
  hw/m68k/next-cube: Move rtc into NeXTPC struct
  hw/m68k/next-cube: Remove unused fields from NeXTState
  hw/m68k/next-cube: Add vmstate for NeXTPC device
  hw/m68k/next-cube: Add missing header comment to next-cube.h

 include/hw/m68k/next-cube.h |  15 ++-
 hw/m68k/next-cube.c         | 238 +++++++++++++++++++++++-------------
 2 files changed, 168 insertions(+), 85 deletions(-)

-- 
2.20.1


