Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D940457E75C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:26:20 +0200 (CEST)
Received: from localhost ([::1]:44824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyHz-000869-Li
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richy.liu.2002@gmail.com>)
 id 1oEyDa-0002ge-1q
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:21:46 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richy.liu.2002@gmail.com>)
 id 1oEyDU-0003JQ-3Z
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:21:44 -0400
Received: by mail-pg1-x529.google.com with SMTP id f11so5165907pgj.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v9nv53xjc4dESiVn3m4kg28mf8iimd6+JcKgKkq7eEw=;
 b=UNIS2QpWOF4IFg8p+M1yQM5n9OF6GEX1QDONNlTJ47BvV20VGtvuKuQ+L6kw7vkk9O
 kZXGrLIXvjY4Y5v2v5y8LNbLDJve91vbq+EF2it7H1de8IQx7+frELvWCg9f5oN29sKQ
 uYCYNnBXBjTzNZcTCCK0fqSt+EZemB/hr3jIS61uBkcxmohvuyH5tr+R0RT39vDc+7vD
 3xxv3d8jEYqN3jhMh96ptQ7pDJM7R78ncd8QM/rM7neTE6D4xV35+gTkbuKSf853JktZ
 Cx2r1LfZLq3UDnsUI4C+icI6mMJmgJq9fMaMiP0CH7XduV7lFR7xzCACxjclafhNUcwA
 9UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v9nv53xjc4dESiVn3m4kg28mf8iimd6+JcKgKkq7eEw=;
 b=jA/u7Vwq1HXZbqcpSmRBNmxIBcx2ySHi1+Vg+pmbcYDHzLBHWoWGdDZ2mmESasjI+j
 mqSWjVt/prUHY2vCrs++M4/8FH9YSWzGt/eOssOILy9mnN2Ft2ec1MOo/5wrumQoEDeO
 zJ0vV4ihGEy13nB62jHjbgdeHsVIcfv1ghGByk23XgpBIDWqS1o8FQB4Xi8KmvHS3Cny
 7TGIJVfQORQw0iswM9POT+dx5RDbUImz/FoshPCfny2v5DnVjMDbOOX5DeOylbvKvO+Z
 eiGH1rqIHxFdgCEb757sVOOEqACVj9Gz9PT0xsmVteszKj+3Ev2+5x3/d4/Qc0SvpecD
 92QA==
X-Gm-Message-State: AJIora/sGm2IUOIxm5nyB/GrSDTImFQSCwpcgmg8/6fn4hMzcAaiOj/d
 WTw+AvhZ3SJuAb76ufSFZxDAt8yrSmXaYg==
X-Google-Smtp-Source: AGRyM1vAP93uWHc7WwkwwOM3XStrJnQ569F13f45hc7sdBYi/qqzrqAmbl0fK1Igf/UP+6TRq5am/w==
X-Received: by 2002:a63:f306:0:b0:41a:6258:dcd2 with SMTP id
 l6-20020a63f306000000b0041a6258dcd2mr1061351pgh.28.1658517696783; 
 Fri, 22 Jul 2022 12:21:36 -0700 (PDT)
Received: from localhost.localdomain ([76.132.29.156])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a17090a2ec500b001f246f2a423sm2006394pjs.17.2022.07.22.12.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 12:21:36 -0700 (PDT)
From: Richard Liu <richy.liu.2002@gmail.com>
To: qemu-devel@nongnu.org
Cc: alxndr@bu.edu, bsd@redhat.com, darren.kenny@oracle.com,
 Richard Liu <richy.liu.2002@gmail.com>
Subject: [RFC 0/3] add snapshot/restore fuzzing device
Date: Fri, 22 Jul 2022 12:20:38 -0700
Message-Id: <20220722192041.93006-1-richy.liu.2002@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richy.liu.2002@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

This RFC adds a virtual device for snapshot/restores within QEMU. I am working
on this as a part of QEMU Google Summer of Code 2022. Fast snapshot/restores
within QEMU is helpful for code fuzzing.

I reused the migration code for saving and restoring virtual device and CPU
state. As for the RAM, I am using a simple COW mmaped file to do restores.

The loadvm migration function I used for doing restores only worked after I
called it from a qemu_bh. I'm not sure if I should run the migration code in a
separate thread (see patch 3), since currently it is running as a part of the
device code in the vCPU thread.

This is a rough first revision and feedback on the cpu and device state restores
is appreciated.

To test locally, boot up any linux distro. I used the following C file to
interact with the PCI snapshot device:

    #include <stdio.h>
    #include <stdint.h>
    #include <fcntl.h>
    #include <sys/mman.h>
    #include <unistd.h>

    int main() {
        int fd = open("/sys/bus/pci/devices/0000:00:04.0/resource0", O_RDWR | O_SYNC);
        size_t size = 1024 * 1024;
        uint32_t* memory = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);

        printf("%x\n", memory[0]);

        int a = 0;
        memory[0] = 0x101; // save snapshot
        printf("before: value of a = %d\n", a);
        a = 1;
        printf("middle: value of a = %d\n", a);
        memory[0] = 0x102; // load snapshot
        printf("after: value of a = %d\n", a);

        return 0;
    }

Richard Liu (3):
  create skeleton snapshot device and add docs
  implement ram save/restore
  use migration code for cpu and device save/restore

 docs/devel/snapshot.rst |  26 +++++++
 hw/i386/Kconfig         |   1 +
 hw/misc/Kconfig         |   3 +
 hw/misc/meson.build     |   1 +
 hw/misc/snapshot.c      | 164 ++++++++++++++++++++++++++++++++++++++++
 migration/savevm.c      |  84 ++++++++++++++++++++
 migration/savevm.h      |   3 +
 7 files changed, 282 insertions(+)
 create mode 100644 docs/devel/snapshot.rst
 create mode 100644 hw/misc/snapshot.c

-- 
2.35.1


