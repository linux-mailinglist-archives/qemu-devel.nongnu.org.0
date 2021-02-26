Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B081532612A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 11:22:01 +0100 (CET)
Received: from localhost ([::1]:51242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFaG0-0000Zc-Of
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 05:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFaEq-00005j-9U
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFaEn-0002l8-FS
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614334843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04LQR2YkB8CxpbB2kcQVUcPCa6XoaIARpaNJmqmUxL8=;
 b=fu55BBVSt6qtSA5Lsxfhb7A5o4xbBJILaqoeFwS5+h8SdQZSnU7PC1Z4/AiF3j22ZUx8bW
 mD3lx1Tm+ZqhO4RX0EQG2qbNAx1COdj6wHiyYeAYQIDrtORik1ooi148rlqJ4JJi0Fgq6L
 L4VR4DCejheNZum1mkYdZOqTQrq97G4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-8zXJ0A7nNde-EawiVqEiwQ-1; Fri, 26 Feb 2021 05:20:39 -0500
X-MC-Unique: 8zXJ0A7nNde-EawiVqEiwQ-1
Received: by mail-ej1-f69.google.com with SMTP id n25so4022551ejd.5
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 02:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=04LQR2YkB8CxpbB2kcQVUcPCa6XoaIARpaNJmqmUxL8=;
 b=rhPjK+5kuSm4/8j4AFEAKQ3dCGjsIr8HrjI5nxucLCLHxKi/5rPPe5UeuDAb70uKuv
 yy4F9nZMf7sKpOGz6Abdq2KnRDfv0HA1umAjtmcqG0Pk1MzNDkzIh2WLeqQ3LjmIKxlq
 3azMts0mJ81P3BJkKpMRaRPKHjfosv+Eyrz7otFhpVsUDixaT67w/+cw9k7TsqHP6bYT
 L+E0m0S65vOBAovAK2tdMEJ5Tbfk5J0DHevggndew9k3Vds11lPOPXjhWTbVwCTIvoaY
 +pD+EUiMQzmGF9RHk1snqPK054iCge8PeEI7MridOKcNSpzaHcygelU/KSqwLidzJVmM
 BLfQ==
X-Gm-Message-State: AOAM5304NqqtSnvyGBE0wcTrcA2bXmhiXpH/n7ISok1fbBAC05NIFovd
 mRCvgRUS6Pr1ZAAW6bNKILpeCh+VTQAJ2LT64RqCyxZI8gsqZ7abySmtTxoR334BJlvhE4aNk1O
 Lx/69AJ1q3RIxACs=
X-Received: by 2002:aa7:c599:: with SMTP id g25mr2421601edq.346.1614334838230; 
 Fri, 26 Feb 2021 02:20:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlKfROALupgrRVcH6mwwMiEtALo19uWr/3WkxY7r1YleM8KKE4fiYAeQSyFCrJ2/2VgW3woA==
X-Received: by 2002:aa7:c599:: with SMTP id g25mr2421580edq.346.1614334838052; 
 Fri, 26 Feb 2021 02:20:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t13sm5310500edr.17.2021.02.26.02.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 02:20:37 -0800 (PST)
Subject: Re: [PATCH] net: Print the packet size in the debug output
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
References: <1614332761-72810-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7224f4c3-92bb-2d82-5736-67c2be43cbd0@redhat.com>
Date: Fri, 26 Feb 2021 11:20:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1614332761-72810-1-git-send-email-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 10:46 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Printing out the packet size is helpful during debug.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  net/net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/net.c b/net/net.c
> index 32d71c1..b038370 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -641,7 +641,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>      int ret;
>  
>  #ifdef DEBUG_NET
> -    printf("qemu_send_packet_async:\n");
> +    printf("qemu_send_packet_async: packet size (%d)\n", size);
>      qemu_hexdump(stdout, "net", buf, size);

At this point better to convert to trace events (see commit
db1e7afa371):

        if (trace_event_get_state_backends(TRACE_NET_SEND_PACKET)) {
            net_pkt_hexdump(buf, size);
        }


