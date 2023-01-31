Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3407B683521
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:24:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMvIT-0005EK-Dy; Tue, 31 Jan 2023 13:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMvIQ-00054w-SD; Tue, 31 Jan 2023 13:23:54 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMvIP-000504-6t; Tue, 31 Jan 2023 13:23:54 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso15293001pjb.4; 
 Tue, 31 Jan 2023 10:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nB4FdcsvBrWO7VIqQykQ2ib/SW/js5SiQH4Gj9RZKJo=;
 b=b6v2xTjrxxXl0ECb8AsUH4onX52F0gljwfTUytb407Y99M2z6B0XN8YhNfjsQUxxb2
 QTh+uBbS7TPNURkXloZWcp70MbHAixaYX8IYSTOmi77kVlBXBvu5jTAbmPTKrYx4/N2W
 XyFBmOFBs+3uZa04t1fOjPK7mvxxXz3gaBTW5ciQ91qlaKn5bX9n03DH3KEJFIWn6Hj+
 l3C+4HBO7wPsyr3QHpgeG64q+CZGeCfsa3U1orj6TlFm0KATgA8hsfULiFm2UXF69HX5
 2qWdnXYATVqTz0FynfoihXNO44jk4NrmumhWLj6upP7mEvBVXpPuSS8nPMmYGcqi7B8Z
 s33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nB4FdcsvBrWO7VIqQykQ2ib/SW/js5SiQH4Gj9RZKJo=;
 b=Sco0O+Q+RJngO6+e3fXEAb871zuV7ThAqowUbYQDs5rkblJWaHxQ+VntuAYywmcgip
 Yc4q++u2Jdj1XOx79MMaPjfuJAiSORXlC+pSnxsBtyrg1OGPt1qCHxFQ6OiT9bnnw+OP
 JFW0sRk/1FC/YhBSxM48mBfsSz8V/22Dgs0l3AF+olA6DV2PcNlZAFuoCsWm/mMYgRfJ
 nIrfNEc4jmCtVdozJg2gUw8WCTeN7MjoBRUAy43nuKjF+uqD8nX94Krx2EekVWSgDyou
 7dsQFT1ns5GeFr+/g0O8VQ7eDUkGICTad3OIvxKlFGwfGwIiDESMbQ4SoReBfri0fR6e
 BhDQ==
X-Gm-Message-State: AO0yUKW4uCS82AEeIsWPL581JVpIfOp3Tb3+lYqTFrK2YBhzPzw88OH6
 sT1gGzMvJKOcHBfPHSFgTU+FKoK4DK+9iKxL
X-Google-Smtp-Source: AK7set82N+b68fZfelIV69oPQ9DDhrLDBlGkUPWpJnbDti/bQ4R6AZpKSQPfB9YH2oBBSfZVyrRokw==
X-Received: by 2002:a17:90b:2252:b0:22c:4efa:3412 with SMTP id
 hk18-20020a17090b225200b0022c4efa3412mr16853859pjb.24.1675189431229; 
 Tue, 31 Jan 2023 10:23:51 -0800 (PST)
Received: from localhost.localdomain ([94.181.144.4])
 by smtp.googlemail.com with ESMTPSA id
 h18-20020a17090adb9200b001ef8ab65052sm9134313pjv.11.2023.01.31.10.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:23:50 -0800 (PST)
From: Vlao Mao <vlaomao@gmail.com>
To: dmitry@daynix.com
Cc: jasowang@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 laurent@vivier.eu
Subject: [PATCH qemu 0/1] MAC address falls to permanent
Date: Tue, 31 Jan 2023 21:23:36 +0300
Message-Id: <20230131182337.15645-1-vlaomao@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=vlaomao@gmail.com; helo=mail-pj1-x102b.google.com
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


