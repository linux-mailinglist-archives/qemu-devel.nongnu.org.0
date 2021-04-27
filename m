Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D912C36C89F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:27:58 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPcz-0003lG-WC
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbPas-0002qm-Jq
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbPap-0008DK-Mx
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619537140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5YglqOSa0HsPg7laM2G2l/ynX70zVsDvLL8Q9P+V40M=;
 b=JgJna+56d1hR0eIDwGrhdiMYphbd4OhOA3qrossEAj8U/VaDRFJ4OIFsJmgLGBKLS24Cf1
 C5RTpiqWfXsBqw6BrZ5aM+Zwpdq/53kTqOxXIjBnxalLNiDEgY5SoVu/0LPHc3LOU+w8Nw
 YHOysRsV+yqQqSgLu47pabmI1AYWJ28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-MCg7-1YCPtqpSv8YBhI-vA-1; Tue, 27 Apr 2021 11:25:38 -0400
X-MC-Unique: MCg7-1YCPtqpSv8YBhI-vA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D267E801B16;
 Tue, 27 Apr 2021 15:25:36 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF52262677;
 Tue, 27 Apr 2021 15:25:21 +0000 (UTC)
Subject: Re: [PATCH 1/4] hw/block/fdc: Replace disabled fprintf() by trace
 event
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210415102321.3987935-1-philmd@redhat.com>
 <20210415102321.3987935-2-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <a03561fd-92e2-813f-b3a8-b03a7f97a8f2@redhat.com>
Date: Tue, 27 Apr 2021 11:25:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415102321.3987935-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 6:23 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/block/fdc.c        | 7 +------
>   hw/block/trace-events | 1 +
>   2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index a825c2acbae..1d3a0473678 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -1242,12 +1242,7 @@ static void fdctrl_external_reset_isa(DeviceState *d)
>   
>   static void fdctrl_handle_tc(void *opaque, int irq, int level)
>   {
> -    //FDCtrl *s = opaque;
> -
> -    if (level) {
> -        // XXX
> -        FLOPPY_DPRINTF("TC pulsed\n");
> -    }
> +    trace_fdctrl_tc_pulse(level);
>   }
>   

Do we need this function to fulfill some specific callback signature? 
... Ah, yeah, I guess for qdev_init_gpio_in. OK.

>   /* Change IRQ state */
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index fa12e3a67a7..306989c193c 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -3,6 +3,7 @@
>   # fdc.c
>   fdc_ioport_read(uint8_t reg, uint8_t value) "read reg 0x%02x val 0x%02x"
>   fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
> +fdctrl_tc_pulse(int level) "TC pulse: %u"
>   
>   # pflash_cfi01.c
>   # pflash_cfi02.c
> 

Reviewed-by: John Snow <jsnow@redhat.com>


