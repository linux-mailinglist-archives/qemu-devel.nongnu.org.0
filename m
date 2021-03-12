Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06200339104
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:19:04 +0100 (CET)
Received: from localhost ([::1]:34704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjZ8-00035a-Uv
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lKjU4-0007C7-E1
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:13:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lKjU0-0000Ln-A8
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615562023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTPwpYg6/gYh7vtpyLOpNsCqbw2jSr3RSKXXugYyPPY=;
 b=KbmhWWh5MFLFsbj4sRG7pvwSUYEBGWQfWD7M7+697tvseGmRcqsescMABeqr8m3YNbiSPo
 whXSg0/Y4YU+yXcAfq+ZT9lZnwPHZBias7SUty61df1VVMIx98qlrRlFuQhdp4Hy2/e8Rs
 UxHzs1aXM/DRd99EWruzTIKv/Lkx5YA=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-J9z7YwRqP0q7FMV3y8z6Pw-1; Fri, 12 Mar 2021 10:13:41 -0500
X-MC-Unique: J9z7YwRqP0q7FMV3y8z6Pw-1
Received: by mail-ot1-f72.google.com with SMTP id x60so14857130ota.15
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 07:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RTPwpYg6/gYh7vtpyLOpNsCqbw2jSr3RSKXXugYyPPY=;
 b=AWZx28wNsCwqawZdEZMsGt2Z22MsofK+a7mcGndBYa0aLngJlSsGyi07M56gs1i3NI
 t5kXUAU0uz7vsw3+4znLLgGsxalf5AF9cXNTHjRqRz9LQ7QC3zKcRioce4AeD5DmQsek
 kyW6jpIhhSvejPFQciroXJMAVnruNTDL4B3hToOIIWZz2oAVpbsf+yq+SPcEi5w/NXgm
 WGlDA+ynIepEj7U/Mxk0YYkDrysAXFa6MUuOwq24PUXusxFpZKOdj4k24RpI4IfAgRH1
 qG4EDopvhJs0+6WyG6+BlZ5Fbtq6d2VV4eskN9N9RSHowwYRmbazCQlJZGeYZG4mHrku
 4Tsw==
X-Gm-Message-State: AOAM533798feljgC25hZNKnon/GZfWGBy8UkYBfYCFalrkkjxdaIXox8
 a3/cmWZxydPSD57Ra2MH+W6FQ0s4xLwV1tZj94h778qo4Mt8jLtBDnSbDAUWa+Dhf1Wohtvblgx
 Q/ZJuieYt9mL3fFE=
X-Received: by 2002:aca:484e:: with SMTP id v75mr1047239oia.56.1615562021022; 
 Fri, 12 Mar 2021 07:13:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4eXmfS/lb+J6Ahu8dTvd2Z4tRHJwYhMEP83y1Tyz1bsIyRaZtatuJrAuDgsK66MUe3wWgzA==
X-Received: by 2002:aca:484e:: with SMTP id v75mr1047229oia.56.1615562020883; 
 Fri, 12 Mar 2021 07:13:40 -0800 (PST)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 p3sm1400753otk.9.2021.03.12.07.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 07:13:40 -0800 (PST)
Subject: Re: [Virtio-fs] [PATCH 2/3] virtiofsd: Convert some functions to
 return bool
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20210312141003.819108-1-groug@kaod.org>
 <20210312141003.819108-3-groug@kaod.org>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <0203832e-bed5-cf64-872e-33bffae30674@redhat.com>
Date: Fri, 12 Mar 2021 09:13:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312141003.819108-3-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 8:10 AM, Greg Kurz wrote:
> Both currently only return 0 or 1.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   tools/virtiofsd/passthrough_ll.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 27a6c636dcaf..f63016d35626 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -221,17 +221,17 @@ static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
>   static int xattr_map_client(const struct lo_data *lo, const char *client_name,
>                               char **out_name);
>   
> -static int is_dot_or_dotdot(const char *name)
> +static bool is_dot_or_dotdot(const char *name)
>   {
>       return name[0] == '.' &&
>              (name[1] == '\0' || (name[1] == '.' && name[2] == '\0'));
>   }
>   
>   /* Is `path` a single path component that is not "." or ".."? */
> -static int is_safe_path_component(const char *path)
> +static bool is_safe_path_component(const char *path)
>   {
>       if (strchr(path, '/')) {
> -        return 0;
> +        return false;
>       }
>   
>       return !is_dot_or_dotdot(path);
> 

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


