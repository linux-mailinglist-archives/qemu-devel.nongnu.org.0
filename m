Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB6C41AE26
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:51:24 +0200 (CEST)
Received: from localhost ([::1]:57548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVBdr-00027F-BH
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVBZo-0006t0-Q8
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:47:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVBZl-0004XV-0N
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:47:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632829626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqjCzZ1UEWvXHRaC7ovjrK+5TmN/nFXR7PNO7Ej4Kxk=;
 b=IFr1xnrGtMcjErHF+wf32zAuEVYfZ4ScYTO3WEpHuGrC0TGh1T1/eHeTDsuP1vXx4kqWLa
 Snu/9x71lJrDJjrjqCyZ1am2w4ULWyXORhbOmkXiA4fs9UCba+47Tf/g/IOtRkgGGvQevB
 kj8LWBwUYAdIlHu94TopUmm7IibC/Rk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-xfPVilULNIuOVMMkCWGRUg-1; Tue, 28 Sep 2021 07:47:05 -0400
X-MC-Unique: xfPVilULNIuOVMMkCWGRUg-1
Received: by mail-wr1-f70.google.com with SMTP id
 c8-20020adfef48000000b00160646ed62cso3404921wrp.18
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 04:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JqjCzZ1UEWvXHRaC7ovjrK+5TmN/nFXR7PNO7Ej4Kxk=;
 b=ITTXhiOvc8AOJa4Aq66Rh/xCFZUmFwMPkIJFRgEzCFD07eoVf0e1574IZqcpzp+yJf
 MTBQR3QipupD/tvwjk5O3k4A2osfn3FiS5LwgBsNpunl6HSt/zJTFmvKsxTpz/8l4uE+
 RyDdBRsdie6lsrf1KI29pt/u3ap9yee4W7OAgdkogXm4gkIhl4vdhgV5EwAFQDRcZ/HT
 l7B4PwxM69BykiasrORL1EJyTUodNlVXln8GHhepSmWLKbzW8ZIuKPqFf9vJN5tOihMW
 cVa14PEujkB/kYkONRmD3PEHlLQfvDECFY4Ez6mhD7lcKcmOO6Kvih/vmCmxF/UQhmOz
 wFvQ==
X-Gm-Message-State: AOAM532q/J0SD6w7GzZFE6UAchbifxzrswa5gkffcBUYpqxWg/9JhKqg
 yElLKW3YwHVRJVYk4zPzZYu4RSrLqG3lY/ZlNJo7mXSn34mRiyqSiv/JPjUdBSYhcuJF5zgpYXm
 YATkthsMBZKE9+LI=
X-Received: by 2002:adf:9f45:: with SMTP id f5mr5843444wrg.170.1632829624344; 
 Tue, 28 Sep 2021 04:47:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjwYu9BCempXiT/YJUScF/zD5Ua7+MC4X9+sTVoaBrjB5vYj5WsGO7WsY/ysTiNuERluOCcA==
X-Received: by 2002:adf:9f45:: with SMTP id f5mr5843388wrg.170.1632829624087; 
 Tue, 28 Sep 2021 04:47:04 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id h18sm4284951wrs.75.2021.09.28.04.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 04:47:03 -0700 (PDT)
Message-ID: <5e36f960-7b40-a55b-ddba-1f635a39941a@redhat.com>
Date: Tue, 28 Sep 2021 13:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 09/29] tcg/module: add tcg-module.[ch] infrastructure
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-10-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210831121545.2874233-10-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Peter Xu <peterx@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 14:15, Gerd Hoffmann wrote:
> Add TCGModuleOps struct, empty for now, followup patches will fill it.
> This struct has pointers for tcg functions which are called by core
> qemu.
> 
> The struct is initialized (at compile time) with pointers to stub
> functions.  When the tcg module loads it will update the function
> pointers to point to the real functions instead.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/tcg/tcg-module.h | 8 ++++++++
>  accel/tcg/tcg-module.c   | 5 +++++
>  accel/tcg/meson.build    | 4 ++++
>  3 files changed, 17 insertions(+)
>  create mode 100644 include/tcg/tcg-module.h
>  create mode 100644 accel/tcg/tcg-module.c
> 
> diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
> new file mode 100644
> index 000000000000..7e87aecb2357
> --- /dev/null
> +++ b/include/tcg/tcg-module.h
> @@ -0,0 +1,8 @@
> +#ifndef TCG_MODULE_H
> +#define TCG_MODULE_H
> +
> +struct TCGModuleOps {
> +};
> +extern struct TCGModuleOps tcg;

TCG functions taking a CPUState argument should reside in
CPUClass's AccelCPUClass/TCGCPUOps, not a global struct.


