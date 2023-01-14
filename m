Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4936A66A8CC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 03:59:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGWl7-0007Wl-2g; Fri, 13 Jan 2023 21:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGWl5-0007Wd-UA
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 21:59:03 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGWl4-00040q-5H
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 21:59:03 -0500
Received: by mail-pl1-x631.google.com with SMTP id b17so17738558pld.7
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 18:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zvhDKeCA4NbQ8q9yUwraVUJbXaRqyEiGvTBKOjE2QY0=;
 b=642ePsMctFhW+KEJK82W8a48hKl4fdbSy2hEcNY6g+Xnx36eL5xJHLF6F6b6KROr6y
 7ATLpvwVjBJEnR43zZ7HA/FU2fBp/qW1dI5vSiDZCZrZdSkcOchl+04f83ikKmHIm+qm
 iQjbZI1RKSB5wFoKVI9VXZTHMa/Nwpxo9SEHzKXiGRGEx1BwlhnultFd4kOryHmBRW3U
 elVsFfESkevBlrq3Yp0bjz+B0cJAHYQyzfJkqcYhq7cUBgQ982bRKpSCsnOSPalLwLkm
 KK0o6O1GNnAPrHUFGzRSeyNf/p8H8ov43fYYOw4XmUyRsIsP+RpbZ9+RBifFRpekD4UE
 kJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zvhDKeCA4NbQ8q9yUwraVUJbXaRqyEiGvTBKOjE2QY0=;
 b=BakRrel1TokHt2G1Dh9n6g29g53N7PTE3mCBBSsY8NK3OyMCHUDnmzk8vun9IC96bP
 5cfOo6WhuPVvPvtr1WBNO7hyxVPbLd4ALyL67j8+Jj15Ucep/gSAtQIo+MCmflgHe7Pi
 ibTh+jVpKPXUGRCs14cHGkP7xCpgfE/fDAC+/zbFjacBfwNpmWZudjb6KnLaAikq6Iey
 uBya+wbrncR0IUGn6us2n0kT4KKjHd3BPSOlGJhLx80mtfRiQP9AEAqXq7noHlzdDR/E
 BJQ8SumdBNJ8KINtbs2q4egsLdBSdeVjSOW0O1bJ9VLlh//r+ao6MKB35qkEogzeNhr6
 Kt5g==
X-Gm-Message-State: AFqh2kozGAZanhGUgGY3r0z5eKe/3+bZuF59MbM7AQIluG4PaaZetQil
 yuCQLQsd6D7AqF8ecC4LHZO/qQ==
X-Google-Smtp-Source: AMrXdXu0TvN/XtDwQSFRplzmzo0+uy4Of8MReVFp4Jn2ddZ8C0onUaZ/VlHIUqmb7bwabMfiHlm25w==
X-Received: by 2002:a17:903:2d0:b0:192:b5b3:7ff5 with SMTP id
 s16-20020a17090302d000b00192b5b37ff5mr57494750plk.50.1673665140711; 
 Fri, 13 Jan 2023 18:59:00 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170903120900b00189618fc2d8sm14851784plh.242.2023.01.13.18.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 18:59:00 -0800 (PST)
Message-ID: <a6fe028f-431e-74a2-77f9-fc2dd8be5969@daynix.com>
Date: Sat, 14 Jan 2023 11:58:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] net: Strip virtio-net header when dumping
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>, Luigi Rizzo <rizzo@iet.unipi.it>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Vincenzo Maffione <v.maffione@gmail.com>, qemu-devel@nongnu.org
References: <20230113130833.81458-1-akihiko.odaki@daynix.com>
 <4670e499-1599-95b6-7489-91f60afd40af@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <4670e499-1599-95b6-7489-91f60afd40af@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/01/13 22:40, Philippe Mathieu-Daudé wrote:
> On 13/1/23 14:08, Akihiko Odaki wrote:
>> filter-dump specifiees Ethernet as PCAP LinkType, which does not expect
>> virtio-net header. Having virtio-net header in such PCAP file breaks
>> PCAP unconsumable. Unfortunately currently there is no LinkType for
>> virtio-net so for now strip virtio-net header to convert the output to
>> Ethernet.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   include/net/net.h |  6 ++++++
>>   net/dump.c        | 11 +++++++----
>>   net/net.c         | 18 ++++++++++++++++++
>>   net/netmap.c      |  1 +
>>   net/tap.c         | 16 ++++++++++++++++
>>   5 files changed, 48 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/net/net.h b/include/net/net.h
>> index dc20b31e9f..4b2d72b3fc 100644
>> --- a/include/net/net.h
>> +++ b/include/net/net.h
>> @@ -56,8 +56,10 @@ typedef RxFilterInfo 
>> *(QueryRxFilter)(NetClientState *);
>>   typedef bool (HasUfo)(NetClientState *);
>>   typedef bool (HasVnetHdr)(NetClientState *);
>>   typedef bool (HasVnetHdrLen)(NetClientState *, int);
>> +typedef bool (GetUsingVnetHdr)(NetClientState *);
>>   typedef void (UsingVnetHdr)(NetClientState *, bool);
>>   typedef void (SetOffload)(NetClientState *, int, int, int, int, int);
>> +typedef int (GetVnetHdrLen)(NetClientState *);
>>   typedef void (SetVnetHdrLen)(NetClientState *, int);
>>   typedef int (SetVnetLE)(NetClientState *, bool);
>>   typedef int (SetVnetBE)(NetClientState *, bool);
>> @@ -84,8 +86,10 @@ typedef struct NetClientInfo {
>>       HasUfo *has_ufo;
>>       HasVnetHdr *has_vnet_hdr;
>>       HasVnetHdrLen *has_vnet_hdr_len;
>> +    GetUsingVnetHdr *get_using_vnet_hdr;
> 
> [*]
> 
>>       UsingVnetHdr *using_vnet_hdr;
>>       SetOffload *set_offload;
>> +    GetVnetHdrLen *get_vnet_hdr_len;
>>       SetVnetHdrLen *set_vnet_hdr_len;
>>       SetVnetLE *set_vnet_le;
>>       SetVnetBE *set_vnet_be;
>> @@ -183,9 +187,11 @@ void qemu_format_nic_info_str(NetClientState *nc, 
>> uint8_t macaddr[6]);
>>   bool qemu_has_ufo(NetClientState *nc);
>>   bool qemu_has_vnet_hdr(NetClientState *nc);
>>   bool qemu_has_vnet_hdr_len(NetClientState *nc, int len);
>> +bool qemu_get_using_vnet_hdr(NetClientState *nc);
>>   void qemu_using_vnet_hdr(NetClientState *nc, bool enable);
>>   void qemu_set_offload(NetClientState *nc, int csum, int tso4, int tso6,
>>                         int ecn, int ufo);
> 
>> @@ -153,8 +154,10 @@ static ssize_t 
>> filter_dump_receive_iov(NetFilterState *nf, NetClientState *sndr,
>>                                          int iovcnt, NetPacketSent 
>> *sent_cb)
>>   {
>>       NetFilterDumpState *nfds = FILTER_DUMP(nf);
>> +    int offset = qemu_get_using_vnet_hdr(nf->netdev) ?
>> +                 qemu_get_vnet_hdr_len(nf->netdev) : 0;
>> -    dump_receive_iov(&nfds->ds, iov, iovcnt);
>> +    dump_receive_iov(&nfds->ds, iov, iovcnt, offset);
>>       return 0;
>>   }
>> diff --git a/net/net.c b/net/net.c
>> index 2d01472998..3a95c3ba6a 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -513,6 +513,15 @@ bool qemu_has_vnet_hdr_len(NetClientState *nc, 
>> int len)
>>       return nc->info->has_vnet_hdr_len(nc, len);
>>   }
>> +bool qemu_get_using_vnet_hdr(NetClientState *nc)
>> +{
>> +    if (!nc || !nc->info->get_using_vnet_hdr) {
>> +        return false;
>> +    }
>> +
>> +    return nc->info->get_using_vnet_hdr(nc);
> 
> Per [*], is get_using_vnet_hdr() really useful? Can't we just
> check for using_vnet_hdr != NULL as:

tap allows to disable vnet_hdr by passing false to using_vnet_hdr() so 
we need to ask it whether vnet_hdr is currently enabled or not.

> 
>         return nc->info->using_vnet_hdr != NULL;
> 
>> +}
>> +
>>   void qemu_using_vnet_hdr(NetClientState *nc, bool enable)
>>   {
>>       if (!nc || !nc->info->using_vnet_hdr) {
>> @@ -532,6 +541,15 @@ void qemu_set_offload(NetClientState *nc, int 
>> csum, int tso4, int tso6,
>>       nc->info->set_offload(nc, csum, tso4, tso6, ecn, ufo);
>>   }
>> +int qemu_get_vnet_hdr_len(NetClientState *nc)
>> +{
>> +    if (!nc || !nc->info->get_vnet_hdr_len) {
>> +        return -ENOSYS;
> 
> Does -ENOSYS provides any value? Otherwise we could return 0.

I have just sent v2, which returns 0 here instead. tap returns 0 in case 
vnet_hdr is disabled so this should also return 0.

> 
>> +    }
>> +
>> +    return nc->info->get_vnet_hdr_len(nc);
>> +}
> 
>> diff --git a/net/netmap.c b/net/netmap.c
>> index 9e0cec58d3..ed9c7ec948 100644
>> --- a/net/netmap.c
>> +++ b/net/netmap.c
>> @@ -393,6 +393,7 @@ static NetClientInfo net_netmap_info = {
>>       .has_ufo = netmap_has_vnet_hdr,
>>       .has_vnet_hdr = netmap_has_vnet_hdr,
>>       .has_vnet_hdr_len = netmap_has_vnet_hdr_len,
>> +    .get_using_vnet_hdr = netmap_get_using_vnet_hdr,
> 
> On what is this patch based? I don't have netmap_get_using_vnet_hdr().

This is a mistake; I removed it in v2.

Regards,
Akihiko Odaki

> 
>>       .using_vnet_hdr = netmap_using_vnet_hdr,
>>       .set_offload = netmap_set_offload,
>>       .set_vnet_hdr_len = netmap_set_vnet_hdr_len,
> 

