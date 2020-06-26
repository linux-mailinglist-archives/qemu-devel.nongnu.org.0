Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3A520AFAF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 12:29:12 +0200 (CEST)
Received: from localhost ([::1]:42106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jolbb-0007A1-Ar
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 06:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jolaI-0005rM-Fs; Fri, 26 Jun 2020 06:27:50 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jolaG-0001w6-UY; Fri, 26 Jun 2020 06:27:50 -0400
Received: by mail-wm1-x344.google.com with SMTP id o2so8883079wmh.2;
 Fri, 26 Jun 2020 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yMKB4/6egIXel+cyR6i/+SHKrBewfwc91aLTHBCpyyk=;
 b=oiHVLx0aZFKBCJeyX1+KNfQeLTy8dZz9gblBn+IJV54iohvrvemVmZm5VIEwDXmoTd
 GgJKxBh/tPhcLUY1OPCyC7u2xBtkuzWmcQ9BjuzgIP6tkINVZK+TU3H4MObk/D9X04py
 Tllb5pTvhP5z1IOtEmK+DTvxT8q+gY9d4Hmh8IHYx1jgkcwbVcARXZwsbgvCHX4wQKUV
 BpA9N2hdJml7b8Bz6MF+juPWPJTEHNvsun3zaRMdIp6S5D5VKqkVd4q+NbqODS1hXh2O
 yWMBWL8QcyxUf8weoPXMqtw/8mlxRuOBUCkXWDBBNtahcbxFOWjSeHMK6RMNxNflFSEn
 LQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yMKB4/6egIXel+cyR6i/+SHKrBewfwc91aLTHBCpyyk=;
 b=OKugNU1NqwBx3M74lpnnuhFO5rtmcuzoFXo9vWdPDV4q5dfes8I99BUL/vnneBJVDm
 Ar1D2mU9n2q0SV196OdFN2KAPiBzJsy5Hb8YdKUo76JHO4/5in2W4HdcDUKU4KHVtP8q
 gwLZUhLHiYpCgxjWMffXh/CuuMjdVkUQmdfQ1ztkhe8sbxGkp+VC9DVDmDXIER0CMyJv
 SfYDMyxIHzo3UcwJUeaJe2moKXOnIMu2mTVhziaEFGRv6hNj/dTD53bP0Yp7GI+oGU1X
 23+pXWM+y35gbL+BLvAUjTsUkskflArolrmhPEbwTKU7JKwjosXHKMLIWVTkklUQQhMb
 lkhg==
X-Gm-Message-State: AOAM533L+kCM97nOG5laQUdJ2LO5hXJ8KQtxyvJ+l/5NguQ1pkX0mSB8
 mrbkSFey5EBPxy1t9/dZ/B0=
X-Google-Smtp-Source: ABdhPJznYoIg9DmNEsWlCv3Jb4AWCfVU0kQa7g5WkVrWxZ4O4n63umcLWAkduUdLl3JKqOUlD1YSpw==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr408518wmc.72.1593167267030;
 Fri, 26 Jun 2020 03:27:47 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id f13sm15598194wmb.33.2020.06.26.03.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 03:27:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 0/3] Use object_get_canonical_path_component to get child
 description
Date: Fri, 26 Jun 2020 12:27:41 +0200
Message-Id: <20200626102744.15053-1-f4bug@amsat.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This RFC is simply a proof-of-concept to see if I correctly
understood Markus' suggestion, see the thread around:
https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg08652.html

Philippe Mathieu-Daudé (3):
  hw/i2c/smbus_eeprom: Set QOM parent
  hw/i2c/smbus_eeprom: Add description based on child name
  hw/i2c/smbus_eeprom: Trace reset() event

 include/hw/i2c/smbus_eeprom.h |  9 ++++++---
 hw/i2c/smbus_eeprom.c         | 18 +++++++++++++++---
 hw/mips/fuloong2e.c           |  2 +-
 hw/ppc/sam460ex.c             |  2 +-
 hw/i2c/trace-events           |  3 +++
 5 files changed, 26 insertions(+), 8 deletions(-)

-- 
2.21.3


