Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B824290B2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 16:09:57 +0200 (CEST)
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZw04-0005FR-CN
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 10:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZvz7-0004T4-OQ
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 10:08:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZvz5-0007hp-Ed
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 10:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633961334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0YPjy9+epP+waavum9vdTqwkZweJXXjvBQCVJbrgvo=;
 b=AnuXhYfxjonuhKrt34k8x/e0Fy+SNq8x51BNwiQwfq4RjcYLeDds8djWOlZ0hiJkAZP90I
 H2uvUdaw2/6RA35SBEAxNAzHvY3diiIMvscg2nCt85Hlqn4sycWBRbt8V3/dlqKeq/acYE
 gimCr5dzTcWOMypi4qxc9WtA2ybpGKY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-gvr409pbOSC4E2_gm6C5vg-1; Mon, 11 Oct 2021 10:08:53 -0400
X-MC-Unique: gvr409pbOSC4E2_gm6C5vg-1
Received: by mail-wr1-f72.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so10291866wrd.5
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 07:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d0YPjy9+epP+waavum9vdTqwkZweJXXjvBQCVJbrgvo=;
 b=sOP52gD7Yyo+tgZRbgk7MyTH/3S+o3kwd51xQHE2vkgWepEf+00WKJw14RN6Jqqpmv
 FsN/62OgmKR1J4U8Nskagu4orvc9lNCz7nn6cJZ+gjrZKmNiovua957pTD0+U0LkIQce
 9LPF80xhFVbW5plr33wT/evXMsecA69c711K4QGMaeojIwv/kS0rmf8OWnK29nna7p7j
 yDOhtS8TYegh5mxfQLxgz3sIQ9ytPE0l50YxhWCwWrb70BNzXZeMEGVJEXywwgmTDNrm
 ibPr80Y6RHQZbzzO/0bc5ynJtaF3810ZAjrtR4wAja3G7M+Mcg6EmybKHNQKsOCpTN0x
 Bn4Q==
X-Gm-Message-State: AOAM532jPweRJsDkh44J1o+U/XSH99kicrxCXmn5SHoM8A6bB4QbhsSw
 /YvuenqDhoCygaSrWUVW3V4ol6VE1ojbMrmiDIq67LS+HTOzk4ONJYZE4NI3wF0ujxo6ZAKivRy
 TbTr0z6MeQhU3YN4=
X-Received: by 2002:adf:f243:: with SMTP id b3mr21415037wrp.60.1633961330550; 
 Mon, 11 Oct 2021 07:08:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDyarjUzpVBhtZ3+aUITMw/Sap7Xw0bYSOTwmDyP9SigUfHJKgq/qS7/bkT/wPjK+tDcX5Sg==
X-Received: by 2002:adf:f243:: with SMTP id b3mr21414997wrp.60.1633961330342; 
 Mon, 11 Oct 2021 07:08:50 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id c15sm7982105wrs.19.2021.10.11.07.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 07:08:50 -0700 (PDT)
Message-ID: <e34673dc-ef79-a039-6165-85b5f149d10f@redhat.com>
Date: Mon, 11 Oct 2021 16:08:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] vmdk: allow specification of tools version
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas.weissschuh.ext@zeiss.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
References: <20210913130419.13241-1-thomas.weissschuh.ext@zeiss.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20210913130419.13241-1-thomas.weissschuh.ext@zeiss.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org, thomas@t-8ch.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.09.21 15:04, Thomas Weißschuh wrote:
> VMDK files support an attribute that represents the version of the guest
> tools that are installed on the disk.
> This attribute is used by vSphere before a machine has been started to
> determine if the VM has the guest tools installed.
> This is important when configuring "Operating system customizations" in
> vSphere, as it checks for the presence of the guest tools before
> allowing those customizations.
> Thus when the VM has not yet booted normally it would be impossible to
> customize it, therefore preventing a customized first-boot.
>
> The attribute should not hurt on disks that do not have the guest tools
> installed and indeed the VMware tools also unconditionally add this
> attribute.
> (Defaulting to the value "2147483647", as is done in this patch)
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh.ext@zeiss.com>
> ---
>
> v1: https://lore.kernel.org/qemu-devel/20210908174250.12946-1-thomas.weissschuh.ext@zeiss.com/
>
> v1 -> v2:
> * Expand QAPI docs (Eric Blake)
>
>   block/vmdk.c         | 24 ++++++++++++++++++++----
>   qapi/block-core.json |  3 +++
>   2 files changed, 23 insertions(+), 4 deletions(-)

[...]

> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index c8ce1d9d5d..42431f52d0 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -4597,6 +4597,8 @@
>   # @adapter-type: The adapter type used to fill in the descriptor. Default: ide.
>   # @hwversion: Hardware version. The meaningful options are "4" or "6".
>   #             Default: "4".
> +# @toolsversion: VMware guest tools version.
> +                 Default: "2147483647" (Since 6.2)

There’s a # missing at the start of the line, and so this doesn’t compile.

I’ve added it (hope that’s OK for you) and taken this patch to my block 
branch:

https://gitlab.com/hreitz/qemu/-/commits/block/

Hanna


