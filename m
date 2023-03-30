Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1456CF843
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 02:34:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phgEB-00082f-Ap; Wed, 29 Mar 2023 20:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phgE8-000827-Tg
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 20:33:16 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phgE6-0004Du-D5
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 20:33:16 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 t17-20020a05600c451100b003edc906aeeaso2569522wmo.1
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 17:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680136391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WhbbiJ4e+b5CD8Cc7IUFUuG1LQyA1ZawH0b3mjKbWjA=;
 b=w1ShlfKrnJmGkEE1SNQ2sNgPbpF/pgxcnUg2g2tnqP0/gzGlsf5PVT29z8+E0qkzd8
 9A0yPrvnPkjG9fm72yTeNISeBsO60N6q4TojTvztylx9PVKp9BKFLIhhJFnvulvVr7G0
 QDNDnLaC7nuNUbzIyTQKzJTI7RChD7NIR8QOk2LKPeQCpcQSevHj8NExMadiRRgnRX5R
 3159iID4QFuumLehIpcqWH0mwi5hqCH+1tLoRfZr+Ssa1eOJVCamuKjBsVZMdjU2ER8t
 tFd/P6CstvRisiapSBgPxR1p38qgnJZAd4amABnV6y6AVM5edRN1ILbF2/aC5U7nySPL
 qlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680136391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WhbbiJ4e+b5CD8Cc7IUFUuG1LQyA1ZawH0b3mjKbWjA=;
 b=RNoceFzOsgo4L38SzxOw4z50Gik6WlzweqDMRZlUIk9wJeRtZLfiX3DZnZyVha8x4D
 7NvPuWlQ7Ee7zobwByKMc0FMEuB2A2W8zxznEm/dcgG5YlB14D9M/qnuevf3OQ2WmPkB
 jq7AuioX6V8ljgpViuyC27/nwb02RFfeDEgCWY0o2n6J9sUxke7nzgBY+5G6ewdRb9fM
 YGrLxPxne69smuj68WjLFPmy+p93eb1Xy1cUUXeXG0nNVyO+VVcYWLnn5RSJN5jKT3o9
 V+To6ftT35VxS/gG3Yenxu+ivOTGbmKBhMLxie3YXLVJ6JhXMKGguhjzFjKmloKgMXwu
 wHPw==
X-Gm-Message-State: AO0yUKXXgqIiDx6x6k9Zf/mWKqXCOPew73SOgobkFXWrTLBx1AB/410B
 tr1CL+uN9oyU23ltNQO7wooODg==
X-Google-Smtp-Source: AK7set8xOLRqqjE54hGD1GloW3FzY4yZDCeXL30LmZ0YV03jMzKKu7SmxwV9ajTSUT8qKchbn0Zeew==
X-Received: by 2002:a7b:c7d1:0:b0:3ed:8bef:6a04 with SMTP id
 z17-20020a7bc7d1000000b003ed8bef6a04mr16467579wmk.27.1680136391558; 
 Wed, 29 Mar 2023 17:33:11 -0700 (PDT)
Received: from localhost.localdomain (178-133-100-41.mobile.vf-ua.net.
 [178.133.100.41]) by smtp.gmail.com with ESMTPSA id
 n19-20020a7bcbd3000000b003ef684c5e32sm3724480wmi.48.2023.03.29.17.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 17:33:11 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [RFC PATCH 0/4] eBPF RSS through QMP support.
Date: Thu, 30 Mar 2023 03:15:17 +0300
Message-Id: <20230330001522.120774-1-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::329;
 envelope-from=andrew@daynix.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Overall, the basic scenario of using the helper looks like this:
 * Libvirt checks for ebpf_fds property.
 * Libvirt requests eBPF blob through QMP.
 * Libvirt loads blob for virtio-net.
 * Libvirt launches the QEMU with eBPF fds passed.
 
Andrew Melnychenko (4):
  ebpf: Added eBPF initialization by fds and map update.
  virtio-net: Added property to load eBPF RSS with fds.
  ebpf: Added declaration/initialization routines.
  qmp: Added new command to retrieve eBPF blob.

 ebpf/ebpf.c                    |  48 +++++++++++++
 ebpf/ebpf.h                    |  25 +++++++
 ebpf/ebpf_rss-stub.c           |   6 ++
 ebpf/ebpf_rss.c                | 124 +++++++++++++++++++++++++++------
 ebpf/ebpf_rss.h                |  10 +++
 ebpf/meson.build               |   1 +
 hw/net/virtio-net.c            |  77 ++++++++++++++++++--
 include/hw/virtio/virtio-net.h |   1 +
 monitor/qmp-cmds.c             |  17 +++++
 qapi/misc.json                 |  25 +++++++
 10 files changed, 307 insertions(+), 27 deletions(-)
 create mode 100644 ebpf/ebpf.c
 create mode 100644 ebpf/ebpf.h

-- 
2.39.1


