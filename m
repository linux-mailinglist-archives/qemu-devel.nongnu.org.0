Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA542F043
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 14:11:55 +0200 (CEST)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbM41-0003ps-MW
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 08:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbM2p-00034F-5k
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbM2l-0005Jk-Tb
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634299833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/qlkQ53cMzidgoquQAc5ZxZUbIZF41WBlXnZOhyEi4=;
 b=bzKierF2QFTk8b3yG0KSQWjrQrYIFQg3eWOSOcCd9bLNunLRuygmamC3YF9w3LdAzs37bY
 AkQ2Sll+y+7SM3hwYFFt3Ha5RglN5W6rV0x6TXxt+gXK7ebC34cNuur3raTT/dQ+Ya3547
 B6+Gtmgx4p6n8ccU+XoXAKKkyoYUelM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476--zQK3YjeNbKtNWmxrE-pWg-1; Fri, 15 Oct 2021 08:10:30 -0400
X-MC-Unique: -zQK3YjeNbKtNWmxrE-pWg-1
Received: by mail-ed1-f72.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so8052608edb.8
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 05:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a/qlkQ53cMzidgoquQAc5ZxZUbIZF41WBlXnZOhyEi4=;
 b=ATtg6r+KuXaNwo5fGGTTrFCy2drSnFOkRVwpuFEOu4YvNPTSV2rH9PklVb1tRima81
 Oorok40Xb6yKZd8V8lJxp8WuOPbwnz9OXjKMP6TTxt3uJCwF1qCIZih6oeR/R2raGwvs
 kksXyya/vPraShgqcErmvrhfQ6ZEmctwn7k6XU0rGWzE1mXgS3k1a7HgG/xNN4DRk7s5
 wv5sdCRk5IZ5eJOzUICAV6o4oUX0s97gjbblHnAUBcQAtIJx6YRKVDnU9I9IgymwRLYj
 6HLmhvqgbJsNp9VT0Fs9+1U6hzPfZ2ZhmXstVN1A88KaUJ8Z0JksU04BC+fCgFbR/bux
 XRGw==
X-Gm-Message-State: AOAM532Cb4IrKuUYHRQRbIWibKxG9fSwgaEGSrnSywzmLC3ICVEsKvmv
 iEeC783wDjkQWoY7hWNbPioI5jX9qj4dmlO8xsgm3R2gaWQ9EWdY+rB3VxPH9jYUcGlZbTCmzMP
 1lJjEHMTt+GBLVxY=
X-Received: by 2002:a50:e044:: with SMTP id g4mr16891693edl.46.1634299829395; 
 Fri, 15 Oct 2021 05:10:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy54w3tdRlAJ7eZZgsWVD2CleC00W6a2T6V7GZluYQL2Ap0XxQmZU0ToJQydgLhBLZQOv7TSA==
X-Received: by 2002:a50:e044:: with SMTP id g4mr16891664edl.46.1634299829147; 
 Fri, 15 Oct 2021 05:10:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h7sm4461764edt.37.2021.10.15.05.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 05:10:28 -0700 (PDT)
Message-ID: <a3b75b85-104e-253e-995b-c93ce4ac1e06@redhat.com>
Date: Fri, 15 Oct 2021 14:10:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 11/11] 9p: darwin: meson: Allow VirtFS on Darwin
To: Will Cohen <wwcohen@gmail.com>, qemu-devel@nongnu.org
References: <20211013230405.32170-1-wwcohen@gmail.com>
 <20211013230405.32170-12-wwcohen@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211013230405.32170-12-wwcohen@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/21 01:04, Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> ---
>   fsdev/meson.build |  1 +
>   meson.build       | 17 ++++++++++-------
>   2 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/fsdev/meson.build b/fsdev/meson.build
> index adf57cc43e..b632b66348 100644
> --- a/fsdev/meson.build
> +++ b/fsdev/meson.build
> @@ -7,6 +7,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
>     'qemu-fsdev.c',
>   ), if_false: files('qemu-fsdev-dummy.c'))
>   softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
> +softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
>   
>   if have_virtfs_proxy_helper
>     executable('virtfs-proxy-helper',
> diff --git a/meson.build b/meson.build
> index 99a0a3e689..5e777b271d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1203,17 +1203,20 @@ have_host_block_device = (targetos != 'darwin' or
>   # config-host.h #
>   #################
>   
> -have_virtfs = (targetos == 'linux' and
> -    have_system and
> -    libattr.found() and
> -    libcap_ng.found())
> +if targetos == 'linux'
> +  have_virtfs = (have_system and
> +      libattr.found() and
> +      libcap_ng.found())
> +elif targetos == 'darwin'
> +  have_virtfs = have_system
> +endif
>   
> -have_virtfs_proxy_helper = have_virtfs and have_tools
> +have_virtfs_proxy_helper = targetos == 'linux' and have_virtfs and have_tools
>   
>   if get_option('virtfs').enabled()
>     if not have_virtfs
> -    if targetos != 'linux'
> -      error('virtio-9p (virtfs) requires Linux')
> +    if targetos != 'linux' and targetos != 'darwin'
> +      error('virtio-9p (virtfs) requires Linux or Darwin')
>       elif not libcap_ng.found() or not libattr.found()
>         error('virtio-9p (virtfs) requires libcap-ng-devel and libattr-devel')
>       elif not have_system
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


