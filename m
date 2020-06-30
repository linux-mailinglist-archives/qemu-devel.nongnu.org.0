Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0431320F22A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 12:07:23 +0200 (CEST)
Received: from localhost ([::1]:42874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqDAe-0007Cu-VQ
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 06:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqD7E-0002Fp-Ds; Tue, 30 Jun 2020 06:03:48 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:41724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqD7C-0004ay-Iy; Tue, 30 Jun 2020 06:03:47 -0400
Received: by mail-ej1-x643.google.com with SMTP id dp18so19908404ejc.8;
 Tue, 30 Jun 2020 03:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DXbfsINVkp7sb87LorrFGxYmws3H8J2H4u7WEqa5JBc=;
 b=goT6xynEQnDX9HaT4NPgetrNLX/tLGerAbMBjJg7mqPyWtUntoOV5YqoXxpCykuPHb
 p20Y9QrJqQY/dLigriRAFaCE0PLehpPUUpCK/PcdGXMOTXgz6s3hfoIOpw9hZZBQ+lha
 x9uGiViEgz2vHMaIDRTBKft0k5U/TvPQJFFK/ZI/tlhcFv3gzATOMfHpmZFL+2v6fLhv
 IdxpP3CkDb2g8JG+aLCiAT3nDoa8FaYwnLZ3pn5zecPkMrFvKWSH3zyXp9EPtWFwt2NA
 jR30G01nsbkFubev8LdV4YP8P4I2JKIjvlqk1BDnz/5DCwtlyPKKIsGg6Yjhq343cR7M
 t+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DXbfsINVkp7sb87LorrFGxYmws3H8J2H4u7WEqa5JBc=;
 b=JBXVRJeEnLfS8/f7/d8pLBcpljJM2NAcUgvaBjEmWrhetBXB4zr/42lsZhvNQRG0IU
 pDxxFh/ya2DzSWpa+AqvyJJINqWflHpp4yQQ5QrS4s6W6KoxEuFD/lvOP2L9dvjbbqod
 Fyr1Ev1Y6C2AZ/yqQMFSJHQItDlzPAAr+BnvuVAxU/UMimiBshfsiK6TvbfiKHIuugXL
 /fS45ENVgv1ABmZexDzMRlQHi7Kis+jv/j6hqdVbqNs9+dMhlZyXANTZJ2CjWXdefKTb
 tbLdIwu7pnMr0Qk2d6Q+By7OkbP9fk4lEsR6sqCFVhqeYFmUIdOt96r8Zg+fnqnGG4Xx
 mxUA==
X-Gm-Message-State: AOAM533qWMN58ubgO9gmljjr/5fdsID28qfxCU9y7z+aiONX+mOaAGx0
 s+ljZFk4x/L9M2E0XldWy7QFXFDrouo=
X-Google-Smtp-Source: ABdhPJxHRmlJT1gMhaHo9y5g5v0TxlIV/QnxmAClRkYdnB4DU8pghAqciVfivWEjXRwb7NEsR1MFWg==
X-Received: by 2002:a17:906:3945:: with SMTP id
 g5mr18695239eje.549.1593511423953; 
 Tue, 30 Jun 2020 03:03:43 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id h2sm2304697edk.54.2020.06.30.03.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 03:03:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/15] hw/sd/sdcard: Fix CVE-2020-13253 & cleanups
Date: Tue, 30 Jun 2020 12:03:27 +0200
Message-Id: <20200630100342.27625-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
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

Since v5: Fix incorrect use of sd_addr_to_wpnum() in sd_reset()

Missing review:
[PATCH 01/15] MAINTAINERS: Cc qemu-block mailing list
[PATCH 03/15] hw/sd/sdcard: Move some definitions to use them
[PATCH 04/15] hw/sd/sdcard: Use the HWBLOCK_SIZE definition
[PATCH 05/15] hw/sd/sdcard: Do not switch to ReceivingData if
[PATCH 07/15] hw/sd/sdcard: Initialize constant values first
[PATCH 08/15] hw/sd/sdcard: Check address is in range
[PATCH 12/15] hw/sd/sdcard: Make iolen unsigned
[PATCH 13/15] hw/sd/sdcard: Correctly display the command name in

$ git backport-diff -u v5
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/15:[----] [--] 'MAINTAINERS: Cc qemu-block mailing list'
002/15:[----] [--] 'hw/sd/sdcard: Update coding style to make checkpatch.pl happy'
003/15:[----] [--] 'hw/sd/sdcard: Move some definitions to use them earlier'
004/15:[----] [--] 'hw/sd/sdcard: Use the HWBLOCK_SIZE definition'
005/15:[----] [--] 'hw/sd/sdcard: Do not switch to ReceivingData if address is invalid'
006/15:[----] [--] 'hw/sd/sdcard: Restrict Class 6 commands to SCSD cards'
007/15:[----] [--] 'hw/sd/sdcard: Initialize constant values first'
008/15:[0004] [FC] 'hw/sd/sdcard: Check address is in range'
009/15:[----] [--] 'hw/sd/sdcard: Update the SDState documentation'
010/15:[----] [--] 'hw/sd/sdcard: Simplify cmd_valid_while_locked()'
011/15:[----] [--] 'hw/sd/sdcard: Constify sd_crc*()'s message argument'
012/15:[----] [--] 'hw/sd/sdcard: Make iolen unsigned'
013/15:[----] [--] 'hw/sd/sdcard: Correctly display the command name in trace events'
014/15:[----] [--] 'hw/sd/sdcard: Display offset in read/write_data() trace events'
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


