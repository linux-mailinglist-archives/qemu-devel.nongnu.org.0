Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598B86980BA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:19:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKTI-0007Fa-01; Wed, 15 Feb 2023 11:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSKT7-00070K-II
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSKT6-0008Hd-5d
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676477835;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StUbj1qio6wwGfPdysYuT6d/VUp+EjrE2Z7gFeivv7Y=;
 b=e5CclPYYgCImxn13htIO8Tfn9nV175wq7m3+1UbAcFQ9IEzmxIXYgGC/IggmIsyfzCpBDh
 rd+2gkwzgXj543Fh8tkg22QCyJ9bhjpXT9icVMZZcz7Zr2PBGIPIG6qN9wVajEEFE1eSBW
 aMTKzN9w1pGPCc2ozxin2epLcQTcl5w=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-482-6PLry6s4ORG0wgAGGTYl9w-1; Wed, 15 Feb 2023 11:17:08 -0500
X-MC-Unique: 6PLry6s4ORG0wgAGGTYl9w-1
Received: by mail-qv1-f72.google.com with SMTP id
 jh2-20020a0562141fc200b004c74bbb0affso10966050qvb.21
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=StUbj1qio6wwGfPdysYuT6d/VUp+EjrE2Z7gFeivv7Y=;
 b=C7zPAgpWloSpboiuXENtBORYO7bxLl5hFofAsdOGdBrkT4uRrCCfDvkXZcbKV4b9HA
 6RQgXm7gk17E6Qo8VEs7KLqlFjcZk+oPM/guupiZGc2hKGbANVjFmUnADtR34HrF8SDM
 aVxCy14SsGwKfLbHgk92ZgNx4jxwcyU/67NDJL312UIXJtEMw/UCcBOnezKTxiyDYYx8
 nADuqzwZYy8CVe5XAVoYuuFmucnlVzbHCmu//4FHgGiyKUpZqZLV8ws2eAnM6Mpr6eyB
 u+qLZJDdYal/yKnTULQqP8f4qoCdWOtG12+PKr9PqU/es3pCuI9kFSb7tHgrlpnDwf+o
 uZxA==
X-Gm-Message-State: AO0yUKVreApd8tjfix7EplQBSKjelQXFYT7oGArrnEC5CSsAtSypSrog
 Acfag9kQuKl+q1frt6X58cofFGdem+BMeRMc72QMaZEDPUx3iXz0GYAOiDKcD0HPYfXDswfraaY
 3CatJWYIDTSL9vYE=
X-Received: by 2002:ac8:5bd6:0:b0:3b8:683c:40f with SMTP id
 b22-20020ac85bd6000000b003b8683c040fmr4072800qtb.30.1676477818809; 
 Wed, 15 Feb 2023 08:16:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/YIJKXpRm+4fPtnFpaHHXPzdr6s4WEkgpOrixqt6jA+DBlWoAAPQcBn2gRhFzyqPHL88P2+A==
X-Received: by 2002:ac8:5bd6:0:b0:3b8:683c:40f with SMTP id
 b22-20020ac85bd6000000b003b8683c040fmr4072767qtb.30.1676477818555; 
 Wed, 15 Feb 2023 08:16:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 o24-20020ac84298000000b003b880ef08acsm13498857qtl.35.2023.02.15.08.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 08:16:57 -0800 (PST)
Message-ID: <f231beb8-df21-29bd-93e5-c8b826c2a221@redhat.com>
Date: Wed, 15 Feb 2023 17:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 01/16] hw/arm/smmuv3: Add missing fields for IDR0
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-2-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-2-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Mostafa,

On 2/5/23 10:43, Mostafa Saleh wrote:
> In preparation for adding stage-2 support.
> Add IDR0 fields related to stage-2.
>
> VMID16: 16-bit VMID supported.
> S2P: Stage-2 translation supported.
>
> They are described in 6.3.1 SMMU_IDR0.
>
> No functional change intended.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3-internal.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index bce161870f..170e88c24a 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -34,10 +34,12 @@ typedef enum SMMUTranslationStatus {
>  /* MMIO Registers */
>  
>  REG32(IDR0,                0x0)
> +    FIELD(IDR0, S2P,         0 , 1)
>      FIELD(IDR0, S1P,         1 , 1)
>      FIELD(IDR0, TTF,         2 , 2)
>      FIELD(IDR0, COHACC,      4 , 1)
>      FIELD(IDR0, ASID16,      12, 1)
> +    FIELD(IDR0, VMID16,      18, 1)
>      FIELD(IDR0, TTENDIAN,    21, 2)
>      FIELD(IDR0, STALL_MODEL, 24, 2)
>      FIELD(IDR0, TERM_MODEL,  26, 1)


