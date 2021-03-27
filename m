Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48034B7BE
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 15:37:49 +0100 (CET)
Received: from localhost ([::1]:41808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQA4S-0003dh-4Q
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 10:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA1j-0001r3-W4
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:35:00 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA1i-0003kM-Ca
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:34:59 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x13so8378598wrs.9
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 07:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FgMTuzs3mpYFkk6o9mVTr/p1bYIvymzXFjUSfxoamWw=;
 b=mjJjYJIxlPxHGyGSOYWLuafN+OSfjihAyQ9OcJZwMapVkY8h0NJ1OODHYjWFPhkE00
 ySX3G7UaQ8lBqo13nSFuyYlKcNBrgdzNPrEIRf/0/viLmNrSS/GWch+iBn2+ecL+NZLW
 9ZWpkVjj5ytbq+zv7VrOCBM2zeClRYQ4pbPLXzhShBGPD0ZC3LoIincJw5UMFjlNJEhX
 ts5E4ZstXsGpIYq4tfgYe2Okb51KJyWiRaVFX4/lPyOJPeKxhf0qemx21hEudFygVZWQ
 CpHZtr2P2ShA0iUA7kJmptNfkjrSHXo775b6SHiq6PQc0yk9lQRTEsoXFRQQ291FsCgl
 Vp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FgMTuzs3mpYFkk6o9mVTr/p1bYIvymzXFjUSfxoamWw=;
 b=NZuE1MnWR8nCfCndsO9ByeC3f1qNOSH86k3B58yftO8who+wCGk8MARorzR0z+GyH6
 kj+1KTr0HkX12H6/SYa839FcTV2S4Hyt5yhzKAYjxFdxalGhr8/pcsoFttnKV1DeeYSl
 2tROYy43Q0GqVTMrq8/MYyV2REq8EAoRGEdUZUjNr1oBr8iignx/YMHPYjKPM4PkVSa0
 a4zo/6iw50RyNgTo+B+w1GcBayBbLJM0+Bt72Ic836Z4z20lTcFRSRaPo9xZa5QUoSa0
 gxd9eLXmUO5aNV3z/q6XtwRW6kZtJpluNcaST8XoJKIb8pSdkybmjnRdkWP1Z+7sdAHX
 nbmQ==
X-Gm-Message-State: AOAM5305nRO/o3qxPAXOEQA89HbbTs86lzLL34qw2bfQUBl7if5S2Zkj
 GOOmkciYEzjBTojpYv8P0+YqkLcqQ/VXiw==
X-Google-Smtp-Source: ABdhPJyP533MseyBh5kudW3yXdIzlltC6QouRAJcLBoeLGsKiOljP4jlNvxRlgI3rQH2vm6ZLlbFkg==
X-Received: by 2002:adf:fb42:: with SMTP id c2mr19856591wrs.83.1616855694864; 
 Sat, 27 Mar 2021 07:34:54 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l6sm19208688wrn.3.2021.03.27.07.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 07:34:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] memory: Add 'priority' property setter
Date: Sat, 27 Mar 2021 15:34:47 +0100
Message-Id: <20210327143452.1514392-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first patch is an old fix, it would be nice to get it=0D
merged eventually, but not a problem during years, so can=0D
also wait 6.1.=0D
=0D
The second patch add the memory_region_set_priority() helper=0D
useful to memory controller devices.=0D
=0D
The rest add the 'size'/'priority' object setters.=0D
=0D
Supersedes: <20180405012241.25714-1-f4bug@amsat.org>=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg525635.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  memory: Fix memory_region 'priority' property sign=0D
  memory: Add memory_region_set_priority()=0D
  memory: Rename MemoryRegion object getters=0D
  memory: Add setter for MemoryRegion object 'size' property=0D
  memory: Add setter for MemoryRegion object 'priority' property=0D
=0D
 include/exec/memory.h | 10 ++++++++=0D
 softmmu/memory.c      | 56 +++++++++++++++++++++++++++++++++++--------=0D
 2 files changed, 56 insertions(+), 10 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

