Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175EF5E5F7F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:12:20 +0200 (CEST)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJBk-00039I-HF
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1obIGg-0005AR-KF
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:13:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1obIGc-000576-VS
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663837989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCHaqdSf2in4H08eTHdQtq8LMHqIviUAgesSjaxcROI=;
 b=hFSRRKZIPRqFQO7f3vhlhHx2qHWXhFpfX16+kNNa2TMAvc14rAG0fD2y+so4Vyv8A0Vvrh
 213Z7CxWrXjEZkOMQvQuTAnDjFjFrUhoa2GAzmQls5xXsa6ihLtLAM0sKZ1IPDU4zJ7s15
 2gJtIno+5nKLZLbKJWexvP8YEDZ93+c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-210-17xELTGPPJyUPiCdLrVCCA-1; Thu, 22 Sep 2022 05:13:08 -0400
X-MC-Unique: 17xELTGPPJyUPiCdLrVCCA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso3059168wra.1
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 02:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZCHaqdSf2in4H08eTHdQtq8LMHqIviUAgesSjaxcROI=;
 b=EwSgP28a2e/5n9Wu+QMS8+Wd/xKEfDTzh55LbqhcFfJKMRN9HJzn+DxOT9AHsLaWeg
 +O8EiVyUpUo5CF5ivRH6eA316oGRtpuaMSzSNAjSjqF/d6uFdVmsOLJ7yzV62OP197Xg
 TYpx8hTvCVllWRgHb11XwCoPYlfc3hgugLqKa82dX0XgxUYxLbkYV6Xu04oWUtKAbFCy
 SZsGj1nNXJl/iS9FwoVE1bJNUx52xqCFfz3lffgkKggx6+6yeWGBAGX7rk2k9fybF+yp
 /OE52aVPthBtgung7WyJ3UoWo6QFXpSS7PpxWAoO8s/KaZ85zXp98lxAbiDAV5erznjg
 dJ/A==
X-Gm-Message-State: ACrzQf1YymmUjr4Ifk1mTO4oaPCA5y/ji6Qxp86zNZtM6QOzV5GZm8GR
 1RGVI9PKbAmIPYnA0H96SgEqhtN89pzDEzs+gpNDv83DxKMp67f85NVoBAgKpTv6/k4B40qFqiV
 0R+wVEYIGQkTqHqY=
X-Received: by 2002:a5d:6c62:0:b0:22a:2f91:b99f with SMTP id
 r2-20020a5d6c62000000b0022a2f91b99fmr1296199wrz.124.1663837987194; 
 Thu, 22 Sep 2022 02:13:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6htw6J860hoPm1NyV/SSsrtVCbQYiC/iC2PHyKl4r2nf1fH5cDNDVFt55166P+1QCSshH6NA==
X-Received: by 2002:a5d:6c62:0:b0:22a:2f91:b99f with SMTP id
 r2-20020a5d6c62000000b0022a2f91b99fmr1296177wrz.124.1663837986954; 
 Thu, 22 Sep 2022 02:13:06 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003a5c999cd1asm7231580wms.14.2022.09.22.02.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 02:13:06 -0700 (PDT)
Message-ID: <68a362a2-33e0-c41c-1871-d22338b5a4a0@redhat.com>
Date: Thu, 22 Sep 2022 11:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8 13/14] net: stream: move to QIO
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-14-lvivier@redhat.com> <87mtasai57.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87mtasai57.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.702, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/22 16:58, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> Use QIOChannel, QIOChannelSocket and QIONetListener.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
> 
> [...]
> 
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index ee2436ae14a7..a0b5b70c80cb 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2732,8 +2732,8 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>       "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
>>       "                configure a network backend to connect to another network\n"
>>       "                using an UDP tunnel\n"
>> -    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
>> -    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path\n"
>> +    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port[,to=maxport][,numeric=on|off][,keep-alive=on|off][,mptcp=on|off][,addr.ipv4=on|off][,addr.ipv6=on|off]\n"
>> +    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path[,abstract=on|off][,tight=on|off]\n"
>>       "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"
>>       "                configure a network backend to connect to another network\n"
>>       "                using a socket connection in stream mode.\n"
> 
> The commit message didn't prepare me for this change.  Could you
> explain?
> 

You're right, I should explain:

moving to QIOChannel allows net/stream to use the all the available parameters provided by 
SocketAddress. They were not listed here before because they were not supported, and as 
they are supported now I have added them in the list.

Thanks,
Laurent


