Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441901E75FD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 08:37:25 +0200 (CEST)
Received: from localhost ([::1]:40364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeYdv-0005EF-TC
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 02:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jeYce-00042H-8L
 for qemu-devel@nongnu.org; Fri, 29 May 2020 02:36:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42780
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jeYcc-0007RU-Rx
 for qemu-devel@nongnu.org; Fri, 29 May 2020 02:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590734161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RxPSWTdJuvfPvSoAEprWkIPM+gF1S/GudfHLBFG6hp8=;
 b=eQ6/xkHmQBcPD/03VqVQu39q4NaErcQjGDX5pKPIA3oZKPasPAXKYge7ZX9GcyRUKrcvED
 MU7Dpi2iS6cYhbML+FkpuUmLv8nrr0pkZaXXzhIvu4b0D0Vmo5iM1p6ftrRKKR+GtBpV1m
 FBmrRLeQpz40Zjhl+WSmsb9RZTB3qcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-2HT8p8WiNAWm2_s5_G-UpA-1; Fri, 29 May 2020 02:35:57 -0400
X-MC-Unique: 2HT8p8WiNAWm2_s5_G-UpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 302BF464;
 Fri, 29 May 2020 06:35:56 +0000 (UTC)
Received: from [10.72.13.231] (ovpn-13-231.pek2.redhat.com [10.72.13.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B81195D9D5;
 Fri, 29 May 2020 06:35:50 +0000 (UTC)
Subject: Re: [RFC PATCH] hw/net/e1000e: Do not abort() on invalid PSRCTL
 register value
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200525122330.3691-1-f4bug@amsat.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2623aab1-355a-a5dc-3fc1-e22f795b98a0@redhat.com>
Date: Fri, 29 May 2020 14:35:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200525122330.3691-1-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 23:43:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/5/25 下午8:23, Philippe Mathieu-Daudé wrote:
> libFuzzer found using 'qemu-system-i386 -M q35':
>
> qemu: hardware error: e1000e: PSRCTL.BSIZE0 cannot be zero
> CPU #0:
> EAX=00000000 EBX=00000000 ECX=00000000 EDX=00000663
> ESI=00000000 EDI=00000000 EBP=00000000 ESP=00000000
> EIP=0000fff0 EFL=00000002 [-------] CPL=0 II=0 A20=1 SMM=0 HLT=0
> ES =0000 00000000 0000ffff 00009300
> CS =f000 ffff0000 0000ffff 00009b00
> SS =0000 00000000 0000ffff 00009300
> DS =0000 00000000 0000ffff 00009300
> FS =0000 00000000 0000ffff 00009300
> GS =0000 00000000 0000ffff 00009300
> LDT=0000 00000000 0000ffff 00008200
> TR =0000 00000000 0000ffff 00008b00
> GDT=     00000000 0000ffff
> IDT=     00000000 0000ffff
> CR0=60000010 CR2=00000000 CR3=00000000 CR4=00000000
> DR0=00000000 DR1=00000000 DR2=00000000 DR3=00000000
> DR6=ffff0ff0 DR7=00000400
> EFER=0000000000000000
> FCW=037f FSW=0000 [ST=0] FTW=00 MXCSR=00001f80
> FPR0=0000000000000000 0000 FPR1=0000000000000000 0000
> FPR2=0000000000000000 0000 FPR3=0000000000000000 0000
> FPR4=0000000000000000 0000 FPR5=0000000000000000 0000
> FPR6=0000000000000000 0000 FPR7=0000000000000000 0000
> XMM00=00000000000000000000000000000000 XMM01=00000000000000000000000000000000
> XMM02=00000000000000000000000000000000 XMM03=00000000000000000000000000000000
> XMM04=00000000000000000000000000000000 XMM05=00000000000000000000000000000000
> XMM06=00000000000000000000000000000000 XMM07=00000000000000000000000000000000
> ==1988== ERROR: libFuzzer: deadly signal
>      #6 0x7fae4d3ea894 in __GI_abort (/lib64/libc.so.6+0x22894)
>      #7 0x563f4cc59a1d in hw_error (qemu-fuzz-i386+0xe8ca1d)
>      #8 0x563f4d7c93f2 in e1000e_set_psrctl (qemu-fuzz-i386+0x19fc3f2)
>      #9 0x563f4d7b798f in e1000e_core_write (qemu-fuzz-i386+0x19ea98f)
>      #10 0x563f4d7afc46 in e1000e_mmio_write (qemu-fuzz-i386+0x19e2c46)
>      #11 0x563f4cc9a0a7 in memory_region_write_accessor (qemu-fuzz-i386+0xecd0a7)
>      #12 0x563f4cc99c13 in access_with_adjusted_size (qemu-fuzz-i386+0xeccc13)
>      #13 0x563f4cc987b4 in memory_region_dispatch_write (qemu-fuzz-i386+0xecb7b4)
>
> It simply sent the following 2 I/O command to the e1000e
> PCI BAR #2 I/O region:
>
>    writew 0x0100 0x0c00 # RCTL =   E1000_RCTL_DTYP_MASK
>    writeb 0x2170 0x00   # PSRCTL = 0
>
> 2813 static void
> 2814 e1000e_set_psrctl(E1000ECore *core, int index, uint32_t val)
> 2815 {
> 2816     if (core->mac[RCTL] & E1000_RCTL_DTYP_MASK) {
> 2817
> 2818         if ((val & E1000_PSRCTL_BSIZE0_MASK) == 0) {
> 2819             hw_error("e1000e: PSRCTL.BSIZE0 cannot be zero");
> 2820         }
>
> Instead of calling hw_error() which abort the process (it is
> meant for CPU fatal error condition, not for device logging),
> log the invalid request with qemu_log_mask(LOG_GUEST_ERROR)
> and return ignoring the request.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC because there might be something clever than returning...
> Probably worth a Cc:qemu-stable@ tag


I can't think of a better solution here. And the code looks safe if we 
accept zero value.

So I applied this patch.

Thanks


> ---
>   hw/net/e1000e_core.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index d5676871fa..bcd186cac5 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -34,9 +34,9 @@
>   */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/log.h"
>   #include "net/net.h"
>   #include "net/tap.h"
> -#include "hw/hw.h"
>   #include "hw/pci/msi.h"
>   #include "hw/pci/msix.h"
>   #include "sysemu/runstate.h"
> @@ -2816,11 +2816,15 @@ e1000e_set_psrctl(E1000ECore *core, int index, uint32_t val)
>       if (core->mac[RCTL] & E1000_RCTL_DTYP_MASK) {
>   
>           if ((val & E1000_PSRCTL_BSIZE0_MASK) == 0) {
> -            hw_error("e1000e: PSRCTL.BSIZE0 cannot be zero");
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "e1000e: PSRCTL.BSIZE0 cannot be zero");
> +            return;
>           }
>   
>           if ((val & E1000_PSRCTL_BSIZE1_MASK) == 0) {
> -            hw_error("e1000e: PSRCTL.BSIZE1 cannot be zero");
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "e1000e: PSRCTL.BSIZE1 cannot be zero");
> +            return;
>           }
>       }
>   


