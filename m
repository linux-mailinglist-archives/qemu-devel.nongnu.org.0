Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854B62EF6F6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:06:23 +0100 (CET)
Received: from localhost ([::1]:46210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxw9W-0001g3-I5
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxw7N-0000I4-5A
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:04:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxw7K-0000oe-1W
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:04:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id g185so9169966wmf.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sLl9sUWU5h1UaKwkdvYGg+aIysds12c5wVsNDj2Vf+M=;
 b=jNl9yJZ7H9EuXoiJUE+GCLCalCIeZA7XK+lgB2M9mdx1MUIBVgm18vzdMOKaOzOEj9
 mrLhLKYK/npPjTDe8nC8FunizcZNJ/E3oIpr65nQq40q1OCB0cW+4SH9sm5u8fOcDjak
 doLX0dyZTytslaClQ86fD8IyStuxIAP/elNFVvq9cuIyx35ehK9AZh/ChAge1O2sizNE
 p3KkoqFaLV6BlozLRwoPH2CpqXAP2uttsWxAd+zrfCwJaZpujmD6Ql4tu/ujxKWnOYMy
 B02Stu2tAZAuIoA4YhrubM9ZFTA7OTE0ma++9nIEVt0b3mvqKjrk80Qf7ONLn4juEtnG
 Qqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sLl9sUWU5h1UaKwkdvYGg+aIysds12c5wVsNDj2Vf+M=;
 b=LkP63a7tgY0mLujt7pjOAWROFkKmvWHAQD28jQl0Q7aZOGY8p3bINJf9mNUZTyRm8L
 Oiwf57CxiZu3G8gzwXfTDxj6TQ8T8SLyq/rP2iqzpLnrTESjkEhAJjaqvEunn7RdzfA+
 5Yu/YutcdYv4BSb5CKVY9A6KBBc5s4jyaTBzLHWwVUq0Em8hqzxyDW3407coBuiYl/yj
 k/0LFOF2AytrcamtbrlaKka3w/PX2Lkmjn+cY08GSIG0Z0MRXMmZnU7ZfEkZ7fzYnlws
 fDFnM4IfWhyh47G121dKnx8GmSHLLNrhYJCwzj4L+pms6ajw160Dyh/9wUh+rpKMvmXj
 yQRA==
X-Gm-Message-State: AOAM533LAH6D1oesdVgSLDbCRMOba8w7ojJCANdleGxr8nbOBiNs6X0I
 Q/pGbk/50Xieqo9F2Y6BlT3Tqg==
X-Google-Smtp-Source: ABdhPJz9DmDPttTCwS15baNoiSUx8u5O9TxMrQ1/lF3Kr7J7V4BHdmBYyCcezHgjWyMe0hTGsIoiwA==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr4059516wme.108.1610129043909; 
 Fri, 08 Jan 2021 10:04:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s1sm13423029wrv.97.2021.01.08.10.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:04:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] lan9118: Fix RX Status FIFO PEEK value
Date: Fri,  8 Jan 2021 18:03:59 +0000
Message-Id: <20210108180401.2263-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset fixes https://bugs.launchpad.net/bugs/1904954 :
we give a bogus value for the RX Status FIFO peek register,
because of a copy-and-paste error. (This bug has been present since
2009 when the device model was first added.)

Patch 1 fixes the bug; patch 2 does a little bit of tidyup while
I was looking at this bit of the code.

thanks
-- PMM

Peter Maydell (2):
  hw/net/lan9118: Fix RX Status FIFO PEEK value
  hw/net/lan9118: Add symbolic constants for register offsets

 hw/net/lan9118.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

-- 
2.20.1


