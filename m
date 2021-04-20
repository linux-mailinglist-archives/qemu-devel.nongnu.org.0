Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E600365DEE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 18:53:31 +0200 (CEST)
Received: from localhost ([::1]:36460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYtcw-000695-41
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 12:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lYtam-0005CF-LD; Tue, 20 Apr 2021 12:51:16 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lYtak-0001JF-I8; Tue, 20 Apr 2021 12:51:16 -0400
Received: by mail-qk1-x72e.google.com with SMTP id o5so40041604qkb.0;
 Tue, 20 Apr 2021 09:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M2iFq6tdONPJaf+K34SBiKl3bsbT4EsYK8ejc4UiQPY=;
 b=BOlqxRaUlNdNe6vLZ3MHpF4NahQlgKRDuf8ZqmSkG2Jh1IlJGbrv/DIBO2vqGwiJHX
 q6lSBpD51bFMVQZz8o5AOVUQ52Rx5im/ENj6ltjIzmIdvPiLvvb/E+rfGkxPJFV3zeVG
 vzCbo9T6x23fG2/erWk2+fRjMofSuUPF3X8SJ83ID7AbPxKa1QNFpiyT0y4mYNn8QwKq
 0cp07YYVW7viTQkee4JVi7MEJrZosi1wgjj6ns9okQCtUQ9kiax8p/DYsaM021aO1rOm
 gLDHI/84XMNwCcrUqMqKSXGhgolowkhEldYQCUeYPXLH2bL54AiteTzII5JV/xVhjkJ8
 K7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M2iFq6tdONPJaf+K34SBiKl3bsbT4EsYK8ejc4UiQPY=;
 b=QRWG8LBXMLSc9yAsYb8AHkPZHu63JQG5yOIWvN4Lg2quBqZsWT2FLT0/UZWpolQ1zO
 riubL2hRVnyvQU3x343xphZx4gQHUjrN2aF11ADTe5hJ3bSQuc/GGYjQZEMsZBfnDrHe
 VJ6P3VfcDrZ7llI/VH3V2nr4IT7fNo+AmtX0jGK7+odaLZGCxayRg6d8yrH9ZXEeU826
 3bGi0v7zxZGJxT9KPOoKXBT9QCsfS3x/CNiJHBwkWQX7Js6h+2qXRdozmr9eaGk0zuCT
 O5/PuVvs5BiLHbrLEY067t8gOI+8k/eN1s8yOiRPKrj/SNwlK+ML5LukVMI57dYpP/DY
 p7LQ==
X-Gm-Message-State: AOAM533wISKPDjto5YctOvIuwU2dOS1LB6pCDEd7wfs7G9wVTnmNcUH/
 CJ2g21Ab+S5i2Ltn3AkQ3SB2sW57C6Z8sQ==
X-Google-Smtp-Source: ABdhPJyr96uOqYEPaw/jVogR7EH0qAVl9RK1zM71kPlLEyoqac2WaWv2t4QkSuMGKQRIWg6yfFO42Q==
X-Received: by 2002:a37:5604:: with SMTP id k4mr5353336qkb.478.1618937471955; 
 Tue, 20 Apr 2021 09:51:11 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:8811:45c7:4abc:f19a:be81])
 by smtp.gmail.com with ESMTPSA id n15sm11831791qti.51.2021.04.20.09.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 09:51:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] pSeries: handle hotunplug errors in
 drc_unisolate_logical()
Date: Tue, 20 Apr 2021 13:50:59 -0300
Message-Id: <20210420165100.108368-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72e.google.com
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

Changes from v1:
- added more context in the commit message
- added David's R-b
v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg03145.html 

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


