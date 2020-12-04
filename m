Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1481A2CF6C8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:33:43 +0100 (CET)
Received: from localhost ([::1]:37546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJe2-0007eK-4i
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klJZC-0004p3-Qo
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:28:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klJZA-00008c-Gi
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607120917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ywfLoS2R1ZNQj4sOSxq9bk871Lp78Gw1xhYE1L968Qk=;
 b=OQBgP8M/eKLE+q99oP3SgBMhHhJzHzVRUVo5csxdWarHrEg9Za5cBgrD2FqrbpJzVSVD5T
 xWWoQNxM7xmiP5bBQGzw/etCb6vedOgdhxVMW66qcTDRb7m/pGRhYJ1b2Zm5/vHOr0cmgz
 TlFOvYm78sDk8yt50rBbhLrup5jrcUw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-tITj4hEfNCGwWc7fs7Iaqg-1; Fri, 04 Dec 2020 17:28:35 -0500
X-MC-Unique: tITj4hEfNCGwWc7fs7Iaqg-1
Received: by mail-ej1-f69.google.com with SMTP id lw15so1106858ejb.7
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 14:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ywfLoS2R1ZNQj4sOSxq9bk871Lp78Gw1xhYE1L968Qk=;
 b=pFsCKWjJzqcOAiT3PT6H2s28PjFo1ZbwB3h9O8hPeBgHjmKEBWOfGdlErrBUCr0py5
 MZk/4meKPj0rFyccA2ZtShFK2gQvHe5Zlf32G5XTUPEQ5zeCOYSDfBv9lMS2bORnyHLj
 X/h7ttx4sM2rZF+hAMYQ4gbZg55oirRSsoVoT6PHW49aYasMMFi0py5Gg9rBCnzmheT6
 wSchBVAInSdIdCO2PqXJtBN++Tq3AAsDIUedqtOG4QgbpavLqSbxJLWE5yGCik3Ng54i
 +rhQ2qaFp18xcJRGKFLWi1hOnNm389CAvUZLF+VCgSL5ZgKIaLK35t9fYu1BdE9k71yY
 jm9A==
X-Gm-Message-State: AOAM532KVlqTVGKgzIUOtM8H21p9UQUh+rw2uLMaGg883EwKvXShYjFM
 BoZ37H/1AP/dmHhqdQ/DXp5sGKzH7jyj8ACrJeHGEPu2gdXf8m0c6GPtK3NWJmcb0qDzzZ878NO
 EQVNNbM1X1umdty0=
X-Received: by 2002:a17:907:3f9e:: with SMTP id
 hr30mr9157960ejc.258.1607120914437; 
 Fri, 04 Dec 2020 14:28:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUwrCyGC9bgCVU/rAUs0XPg8A6FTxnq9dGYQIstXtX+5OtNKt40Ol9nDteRHL7r1wj0lxZOg==
X-Received: by 2002:a17:907:3f9e:: with SMTP id
 hr30mr9157948ejc.258.1607120914296; 
 Fri, 04 Dec 2020 14:28:34 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id b21sm4282393edr.53.2020.12.04.14.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 14:28:33 -0800 (PST)
Subject: Re: [PATCH] block/nvme: Do not allow image creation with NVMe block
 driver
To: qemu-devel@nongnu.org
References: <20201204165724.2647357-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d1deeab3-251f-5081-7d45-0092b381bc5a@redhat.com>
Date: Fri, 4 Dec 2020 23:28:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201204165724.2647357-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Xueqiang Wei <xuwei@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 5:57 PM, Philippe Mathieu-Daudé wrote:
> The NVMe driver does not support image creation.
> The full drive has to be passed to the guest.
> 
> Before:
> 
>   $ qemu-img create -f raw nvme://0000:04:00.0/1 20G
>   Formatting 'nvme://0000:04:00.0/1', fmt=raw size=21474836480
> 
>   $ qemu-img info nvme://0000:04:00.0/1
>   image: nvme://0000:04:00.0/1
>   file format: raw
>   virtual size: 349 GiB (375083606016 bytes)
>   disk size: unavailable
> 
> After:
> 
>   $ qemu-img create -f raw nvme://0000:04:00.0/1 20G
>   qemu-img: nvme://0000:04:00.0/1: Protocol driver 'nvme' does not support image creation
> 
> Fixes: 5a5e7f8cd86 ("block: trickle down the fallback image creation function use to the block drivers")
> Reported-by: Xueqiang Wei <xuwei@redhat.com>
> Suggested-by: Max Reitz <mreitz@redhat.com>

Well Max didn't suggest the change but pointed me to commit 5a5e7f8cd86.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  block/nvme.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index a06a188d530..73ddf837c2b 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -1515,9 +1515,6 @@ static BlockDriver bdrv_nvme = {
>      .protocol_name            = "nvme",
>      .instance_size            = sizeof(BDRVNVMeState),
>  
> -    .bdrv_co_create_opts      = bdrv_co_create_opts_simple,
> -    .create_opts              = &bdrv_create_opts_simple,
> -
>      .bdrv_parse_filename      = nvme_parse_filename,
>      .bdrv_file_open           = nvme_file_open,
>      .bdrv_close               = nvme_close,
> 


