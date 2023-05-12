Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3081870085F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:48:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxSBs-0003Db-Pc; Fri, 12 May 2023 08:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSBh-0003CI-LV
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:47:57 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSBf-0000Jv-4m
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:47:56 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-96622bca286so1445762766b.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683895672; x=1686487672;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sMy10c/2zeDBQKu5955DezN44GqqW0s4+xHIEBzOFqY=;
 b=LhHik3tH8sWGYSa9RdURgseciKXqnwlRbLxKkPqPhL23u0kBBotPmb7uYRQJtFqbwt
 PuMF64WWJvlJlwKcQx6UqMSFDFUiObrrcYrgW51LNBrkaxt8OPVlZKPp5SkWs5AU6wFp
 IS4ALxixRZ+/PcrDfZly9yK497N4IvqpIsN5Gjtd/5gg13rlXUePB4NGVMph+ul0L43D
 qSHslNsxSf8dlPptsdt5t2JUbLKc2GJVD7fMedhQ6617MDk+pyJ3cqxRpdhWcPMB+GYP
 45jx+vt6hmg6CIuBJhfEQAEnbwvH/EDIc1O5KHf62pZDQJ6zxfdKVpvb6ZpP9JilHaY3
 BrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683895672; x=1686487672;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sMy10c/2zeDBQKu5955DezN44GqqW0s4+xHIEBzOFqY=;
 b=CrYnTxYOSI5dBvufDZsPkkNAQ2646fIf8rHdPjs6LYlRT2bZ5AqNxwb4VBM19GInKg
 tLoyQE/zwkpdBonz6owXVp7p2fyYSresQNXsil/QZ7MAKjBxX5v9RveFx/telmhzw7GA
 ek9IBBcGeri+ETXm8qW61Axu1geXNNxczFB3ONFANLZIynfvFmd+Cg/7t+asCFf0ZGkJ
 FtW5BfnUSIdCUYQBZe8DG0KNi2JhpLAYpxbdMZsOk+NcUd6zlm+4qW2dk66eDMsudTdw
 F+Cd/vv6b8/oLkxCouuQSNwoa2LGJf8HLeihU8I5r341BisJSRXQGyBP+9e+kbW1qMG1
 VoTw==
X-Gm-Message-State: AC+VfDxzSKB2PXQ+m4IZwboTp99OLXRn4GawhYKfOH2knb1I3jB/VL8q
 18K7VffI38Dn9WYlq5SeDatbCw==
X-Google-Smtp-Source: ACHHUZ6ipaZJVduEIKQ+tol5sb7SlsjzQNQWJJ/gLt0BuRjohygHDuDvIKUk1I8mDc3QkkNMwXeD+A==
X-Received: by 2002:a17:907:7b91:b0:969:bac4:8e22 with SMTP id
 ne17-20020a1709077b9100b00969bac48e22mr13737157ejc.26.1683895672583; 
 Fri, 12 May 2023 05:47:52 -0700 (PDT)
Received: from localhost.localdomain (178-133-109-64.mobile.vf-ua.net.
 [178.133.109.64]) by smtp.gmail.com with ESMTPSA id
 ze11-20020a170906ef8b00b00965b0eb7b0csm5322585ejb.103.2023.05.12.05.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 05:47:52 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH v2 0/6] eBPF RSS through QMP support.
Date: Fri, 12 May 2023 15:28:56 +0300
Message-Id: <20230512122902.34345-1-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::634;
 envelope-from=andrew@daynix.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series of patches provides the ability to retrieve eBPF program
through qmp, so management application may load bpf blob with proper capabilities.
Now, virtio-net devices can accept eBPF programs and maps through properties
as external file descriptors. Access to the eBPF map is direct through mmap()
call, so it should not require additional capabilities to bpf* calls.
eBPF file descriptors can be passed to QEMU from parent process or by unix
socket with sendfd() qmp command.

Changes since v1:
 * refactored code.
 * eBPF program ids implemented as enums

Andrew Melnychenko (6):
  ebpf: Added eBPF map update through mmap.
  ebpf: Added eBPF initialization by fds.
  virtio-net: Added property to load eBPF RSS with fds.
  ebpf: Added declaration/initialization routines.
  qmp: Added new command to retrieve eBPF blob.
  ebpf: Updated eBPF program and skeleton.

 ebpf/ebpf.c                    |   54 ++
 ebpf/ebpf.h                    |   31 +
 ebpf/ebpf_rss-stub.c           |    6 +
 ebpf/ebpf_rss.c                |  149 +++-
 ebpf/ebpf_rss.h                |   10 +
 ebpf/meson.build               |    1 +
 ebpf/rss.bpf.skeleton.h        | 1469 ++++++++++++++++----------------
 hw/net/virtio-net.c            |   55 +-
 include/hw/virtio/virtio-net.h |    1 +
 monitor/qmp-cmds.c             |   16 +
 qapi/misc.json                 |   38 +
 tools/ebpf/rss.bpf.c           |    2 +-
 12 files changed, 1073 insertions(+), 759 deletions(-)
 create mode 100644 ebpf/ebpf.c
 create mode 100644 ebpf/ebpf.h

-- 
2.39.1


