Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927403B6B5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 16:07:04 +0200 (CEST)
Received: from localhost ([::1]:46884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haKwx-0007Ql-NK
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 10:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53735)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1haKnk-0008CZ-Nt
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:57:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1haKni-0007qr-RJ
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:57:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37721)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1haKng-0007ox-U6
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:57:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id v14so9296599wrr.4
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 06:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bnDKenNNos40mZIIz0MdLFy86MsODSnBgW+fQyKY6Qc=;
 b=dg7a8CBtiUe22fmO1UynU0eKO2snc3gaD/e8SNJx4Qr7dcEqkP6JXa3ScwZkSOzWeG
 0rklsCML4lOxIJIFb8DgXla1AFDtmYoKfPHiHhPHfRr4Y8aYgKfp3jiik+k0YhRuRToD
 JGhJwC8y5Zcz3UpMkNO5fdqcebbjy4HVhextCXL6g11zlugTXiJH9CPFGqDxypUskszy
 RQifTBwOkLcQTB68K8AKO5rv9ZVQj2K2Zcr0FIenuBWpK7MV1u8rutqYHYA8HR5hoD6n
 yqgbzIjuKeOj4Owd3WEKtS5PbljHudbjFnREO6VatEu8N+GN+ZzK5m4PXQZFDLFwifau
 wahA==
X-Gm-Message-State: APjAAAU1BH/2VNrT6G1SdzLgLxyihoV8fsntIjBp7Zy1bbuBG/RoZREn
 R9RgGYvEUkKPeVQmwAOV8IWL3w==
X-Google-Smtp-Source: APXvYqwI8k37F4fme5Tio2cJRK+kcHAUOdr1GAWuWeSXeVxvPx2VsekhXnPrGzMwK2oTThUQMYRhhg==
X-Received: by 2002:a5d:5582:: with SMTP id i2mr9954820wrv.209.1560175047080; 
 Mon, 10 Jun 2019 06:57:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:49d3:a711:c5a3:8ebf?
 ([2001:b07:6468:f312:49d3:a711:c5a3:8ebf])
 by smtp.gmail.com with ESMTPSA id 74sm9412877wma.7.2019.06.10.06.57.26
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 06:57:26 -0700 (PDT)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1560174635-22602-1-git-send-email-imammedo@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5b8571b6-2347-ff62-2b0f-484fe47b476a@redhat.com>
Date: Mon, 10 Jun 2019 15:57:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560174635-22602-1-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH] pc: fix possible NULL pointer dereference
 in pc_machine_get_device_memory_region_size()
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
Cc: armbru@redhat.com, mst@redhat.com, ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/06/19 15:50, Igor Mammedov wrote:
> QEMU will crash when device-memory-region-size property is read if ms->device_memory
> wasn't initialized yet.
> 
> Crash can be reproduced with:
>  $QEMU -preconfig -qmp unix:qmp_socket,server,nowait &
>  ./scripts/qmp/qom-get -s qmp_socket /machine.device-memory-region-size
> 
> Instead of crashing return 0 if ms->device_memory hasn't been initialized.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v2:
>   add reproducer to commit message
>    (Markus Armbruster <armbru@redhat.com>)
> 
>  hw/i386/pc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index edc240b..1b7ead9 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -2459,7 +2459,11 @@ pc_machine_get_device_memory_region_size(Object *obj, Visitor *v,
>                                           Error **errp)
>  {
>      MachineState *ms = MACHINE(obj);
> -    int64_t value = memory_region_size(&ms->device_memory->mr);
> +    int64_t value = 0;
> +
> +    if (ms->device_memory) {
> +        memory_region_size(&ms->device_memory->mr);
> +    }
>  
>      visit_type_int(v, name, &value, errp);
>  }
> 

Queued, thanks.

Paolo

