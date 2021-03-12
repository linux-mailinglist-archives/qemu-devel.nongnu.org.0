Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F154233970A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:02:17 +0100 (CET)
Received: from localhost ([::1]:43820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKn3A-0004Vk-Rw
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmWw-00057G-Vk; Fri, 12 Mar 2021 13:28:59 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmWv-0004qO-6p; Fri, 12 Mar 2021 13:28:58 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so16364999wmy.5; 
 Fri, 12 Mar 2021 10:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/TIv3/1V+tYkSopWH9Wv5IsTEd2U//KEZ8O05K9qYMw=;
 b=V1msm4wIUipqRvTdqenw+zrQYC62O55An22DwRh4GwZaeziot/uX0xCgdOsHvqLWgR
 yMhuifqyOcCsfVD2bU5cQfSRMUx+ITMASy89mOc1cIYeaD6m01ZwzrVHwGEQeE70ewoT
 oOnoW49GYeVdSpETFn5vz/6wGhTIDmZ4kAxzAVRM1fsRT+FeEDKbYkX1VrEM1uPZvEpz
 XZYoaG61z5GvMfqud6+UgXLX/sqr0yGkcQdTMJwp1kLCI01n6vZCIwrdv/pLuywIocV7
 +BmPZxJ3xV3OZgIe7PpxSepmtyoNLBUlsCarjLzFVc5PC7LA/WdIdoT/wkxq2MDCDcNR
 Gggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/TIv3/1V+tYkSopWH9Wv5IsTEd2U//KEZ8O05K9qYMw=;
 b=Abaon32U5oQQBG8onZqxlCPFM2DoYXYQuHlUH44vQ/pEGTk0xW6CBjOn3/U+6TJiza
 h4Ly9OjzTNdJobNjnmrf9RlDCRXkoqC378cwTWfFm5xQV8PD35CBQtkNcsBHa1qRZIBE
 cvtNncyDxvl3mEy3q7DIUHXS4QkHqd8kBAxT0nqZ9ksq/CMOseqCY4OeADCPI5xHAgQ/
 hM1z5SWNSSB6lGSGiGicxN4F46Ef1t2UKJuob7f4jTQwKgSnzp7lH0yfK9qrd+uXL2F3
 oDxEiGCb9B8EEVpf7GrdB15Ud3ohd2OfDnsGk8CSE0nXm9pB+l7N4gp/xkNWr4/+7UAH
 +lAg==
X-Gm-Message-State: AOAM530R3D/eEmJVtmIeFu051CTyT7fnXzQUhFahxQ8OVVZimwII3hB+
 EMOZCfsd6QXsWjTwvX/ZJOPLK3nZWJI=
X-Google-Smtp-Source: ABdhPJxIJ/5g11It3XdlUUDdkxJWw385co/JKoJDvgrNBNpcUGvb534cbKHxenL0r5p+/hrwyanTcw==
X-Received: by 2002:a1c:7210:: with SMTP id n16mr13993521wmc.13.1615573734175; 
 Fri, 12 Mar 2021 10:28:54 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 18sm3076941wmj.21.2021.03.12.10.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 10:28:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] memory: Forbid mapping AddressSpace root MemoryRegion
Date: Fri, 12 Mar 2021 19:28:46 +0100
Message-Id: <20210312182851.1922972-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series is the result of a long thread with Peter:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg788366.html=0D
=0D
AddressSpace are physical address view and shouldn't be using=0D
non-zero base address. The correct way to map a MR used as AS=0D
root is to use a MR alias.=0D
=0D
Fix the current incorrect uses, then forbid further use.=0D
=0D
Peter Xu (1):=0D
  memory: Make sure root MR won't be added as subregion=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/arm/aspeed: Do not directly map ram container onto main address bus=0D
  hw/arm/aspeed: Do not sysbus-map mmio flash region directly, use alias=0D
  hw/pci-host/prep: Remove unuseful memory region mapping=0D
  hw/pci-host/prep: Do not directly map bus-master region onto main bus=0D
=0D
 include/exec/memory.h       |  1 +=0D
 include/hw/ssi/aspeed_smc.h |  1 +=0D
 hw/arm/aspeed.c             |  6 +++++-=0D
 hw/pci-host/prep.c          | 17 ++++++++---------=0D
 hw/ssi/aspeed_smc.c         |  4 +++-=0D
 softmmu/memory.c            |  2 ++=0D
 6 files changed, 20 insertions(+), 11 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

