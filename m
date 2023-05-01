Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C666F2F30
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 09:41:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptO8P-00053h-Fo; Mon, 01 May 2023 03:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1ptO8D-00053E-QB
 for qemu-devel@nongnu.org; Mon, 01 May 2023 03:39:33 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1ptO8B-0004kr-H8
 for qemu-devel@nongnu.org; Mon, 01 May 2023 03:39:33 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94ef0a8546fso360940366b.1
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 00:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682926769; x=1685518769;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u+a/8oq0L9M7VO1kAnOD4w9cTaLF60gToA4GEY/WanE=;
 b=XCOj7LTP+KaflkqM6g8CLF+1J7V3r3sFW6imsUvT+nCLByEuKD0ckzY1IW6th+33pl
 nd6MZ3D2MkTWQNR/fd6WTuZuCiURC9/0OO6iS8ZkGG+XemAUw7Jq9d7FJA5Rn91mHcWw
 XmIwa8ZbOGzBjlIBvg+q6EZE1di7FKx5EdOjzGaesaPQBc9T8B7rfk0NBEI+z2Xq6D6K
 R38GlBT5GHFjg/oyU88OmphlJEeRJDmXBSQBXpfLgvvWa8NeMZAp8Zrxhag1l0V/hlF/
 FY2/KOtFXIovrmECpuH2ON1UldEewTCkxByTeAsWCaInj3wScjbM6z7ESkDWU2p00mED
 wPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682926769; x=1685518769;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u+a/8oq0L9M7VO1kAnOD4w9cTaLF60gToA4GEY/WanE=;
 b=jPeruBvHwiX43++KVJyBnsiLFJq3PiDGEUfsbysRJ66JJGp6Grunz1o7w0Prd9xNzM
 PDEacqRneP5+v5MhoQPWGol16r6malyhzehhnNFldguWz00TrpFF4yMNxin29WmY5Ddv
 Ju47mxNwGgSA5ED4cpxKRMxwY9ZUBwjb0BDDapdDt/AcamTNjn58EORzXQm+t/CBLnwn
 gi1G8f6R3CoyOP3/tzqrAGvnECSClDzoXnI44vatdGlYT4gSbF2evU+Log+7Ym1A7kgk
 lMfSFO5b90G5ks+ow+YO/50vAiWnTD3qi671ubTxlFfWnKsKKbBioLaLciHYRLpm8BNf
 wxuQ==
X-Gm-Message-State: AC+VfDyuQxY+4iV2cSYkBYDonUWuBz1BKqMdUwjT8aFhivVX7rbeBKGh
 MbqXf+hH7aDKAn6MLimmy27szw==
X-Google-Smtp-Source: ACHHUZ4lVeFEtAJkLYnEU/I0A/Fk6TeFkM6H1FgnpoDidLL/eLvtqnI19vLoC/3whMmHs9A5BmMdIg==
X-Received: by 2002:a17:907:a40d:b0:94f:21f3:b5f8 with SMTP id
 sg13-20020a170907a40d00b0094f21f3b5f8mr12535860ejc.21.1682926769199; 
 Mon, 01 May 2023 00:39:29 -0700 (PDT)
Received: from localhost.localdomain (178-133-125-224.mobile.vf-ua.net.
 [178.133.125.224]) by smtp.gmail.com with ESMTPSA id
 d21-20020aa7c1d5000000b005027d31615dsm11708182edp.62.2023.05.01.00.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 00:39:28 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 0/5] eBPF RSS through QMP support.
Date: Mon,  1 May 2023 10:20:56 +0300
Message-Id: <20230501072101.22890-1-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=andrew@daynix.com; helo=mail-ej1-x62f.google.com
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

Possible solution for libvirt may look like this: https://github.com/daynix/libvirt/tree/RSS_eBPF (WIP)

Andrew Melnychenko (5):
  ebpf: Added eBPF initialization by fds and map update.
  virtio-net: Added property to load eBPF RSS with fds.
  ebpf: Added declaration/initialization routines.
  qmp: Added new command to retrieve eBPF blob.
  ebpf: Updated eBPF program and skeleton.

 ebpf/ebpf.c                    |   54 ++
 ebpf/ebpf.h                    |   31 +
 ebpf/ebpf_rss-stub.c           |    6 +
 ebpf/ebpf_rss.c                |  124 ++-
 ebpf/ebpf_rss.h                |   10 +
 ebpf/meson.build               |    1 +
 ebpf/rss.bpf.skeleton.h        | 1469 ++++++++++++++++----------------
 hw/net/virtio-net.c            |   96 ++-
 include/hw/virtio/virtio-net.h |    1 +
 monitor/qmp-cmds.c             |   16 +
 qapi/misc.json                 |   28 +
 tools/ebpf/rss.bpf.c           |    2 +-
 12 files changed, 1079 insertions(+), 759 deletions(-)
 create mode 100644 ebpf/ebpf.c
 create mode 100644 ebpf/ebpf.h

-- 
2.39.1


