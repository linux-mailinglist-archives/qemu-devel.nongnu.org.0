Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF4D35A1A9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:07:30 +0200 (CEST)
Received: from localhost ([::1]:49392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsjI-00042r-Si
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshR-0002Za-5n
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:05:33 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshP-0004Qf-Eb
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:05:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id a6so5952848wrw.8
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=86r6ZcxyKLSRFnboIa/RjDv32mKauqu0t/J5jJyk3oI=;
 b=vOG27fmjmsNLbtNiK8+8r/gMNMz9dqk1iAAmFaCJVWItDNGQmmARXqKkJs6nMk+mBb
 2qh6oRPox3jjIY3zAA63vic9u9iOqT4W/Jr/wo3Qr6MnqbnODPp0b7+MR8AC1wk+gR3F
 fgSmex/teDF0I6XK0VeKxjjbHYQwEDusSJsguA5gUX5skJnCMXBfBZW7TKYDT2Bc1wpg
 BHjQEBsHihQlsGL4jtrSfVakglTfSPLYhxjR+YCUnr1mHFpf0+s5BqflWHIfk6ZAspSE
 jJIThEb5CT+UgnsMV8kL2N6TZmOt62d44MPjz6BSckXSLETTRP4WHBdy/mzpuI9TLw94
 Mrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=86r6ZcxyKLSRFnboIa/RjDv32mKauqu0t/J5jJyk3oI=;
 b=p2ilUZN/0RMe8FWjP6BQDvtfbmjkS1dZDE3SN/cy+3WMjoSLLiQjzwRiL9jRK0phub
 Bte/fJorUKCvlSYCK4fdsBwwM5OatLTsxcMP5XJSE9nCUsfUfiGz9r6U09icEEzzrrPh
 ZQrZgSESqIvECJlivi5z9Vqz6VgULd/lGVT86taKlWqm9jTPPM5oClQC7qY9XZuCSFD2
 l/Pm87+k6NLnGq7rTQSke/VyBeuQMJfiZ7+U1wMaeMv3B5Y5DJ6H11QQgqUbti9unLvK
 9IpWAgGSzW/jd9bIZQh+oqtw4YKqcOGM8OJkSMe2C69YW57Y5rne7XlvNvuPoAEorykF
 98TQ==
X-Gm-Message-State: AOAM532Ca4s/R5b/COm+kv+tPI2sWfPmIZI0ip8MkwQlyAuZ8jxfMy/+
 WrFKBD6Y+BZExSfFKlqsD+K9/nrB2lshs2wr
X-Google-Smtp-Source: ABdhPJyo0+2NPQO1so+vhIWOBIF92Tqu03grevhknvu/KuPCWXhhf4c26u2Hvge9U6G9EsZY2u0whw==
X-Received: by 2002:adf:f3cd:: with SMTP id g13mr18595955wrp.286.1617980729613; 
 Fri, 09 Apr 2021 08:05:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c18sm5048094wrp.33.2021.04.09.08.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 08:05:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 0/2] mps3-an524: Fix MPC setting for SRAM block
Date: Fri,  9 Apr 2021 16:05:25 +0100
Message-Id: <20210409150527.15053-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The AN524 FPGA image has three MPCs: one for the BRAM, one for
the QSPI flash, and one for the DDR. In the an524_raminfo[] array
that defines the various RAM blocks on the board, we incorrectly
set the .mpc field for the SRAM to 1 as well as for the QSPI flash.
The effect of this was to cause the QSPI flash not to be mapped
at all (because when we mapped the 'upstream' end of each MPC,
we found the incorrectly marked SRAM entry before the QSPI one
when scanning through the raminfo array, and so put the upstream
end of MPC1 at the SRAM address).

Patch 1 fixes the SRAM block to use '.mpc = -1' indicating that
there is no associated MPC. Patch 2 adds an assert() that would
have caught this programming error (which is quite easy to make
if you're constructing the raminfo array for a new board by
copying and modifying entries from existing boards).

I think this makes sense to put into 6.0, it's a pretty safe change.

Peter Maydell (2):
  hw/arm/mps2-tz: Fix MPC setting for AN524 SRAM block
  hw/arm/mps2-tz: Assert if more than one RAM is attached to an MPC

 hw/arm/mps2-tz.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.20.1

