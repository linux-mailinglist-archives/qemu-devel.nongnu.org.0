Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6782ADCA3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:11:12 +0100 (CET)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXAl-0000rU-1f
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcX6A-0006En-Ey
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:06:26 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcX5y-0008Ih-31
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:06:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id a65so3798660wme.1
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QFqB4kS+HlHYFzREn9i9Q9WziWXHZrZtv1/LLsxdOTI=;
 b=wO38cGEfooXVHBIhGAi+/QKL5CnwzO5JqEGojIdx+kHgtJvBnlddx24rFZJPe/ORuh
 VOMacA7AwssjrcHK9bIb01wPMUsWwnaGNGdkqVh1FN9Yrb2BvQlfkbTCmf9+oII/SEra
 /0HxW3/DDmTvauTzWCTV1L19OyQ7G5Xif/VMvLg2lotvfuQGShIpUtCI9fV3gHXsCNnT
 XjDC7yeHwjfpHSmbrYYrsQiNSvU+oiSOJ2I9B1409YCQ/XSbO4aFIZ+W7rZvoFQ+hMjr
 mzx1ChB22YtrKWJJXpsMygstlSpR9lzNn/fBv7AKamehBLdvgWjVjghWtlvmSOcwpsIY
 Ct2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QFqB4kS+HlHYFzREn9i9Q9WziWXHZrZtv1/LLsxdOTI=;
 b=DDGJbpOgTsojdQpaXFabBfefxuHPLXxTnj1QwOpdj6jXKNUp1GkUMH0oXm+gBJyNci
 iuyAvf1oI2nJZDL6f0UHyfovxw7QHd8bW/1eJS6V9lacOs3SHeajwCogM5UMX5VkzV5p
 aPp4pOOPckYnD6XkMS9GIvxOQTppzHjhHE2FrHM9HOk62qYrF8dSiqg4omoI38Gggwo5
 FteLlXMxkg/Memubj/a8/i0yD/bwHAgnVcwz7LtLRKGEBwPHmckA7VoPtvpQpdB/fHYv
 XG86Z+B6KjA6F0cTJdkROKook11y2XwKGY3fyNm4kCpdKUIxzHu1Anh5Ss3u3zuGO23+
 +Jng==
X-Gm-Message-State: AOAM531zAwRO/L9KeUfwjNJCD3m9jEBHnrfWZdpONmiJ9GdsQ+SPayTd
 p1UT8uv1jbpoOpq3nGsjEJ7ybpC/4JIoug==
X-Google-Smtp-Source: ABdhPJz3csT4cDLiCi9EJIWBi9RiF/9kN8luT/kFwSlg0NkKta8L6sVpxWjZRSONNVbUBpqKXuP/xw==
X-Received: by 2002:a7b:ce0e:: with SMTP id m14mr47001wmc.17.1605027967044;
 Tue, 10 Nov 2020 09:06:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h4sm17334893wrq.3.2020.11.10.09.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 09:06:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 v2 0/4] hw/net/can/ctucan: fix Coverity and other
 issues
Date: Tue, 10 Nov 2020 17:06:00 +0000
Message-Id: <20201110170604.5897-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Jason Wang <jasowang@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset fixes a couple of issues spotted by Coverity:
 * incorrect address checks meant the guest could write off the
   end of the tx_buffer arrays
 * we had an unused value in ctucan_send_ready_buffers()
and also some I noticed while reading the code:
 * we don't adjust the device's non-portable use of bitfields
   on bigendian hosts
 * we should use stl_le_p() rather than casting uint_t* to
   uint32_t*

Tested with "make check" only.

Changes v1->v2: don't assert() the can't-happen case in patch 1,
to allow for future adjustment of #defines that correspond to
h/w synthesis parameters.

thanks
 -- PMM

Peter Maydell (4):
  hw/net/can/ctucan: Don't allow guest to write off end of tx_buffer
  hw/net/can/ctucan: Avoid unused value in ctucan_send_ready_buffers()
  hw/net/can/ctucan_core: Handle big-endian hosts
  hw/net/can/ctucan_core: Use stl_le_p to write to tx_buffers

 hw/net/can/ctucan_core.h |  3 +--
 hw/net/can/ctucan_core.c | 23 +++++++----------------
 2 files changed, 8 insertions(+), 18 deletions(-)

-- 
2.20.1


