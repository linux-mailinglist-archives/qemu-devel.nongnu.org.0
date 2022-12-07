Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E57A6460A4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 18:49:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2yY0-0001eS-OH; Wed, 07 Dec 2022 12:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p2yXu-0001eH-3e
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 12:49:26 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p2yXq-0003Sc-L6
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 12:49:25 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso22122814fac.10
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 09:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=42ZUzXP0Q+K0r/qguonfBFATcxW0cNiAlCL9i/Wscvg=;
 b=mt+aoz2oR3QALOYfdYhaVdQLdrTonIVQiXJpD1iOUgtnl19WrEtejHpU7EHoat/XRA
 C4EfzuD4GJjdCYx3NPPSvkfTuBC/hULjRuU/q//xkZFW0V/o3yKGVV7wvwOD2MCk+yfy
 Bl1VbNVlfrEzcxCbsvBWsrvEopATN13PnJOJlyboOAH+T3yRi1hMbxpeMPx93lflJKr2
 b1N2ptAe7tZ6rj8x/fpnIis7/A5Br4bR/xoKYZUMy07p/QWKERrVKJHkeDFIh6mUqj2i
 xDx0N8y0ljeHHuealqJrkXj7Pr5lAFRTvXa9uznutxTwAxYJErbBJxC5SwoP0r3IGJdI
 Fadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42ZUzXP0Q+K0r/qguonfBFATcxW0cNiAlCL9i/Wscvg=;
 b=RAuzYRuqOH0TRrCW/QOiVLJzJQLM7HOxzQS4Ge0aVHKW0BucaMZyXXvsEd1DQGVqFv
 OXmZ8Jcay7fJt8Mla7sOXBmIi/qX79MS185NovgOTbpcrupKCRlrkI4x1rYGtrxgBcJ+
 5uqNIq1Gk0rYdj4J0h6wjn2ydZOIJSqM685KufjhDjNC+fQKwCmGNWLcgLEoLTTBSg2n
 7tUESx/a/KNqOiwm3Iu/2o7FWVf6LqI6JD+hbRRvKS46Dlg1IttjqHW22lsliONPaMia
 iVsELipbvQ3fuz3XDHZYvcg2LZqxnKLeJ3QOBpDX0Fn8rwjahMK12IqF/Q4mFaN0VAxG
 NGUA==
X-Gm-Message-State: ANoB5pm8AdJMiZLeU7nhPEZAnnafuwMfmJyZXqmP1zrc46ZpVLM79piL
 Gqwnsidp4V9bDi5VurqZWDE=
X-Google-Smtp-Source: AA0mqf5DlUdQO9qWCt/weAQRD6fa3eC4pONyakT2gRF8g1DF+1Thwh2SWeVUNLzIF2yx8qQYkc9DOg==
X-Received: by 2002:a05:6870:f816:b0:144:687:9ac0 with SMTP id
 fr22-20020a056870f81600b0014406879ac0mr18726757oab.277.1670435360380; 
 Wed, 07 Dec 2022 09:49:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t27-20020a056870f21b00b001435fe636f2sm12409252oao.53.2022.12.07.09.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 09:49:19 -0800 (PST)
Date: Wed, 7 Dec 2022 09:49:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, its@irrelevant.dk, kbusch@kernel.org
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <20221207174918.GA1151796@roeck-us.net>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=groeck7@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.21, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi,

On Thu, Jun 16, 2022 at 08:34:07PM +0800, Jinhao Fan wrote:
> Implement Doorbel Buffer Config command (Section 5.7 in NVMe Spec 1.3)
> and Shadow Doorbel buffer & EventIdx buffer handling logic (Section 7.13
> in NVMe Spec 1.3). For queues created before the Doorbell Buffer Config
> command, the nvme_dbbuf_config function tries to associate each existing
> SQ and CQ with its Shadow Doorbel buffer and EventIdx buffer address.
> Queues created after the Doorbell Buffer Config command will have the
> doorbell buffers associated with them when they are initialized.
> 
> In nvme_process_sq and nvme_post_cqe, proactively check for Shadow
> Doorbell buffer changes instead of wait for doorbell register changes.
> This reduces the number of MMIOs.
> 
> In nvme_process_db(), update the shadow doorbell buffer value with
> the doorbell register value if it is the admin queue. This is a hack
> since hosts like Linux NVMe driver and SPDK do not use shadow
> doorbell buffer for the admin queue. Copying the doorbell register
> value to the shadow doorbell buffer allows us to support these hosts
> as well as spec-compliant hosts that use shadow doorbell buffer for
> the admin queue.
> 
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>

I noticed that I can no longer boot Linux kernels from nvme on riscv64
systems. The problem is seen with qemu v7.1 and qemu v7.2-rc4.
The log shows:

[   35.904128] nvme nvme0: I/O 642 (I/O Cmd) QID 1 timeout, aborting
[   35.905000] EXT4-fs (nvme0n1): mounting ext2 file system using the ext4 subsystem
[   66.623863] nvme nvme0: I/O 643 (I/O Cmd) QID 1 timeout, aborting
[   97.343989] nvme nvme0: Abort status: 0x0
[   97.344355] nvme nvme0: Abort status: 0x0
[   97.344647] nvme nvme0: I/O 7 QID 0 timeout, reset controller
[   97.350568] nvme nvme0: I/O 644 (I/O Cmd) QID 1 timeout, aborting

This is with the mainline Linux kernel (v6.1-rc8).

Bisect points to this patch. Reverting this patch and a number of associated
patches (to fix conflicts) fixes the problem.

06143d8771 Revert "hw/nvme: Implement shadow doorbell buffer support"
acb4443e3a Revert "hw/nvme: Use ioeventfd to handle doorbell updates"
d5fd309feb Revert "hw/nvme: do not enable ioeventfd by default"
1ca1e6c47c Revert "hw/nvme: unregister the event notifier handler on the main loop"
2d26abd51e Revert "hw/nvme: skip queue processing if notifier is cleared"
99d411b5a5 Revert "hw/nvme: reenable cqe batching"
2293d3ca6c Revert "hw/nvme: Add trace events for shadow doorbell buffer"

Qemu command line:

qemu-system-riscv64 -M virt -m 512M \
     -kernel arch/riscv/boot/Image -snapshot \
     -device nvme,serial=foo,drive=d0 \
     -drive file=rootfs.ext2,if=none,format=raw,id=d0 \
     -bios default \
     -append "root=/dev/nvme0n1 console=ttyS0,115200 earlycon=uart8250,mmio,0x10000000,115200" \
     -nographic -monitor none

Guenter

