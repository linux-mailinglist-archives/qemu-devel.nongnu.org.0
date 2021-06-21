Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660323AEAE7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:12:56 +0200 (CEST)
Received: from localhost ([::1]:43310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKfX-0002vg-Fu
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lvKdb-0000xx-Tm; Mon, 21 Jun 2021 10:10:55 -0400
Received: from relay64.bu.edu ([128.197.228.104]:51812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lvKdZ-0001gW-3g; Mon, 21 Jun 2021 10:10:55 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 15LE9EWf027387
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 21 Jun 2021 10:09:19 -0400
Date: Mon, 21 Jun 2021 10:09:14 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] hw/pci-host/q35: Ignore write of reserved PCIEXBAR
 LENGTH field
Message-ID: <20210621140914.a7leozoakgvumalf@mozz.bu.edu>
References: <20210526142438.281477-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526142438.281477-1-f4bug@amsat.org>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210526 1624, Philippe Mathieu-Daudé wrote:
> libFuzzer triggered the following assertion:
> 
>   cat << EOF | qemu-system-i386 -M pc-q35-5.0 \
>     -nographic -monitor none -serial none \
>     -qtest stdio -d guest_errors -trace pci\*
>   outl 0xcf8 0xf2000060
>   outl 0xcfc 0x8400056e
>   EOF
>   pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
>   Aborted (core dumped)
> 
> This is because guest wrote MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD
> (reserved value) to the PCIE XBAR register.
> 
> There is no indication on the datasheet about what occurs when
> this value is written. Simply ignore it on QEMU (and report an
> guest error):
> 
>   pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
>   Q35: Reserved PCIEXBAR LENGTH
>   pci_cfg_read mch 00:0 @0x0 -> 0x8086
>   pci_cfg_read mch 00:0 @0x0 -> 0x29c08086
>   ...
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> BugLink: https://bugs.launchpad.net/qemu/+bug/1878641
> Fixes: df2d8b3ed4 ("q35: Introduce q35 pc based chipset emulator")
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

