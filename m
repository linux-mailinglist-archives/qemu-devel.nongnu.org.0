Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6435B2ADCA8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:13:28 +0100 (CET)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXCv-0003YP-UW
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcX6A-0006Ey-HR
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:06:26 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:50295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcX5z-0008Im-Ti
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:06:26 -0500
Received: by mail-wm1-x344.google.com with SMTP id h2so3847592wmm.0
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kSQkE4mQsz+5YrFfsY3dUOcYsreKD46sMKkau53xx+o=;
 b=CoYVfKyR9xho72qKse3GoaQx9V4iQCL2Ifj3Xg6dLyX4SnE5bUd7tqoZjISskD72r+
 I0TWV+Y8TQkfhyr9oiyAYuBK7hIKGome61lyvN1KerTsDQhXixaC7BCJpSzZNCT7kHvB
 ZbP/FpwDCzdzh/r/3SlnymfBi9f+7w9+LfV3TpDiHJo5ziJDyyI+uEdCDoXxr8Uj3diS
 Grc2y3JZZPR67cHah2yzWewSqaJSfnL0AF4CMu82/r8EQ83Z+buAPLv8Q2M975WNj5dt
 PIKFJnYebr8piu89neezzRSBzc3NK6Q7Eq5kIRFTASP4v6DWHbxR0Zx28zgqMaai9dz/
 7nsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kSQkE4mQsz+5YrFfsY3dUOcYsreKD46sMKkau53xx+o=;
 b=AruyaGLIW3lb9Iga73IJuBWWDRDakrIF1AmaLO2Y841ERHIdO9AuG1zVuF9Ur90A4y
 e6/HhiIkar3U2NMwx5NfVKxjiRObBgXMFKUDpmLb/rRIz0COJ6U8ZXCMBb254Q+suphR
 zhJOraOBl6bpTH5fv4sUcYYgTteHi7pt2pDS94UkxM9I44Y57dDSgB5N90J6g3hsJULW
 vcl6BN6Y9BdJvkWc6SjXHJpyviwEqRoeDPl4pKL4tVvKhtkZ91THeVNEjFQSK25M6PyQ
 F57mxNturXGcs1fnJNZ/bs4mQ4ArE0hE4asS2K/8dOpa+foRWKuVIfeF3JhdWL2zZOV+
 JZdg==
X-Gm-Message-State: AOAM533WlSJ36NEJaSzpCiI7CLjllAvp+Sf3fMlCvxIlKhznruiFxAHE
 C2aMgUQUu1Rc34uPvgVT+lO/mtrzRlmjsQ==
X-Google-Smtp-Source: ABdhPJwDRSFSdfkJBioSiU3QmeEe6yOeFq7/s3NVZYTXycowfhFDhPwqt9NdTcdOlh/nwFM4AD16rg==
X-Received: by 2002:a1c:6856:: with SMTP id d83mr47665wmc.13.1605027970551;
 Tue, 10 Nov 2020 09:06:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h4sm17334893wrq.3.2020.11.10.09.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 09:06:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 v2 3/4] hw/net/can/ctucan_core: Handle big-endian hosts
Date: Tue, 10 Nov 2020 17:06:03 +0000
Message-Id: <20201110170604.5897-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110170604.5897-1-peter.maydell@linaro.org>
References: <20201110170604.5897-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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

The ctucan driver defines types for its registers which are a union
of a uint32_t with a struct with bitfields for the individual
fields within that register. This is a bad idea, because bitfields
aren't portable. The ctu_can_fd_regs.h header works around the
most glaring of the portability issues by defining the
fields in two different orders depending on the setting of the
__LITTLE_ENDIAN_BITFIELD define. However, in ctucan_core.h this
is unconditionally set to 1, which is wrong for big-endian hosts.

Set it only if HOST_WORDS_BIGENDIAN is not set. There is no need
for a "have we defined it already" guard, because the only place
that should set it is ctucan_core.h, which has the usual
double-inclusion guard.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/can/ctucan_core.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/can/ctucan_core.h b/hw/net/can/ctucan_core.h
index f21cb1c5ec3..bbc09ae0678 100644
--- a/hw/net/can/ctucan_core.h
+++ b/hw/net/can/ctucan_core.h
@@ -31,8 +31,7 @@
 #include "exec/hwaddr.h"
 #include "net/can_emu.h"
 
-
-#ifndef __LITTLE_ENDIAN_BITFIELD
+#ifndef HOST_WORDS_BIGENDIAN
 #define __LITTLE_ENDIAN_BITFIELD 1
 #endif
 
-- 
2.20.1


