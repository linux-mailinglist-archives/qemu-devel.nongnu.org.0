Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563A4362AB0
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 00:03:51 +0200 (CEST)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWZ4-0004ed-9Z
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 18:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lXVit-00056d-Eu; Fri, 16 Apr 2021 17:09:55 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:41699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lXVir-0004qQ-MT; Fri, 16 Apr 2021 17:09:55 -0400
Received: by mail-qk1-x734.google.com with SMTP id f19so12619100qka.8;
 Fri, 16 Apr 2021 14:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e5svKeucWVM0eMFR+9LDJPyDdbchUvAcJS8cfbi+eP8=;
 b=EIbFgULkOLAaJ+7deyzbPwPoliA34wE3atctmMUfgax8V/SGd29LLwNJInruVB0t01
 BJiqUhA2VpLn5+yL4VwOnRNpqBc+S7bPDWXKE2QfhytGZUIHMVyjKlaNS8k0F6WNjsSn
 2vERqbiisl4NN/2XZCsv6zFGi1hoA+/k7uKqOZC+BLWDr4XJf1xSL9MLykSizLaCcctf
 q0BU8mrtoKZ1iS4jffergN/pqpzBtukzC0AK+8W/1aeWkyRynbNN/eV6+zWg3EOuLdOW
 zO/VGEVuKWUW3OTXL92Oa5ONa+yzN+qL+ESGQwWKNrMSWa5zVwLW3S8iodF17ZVh+A3M
 CTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e5svKeucWVM0eMFR+9LDJPyDdbchUvAcJS8cfbi+eP8=;
 b=Arq1MhP+vDiybBwfSRIvNYummSIpwlnAE+oEf7KH9ovFH1LemWKpmHomJ+DDV1pJ2e
 3W4rbx0DAnAVl7F2kP0m97d2Pnx6ciROFXqqomKWnwN9G5Ru+zlAAGWddStw6bx0NQbX
 X7OoKhqTX+Ozu44EWYVGgL6zovCXiVjqdKUY8kdcFaCzkpC+996Cra6pSUniFesIqcSg
 UrJbTIIizX6QRPpJKcNFLRbHpbUnhqEyNesVeUtmim8jvjPWR4sDvQfeQL2DpqZa8WHA
 QmX7YyUH3RisCdNIgOPFrKL8CpVnoerhQEkYYoxmKhmjmOjpp3CjZQaAj+ERwkl4mQlp
 Xvvg==
X-Gm-Message-State: AOAM532NJxyAS3UFyADmLF6XyZKDbKBm1K765OpOqHvKhzYJIPQz3jDJ
 BjDClSApAf6NdvMtDOqX86GKvwX9LyWwn9D7JeY=
X-Google-Smtp-Source: ABdhPJx7W9JwzKC1fevNXSkbwq+hLn93/myt7mW1hd3uHUC/m43J7LpoCVB647V+PaU9g9FCPs3ZdA==
X-Received: by 2002:a37:d86:: with SMTP id 128mr1296051qkn.284.1618607391503; 
 Fri, 16 Apr 2021 14:09:51 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:8811:45c7:4abc:f19a:be81])
 by smtp.gmail.com with ESMTPSA id g4sm4647634qtg.86.2021.04.16.14.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:09:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] pSeries: handle hotunplug errors in
 drc_unisolate_logical()
Date: Fri, 16 Apr 2021 18:09:40 -0300
Message-Id: <20210416210941.381119-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is the QEMU side of a kernel change being proposed in [1],
where an attempt to implement a CPU hotunplug error report
mechanism was proposed.

The idea was discussed first in this mailing list [2], where the
RTAS set-indicator call would be used to signal QEMU when a kernel
side error happens during the unplug process.

Using the modified kernel and this patch, this is the result of a
failed CPU hotunplug attempt when trying to unplug the last online
CPU of the guest:

( QEMU command line: qemu-system-ppc64 -machine pseries,accel=kvm,usb=off
-smp 1,maxcpus=2,threads=1,cores=2,sockets=1 ... )

[root@localhost ~]# QEMU 5.2.92 monitor - type 'help' for more information
(qemu) device_add host-spapr-cpu-core,core-id=1,id=core1
(qemu) 

[root@localhost ~]# echo 0 > /sys/devices/system/cpu/cpu0/online
[   77.548442][   T13] IRQ 19: no longer affine to CPU0
[   77.548452][   T13] IRQ 20: no longer affine to CPU0
[   77.548458][   T13] IRQ 256: no longer affine to CPU0
[   77.548465][   T13] IRQ 258: no longer affine to CPU0
[   77.548472][   T13] IRQ 259: no longer affine to CPU0
[   77.548479][   T13] IRQ 260: no longer affine to CPU0
[   77.548485][   T13] IRQ 261: no longer affine to CPU0
[   77.548590][    T0] cpu 0 (hwid 0) Ready to die...
[root@localhost ~]# (qemu) 
(qemu) device_del core1
(qemu) [   83.214073][  T100] pseries-hotplug-cpu: Failed to offline CPU PowerPC,POWER9, rc: -16
qemu-system-ppc64: Device hotunplug rejected by the guest for device core1

(qemu) 


As mentioned in the kernel change, if this is accepted I'll push
for a PAPR change to make this an official device removal error
report mechanism.


[1] https://lore.kernel.org/linuxppc-dev/20210416210216.380291-3-danielhb413@gmail.com/
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06395.html

Daniel Henrique Barboza (1):
  spapr_drc.c: handle hotunplug errors in drc_unisolate_logical()

 hw/ppc/spapr_drc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.30.2


