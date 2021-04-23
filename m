Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD63368CEB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 08:04:04 +0200 (CEST)
Received: from localhost ([::1]:39998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZov5-0007B7-8U
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 02:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZou8-0006lA-0t
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 02:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZou6-000266-C9
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 02:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619157781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qrJFyHq7DheV8OjQc5dfdDE2w8JF+TvxwNVXbe0uVtU=;
 b=Dw9g+BtiOcsmOkPOVzs596xAaSUgu9IRjIGGLVq1Ya+9YjlaRGff2qcswqYztT7Lw4IUeQ
 Gi7+wx2GPRUx1qFjN+0Yjsql/xHD5RiDZPNQKNJ5OURFZhWOYnaAPynFnK3/tRzKFxt2uj
 y8H+eaQDTD7/mBrES4ApgwSHDhAJFHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-t4-stKNqOeO4HIuXq872WA-1; Fri, 23 Apr 2021 02:02:59 -0400
X-MC-Unique: t4-stKNqOeO4HIuXq872WA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FFD0107ACF5;
 Fri, 23 Apr 2021 06:02:58 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-225.pek2.redhat.com
 [10.72.13.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C4DA1B5AB;
 Fri, 23 Apr 2021 06:02:54 +0000 (UTC)
Subject: Re: [PATCH for 6.0] net: check the existence of peer before trying to
 pad
To: Stefan Weil <sw@weilnetz.de>, samuel.thibault@ens-lyon.org,
 qemu-devel@nongnu.org
References: <20210423031803.1479-1-jasowang@redhat.com>
 <45b74435-2bcd-d6f4-4ada-8d357bd33d4d@weilnetz.de>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cad69b02-f423-ee5a-812d-3eef06260176@redhat.com>
Date: Fri, 23 Apr 2021 14:02:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <45b74435-2bcd-d6f4-4ada-8d357bd33d4d@weilnetz.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, bmeng.cn@gmail.com, philmd@redhat.com,
 crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/4/23 下午1:42, Stefan Weil 写道:
> Am 23.04.21 um 05:18 schrieb Jason Wang:
>
>> There could be case that peer is NULL. This can happen when during
>> network device hot-add where net device needs to be added first. So
>> the patch check the existence of peer before trying to do the pad.
>>
>> Fixes: 969e50b61a285 ("net: Pad short frames to minimum size before 
>> sending from SLiRP/TAP")
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   include/net/net.h | 5 +++++
>>   net/slirp.c       | 2 +-
>>   net/tap-win32.c   | 2 +-
>>   net/tap.c         | 2 +-
>>   4 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/net/net.h b/include/net/net.h
>> index eff24519d2..1ef536d771 100644
>> --- a/include/net/net.h
>> +++ b/include/net/net.h
>> @@ -241,4 +241,9 @@ uint32_t net_crc32_le(const uint8_t *p, int len);
>>       .offset     = vmstate_offset_macaddr(_state, _field), 
> \
>>   }
>>   +static inline bool net_peer_needs_padding(NetClientState *nc)
>> +{
>> +  return nc->peer && !nc->peer->do_not_pad;
>> +}
>> +
>>   #endif
>> diff --git a/net/slirp.c b/net/slirp.c
>> index a01a0fccd3..7a4e96db5c 100644
>> --- a/net/slirp.c
>> +++ b/net/slirp.c
>> @@ -119,7 +119,7 @@ static ssize_t net_slirp_send_packet(const void 
>> *pkt,size_t pkt_len,
>>       uint8_t min_pkt[ETH_ZLEN];
>>       size_t min_pktsz = sizeof(min_pkt);
>>   -    if (!s->nc.peer->do_not_pad) {
>> +    if (net_peer_needs_padding(&s->nc)) {
>>           if (eth_pad_short_frame(min_pkt, &min_pktsz, pkt, pkt_len)) {
>>               pkt = min_pkt;
>>               pkt_len = min_pktsz;
>> diff --git a/net/tap-win32.c b/net/tap-win32.c
>> index 897bd18e32..6096972f5d 100644
>> --- a/net/tap-win32.c
>> +++ b/net/tap-win32.c
>> @@ -696,7 +696,7 @@ static void tap_win32_send(void *opaque)
>>       if (size > 0) {
>>           orig_buf = buf;
>>   -        if (!s->nc.peer->do_not_pad) {
>> +        if (net_peer_needs_padding(&s->nc)) {
>>               if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
>>                   buf = min_pkt;
>>                   size = min_pktsz;
>> diff --git a/net/tap.c b/net/tap.c
>> index 7d53cedaec..820872fde8 100644
>> --- a/net/tap.c
>> +++ b/net/tap.c
>> @@ -203,7 +203,7 @@ static void tap_send(void *opaque)
>>               size -= s->host_vnet_hdr_len;
>>           }
>>   -        if (!s->nc.peer->do_not_pad) {
>> +        if (net_peer_needs_padding(&s->nc)) {
>>               if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
>>                   buf = min_pkt;
>>                   size = min_pktsz;
>
>
> I assume that you had a test case which triggered that null pointer 
> access?


Yes, it's simple to trigger by just adding a tap device and assign an IP 
to that.

Thanks


> If yes, than this should indeed be applied before releasing 6.0.
>
> The modification is simple enough for a last minute change.
>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>
>
>
>


