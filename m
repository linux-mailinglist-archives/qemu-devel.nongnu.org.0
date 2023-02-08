Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5605468E4BF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 01:09:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPY08-0005QJ-A4; Tue, 07 Feb 2023 19:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY05-0005Pz-S6
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:07:49 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY04-0008R9-5a
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:07:49 -0500
Received: by mail-wr1-x432.google.com with SMTP id r2so15185039wrv.7
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 16:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pB5gfdAId6nFf1U+98M6HgWFc/GSRqkkNeSxZeV/xDE=;
 b=AnSeJIIOv0Xn08tuUG+OJAdaz2a9GORr3h5bdBIFwcVU4f0jRt1dAYW07THLS8LxBY
 jzl1Dstp4/6fXSckQRaxN5aZkUzdngRwxAFLaidHH4jYTlNVBBrO0DJu6f4yyMXoVGDB
 095RpvNjadwQtdy5eMvjFrwdQSVloC6qCZhmxuVM70YHwGWjmVG3fQchjHbNGjg0jXl4
 uwOao2xQXaM5g1hPZ6GcMc4y0kWaMUcYxA94zZxOeBh5ZloDP+c6m+lswgBBFH5t9RLL
 AidnOo0LTuKoQGypE3iGSeqciUTN+vtF8VaGFZNlxo215lm3mGSlZ0EkjtUAPlWstLaN
 Y3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pB5gfdAId6nFf1U+98M6HgWFc/GSRqkkNeSxZeV/xDE=;
 b=6EKG1PYIpFw9z21TvUtJNtdtB3eoSbKy91P34zKvm6VmZG5yOsA1MprQorRXa/23Y0
 nNqM8hEK/W71aQTI1j62C5q448u8oXHjFz1zJB4eK8eDLuXPcoXNsKUsnnE0jDkvCDBM
 b2tSPRqqStPuTk4BixN4c7hIlXVJsVwjJZpLmX1ooQ2GL5pQv3ULS4SK8S4udX93U8M6
 xyCF2D72x8Npet0nuiQo1b0RDO24w3Mk5HySoPG+VjJ7dz7tyjzPmC12unFYVxyweHiv
 M5FQCO5CfSFbJsuBikCpWrB5KSycmZV019QPgXf0u4fwLZ3QhGHEZ2aJdYXrhcVOzCGE
 acXA==
X-Gm-Message-State: AO0yUKUDdvINkbwvV1tKYwESi9yFJgqI3msHltNGPv6/Zt5wiuccyBIM
 QdLPqmxZGUq2e6pkyuXObaXZe/WfhH1aXqQg
X-Google-Smtp-Source: AK7set8zurIydCgf7KNadV7zrYHOHiXyqBP/fYOU2PevKC+YiAvqzHrzoKZBb5ffE1s1wQkWgVeJfg==
X-Received: by 2002:a5d:6843:0:b0:2bf:bb22:946e with SMTP id
 o3-20020a5d6843000000b002bfbb22946emr4786706wrw.5.1675814866155; 
 Tue, 07 Feb 2023 16:07:46 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h12-20020adff4cc000000b002c3d814cc63sm11414603wrp.76.2023.02.07.16.07.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Feb 2023 16:07:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/7] hw/ide: Untangle ISA/PCI abuses of ide_init_ioport()
Date: Wed,  8 Feb 2023 01:07:36 +0100
Message-Id: <20230208000743.79415-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Background thread:
https://lore.kernel.org/qemu-devel/5095dffc-309b-6c72-d255-8cdaa6fd3d52@ilande.co.uk/

The ide_init_ioport() method expect an ISA device, but is
massaged to accept NULL device (IOW, non-ISA devices...).

A plausible explanation is QOM objects can only inherit one
parent, and ide_init_ioport() was first used with ISA children.
Later it was adapted to accept PCI children in a convoluted
way. The PIIX IDE function abuse it.

This series rename the current ide_init_ioport() as
ide_init_ioport_isa(), then add a generic ide_init_ioport()
which works with PCI devices.

This is required to proceed with more PIIX cleanups.

Philippe Mathieu-Daudé (7):
  hw/isa: Un-inline isa_bus_from_device()
  hw/isa: Use isa_address_space_io() to reduce access on global 'isabus'
  hw/ide: Rename ISA specific ide_init_ioport() as ide_init_ioport_isa()
  hw/ide: Introduce generic ide_init_ioport()
  hw/ide/piix: Use generic ide_init_ioport()
  hw/isa: Assert isa_register_portio_list() gets non-NULL ISA device
  hw/ide/piix: Remove dead code in pci_piix_init_ports()

 hw/ide/ioport.c           | 13 ++++++++++---
 hw/ide/isa.c              |  2 +-
 hw/ide/piix.c             | 21 ++++++---------------
 hw/isa/isa-bus.c          | 13 ++++++++++---
 include/hw/ide/internal.h |  4 +++-
 include/hw/isa/isa.h      |  5 +----
 6 files changed, 31 insertions(+), 27 deletions(-)

-- 
2.38.1


