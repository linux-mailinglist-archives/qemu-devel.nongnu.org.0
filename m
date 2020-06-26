Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639B120B614
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 18:43:11 +0200 (CEST)
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jorRW-0003hJ-BY
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 12:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jorOy-00008z-JK; Fri, 26 Jun 2020 12:40:34 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jorOw-0005zT-Nh; Fri, 26 Jun 2020 12:40:32 -0400
Received: by mail-wm1-x344.google.com with SMTP id j18so9409600wmi.3;
 Fri, 26 Jun 2020 09:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q9NxDW2oQ9w4rrOZiKQo2soGzZ8yBLvV0TRmyvXJhd8=;
 b=Nq4H/Ejv9nri+mryeLy1j0xw2hWX1d6WofvdGeckWWqHHlWxL0/o0PIFGl0S4py5eh
 FPUtffUdWzCCpNWuYRh/CUW29pMl9zWaWhQeKlGGw70wG90A+7DTPUzbW/HWW7utRQwQ
 dVdxzSEIW0w80PI7mfXdcQWPWWZlFXI6GNLbDoK9acWAdzajK4Hkq7/37CygzMCFgfjC
 +9448sTsI6PKnW1qM7gZW28QDLaZk0KnDvy79xbwiaK91O0/XnMCByW/b7P2tzfD0FHA
 +50GiLCPHIAJkm/7Y5sSipjpQbdUKSY67CLwyvrmgehAcxihPySBjVD34hx8Lx0VhhDX
 jP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=q9NxDW2oQ9w4rrOZiKQo2soGzZ8yBLvV0TRmyvXJhd8=;
 b=mKfwpaMCYnQJVu/9t4fSb1XcRXyiYiBmOai2r9lIY6Npyb89P5bOk6ybWj6KQrEUno
 2MTWvk1Y/K58A9odDDhiec1yVFudsGK7L0/6ODk6WfXecG6nhtvZ1cljzuLycHzkqqB5
 HnKXGZbjFjzzHYv7MjBRw5GkpUHMJ91VgC8xFeTidTWxLGQr4eAwViAX+QiX4Cj9BW4/
 ADwj8ZdnQ+RWNtn4Cxwxrdn8sZfHyuvg1iHuFAtvceX3i6FwcBVcGsW6QnZqeYLbOjXh
 IXxarDM6UWqKU9APBNFXFp5jUROCYysDRdcYqJXw0IT+xFzwqvqJOIaeqa+3xL65rPuj
 T3Hg==
X-Gm-Message-State: AOAM533B/bYLNMe62tqeccdSalxopDXzaHkgAdKzE06LBw4bqMPhZcti
 fEll2XY8zuGgCISAasapBoRDKkiK
X-Google-Smtp-Source: ABdhPJwOMpDmb99nh5naGP4G/dvGTd7T4rzAhlsFajltFdcSMbnkUrK9zB0BYTczvFmJHZQWclCOHw==
X-Received: by 2002:a1c:b182:: with SMTP id a124mr4119349wmf.114.1593189628827; 
 Fri, 26 Jun 2020 09:40:28 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id f12sm24623646wrw.53.2020.06.26.09.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 09:40:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/15] hw/sd/sdcard: Fix CVE-2020-13253 & cleanups
Date: Fri, 26 Jun 2020 18:40:11 +0200
Message-Id: <20200626164026.766-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patches 5 & 6 fix CVE-2020-13253.
The rest are (accumulated) cleanups.

Missing review:
[PATCH 01/15] MAINTAINERS: Cc qemu-block mailing list
[PATCH 03/15] hw/sd/sdcard: Move some definitions to use them
[PATCH 04/15] hw/sd/sdcard: Use the HWBLOCK_SIZE definition
[PATCH 05/15] hw/sd/sdcard: Do not switch to ReceivingData if
[PATCH 07/15] hw/sd/sdcard: Initialize constant values first
[PATCH 08/15] hw/sd/sdcard: Check address is in range
[PATCH 12/15] hw/sd/sdcard: Make iolen unsigned
[PATCH 13/15] hw/sd/sdcard: Correctly display the command name in

$ git backport-diff -u v3
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
001/15:[----] [--] 'MAINTAINERS: Cc qemu-block mailing list'
002/15:[----] [--] 'hw/sd/sdcard: Update coding style to make checkpatch.pl happy'
003/15:[down] 'hw/sd/sdcard: Move some definitions to use them earlier'
004/15:[down] 'hw/sd/sdcard: Use the HWBLOCK_SIZE definition'
005/15:[0030] [FC] 'hw/sd/sdcard: Do not switch to ReceivingData if address is invalid'
006/15:[----] [--] 'hw/sd/sdcard: Restrict Class 6 commands to SCSD cards'
007/15:[down] 'hw/sd/sdcard: Initialize constant values first'
008/15:[down] 'hw/sd/sdcard: Check address is in range'
009/15:[----] [--] 'hw/sd/sdcard: Update the SDState documentation'
010/15:[----] [--] 'hw/sd/sdcard: Simplify cmd_valid_while_locked()'
011/15:[----] [--] 'hw/sd/sdcard: Constify sd_crc*()'s message argument'
012/15:[0004] [FC] 'hw/sd/sdcard: Make iolen unsigned'
013/15:[----] [-C] 'hw/sd/sdcard: Correctly display the command name in trace events'
014/15:[0004] [FC] 'hw/sd/sdcard: Display offset in read/write_data() trace events'
015/15:[----] [--] 'hw/sd/sdcard: Simplify realize() a bit'

Philippe Mathieu-Daudé (15):
  MAINTAINERS: Cc qemu-block mailing list
  hw/sd/sdcard: Update coding style to make checkpatch.pl happy
  hw/sd/sdcard: Move some definitions to use them earlier
  hw/sd/sdcard: Use the HWBLOCK_SIZE definition
  hw/sd/sdcard: Do not switch to ReceivingData if address is invalid
  hw/sd/sdcard: Restrict Class 6 commands to SCSD cards
  hw/sd/sdcard: Initialize constant values first
  hw/sd/sdcard: Check address is in range
  hw/sd/sdcard: Update the SDState documentation
  hw/sd/sdcard: Simplify cmd_valid_while_locked()
  hw/sd/sdcard: Constify sd_crc*()'s message argument
  hw/sd/sdcard: Make iolen unsigned
  hw/sd/sdcard: Correctly display the command name in trace events
  hw/sd/sdcard: Display offset in read/write_data() trace events
  hw/sd/sdcard: Simplify realize() a bit

 hw/sd/sd.c         | 173 +++++++++++++++++++++++++++------------------
 MAINTAINERS        |   1 +
 hw/sd/trace-events |   4 +-
 3 files changed, 109 insertions(+), 69 deletions(-)

-- 
2.21.3


