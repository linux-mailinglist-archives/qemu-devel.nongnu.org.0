Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B2B4B85CF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:32:29 +0100 (CET)
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHbo-0007LQ-0F
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:32:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nKHV1-0007Dh-26
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:25:27 -0500
Received: from [2a00:1450:4864:20::32a] (port=46657
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nKHUz-0005B2-26
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:25:26 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so1223554wml.5
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 02:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mc7PhGprugYH6JsJ/btdb54+G1UeM9DE+ApRCNmOHhE=;
 b=e8x5fScG9S78GgtHIk9SRmTwMlbbna6cgWXc/qpGUX5MVDsVjSmHWF4bIQQu3n5mOp
 UY/XVIccHjtGfpn1p4ouMzcBQHANvJn0F1hFxpYbf3OZ2Nh8kUI8ycTAUljlCG/quNcg
 gzBg1C8R3QRq23/OLG+wzkg6mrlT7nYBoCCU7afmDAdzbrdFsIw7PO8idDjKb0R7gAjV
 qS/LhjCfSP6AxveeW2vUgVJAiH7fOHSY73wXRXkZj9IMl/96gEA/qXUMcdUqNt7N3ktf
 og7L+zHaMgLf/M56I/Y6sJg4oXCA3lY4XNRdIT+WmyZCsMNCZL7bny4nrVXI2dtUNE6X
 G/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mc7PhGprugYH6JsJ/btdb54+G1UeM9DE+ApRCNmOHhE=;
 b=k1iaoQWSi5gwevrhydIy4CfeP3mxmYKUvc/T/YBb/4LBfz55aOMf7r0yHgoEd8c0lU
 KS196vN49nIwX8VjoRkYMBcrfsDExVhqe+XuIT7V7XeRN/+2OrqPJSp650APLLFSclA3
 pTz5RMXBcmXFhz849Eu4tCRoMorzn8imdFz/gNsFojDmWZRRYfO2NgI0UzyQfmKoPoph
 0W2dEqaUsA9bg/C7CnU9Nrtf4qOoIciLm+1COOKoNwTeOZOqFGY26whuAcn7pfX91LS6
 HUITGxg2avkOaoFzJftHf5cJCMQ0add7qZMMapCvpLrHABD3ncZDax/CI0nkBxjlhx7x
 6UVA==
X-Gm-Message-State: AOAM533QfSv7U+43OBZ54YbMdSoOnb5gYMK+cTE3bwf8CJy0u8SnckDx
 h0vpssU4gieEJawxkHKvuoE4Xdmkoqw=
X-Google-Smtp-Source: ABdhPJyHDFCVLd7OyM6o1TMhoBvndejxNbiiwHwR7upVCcX6KWiCs6Y//i1fXUIt18aOUK+KnbBTXA==
X-Received: by 2002:a7b:c8d4:0:b0:37c:32be:55b4 with SMTP id
 f20-20020a7bc8d4000000b0037c32be55b4mr924158wml.53.1645007120508; 
 Wed, 16 Feb 2022 02:25:20 -0800 (PST)
Received: from localhost.localdomain
 ([2a0d:6fc2:4af1:7d00:5e41:a6ea:ffaa:548c])
 by smtp.gmail.com with ESMTPSA id y10sm17212967wmi.47.2022.02.16.02.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:25:19 -0800 (PST)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] HyperV: Synthetic Debugging device
Date: Wed, 16 Feb 2022 12:24:56 +0200
Message-Id: <20220216102500.692781-1-arilou@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=arilou@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds support for the synthetic debugging device.

HyperV supports a special transport layer for the kernel debugger when
running in HyperV.

This patchset add supports for this device so you could have a setup
fast windows kernel debugging.

At this point of time, DHCP is not implmeneted so to set this up few
things need to be noted.

The scenario I used to test is having 2 VMs in the same virtual network
i.e a Debugger VM with the NIC:
-nic tap,model=virtio,mac=02:ca:01:01:01:01,script=/etc/qemu-ifup
And it's IP is going to be static 192.168.53.12
And the VM we want to debug, to which we need to have the englightments
and vmbus configured:
 -cpu host,hv-relaxed,hv_spinlocks=0x1fff,hv_time,+vmx,invtsc,hv-vapic,hv-vpindex,hv-synic,hv-syndbg \
 -device vmbus-bridge \
 -device hv-syndbg,host_ip=192.168.53.12,host_port=50000,use_hcalls=false \
 -nic tap,model=virtio,mac=02:ca:01:01:01:02,script=/etc/qemu-ifup \

Then in the debuggee VM we would setup the kernel debugging in the
following way:

If the VM is older than Win8:
* Copy the proper platform kdvm.dll (make sure it's called kdvm.dll even if platform is 32bit)
bcdedit /set {GUID} dbgtransport kdvm.dll
bcdedit /set {GUID} loadoptions host_ip="1.2.3.4",host_port="50000",nodhcp
bcdedit /set {GUID} debug on
bcdedit /set {GUID} halbreakpoint on

Win8 and late:
bcdedit /dbgsettings net hostip:7.7.7.7 port:50000 nodhcp

This is all the setup that is required to get the synthetic debugger
configured correctly.

Jon Doron (4):
  hyperv: SControl is optional to enable SynIc
  hyperv: Add definitions for syndbg
  hyperv: Add support to process syndbg commands
  hw: hyperv: Initial commit for Synthetic Debugging device

 docs/hyperv.txt                  |  15 ++
 hw/hyperv/Kconfig                |   5 +
 hw/hyperv/hyperv.c               | 352 ++++++++++++++++++++++++---
 hw/hyperv/meson.build            |   1 +
 hw/hyperv/syndbg.c               | 402 +++++++++++++++++++++++++++++++
 include/hw/hyperv/hyperv-proto.h |  52 ++++
 include/hw/hyperv/hyperv.h       |  58 +++++
 target/i386/cpu.c                |   2 +
 target/i386/cpu.h                |   7 +
 target/i386/kvm/hyperv-proto.h   |  37 +++
 target/i386/kvm/hyperv-stub.c    |   6 +
 target/i386/kvm/hyperv.c         |  52 +++-
 target/i386/kvm/kvm.c            |  76 +++++-
 13 files changed, 1024 insertions(+), 41 deletions(-)
 create mode 100644 hw/hyperv/syndbg.c

-- 
2.35.1


