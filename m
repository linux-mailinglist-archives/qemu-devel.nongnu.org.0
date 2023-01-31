Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5EC683517
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:21:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMvG9-00028D-Cx; Tue, 31 Jan 2023 13:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMvFl-00020d-Gr; Tue, 31 Jan 2023 13:21:09 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMvFg-0004cY-Dw; Tue, 31 Jan 2023 13:21:08 -0500
Received: by mail-pl1-x62a.google.com with SMTP id r8so9096511pls.2;
 Tue, 31 Jan 2023 10:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nB4FdcsvBrWO7VIqQykQ2ib/SW/js5SiQH4Gj9RZKJo=;
 b=dFdsDK3m160jh3IkQmQQtUd2W55YLHus2DH8sHpO6YLiiJUuKzb+W/GnBwCUFjZzQl
 WVNJtz2c2gVMW3cUFf2YFQc032YmK3hqgZHjOnS7hs26t4c3FXgCt5c7GOSjpq2hfDVF
 3QDQOAgKZ75lwMPn6QDJ4vuRjb0hKys1gsOgbyZiRryL500Hf1sAFXaPTNbmBq3b/tR+
 /CPyJJf8cLDl8Mr/+to7DirIgkVVmfSXmtmz1BxRUVOO59Zil99u4Uj8mjCWVZ2Dz63e
 /DY1v2P2qDIA4Pj9V1gD1Z0YiG0+hgytpwRtW4+/kK5GnVXIoImwgXgyd04v0fsw7Eov
 4B7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nB4FdcsvBrWO7VIqQykQ2ib/SW/js5SiQH4Gj9RZKJo=;
 b=XfKH+K0F30VsjK0fMhipE1NEpmWkin4TUuHwELaxNAGHsEb6Z6+F9Xjt3Xe0zXYOu/
 DQllC6mi8++tWeMa+HiUftXKdUvnkMJ8zxOLiMMWZwuJ1BykOCYdsAhQn8Bd1QUm+2gO
 AEoA1slRHciczsqu64FyuH1f5Bp0QuPbiOu5t3SMC9UHINangB4B8ZQ10N1yuUXYj7qt
 3Om5EngWivfdajXU29/bkGxiaeXdcTJ2l273PlZ1vXSluuuQhegXhHvot0wxSHZN6b83
 5td7OXCgeQ13ozCvkFPQWexeFzimDh1P7YHsZKveiocZIIm0L8wunVem1tWymdoP+I/o
 gCew==
X-Gm-Message-State: AO0yUKWIRw364VYZumqb4IDpI1P9qtYUPXESdFC1zOalbE1pO9Lw33Th
 9/ZXljpUgc3Jsc6RCHY+SIs=
X-Google-Smtp-Source: AK7set/FT1WcQvQaQvFToLrOa+JfNwEffH0a5KHDxZQUewiXlNGP1hb6UHNAnI2WLoYYy7hS6vr89w==
X-Received: by 2002:a17:902:e54c:b0:196:2143:5eff with SMTP id
 n12-20020a170902e54c00b0019621435effmr31088172plf.24.1675189262086; 
 Tue, 31 Jan 2023 10:21:02 -0800 (PST)
Received: from localhost.localdomain ([94.181.144.4])
 by smtp.googlemail.com with ESMTPSA id
 jd13-20020a170903260d00b0019893d572bfsm2260414plb.211.2023.01.31.10.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:21:01 -0800 (PST)
From: Vlao Mao <vlaomao@gmail.com>
To: dmitry@daynix.com
Cc: jasowang@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 laurent@vivier.eu
Subject: [PATCH qemu 0/1] MAC address falls to permanent
Date: Tue, 31 Jan 2023 21:20:47 +0300
Message-Id: <20230131182048.15535-1-vlaomao@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=vlaomao@gmail.com; helo=mail-pl1-x62a.google.com
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

A bug was found with the vmxnet3 driver, after changing the MAC address
and rebooting, it falls into the category of a permanent address until
the VM is turned off. Here is log output:

-bash-4.4# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group
default qlen 1000
    link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff

-bash-4.4# ip link set dev ens3 address 33:33:33:33:33:33
-bash-4.4# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group
default qlen 1000
    link/ether 33:33:33:33:33:33 brd ff:ff:ff:ff:ff:ff
-bash-4.4# ethtool -P ens3
Permanent address: 52:54:00:12:34:56
-bash-4.4# reboot

//rebooting


-bash-4.4# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group
default qlen 1000
    link/ether 33:33:33:33:33:33 brd ff:ff:ff:ff:ff:ff
-bash-4.4# ethtool -P ens3
Permanent address: 33:33:33:33:33:33
-bash-4.4#

Vlao Mao (1):
  vmxnet3: add mac address restore upon reset

 hw/net/vmxnet3.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.35.1


