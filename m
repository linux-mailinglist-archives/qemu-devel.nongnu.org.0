Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9225532A82
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:39:38 +0200 (CEST)
Received: from localhost ([::1]:52000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTp3-0000Fj-Nt
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntTEe-0003xG-Ak
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntTEa-0005c9-Ur
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653393715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTro9P/m0PFDFr1iDoi737zImcgmBf1lXhGvPQ660wk=;
 b=IpNvn+ryPxHkta9fjEtQ3ibQQzUWgyQZO1jKsqjao9PWMc/bhk6g+lg072lre5F3NqcKZN
 iXtHsCgExD0+p26tZznSK/m4loqIlP/N8t/K4Uzn+dTGVwHvC7X7ypxyNuvr8lghK3ieBH
 ogAWTOueytghnUA7I/ach6bp/vGJsi4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-ZgoT5Hu8MqKHPKm-0I1NZw-1; Tue, 24 May 2022 08:01:51 -0400
X-MC-Unique: ZgoT5Hu8MqKHPKm-0I1NZw-1
Received: by mail-wm1-f72.google.com with SMTP id
 h133-20020a1c218b000000b003972dbb1066so1198698wmh.4
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 05:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gTro9P/m0PFDFr1iDoi737zImcgmBf1lXhGvPQ660wk=;
 b=ObQ0RP9qN5OjNRv82XBR19oPk82A0+5oMm3YMoY4B8C99MmKTXW3P4sjCI8kj0XaZ1
 yEYudeNZhWrjBzKXDai5SOot5Ac0RVU+3FmmaqjwjtR5va+xV/ObUvg43DuS2P3CjcE+
 vTRbZv6e9BaA6oXXGDEIZ5WXI9sVEnfg3tT5UJkF7XXVqlTjXeT5/G6WzG5ev8vUEEMo
 uES27ZepksNDAHuRi8Q8ArgRMlqLxspaVp3PGTx8VCcBC4KCAllKNAQAynbxTJBJL1KS
 R2JC7mr8wzjLRjA12PqVR0dPIY8PPTHggT0HrCVFYTiX0lq1GJyOv8ei4XePHrAqEWlb
 DcTA==
X-Gm-Message-State: AOAM533a+biFv84oDLYbk8vD8ypQiBQpO3darexdTn8ETOQEZpL1kPWy
 sqqU/uhdTw3BzHpGL0OEbWnjNM9xtJ4upCBCPyiokgJ+PE8D9oCi4nDdtwZQ2p3RrEm3d+86fva
 NTK4ltEsVvrjiNko=
X-Received: by 2002:a05:600c:4fd4:b0:397:4d74:e2c6 with SMTP id
 o20-20020a05600c4fd400b003974d74e2c6mr3381289wmq.179.1653393710600; 
 Tue, 24 May 2022 05:01:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAdOfkAIQ29HwuDrajQpQdINRTaUTkcJupo/lyh4+utd8I7nIyPUpfUvbZ8oYoBdgJtg08rg==
X-Received: by 2002:a05:600c:4fd4:b0:397:4d74:e2c6 with SMTP id
 o20-20020a05600c4fd400b003974d74e2c6mr3381261wmq.179.1653393710319; 
 Tue, 24 May 2022 05:01:50 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b00396f8c79d22sm1843214wmb.11.2022.05.24.05.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 05:01:48 -0700 (PDT)
Message-ID: <6933b872-7fd6-8e1f-d37f-b0f13b8aa1ed@redhat.com>
Date: Tue, 24 May 2022 14:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/5] s390x: Add KVM PV dump interface
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org
References: <20220310112547.3823-1-frankja@linux.ibm.com>
 <20220310112547.3823-5-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220310112547.3823-5-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2022 12.25, Janosch Frank wrote:
> Let's add a few bits of code which hide the new KVM PV dump API from
> us via new functions.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   hw/s390x/pv.c         | 52 +++++++++++++++++++++++++++++++++++++++++++
>   include/hw/s390x/pv.h |  8 +++++++
>   2 files changed, 60 insertions(+)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index a5af4ddf46..d6625fa374 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -175,6 +175,58 @@ bool kvm_s390_pv_info_basic_valid(void)
>       return info_valid;
>   }
>   
> +static int s390_pv_dump_cmd(uint64_t subcmd, uint64_t uaddr, uint64_t gaddr,
> +                            uint64_t len)
> +{
> +    struct kvm_s390_pv_dmp dmp = {
> +        .subcmd = subcmd,
> +        .buff_addr = uaddr,
> +        .buff_len = len,
> +        .gaddr = gaddr,
> +    };
> +    int ret;
> +
> +    ret = s390_pv_cmd(KVM_PV_DUMP, (void *)&dmp);
> +    if (ret) {
> +        error_report("KVM DUMP command %ld failed", subcmd);
> +

Please remove the empty line.

> +    }
> +    return ret;
> +}

  Thomas


