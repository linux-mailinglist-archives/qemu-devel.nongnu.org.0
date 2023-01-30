Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18746681536
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 16:38:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMWDF-0001Rd-LY; Mon, 30 Jan 2023 10:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMWDD-0001R9-DM
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:36:51 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMWDA-00084x-CU
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:36:51 -0500
Received: by mail-pj1-x1032.google.com with SMTP id mi9so2268790pjb.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 07:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8irLA1x4hwpw2d0BP1UCnLNDX5vR/27XKwjEsMNk+PU=;
 b=6C/bUJUSNyIMSIv1WNXjUAq5ubvkiSs67eW+W1xWMD1+a0/Spb5IvRdsLFKdBPO/oY
 jN20+sCwf0MmvvMYMUxgIk5Sx+bBceKVbyMLxTTLTLYBM1WUuHI9ZOkjljXuzKqYsgig
 fIJU49SWKW0l5UCpy1CRh9ktsfNi6wjl7xw1jPaYNxwD6gdD8c9zw1NfD8Y75gzVLtc1
 /P72Zn+gm3T754W00tsMbf2RX2fdg1yjVEqdkTTCr1aBBn7G5epUat7KoJ7Mv0BPZDyh
 IYUstCX+oh6OA6ZpmSEZzyFxs7rkoQsWhfU+6PmuZ9I8SU0VvVDmz5p5KxG94EkHLuj1
 A8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8irLA1x4hwpw2d0BP1UCnLNDX5vR/27XKwjEsMNk+PU=;
 b=pwF2DSu1RlYfYactVGqzBlytfcIuCLDXjFm3wsh21JKqr4A5lA900DqsN9bE/EsZQr
 L76l2m9Wy+kBkyP5sUC3Aj9P5HDBzs+ckZEunzioldo5MOsDp6OcEIzTAcpfNOnRw/OZ
 VHIgA/v9vWEUNFpKcTUi/RBkUYEnog8Vq1I4bFx6MwMxYkKu5d7oedwmK7GQFzLC+y4q
 BYwcI+ASVQXl0X7FRhKGCy2QJCJK9JsFI4+P7itKhMhpi/VJqlzapcVJQ6oqOnHuNJbG
 qy/sJPPNI7zemOs+cPE9fL1FWynaJ/ni/FCKMkFHwbeI6ZD7jkRl876Q7x5fhh/m468t
 dETQ==
X-Gm-Message-State: AO0yUKUyq8YQyWT6eEEgxxBqwSyKqJkcDdNEMBxKxOJtmsez9mMrMlTY
 iBW44XJAJYr/UTnVWXeELuobng==
X-Google-Smtp-Source: AK7set/v0OOhB3Ky8astqweZnidw+iCKyfbzmZJzJViUu5O5W1lGzxkaYWXSgTOMikDGLZr64XHYvw==
X-Received: by 2002:a17:903:1251:b0:196:f82:14b7 with SMTP id
 u17-20020a170903125100b001960f8214b7mr32550372plh.37.1675093002212; 
 Mon, 30 Jan 2023 07:36:42 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170902fe0c00b00189f2fdc178sm7919112plj.177.2023.01.30.07.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 07:36:41 -0800 (PST)
Message-ID: <2b7d65e9-5928-8038-34f2-03fc2ee6a819@daynix.com>
Date: Tue, 31 Jan 2023 00:36:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 20/28] net: Strip virtio-net header when dumping
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
 <20230130134715.76604-21-akihiko.odaki@daynix.com>
 <20230130101211-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230130101211-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2023/01/31 0:12, Michael S. Tsirkin wrote:
> On Mon, Jan 30, 2023 at 10:47:07PM +0900, Akihiko Odaki wrote:
>> filter-dump specifiees Ethernet as PCAP LinkType, which does not expect
>> virtio-net header. Having virtio-net header in such PCAP file breaks
>> PCAP unconsumable. Unfortunately currently there is no LinkType for
>> virtio-net so for now strip virtio-net header to convert the output to
>> Ethernet.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> Probably means you need to calculate checksums and split gso too right?

It was not necessary in my case as I used Wireshark and it tolerates 
wrong checksums and large packets (it even says "Checksum incorrect 
[maybe caused by 'TCP checksum offload'?]"). It was even more helpful to 
have raw packets instead of transformed packets for debugging purposes. 
Perhaps an option to transform packets may be added later if a need arises.

> 
>> ---
>>   include/net/net.h |  6 ++++++
>>   net/dump.c        | 11 +++++++----
>>   net/net.c         | 18 ++++++++++++++++++
>>   net/tap.c         | 16 ++++++++++++++++
>>   4 files changed, 47 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/net/net.h b/include/net/net.h
>> index dc20b31e9f..4b2d72b3fc 100644
>> --- a/include/net/net.h
>> +++ b/include/net/net.h
>> @@ -56,8 +56,10 @@ typedef RxFilterInfo *(QueryRxFilter)(NetClientState *);
>>   typedef bool (HasUfo)(NetClientState *);
>>   typedef bool (HasVnetHdr)(NetClientState *);
>>   typedef bool (HasVnetHdrLen)(NetClientState *, int);
>> +typedef bool (GetUsingVnetHdr)(NetClientState *);
>>   typedef void (UsingVnetHdr)(NetClientState *, bool);
>>   typedef void (SetOffload)(NetClientState *, int, int, int, int, int);
>> +typedef int (GetVnetHdrLen)(NetClientState *);
>>   typedef void (SetVnetHdrLen)(NetClientState *, int);
>>   typedef int (SetVnetLE)(NetClientState *, bool);
>>   typedef int (SetVnetBE)(NetClientState *, bool);
>> @@ -84,8 +86,10 @@ typedef struct NetClientInfo {
>>       HasUfo *has_ufo;
>>       HasVnetHdr *has_vnet_hdr;
>>       HasVnetHdrLen *has_vnet_hdr_len;
>> +    GetUsingVnetHdr *get_using_vnet_hdr;
>>       UsingVnetHdr *using_vnet_hdr;
>>       SetOffload *set_offload;
>> +    GetVnetHdrLen *get_vnet_hdr_len;
>>       SetVnetHdrLen *set_vnet_hdr_len;
>>       SetVnetLE *set_vnet_le;
>>       SetVnetBE *set_vnet_be;
>> @@ -183,9 +187,11 @@ void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6]);
>>   bool qemu_has_ufo(NetClientState *nc);
>>   bool qemu_has_vnet_hdr(NetClientState *nc);
>>   bool qemu_has_vnet_hdr_len(NetClientState *nc, int len);
>> +bool qemu_get_using_vnet_hdr(NetClientState *nc);
>>   void qemu_using_vnet_hdr(NetClientState *nc, bool enable);
>>   void qemu_set_offload(NetClientState *nc, int csum, int tso4, int tso6,
>>                         int ecn, int ufo);
>> +int qemu_get_vnet_hdr_len(NetClientState *nc);
>>   void qemu_set_vnet_hdr_len(NetClientState *nc, int len);
>>   int qemu_set_vnet_le(NetClientState *nc, bool is_le);
>>   int qemu_set_vnet_be(NetClientState *nc, bool is_be);
>> diff --git a/net/dump.c b/net/dump.c
>> index 6a63b15359..7d05f16ca7 100644
>> --- a/net/dump.c
>> +++ b/net/dump.c
>> @@ -61,12 +61,13 @@ struct pcap_sf_pkthdr {
>>       uint32_t len;
>>   };
>>   
>> -static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
>> +static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt,
>> +                                int offset)
>>   {
>>       struct pcap_sf_pkthdr hdr;
>>       int64_t ts;
>>       int caplen;
>> -    size_t size = iov_size(iov, cnt);
>> +    size_t size = iov_size(iov, cnt) - offset;
>>       struct iovec dumpiov[cnt + 1];
>>   
>>       /* Early return in case of previous error. */
>> @@ -84,7 +85,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
>>   
>>       dumpiov[0].iov_base = &hdr;
>>       dumpiov[0].iov_len = sizeof(hdr);
>> -    cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
>> +    cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, offset, caplen);
>>   
>>       if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
>>           error_report("network dump write error - stopping dump");
>> @@ -153,8 +154,10 @@ static ssize_t filter_dump_receive_iov(NetFilterState *nf, NetClientState *sndr,
>>                                          int iovcnt, NetPacketSent *sent_cb)
>>   {
>>       NetFilterDumpState *nfds = FILTER_DUMP(nf);
>> +    int offset = qemu_get_using_vnet_hdr(nf->netdev) ?
>> +                 qemu_get_vnet_hdr_len(nf->netdev) : 0;
>>   
>> -    dump_receive_iov(&nfds->ds, iov, iovcnt);
>> +    dump_receive_iov(&nfds->ds, iov, iovcnt, offset);
>>       return 0;
>>   }
>>   
>> diff --git a/net/net.c b/net/net.c
>> index 2d01472998..03f17de5fc 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -513,6 +513,15 @@ bool qemu_has_vnet_hdr_len(NetClientState *nc, int len)
>>       return nc->info->has_vnet_hdr_len(nc, len);
>>   }
>>   
>> +bool qemu_get_using_vnet_hdr(NetClientState *nc)
>> +{
>> +    if (!nc || !nc->info->get_using_vnet_hdr) {
>> +        return false;
>> +    }
>> +
>> +    return nc->info->get_using_vnet_hdr(nc);
>> +}
>> +
>>   void qemu_using_vnet_hdr(NetClientState *nc, bool enable)
>>   {
>>       if (!nc || !nc->info->using_vnet_hdr) {
>> @@ -532,6 +541,15 @@ void qemu_set_offload(NetClientState *nc, int csum, int tso4, int tso6,
>>       nc->info->set_offload(nc, csum, tso4, tso6, ecn, ufo);
>>   }
>>   
>> +int qemu_get_vnet_hdr_len(NetClientState *nc)
>> +{
>> +    if (!nc || !nc->info->get_vnet_hdr_len) {
>> +        return 0;
>> +    }
>> +
>> +    return nc->info->get_vnet_hdr_len(nc);
>> +}
>> +
>>   void qemu_set_vnet_hdr_len(NetClientState *nc, int len)
>>   {
>>       if (!nc || !nc->info->set_vnet_hdr_len) {
>> diff --git a/net/tap.c b/net/tap.c
>> index 7d7bc1dc5f..1bf085d422 100644
>> --- a/net/tap.c
>> +++ b/net/tap.c
>> @@ -255,6 +255,13 @@ static bool tap_has_vnet_hdr_len(NetClientState *nc, int len)
>>       return !!tap_probe_vnet_hdr_len(s->fd, len);
>>   }
>>   
>> +static int tap_get_vnet_hdr_len(NetClientState *nc)
>> +{
>> +    TAPState *s = DO_UPCAST(TAPState, nc, nc);
>> +
>> +    return s->host_vnet_hdr_len;
>> +}
>> +
>>   static void tap_set_vnet_hdr_len(NetClientState *nc, int len)
>>   {
>>       TAPState *s = DO_UPCAST(TAPState, nc, nc);
>> @@ -268,6 +275,13 @@ static void tap_set_vnet_hdr_len(NetClientState *nc, int len)
>>       s->host_vnet_hdr_len = len;
>>   }
>>   
>> +static bool tap_get_using_vnet_hdr(NetClientState *nc)
>> +{
>> +    TAPState *s = DO_UPCAST(TAPState, nc, nc);
>> +
>> +    return s->using_vnet_hdr;
>> +}
>> +
>>   static void tap_using_vnet_hdr(NetClientState *nc, bool using_vnet_hdr)
>>   {
>>       TAPState *s = DO_UPCAST(TAPState, nc, nc);
>> @@ -372,8 +386,10 @@ static NetClientInfo net_tap_info = {
>>       .has_ufo = tap_has_ufo,
>>       .has_vnet_hdr = tap_has_vnet_hdr,
>>       .has_vnet_hdr_len = tap_has_vnet_hdr_len,
>> +    .get_using_vnet_hdr = tap_get_using_vnet_hdr,
>>       .using_vnet_hdr = tap_using_vnet_hdr,
>>       .set_offload = tap_set_offload,
>> +    .get_vnet_hdr_len = tap_get_vnet_hdr_len,
>>       .set_vnet_hdr_len = tap_set_vnet_hdr_len,
>>       .set_vnet_le = tap_set_vnet_le,
>>       .set_vnet_be = tap_set_vnet_be,
>> -- 
>> 2.39.1
> 

