Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A20F6FF67C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:52:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8aV-00052M-3v; Thu, 11 May 2023 11:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1px8aS-00052E-FZ
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1px8aR-0004aL-1g
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683820329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHToo8zfgQ4x4Uu9DcZA84tZXVu0Vpr3j+i8coqAUhQ=;
 b=WHEEON1szCL3PMH0314qMZHiPoZNcPqZO5uJmnxtDS4eAvA+AL3xc2OWV86symPUp9G4tc
 B2Hv2KlkQ1U4P8QzDnZvA5y1eCoeoDFD7ouIYlWApgIpUXuUQyFLrKP3SXhDDSa0K3hj15
 TGrswk5OmHILZuvJS0lYzARFLoRDNAE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-t7ec5d5EOMak4tx1VFLLAg-1; Thu, 11 May 2023 11:52:05 -0400
X-MC-Unique: t7ec5d5EOMak4tx1VFLLAg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50d89279d95so4447781a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683820320; x=1686412320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FHToo8zfgQ4x4Uu9DcZA84tZXVu0Vpr3j+i8coqAUhQ=;
 b=l6bcLEQIqnyhqkbLYi1uMWy+8k1QNPDJBVn7VkuBFVB4c/IHQG2nfrkBe7KVymwjzB
 8Q+iCeA01EImkv6jbsfcuJ2b8GtQaVhxEcpAHDQ170is4DdiKaggk2/hA65AJPZgB8Mo
 qQ8bGFF+WsSO+gDLXFuQqYoU/C49Ou+2OS2ISNDxAVkwhF1UEKI8AIAbLjqzge5j/cTU
 6sRwbx8DdA12sLWKZ+RIdyfA0N93qj8KHJd8E6+E06eYkAvU2bA48jXVMeWjixKRoIsk
 35jE6m0n5DcgBoU41v0FvX4ut3HSBR2CGuH+RSJqk0z0vxu9AvllfjkG/J7NLhIujbfu
 IrOw==
X-Gm-Message-State: AC+VfDxqVhXzE5m38TZCQ7bKJ/VAXV39V8+DlGvohNczqfWWywTHbxcp
 vPUuMswSKbnRktfFOO5z5m/sST/bLIBmtWHVrGNDbrxYmQLwoIe8SYNlTHw4XM38C526HFUvqLF
 iSd4is0DgiKVH5n4=
X-Received: by 2002:a17:907:6290:b0:95f:af3a:be8c with SMTP id
 nd16-20020a170907629000b0095faf3abe8cmr21075761ejc.18.1683820320087; 
 Thu, 11 May 2023 08:52:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ufj/7KU2cKVt8IxK2tjkmGkzlNF07kePbbhqlNWzAuZJixwrNL9Y0Hx/73vO6iI0WHXopfA==
X-Received: by 2002:a17:907:6290:b0:95f:af3a:be8c with SMTP id
 nd16-20020a170907629000b0095faf3abe8cmr21075740ejc.18.1683820319796; 
 Thu, 11 May 2023 08:51:59 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-208.customers.d1-online.com.
 [80.187.98.208]) by smtp.gmail.com with ESMTPSA id
 jz14-20020a17090775ee00b00969cbd5718asm3942873ejc.48.2023.05.11.08.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 08:51:59 -0700 (PDT)
Message-ID: <7da3ca31-0faf-2c45-e34d-e45f2e93c906@redhat.com>
Date: Thu, 11 May 2023 17:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] configure: make clear that VirtFS is 9p
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <E1px7Id-0000NE-OQ@lizzy.crudebyte.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <E1px7Id-0000NE-OQ@lizzy.crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.124, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/05/2023 16.12, Christian Schoenebeck wrote:
> Add '9P' to the summary output section of 'VirtFS' to avoid being
> confused with virtiofs.
> 
> Based-on: <20230503130757.863824-1-pefoley@google.com>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>   meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 5d8373b608..5d65f53fec 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3922,8 +3922,8 @@ if have_block
>     summary_info += {'Block whitelist (rw)': get_option('block_drv_rw_whitelist')}
>     summary_info += {'Block whitelist (ro)': get_option('block_drv_ro_whitelist')}
>     summary_info += {'Use block whitelist in tools': get_option('block_drv_whitelist_in_tools')}
> -  summary_info += {'VirtFS support':    have_virtfs}
> -  summary_info += {'VirtFS Proxy Helper support': have_virtfs_proxy_helper}
> +  summary_info += {'VirtFS (9P) support':    have_virtfs}
> +  summary_info += {'VirtFS (9P) Proxy Helper support': have_virtfs_proxy_helper}
>     summary_info += {'Live block migration': config_host_data.get('CONFIG_LIVE_BLOCK_MIGRATION')}
>     summary_info += {'replication support': config_host_data.get('CONFIG_REPLICATION')}
>     summary_info += {'bochs support':     get_option('bochs').allowed()}

Reviewed-by: Thomas Huth <thuth@redhat.com>


