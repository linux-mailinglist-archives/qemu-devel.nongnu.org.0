Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD016ED85
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 19:09:58 +0100 (CET)
Received: from localhost ([::1]:33373 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6eea-0003hR-N7
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 13:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edJ-0002C2-FO
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 13:08:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edI-0004EM-ES
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 13:08:37 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36049)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6edH-0004Cb-G3
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 13:08:36 -0500
Received: by mail-pg1-x541.google.com with SMTP id d9so7263889pgu.3
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 10:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZsIwMtj9HBIaWG7OkY3RpkjtyGYLVuwXKjm4gMidFI=;
 b=ccTvrEQ+aRv3+g5qtXzE7JIEqXNpASXGhK6bC+qsixvYAGDw9fmvrSP/uEryhEqgYd
 mJoD1zvmlvVt1mzGoOCItgfapVIqwpvY1h3js57Vmzz31AC1Yn8ZaGbBDcwPofswo4T/
 tcIsgwjG9hpve1sx1B1yxzYZnGdW+3O8dlH0mGJPY+NbmtKFD08jlscnuOTKWFX0ryY5
 TMe5rlr2TzOxiQ/95vP4+3vniahiyr2xCe54u4uA1Tm5s0pifeDEOQKg8tHeuzf7gBNu
 9JMgfCM+iBFUF7ifHGMqw9e5XAy7JnWXNnDP1KYXA+U4mACOmMGlwGXyPpy1Gz4c5JXI
 wv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZsIwMtj9HBIaWG7OkY3RpkjtyGYLVuwXKjm4gMidFI=;
 b=OkzAJfnRn7uTH/XQFmo7Dqw4p2u/PiEjQiSIfbXGV34xsL/b0OXdWqEMeLYhMQu3a7
 fCyWEdnE5OmDP5+LztaeIHfJ1BcID4jFKtSASRBQjmu10S+PX8rulVE0pLOcJ8SL6TED
 IGlys5Jeg883iW8qwuF0wX+h03hFYRnIVIaeXoHOEVzlZZb7ia7N2SDkg3Ao1I44zOQY
 XN4hWgNBeAfCVpRcEzjHvaldFPpchPX2Q49TpnKRNUMqVtAzINICuX5p/cUNkJfr8PTR
 TojezI3wZ/UIR7dB/zY3A3FZuKKu5wbwv7BvvVRvkerdlGCns6sx+VgD35LDs+HXU4dO
 Pt4g==
X-Gm-Message-State: APjAAAWY9AfPEmFn38S2SCnvI22z6ZscDXlFkhdgc+xwnzf4/Tg7ADKW
 BXCh77boRI8PIHuB94il0uhXUCPXFdc=
X-Google-Smtp-Source: APXvYqxCk3EyFV+iEWHAm7ENTRV2JimxlkUz+VLwQ+SELEdXv/LJGA4HawngjVFgwJINxARmxHgcag==
X-Received: by 2002:a62:e708:: with SMTP id s8mr59375815pfh.122.1582654113303; 
 Tue, 25 Feb 2020 10:08:33 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id d69sm19069704pfd.72.2020.02.25.10.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:08:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] target/arm: Honor more HCR_EL2 traps
Date: Tue, 25 Feb 2020 10:08:24 -0800
Message-Id: <20200225180831.26078-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v4:
  * Mask more res0 bits for HCR.
  * Fixes for TVM/TRVM.
  * Fixes for el0 for TPCP & TPU.

r~

Richard Henderson (7):
  target/arm: Improve masking of HCR RES0 bits
  target/arm: Honor the HCR_EL2.{TVM,TRVM} bits
  target/arm: Honor the HCR_EL2.TSW bit
  target/arm: Honor the HCR_EL2.TACR bit
  target/arm: Honor the HCR_EL2.TPCP bit
  target/arm: Honor the HCR_EL2.TPU bit
  target/arm: Honor the HCR_EL2.TTLB bit

 target/arm/helper.c | 306 ++++++++++++++++++++++++++++++--------------
 1 file changed, 213 insertions(+), 93 deletions(-)

-- 
2.20.1


