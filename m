Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71636C6D0A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 17:11:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfNWr-0005go-TU; Thu, 23 Mar 2023 12:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfNWp-0005fP-LV; Thu, 23 Mar 2023 12:11:03 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfNWo-0005eX-2S; Thu, 23 Mar 2023 12:11:03 -0400
Received: by mail-oi1-x232.google.com with SMTP id v17so6777942oic.5;
 Thu, 23 Mar 2023 09:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679587859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ThJVkvAmJ1u7DqjAudIv1Cf4fo6zpPb+9sotSpn8cd8=;
 b=JU71fnCylfvk6ECE9WAx7WKO0KHHEZ1+GYACU9Peg86g4JV9AEIqnOMw/pBcGpp2Q7
 oJlBbWV2G8PgGtYyC7RlOhYo+3BUWQfwBWWvLmaNOAUX/Il1HJTY4Cchvn0nESQFzoWV
 es1BALJ1TcyImxoNj2LUUWFTLeTBaquJaWYRYxly6Mt4Pkug3ybP+ilqc1xk1khlh94I
 2iMV6lIeJXGh919Da9f7zGVaPk8+cH9eoLNDd+8+TDPRjaE+0Z0h5i1w2NSA5fLuA4Qh
 daofw2ZOZdvxcVpVN12QHQH+eo3oiFr32B++Vdbr0rYTEi6R+xIOVYLyY5ZnP2pc5QOS
 7jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679587859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ThJVkvAmJ1u7DqjAudIv1Cf4fo6zpPb+9sotSpn8cd8=;
 b=NpIqNBLXYyZ6oNFLs/OR1mAmWRJ7i3v7OSIoqeLG0eIoQuTDY7V0BJgr+Kv9bAT9Gl
 9Qb+73jjSv7HsNVFzXZTTWu7em9dMNIdWLKL3UgWZweDafDhQHzU3RevCpk7FtFXgprG
 HRSzMryqyApeSFQogjkTmfBeKj8dqIN+yAm5wjhHFe8ec6KK1PecyP06qwuZZWD6O4og
 98xL7TK3krkl8YmNKHDUO2AT0lcy3+OtrriMX6OF5fHI2w4xfe9Oa/BCVqEGeiLnc2C2
 1DXmj6uOpJhICMMIo8Bhplrz4KteH+8hIalC7xXPB3KHraXK3Wyuldt/U5wWV4wj1pov
 T3CA==
X-Gm-Message-State: AO0yUKXZ9MV+DZUycs79gSbvTB8pNbrQ6z707DNZlFjzlQTZyi2QNO6j
 YypwdPcE+82OJk/WEM9ccqrXZWJJAO4=
X-Google-Smtp-Source: AK7set89aFs4c2G3tzjq9BQB1tvZBHrBT5akIVjeARyj6Rwb4Yhy+M9xhjt4HkCWZG3xP/9xhTawwA==
X-Received: by 2002:a05:6808:280d:b0:37f:b11c:7525 with SMTP id
 et13-20020a056808280d00b0037fb11c7525mr2696128oib.29.1679587858951; 
 Thu, 23 Mar 2023 09:10:58 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 q32-20020a4a9623000000b0051a6cb524b6sm7575504ooi.2.2023.03.23.09.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 09:10:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH 0/1] fix dumpdtb crash with ARM machines
Date: Thu, 23 Mar 2023 13:10:52 -0300
Message-Id: <20230323161053.412356-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

This is a re-post of "[PATCH v8 03/16] hw/arm: do not free machine->fdt
in arm_load_dtb()":

https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg04201.html

Turns out that I drop the ball and left this patch behind. Aside from
some patches of that series that were optional, the way ARM code is
working ATM is causing 'dumpdtb' to crash QEMU, as reported by Markus in
https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05858.html .

Applying this patch fixes the reported crash:

$ ./qemu-system-aarch64 -S -M virt -display none -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 91, "minor": 2, "major": 7}, "package": "v8.0.0-rc1-37-g298c4469cf"}, "capabilities": ["oob"]}}
{"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
{"return": {}}
{"execute": "dumpdtb", "arguments": {"filename": "fdt.dtb"}}
{"return": {}}
^Cqemu-system-aarch64: terminating on signal 2
{"timestamp": {"seconds": 1679587153, "microseconds": 714319}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-signal"}}
$ 
$ dtc -I dtb -O dts fdt.dtb | grep timer
	timer {
		compatible = "arm,armv7-timer";
$

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org

Daniel Henrique Barboza (1):
  hw/arm: do not free machine->fdt in arm_load_dtb()

 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.39.2


