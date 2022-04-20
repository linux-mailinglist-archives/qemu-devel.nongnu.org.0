Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB5508D85
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:41:59 +0200 (CEST)
Received: from localhost ([::1]:53418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDOv-0001NK-Ot
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhCTh-0008Rk-Jl
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:42:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhCTf-0002Sf-UO
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650469367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYwVy8Ihle2wcAUo9L/saawwi+dHuu2XNx6fZpqklqU=;
 b=D27OzS+C2F8l4piOXK2tf0Egp8ptV7/z3b11kX8gYBxIfnOM4zSS4CT4L5ecsGmF984eXt
 EvjIKyQUeNiywMWjzcl3v90aBSeUneQdYCvvmh8QvFyf55a+6kmTW3tKMGSSKZd52etNb1
 Rh67dOVCbSdK9DKOFQIu9R0Cs4OWEDc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-2deDAXaTONegOhek62fH6A-1; Wed, 20 Apr 2022 11:42:46 -0400
X-MC-Unique: 2deDAXaTONegOhek62fH6A-1
Received: by mail-wm1-f69.google.com with SMTP id
 i66-20020a1c3b45000000b0038eab4e0feaso1058324wma.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hYwVy8Ihle2wcAUo9L/saawwi+dHuu2XNx6fZpqklqU=;
 b=Anbn51UTAyCeTLX4zzM1gk2hIpFS1Y9/vZLNWOpPf6ir7fUBb7URecukHHQiBIXNVF
 Sl3gsE47lCrfHDDKAGlbeLsgKVQAUoEB1od0Sg59wXZ1vndPxlubMjVd39LshiZlLWc/
 z59VTMgcaw20phmwT5EJUqX1wXkLSMccmCdY7crRo4YmqwsVOGD8r1eERsze07PhyNO7
 +kcf1Qbhljw5GfASVkqWPf/UKMf0kk4qu0dM6uWkNiGm456I4HSrKG2qvE/ynmtao4ig
 RCqU2bExVJLWN9xfhz4GPJM/9M8gOC4g0p4FlRT1UGfD6b/S9r6Bia7LMyjEVkmTCvRu
 NeoA==
X-Gm-Message-State: AOAM53201I7tKzg9H02MG8ve53GdBYURyKvAVbRu648MZ6ArdDVRu1h1
 K+CrQFZiSnNoBCGNdWEi/2GiGSV8YALPYpSupAEhyuThe40CRh5DBH3AlOwwmhNQrNcMnIXgwTy
 DHTqkvOe/9uKPfC4=
X-Received: by 2002:a1c:21c5:0:b0:38e:b464:6a39 with SMTP id
 h188-20020a1c21c5000000b0038eb4646a39mr4261981wmh.186.1650469365095; 
 Wed, 20 Apr 2022 08:42:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2Pz690sQ381w5+JVeNA8xYIfL6beiHzxNiWXb1LGz5Z5lHXx4hCBrXmBfBIgWjMJmlqsJaA==
X-Received: by 2002:a1c:21c5:0:b0:38e:b464:6a39 with SMTP id
 h188-20020a1c21c5000000b0038eb4646a39mr4261968wmh.186.1650469364876; 
 Wed, 20 Apr 2022 08:42:44 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600002cb00b0020a88c4ecb5sm259730wry.3.2022.04.20.08.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 08:42:44 -0700 (PDT)
Message-ID: <e28bdcf8-2f95-b444-30a2-c3f2f5d67586@redhat.com>
Date: Wed, 20 Apr 2022 17:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 06/34] configure: move --enable/--disable-debug-info to
 second option parsing pass
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-7-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220420153407.73926-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 17.33, Paolo Bonzini wrote:
> $debug_info is not needed anywhere except in the final meson invocation,
> no need to special case it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/configure b/configure
> index 48ae18f47f..07053e7b27 100755
> --- a/configure
> +++ b/configure
> @@ -244,7 +244,6 @@ audio_drv_list="default"
>   block_drv_rw_whitelist=""
>   block_drv_ro_whitelist=""
>   host_cc="cc"
> -debug_info="yes"
>   lto="false"
>   stack_protector=""
>   safe_stack=""
> @@ -304,6 +303,7 @@ vhost_user_fs="$default_feature"
>   vhost_vdpa="$default_feature"
>   rdma="$default_feature"
>   pvrdma="$default_feature"
> +debug_info="yes"
>   debug_tcg="no"
>   debug="no"
>   sanitizers="no"
> @@ -379,10 +379,6 @@ for opt do
>     ;;
>     --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
>     ;;
> -  --enable-debug-info) debug_info="yes"
> -  ;;
> -  --disable-debug-info) debug_info="no"
> -  ;;
>     --cross-cc-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --cross-cc-FOO option"
>     ;;
>     --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-cflags-}; cc_arch=${cc_arch%%=*}
> @@ -759,12 +755,12 @@ for opt do
>     ;;
>     --extra-ldflags=*)
>     ;;
> -  --enable-debug-info)
> -  ;;
> -  --disable-debug-info)
> -  ;;
>     --cross-cc-*)
>     ;;
> +  --enable-debug-info) debug_info="yes"
> +  ;;
> +  --disable-debug-info) debug_info="no"
> +  ;;
>     --enable-modules)
>         modules="yes"
>     ;;

Reviewed-by: Thomas Huth <thuth@redhat.com>


