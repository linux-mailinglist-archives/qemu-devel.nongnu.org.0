Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BCF41AD86
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:04:52 +0200 (CEST)
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAup-00083F-TR
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAog-0000tl-9h
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAod-00089Q-MS
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OBmgT684d3V/w8GmefcY6+SwuahSJTJUkp5geTMA2Bo=;
 b=JD3vXFX4J/PsMxCwsZL4+cmvMwGlVTUHQkFb1+oKCzP6Jx4P5tmUJpnOlkMz8NYdERvr/t
 NtGJotx7nemuJPJu2R0j5vf/g7yVIK7i7gHZhZp2afdcSl4Qe8yVLtmS7ph+Lfmxz+SLpC
 LEeXyFVOdZD14eT+shS/NryX6psrZ/4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-zyuW8gfUN7uidkG5k8R7dA-1; Tue, 28 Sep 2021 06:58:25 -0400
X-MC-Unique: zyuW8gfUN7uidkG5k8R7dA-1
Received: by mail-wr1-f72.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so15060169wrh.0
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 03:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OBmgT684d3V/w8GmefcY6+SwuahSJTJUkp5geTMA2Bo=;
 b=HRc01AOsh/lWS0SXts45ckzxODwdWZsbZ+jER3BAloIoHKbqtlOJtzkj5+G6jOf81h
 3S8DVHzKAeZJOiMmNXbp/6uRbTY3CDSC00C/KXmUJ9AJKMHteSZNTtm8G6SA/Pl7isTq
 DaVrPdi2ZC3VkAJyADta9ad5rI3yMrJxro1KDS/KqOS2VEW6HhorAUY0LWOUVn+BgbBI
 qFLSI+epeKCNj4+KPtN6TtnFCwcPoC9B0DCctSiAeIqQaHbGUga2SyklKVAoOt40ZNMB
 i8Us5R6yn8zat7oBj2cbOJmsgTa0nUpC5hCLNDxcQZ4CyX+hCuGO2D+XMfKkUyokO5KD
 UUTA==
X-Gm-Message-State: AOAM533Nrof2sB41oLyDymN90h0llE/8oKnfu8exsoj97JsqZ6w/hJrO
 HOvAwBZbPsw2kQw5RQjVan/o0JPwEUcwWerMnvIaeS7fXyACM/CPKe1feuRssXUQE7cJm4t6NRA
 3vxCm7jffJjDKaoE=
X-Received: by 2002:a05:600c:214d:: with SMTP id
 v13mr4018914wml.30.1632826704682; 
 Tue, 28 Sep 2021 03:58:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Ny7Xumj1FDGxmZ3sQvKMgDkwrmnf/bHY+foReXmjZ67YQGvL7KRT0WdDQKcm8nL8owUyoQ==
X-Received: by 2002:a05:600c:214d:: with SMTP id
 v13mr4018900wml.30.1632826704537; 
 Tue, 28 Sep 2021 03:58:24 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g25sm19136406wrc.88.2021.09.28.03.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:58:24 -0700 (PDT)
Message-ID: <c78012a1-b5e1-3505-965d-b807886accda@redhat.com>
Date: Tue, 28 Sep 2021 12:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 12/14] machine: Remove smp_parse callback from
 MachineClass
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-13-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-13-wangyanan55@huawei.com>
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
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 05:57, Yanan Wang wrote:
> Now we have a generic smp parser for all arches, and there will
> not be any other arch specific ones, so let's remove the callback
> from MachineClass and call the parser directly.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/core/machine.c   | 3 +--
>  include/hw/boards.h | 5 -----
>  2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f5dadcbd78..23f77201eb 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -918,7 +918,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>                      "CPU topology parameters must be greater than zero");
>      }
>  
> -    mc->smp_parse(ms, config, errp);
> +    smp_parse(ms, config, errp);
>      if (*errp) {

If smp_parse() were to return a boolean, this would become:

       if (!smp_parse(ms, config, errp)) {

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>          goto out_free;
>      }


