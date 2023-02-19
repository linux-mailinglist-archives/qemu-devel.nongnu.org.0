Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297B769C159
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 17:39:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTmhS-0006Hw-Pz; Sun, 19 Feb 2023 11:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmhO-0006Hi-Vl
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:02 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmhM-0006hl-U8
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:02 -0500
Received: by mail-ed1-x535.google.com with SMTP id eg19so4189155edb.0
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 08:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xmqX1HbLZNFRuqU2REmpGWGsl4LkgUtheELjRCgQwmA=;
 b=tJIogemhet4Iawlv0R2wVvrzD8ALQUtTL642eZj2lfu8uBp6TMXu8WtrvfvKC+Cred
 DUWCgiScmINPn7RYBHXjtIafMRLaUyIfhEXprloPykR83B4KI197bzciChnLlu+PyIZ5
 b1UYHpanwhIkHIvLjDQ+9TrTkvxQlfzpPfQIAd/NkxtqEJ13L7icSTw/ZcP47nQr1KXq
 nEyjKBo3RliZwexpLqykvUwS5GPizNb5smY06hGN4PpTpPaZghpqHbfnegQhvaiozfGA
 hepXLTtVNPqS42jmr8ELDS/HP2xu8ZyQqAjNaPHX5s1h19MC66uMR4+bRZQ/a5UO3DWr
 G0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xmqX1HbLZNFRuqU2REmpGWGsl4LkgUtheELjRCgQwmA=;
 b=ktL5huihprEj0FVCJZAEIktqTx9xzsWCgP4P1iCaezAvxNanp5de69DdU+FrmHZToI
 BMKi/pjhbMoxWQ84BOuVHzEV+8iWGfnqIKtpiX6VV8b4J2mtWzICKib0yZjomviL9qyG
 dYb1bdhU8YDy1tUuivmpvgzMZYR+KHiYWHHFKsA8UvDIPwk1mwA0G/0poYhb4l9a1wiy
 CDd9hbKXsTnUVJxH60ycm3oj2uKH01Bjjyvd57XYhZbhxgzsqLzzITcddme5CGZdQ/5Y
 eO8ape8HoZv+nmwBezN6pRDsOKifHS1ZcU0l/MCSY0qh6n/LwbEymvr7w9duMQYu8L1G
 2wLg==
X-Gm-Message-State: AO0yUKWAQqRtwBzuKxtuc1R/G9SuQVJAh++JVU6946OcnAi4vYHHlURE
 GAlY4282jLE12i2NmCL2s/2Z9g==
X-Google-Smtp-Source: AK7set9FQtxJg81yyuNcY0rF8Kf+H1E3kPUa0KOI9iKHBGLw+UaqoDlHNGkoAaVjcAJZYZ+zJZcxIQ==
X-Received: by 2002:a17:906:518d:b0:8b1:78b6:bbd7 with SMTP id
 y13-20020a170906518d00b008b178b6bbd7mr10445007ejk.10.1676824678700; 
 Sun, 19 Feb 2023 08:37:58 -0800 (PST)
Received: from localhost.localdomain ([193.33.38.48])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1709066b8d00b008cdb0628991sm647516ejr.57.2023.02.19.08.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 08:37:55 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 0/5] eBPF RSS Helper support.
Date: Sun, 19 Feb 2023 18:20:55 +0200
Message-Id: <20230219162100.174318-1-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=andrew@daynix.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

This series of patches provides the ability to initialize eBPF RSS steering
with the helper.
Now, virtio-net devices can accept eBPF programs and maps through properties
as external file descriptors. Access to the eBPF map is direct through mmap()
call, so it should not require additional capabilities to bpf* calls.
eBPF file descriptors can be passed to QEMU from parent process or by unix
socket with sendfd() qmp command.
The helper is provided that would load eBPF RSS program/maps and pass fd to
the called process(in future - Libvirtd) through unix socket.
Because of structures stored in the maps, it's crucial that the helper provides a proper eBPF program. That's why the stamp was added to the helper and
QEMU may check the binary. Also, additional qmp command was added for checking
the stamp.
Overall, the basic scenario of using the helper looks like this:
 * Libvirt checks for ebpf_fds property.
 * Libvirt ask QEMU for the proper helper(where is located and proper stamp)
 * Libvirt calls the helper with BPF capabilities and retrieves fds.
 * Libvirt launches the QEMU with eBPF fds passed.

Changes since RFC:
 * refactored/rebased code.
 * changed qmp command.
 * refactored helper.
 
Andrew Melnychenko (5):
  ebpf: Added eBPF initialization by fds and map update.
  virtio-net: Added property to load eBPF RSS with fds.
  qmp: Added the helper stamp check.
  ebpf_rss_helper: Added helper for eBPF RSS.
  qmp: Added find-ebpf-rss-helper command.

 ebpf/ebpf_rss-stub.c                       |   6 +
 ebpf/ebpf_rss.c                            | 120 ++++++--
 ebpf/ebpf_rss.h                            |  10 +
 ebpf/qemu-ebpf-rss-helper.c                | 132 +++++++++
 hw/net/virtio-net.c                        |  77 ++++-
 include/hw/virtio/virtio-net.h             |   1 +
 meson.build                                |  47 ++-
 monitor/meson.build                        |   1 +
 monitor/qemu-ebpf-rss-helper-stamp-utils.c | 322 +++++++++++++++++++++
 monitor/qemu-ebpf-rss-helper-stamp-utils.h |  39 +++
 monitor/qmp-cmds.c                         |  28 ++
 qapi/misc.json                             |  42 +++
 12 files changed, 785 insertions(+), 40 deletions(-)
 create mode 100644 ebpf/qemu-ebpf-rss-helper.c
 create mode 100644 monitor/qemu-ebpf-rss-helper-stamp-utils.c
 create mode 100644 monitor/qemu-ebpf-rss-helper-stamp-utils.h

-- 
2.39.1


