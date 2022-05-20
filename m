Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8538652F1E1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 19:49:54 +0200 (CEST)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns6l7-0004tM-I8
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 13:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6hS-0002b0-Q8; Fri, 20 May 2022 13:46:06 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6hR-0002DJ-6C; Fri, 20 May 2022 13:46:06 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gh17so3896944ejc.6;
 Fri, 20 May 2022 10:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9zR9R0YJVnAbSia+EXR1E7kQT16w5RPYN8Ulr0aKzE=;
 b=etX8od50YVwOQYq7GSAXtUUPEvWsQfpgifowEKK/fVmJbqtPZu8wsWHYW3mQ5YVF0A
 +YAAri2l3u1L0lznIYlSA2SYnoJrfGjZNKpXOkRoIjh98Dn0w4mFsR9uzLVhG777aaax
 v+1EcYJhqgH88xIycI6xZOx7iulOFMJWHhkoHCK5HghLdDOQkyBHIK5YsZnmgGnLT/9N
 dU/O2fj5oPLTaWuSeaIk/tCYHyHudT1ZjbTpmr1iigVyFPzKQEVChiYXVhO7H96zQ+FG
 HX6Ynnv8qUhE2cwWriktaTqShnt/Q6wLt+KOQANpU60sCN/yOYfIdDGUSCx5aqhE21df
 oIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9zR9R0YJVnAbSia+EXR1E7kQT16w5RPYN8Ulr0aKzE=;
 b=OadcSbt88ZfeS2b6eaRZGKf4DHqMsGqTz+9NLV7hJ0UOs3oB6BygTuyPSuwk0mXaum
 3euz9PHNQyptA/9zAW3QKMTbbTmP1nq7GweOdxYFdavJVZmMgYhVG5vAv5qSeudpV25X
 VuGP0kLuU8Uxu9gatPi7wzP5eKMkscdTTkDvXSte/Ep5Q6WMuK7TUPBJHejx5PHNrRns
 8rMtUXbXgVp3e/3bO0mAtPNlKVIFGeFPjzMjVo9cLDMQ60rF4sPYllt8u36T2YUpZwqU
 KgKgVca7AutgaLcdrFjo54p4NAIaQU3/zTitAh1f18Moew+/GmudeStB/qsdRwW33Xmc
 p26Q==
X-Gm-Message-State: AOAM532M1gtiLVc7fz1j1heBWMP/6PiCGCiOffK+24BjCeg3S04xMhdz
 zdO8nX5rSgalSMBa74qHbIqmVQrcWVs=
X-Google-Smtp-Source: ABdhPJzHNAARu1E3L5GETLLuV9XHWwehGRpW/fTlEh1BFa+TZeoqYWAqqXgpeATeXjDHFbdkms8EAA==
X-Received: by 2002:a17:907:6284:b0:6e0:f895:15a with SMTP id
 nd4-20020a170907628400b006e0f895015amr9726965ejc.713.1653068762762; 
 Fri, 20 May 2022 10:46:02 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 h22-20020aa7cdd6000000b0042abb914d6asm4410209edw.69.2022.05.20.10.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 10:46:02 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/2] QOM improvements for rtc/mc146818rtc
Date: Fri, 20 May 2022 19:45:35 +0200
Message-Id: <20220520174537.5827-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This little series enhances QOM support for mc146818rtc:
* makes microvm-dt respect mc146818rtc's IRQ number set by QOM property and
* adds an io_base QOM property similar to other ISA devices

Bernhard Beschow (2):
  hw/i386/microvm-dt: Determine mc146818rtc's IRQ number from QOM
    property
  rtc/mc146818rtc: QOM'ify io_base offset

 hw/i386/microvm-dt.c         | 4 ++--
 hw/rtc/mc146818rtc.c         | 7 ++++---
 include/hw/rtc/mc146818rtc.h | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.36.1


