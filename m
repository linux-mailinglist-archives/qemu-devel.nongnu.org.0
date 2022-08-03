Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8AD5887E5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 09:23:31 +0200 (CEST)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ8j4-0002n3-4C
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 03:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irischenlj@gmail.com>)
 id 1oJ4Bm-00009A-EC; Tue, 02 Aug 2022 22:32:53 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <irischenlj@gmail.com>)
 id 1oJ4Bk-0008FN-Pr; Tue, 02 Aug 2022 22:32:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id t2so15142577ply.2;
 Tue, 02 Aug 2022 19:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=83Bzl50cRjiDRvTTK2a+8PVQTAKg3HtXuHQtPIEfRfo=;
 b=CxquLYN173eX+ltlThkAJsN/SF12SC06/mHNVucHZiuBfXEM0kbcOOd4Ovq5NK1A4s
 aIQYhqEgERnizy3UoDEeeyfCwHI7lqXnYVDBl8oTeVjC+m7aaU9SY642eaUhE5kf/yYj
 7lN7ZjSLpo4XFmvQai4YEW9hwK4MIdwMSKHsiZP8M5s92DTPLZCqPcNXSNaYu/9stq4m
 OH7YrpaxnUHUQA7jIzQfiZkdyc0uda1h9eFpXynErJ1J9g9pEd+gJGTuz4KQnI1Zzz7k
 n498RKd+RopPZOJ8MEo96gysmxLm1PVx48YJx5s3H//HkjG5RQUO5vgAQRtzMrBx5Wng
 C7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=83Bzl50cRjiDRvTTK2a+8PVQTAKg3HtXuHQtPIEfRfo=;
 b=DIYGxYZgxB5Wh317u39UxMUyVp8Fpm3zlyI/ZKrRYTCAMsTWwiDYw9y/eoHBcJFVAw
 nx+gbDJsTXLYQtGOuiNeMdJ54PoRRAH+nFPYxTBMnU9pmfjzaTwu+8AtxF9nTeKXfdSk
 HfqAcjHHtIyQPEMgSkDOd1AlZcwqV8lFb7A7ENFA4cQweGinJgonFN0KLRAmpMJ2wXYK
 DUWRYky/avQraHV9ypalLD6pEqhl+/5fBUU9PxeBlKhW22j/8U0p0pdpzm08YkfTefOG
 4pBxLAw/ILrAwV7uQFfqVVCWZgeflSIjedEzSTinq6vRBNt0pbseUAvyXyNXjtRdk4fR
 wWDA==
X-Gm-Message-State: ACgBeo3rvsN3uH3xszk6N0+OOSpAsTO9l/CwbaaFptIQeghkHJ9xjk36
 b3dxzQaK4k0VOiv6l3pnMlo=
X-Google-Smtp-Source: AA6agR5OAeaVlckgyXg4SJ3Iob6GwYZ38mv8LLkVvZdZylyw5znFlKXA/kfbnU+gvWkLQW+07m3Uzw==
X-Received: by 2002:a17:90b:4a4e:b0:1f5:431c:54f8 with SMTP id
 lb14-20020a17090b4a4e00b001f5431c54f8mr1815443pjb.161.1659493966121; 
 Tue, 02 Aug 2022 19:32:46 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:80d])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a635341000000b0041c30def5e8sm3786247pgl.33.2022.08.02.19.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 19:32:44 -0700 (PDT)
From: Iris Chen <irischenlj@gmail.com>
To: 
Cc: irischenlj@fb.com, peter@pjd.dev, pdel@fb.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, patrick@stwcx.xyz,
 alistair@alistair23.me, kwolf@redhat.com, hreitz@redhat.com,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 qemu-block@nongnu.org, dz4list@gmail.com
Subject: [RFC 0/1] SPI support in QEMU TPM
Date: Tue,  2 Aug 2022 19:32:40 -0700
Message-Id: <20220803023241.63739-1-irischenlj@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=irischenlj@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Aug 2022 03:19:31 -0400
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

From: Iris Chen <irischenlj@fb.com>

Hey everyone,

Thanks for all your comments on the SPI GPIO model. I am working through them.

As for adding support for SPI-based TPMs in QEMU, this RFC patch adds SPI
support in the QEMU TPM implementation via tpm_tis_spi.c.

The QEMU tree already has support for two connection methods to the TPM:
mmio (isa for x86, sysbus for arm) and “spapr”. This patch adds a new SPI
bus implementation for the TPM. Specifically, this SPI bus implementation
connects to the Yosemite-v3.5 model using the SPI-GPIO model sent earlier
last week. I have already tested these implementations locally together
and can verify that the Linux kernel can successfully probe the TPM device
on Yosemite-v3.5 and we can run the TPM command line tools to interact with it.

Please let me know what you think about this!

Thanks,
Iris

Iris Chen (1):
  hw: tpmtisspi: add SPI support to QEMU TPM implementation

 configs/devices/arm-softmmu/default.mak |   1 +
 hw/arm/Kconfig                          |   5 +
 hw/tpm/Kconfig                          |   5 +
 hw/tpm/meson.build                      |   1 +
 hw/tpm/tpm_tis_spi.c                    | 311 ++++++++++++++++++++++++
 include/sysemu/tpm.h                    |   3 +
 6 files changed, 326 insertions(+)
 create mode 100644 hw/tpm/tpm_tis_spi.c

--
2.30.2

