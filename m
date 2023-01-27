Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DDC67EB76
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 17:48:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLRt8-0002KC-8c; Fri, 27 Jan 2023 11:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt1-0002HQ-3p; Fri, 27 Jan 2023 11:47:35 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRsy-0005e8-Pu; Fri, 27 Jan 2023 11:47:34 -0500
Received: by mail-ej1-x629.google.com with SMTP id k4so9822568eje.1;
 Fri, 27 Jan 2023 08:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LZ1IeIKZdFUs3kZ3eGUdzG1WYf69b6xCYy2NW3EANJM=;
 b=qVk1JwW9CIawa1K4Wiw9sIN7sqqNCBwpuAIWFIFA+bGHsY3LtZmRZ6lYOSKIVmuFoT
 3L+Xb/XA1SvjbABXY/u1k0fIgGxzvfNICakfLQbh0I5L0v3oNX51VVK4k6+J8YHQZ6pW
 ZR+5c81XR1VkMJeEtdWJnuHxMm33hyJeQGSAW4qw0fO7y7hnuiUVpg6jO+oixK/D4m9E
 YQoo8BgAmhaXIjPE9OR98CyWlVTOvfY05VBA72Dhy5D5mORuSP6OwklNJqBkQo1n6sn5
 28pevCUJOaH5Slivs+Xjfmdga2OQGtaY0W+/Ao6IhL6CUcKfmFieu0B4ye7CMLsX7r/8
 dNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LZ1IeIKZdFUs3kZ3eGUdzG1WYf69b6xCYy2NW3EANJM=;
 b=RxOYSoY7HTBSWPMWGxV//zVOdQ3fJgN0vK4lfe8fiY5RGQAD7gdL7ZRQ6PgEsM5vlV
 h5nWC1/NFTxzCHvoPYDzeDziSmsk4wipO793zi8GyNNE71mdopJfFfLkkgTMzU0mZZge
 Pt+SrkOjCncf1/hJzjp3iyba9OkkDqgWuk2WdEIyyoj3dIUJkqgQV1UzJl79/DXctBQR
 UYW6P07VdrniuTag0Pdjh7lORAZz/oGDblV7N3QYlCq6vgc1lw7zm+RCqGvbQqByJ8V2
 Iv2UvGhVitNmAytnx8wdgBhiLpQqAwh8AGN/ZJ3RQRwRIKry3HcA1In2eQCyuj32wohl
 lm6w==
X-Gm-Message-State: AFqh2krAEpwzATZ3WLcaN2WSuCg6upEXhcTT1n6ecXwOJ1Gmat2a5ea2
 zprWMlzpD6goRrt2J+KJHbeGfP8l42HNKg==
X-Google-Smtp-Source: AMrXdXtG8Ie80rETQwfF5cMSBdLXXyKFfuUX+cDvqthurGqT7x5adLsTUPxHO25juJ4qn0rn3zBS+g==
X-Received: by 2002:a17:906:df49:b0:84d:34fa:f1a4 with SMTP id
 if9-20020a170906df4900b0084d34faf1a4mr36316665ejc.60.1674838050394; 
 Fri, 27 Jan 2023 08:47:30 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056402050f00b0049ef70a2894sm2574414edv.38.2023.01.27.08.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 08:47:29 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/7] PC cleanups
Date: Fri, 27 Jan 2023 17:47:11 +0100
Message-Id: <20230127164718.98156-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This series contains some random trivial cleanups I came across when workin=
g on=0D
the PC machines. It consists of reducing the usage of global variables and=
=0D
eliminating some redundancies.=0D
=0D
Testing done:=0D
* `make check`=0D
* `qemu-system-x86_64 -M q35 -m 2G -cdrom \=0D
   manjaro-kde-21.3.2-220704-linux515.iso`=0D
* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.3.2-220704-linux515=
.iso`=0D
=0D
Bernhard Beschow (7):=0D
  hw/pci-host/i440fx: Inline sysbus_add_io()=0D
  hw/pci-host/q35: Inline sysbus_add_io()=0D
  hw/i386/ich9: Rename Q35_MASK to ICH9_MASK=0D
  hw/i386/pc_q35: Resolve redundant q35_host variable=0D
  hw/i386/pc_{q35,piix}: Reuse MachineClass::desc as SMB product name=0D
  hw/i386/pc_{q35,piix}: Minimize usage of get_system_memory()=0D
  hw/i386/pc: Initialize ram_memory variable directly=0D
=0D
 include/hw/i386/ich9.h | 10 +++++-----=0D
 include/hw/i386/pc.h   |  1 -=0D
 hw/i386/pc.c           |  2 --=0D
 hw/i386/pc_piix.c      |  8 ++++----=0D
 hw/i386/pc_q35.c       | 34 ++++++++++++++++------------------=0D
 hw/pci-host/i440fx.c   |  5 +++--=0D
 hw/pci-host/q35.c      |  6 ++++--=0D
 7 files changed, 32 insertions(+), 34 deletions(-)=0D
=0D
-- =0D
2.39.1=0D
=0D

