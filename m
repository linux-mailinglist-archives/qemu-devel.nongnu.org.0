Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C002BB0B6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:38:47 +0100 (CET)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9Qs-0003l8-OL
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg9Kt-0007he-6K
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:32:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg9Kr-0007f2-5A
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:32:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605889952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gn8UOCBWsYoNKqyeVyXH2NUg3JIEqsto3lJUyBBZr4U=;
 b=fFoiQ/qt/DwwwkBjLa/dG5yAwZ+btrHJom7hQ3Ep/bDMlttkhCGBLT1eiaDts92Jcgrw8k
 k5s6Bh9Vsy6BjvPc5KfkKNPVDbxZ8y741arPgrYiDwVvSKQH3TPOQG6jXKsdFDHhZjEh94
 nncZetnYZbFFYXuwWF6L6WyRd4UpRyQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-qXSgWaGCPUKVRpxbU68vsQ-1; Fri, 20 Nov 2020 11:32:28 -0500
X-MC-Unique: qXSgWaGCPUKVRpxbU68vsQ-1
Received: by mail-ed1-f72.google.com with SMTP id b13so3926744edy.8
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gn8UOCBWsYoNKqyeVyXH2NUg3JIEqsto3lJUyBBZr4U=;
 b=X7RCmoRFuqMQoOVCI3GGFoPhfC1+szABV+ESd7BahmxGyTBgGvmnGM+5inOMuboDit
 aqr1OGxbZE9fP8fdbqGi5FkyIzCRBUJjJBoK7+28f5nSRdLLHKdG/0hr0DnNoMG1rZJH
 2sSyn90CavoB35llarGce/+aOjAXyhUVsHsSrO6hHejqE3llVAwCCeESsi9/pWuvbujc
 m3PL2o2n9TKypsuJpIS7M/UrU/RShD03CIe5Uee2otMPVXrTXLU5s8aTUEeuKs/0V6L2
 BH7i+PbNyax0iBcbRi1MKfW4Kf+ED2CC8elJ/vdNsfUZ2tK+/Xsjkn+1XzigfrR4VXG2
 lF6A==
X-Gm-Message-State: AOAM533oKZxHpRMJQFCBc/OoMRkiaiH3HljV1fmERvEt6sM52wSrLeqT
 lfNT/+o0v7LLbTqHsIDhJTHRGe6kekXg45xEqdRdEhYAlamrAmts2zdyql2bxt4uNf3k+vYUlSO
 klOA9RQE4R8WPQnE=
X-Received: by 2002:a17:906:ee2:: with SMTP id
 x2mr23075314eji.326.1605889947412; 
 Fri, 20 Nov 2020 08:32:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaAbbzBRXkZrGxvmactcEP6Wz/xvHv+I51CBz2Y1KwBtJ22vkosSofKPiwUZ++TZMMmgHZTw==
X-Received: by 2002:a17:906:ee2:: with SMTP id
 x2mr23075281eji.326.1605889947041; 
 Fri, 20 Nov 2020 08:32:27 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id by8sm1326385edb.49.2020.11.20.08.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 08:32:26 -0800 (PST)
Subject: Re: [PATCH-for-5.2?] hw/char/serial: Clean up unnecessary code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120161933.2514089-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d5a2e6e4-007a-e60e-d09e-3569d7d81465@redhat.com>
Date: Fri, 20 Nov 2020 17:32:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120161933.2514089-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Jonathan D . Belanger" <jbelanger1@rochester.rr.com>,
 Bug 1904331 <1904331@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 17:19, Philippe Mathieu-Daudé wrote:
> Since commit 5ec3a23e6c8 ("serial: convert PIO to new memory
> api read/write") we don't need to worry about accesses bigger
> than 8-bit. Use the extract()/deposit() functions to access
> the correct part of the 16-bit 'divider' register.
> 
> Reported-by: Jonathan D. Belanger <jbelanger1@rochester.rr.com>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1904331
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Bug 1904331 <1904331@bugs.launchpad.net>
> ---
>   hw/char/serial.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)

Looks good, but certainly not for 5.2.

Paolo

> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 97f71879ff2..62c627f486f 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -24,6 +24,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/bitops.h"
>   #include "hw/char/serial.h"
>   #include "hw/irq.h"
>   #include "migration/vmstate.h"
> @@ -338,11 +339,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
>       default:
>       case 0:
>           if (s->lcr & UART_LCR_DLAB) {
> -            if (size == 1) {
> -                s->divider = (s->divider & 0xff00) | val;
> -            } else {
> -                s->divider = val;
> -            }
> +            s->divider = deposit32(s->divider, 8 * addr, 8, val);
>               serial_update_parameters(s);
>           } else {
>               s->thr = (uint8_t) val;
> @@ -364,7 +361,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
>           break;
>       case 1:
>           if (s->lcr & UART_LCR_DLAB) {
> -            s->divider = (s->divider & 0x00ff) | (val << 8);
> +            s->divider = deposit32(s->divider, 8 * addr, 8, val);
>               serial_update_parameters(s);
>           } else {
>               uint8_t changed = (s->ier ^ val) & 0x0f;
> @@ -478,7 +475,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
>       default:
>       case 0:
>           if (s->lcr & UART_LCR_DLAB) {
> -            ret = s->divider & 0xff;
> +            ret = extract16(s->divider, 8 * addr, 8);
>           } else {
>               if(s->fcr & UART_FCR_FE) {
>                   ret = fifo8_is_empty(&s->recv_fifo) ?
> @@ -502,7 +499,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
>           break;
>       case 1:
>           if (s->lcr & UART_LCR_DLAB) {
> -            ret = (s->divider >> 8) & 0xff;
> +            ret = extract16(s->divider, 8 * addr, 8);
>           } else {
>               ret = s->ier;
>           }
> 


