Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B257C48C0E9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:22:45 +0100 (CET)
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Zq8-0006c6-R8
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7Zcy-0002Pl-B3
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:09:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7Zcs-00085o-Et
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641978541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HYzOp+LP8wETSxgr7pIsXhHFNYHEAX5VJb3lAfKxn/g=;
 b=XFqqR6BjBEy1KlWjnzhi7g5PT+jRC8jCr8/AQvzoukD5CQTSO4NfgIE/lfvGqZpl+nwx01
 yQFEEPKVrhaqsmpASctFAk4QIX9C+kqBgf1cD401l3aWdhPueACvR3TNLwQKt0gu7Sh7Au
 uvo2SNtKEwQLm0SCE641bqSoz4fyICM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-OxUdJTstNoiAtyns6E9UKg-1; Wed, 12 Jan 2022 04:09:00 -0500
X-MC-Unique: OxUdJTstNoiAtyns6E9UKg-1
Received: by mail-ed1-f69.google.com with SMTP id
 eg24-20020a056402289800b003fe7f91df01so1705117edb.6
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 01:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HYzOp+LP8wETSxgr7pIsXhHFNYHEAX5VJb3lAfKxn/g=;
 b=3vocWdEVKs1nZ2YPYmm6GX5ic4m/nCgaMPUnFYVWELhiUSOFVLtn6MvNdrJf8VBDSv
 U8vplYxuhXO8MgaaFlGheLdJtVT6T4DrRKhZm3EnZgSgV8VIVjSZknfHjvlJ9/A85N+T
 dqZWb6cT4/XaM0kj2OkNKwmhOoqjUxSmH7S9CrSyoRaAnEx+NGzAQ5zFwLBYVyZNKXuh
 oS+/on108cYWyz2p5nnYhYSzzqxWbFg3x4wbarzv+TQV3VwaCmjZsqMpvRI5YoTdUTfD
 q4YNUm6sQ+5l9WDyTncQLLurzlo270MTT9BKukxdeFd+ODjGlNeep/T7bthhBq4iVnDK
 88Vg==
X-Gm-Message-State: AOAM532iOt6vek194ZOemuSDwnrFFuWiHYFycgrTcY7YJGGYypxa9hjR
 dqHpn1wvhZpR7SmKV8r8xXOUB2OuvlUG9OlXGaGsKmVCyOEMMzeCUKT0mncnZbrgw3fQ9BkHS4u
 PiiVGlemqqCV3nME=
X-Received: by 2002:aa7:c7d1:: with SMTP id o17mr8018630eds.412.1641978539239; 
 Wed, 12 Jan 2022 01:08:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHM4LWG23oGgehhZuk9/ncwuBZTFV4YQZniAOhuwHYpl1GUAg5P7LQeNQA5eX471++dQiIwA==
X-Received: by 2002:aa7:c7d1:: with SMTP id o17mr8018620eds.412.1641978539073; 
 Wed, 12 Jan 2022 01:08:59 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id kw22sm4321342ejc.132.2022.01.12.01.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 01:08:58 -0800 (PST)
Message-ID: <b088c752-2e48-1ad6-2238-b1370af3e05c@redhat.com>
Date: Wed, 12 Jan 2022 10:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 02/10] hw/nvram: Restrict fw_cfg QOM interface to
 sysemu and tools
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220111184309.28637-1-f4bug@amsat.org>
 <20220111184309.28637-3-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220111184309.28637-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.01.22 19:43, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> fw_cfg QOM interface is required by system emulation and
> qemu-storage-daemon. User-mode emulation doesn't need it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/nvram/meson.build | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
> index 202a5466e63..f5ee9f6b88c 100644
> --- a/hw/nvram/meson.build
> +++ b/hw/nvram/meson.build
> @@ -1,5 +1,7 @@
> -# QOM interfaces must be available anytime QOM is used.
> -qom_ss.add(files('fw_cfg-interface.c'))
> +if have_system or have_tools
> +  # QOM interfaces must be available anytime QOM is used.
> +  qom_ss.add(files('fw_cfg-interface.c'))
> +endif
>  
>  softmmu_ss.add(files('fw_cfg.c'))
>  softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


