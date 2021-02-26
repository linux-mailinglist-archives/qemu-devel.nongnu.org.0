Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3354325DE8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 08:06:24 +0100 (CET)
Received: from localhost ([::1]:57936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFXCh-0002nI-Qy
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 02:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lFXAf-00018e-Du
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 02:04:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lFXAd-0002fx-3Y
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 02:04:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614323053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6WzyRFK5f71jLN0VA00MRT10BPs7vRW7ryKNwaqb+8=;
 b=aZhetpglVGIeUTfDIYcZv6zRhzcl7dYv9OHFdCD8bwY++ZrzI4DF8twSqkLKFUrv4Zs2Rw
 WcZOFLwcPC88xdzJPkohXKMxdx/2nh5Zt3aHFMV2QbHBhzmEcn5jMEU+zdmiLtxcktx4rY
 7EqTfOCIcuGyC8hBhcjlOVl3E9aFDX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-F_lGky4uNCmWDFYElyxphw-1; Fri, 26 Feb 2021 02:04:11 -0500
X-MC-Unique: F_lGky4uNCmWDFYElyxphw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 094B2185A0C9;
 Fri, 26 Feb 2021 07:04:10 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-208.pek2.redhat.com
 [10.72.12.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C2635D9C6;
 Fri, 26 Feb 2021 07:04:08 +0000 (UTC)
Subject: Re: [PATCH 3/6] dp8393x: switch to use qemu_receive_packet() for
 loopback packet
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-4-jasowang@redhat.com>
 <70f3456c-1f3b-8a14-8c51-a0b7dff5f048@weilnetz.de>
 <fdd95814-c3d9-3c93-466a-5846da8e10e5@redhat.com>
 <326a7231-d5f1-5f08-eac3-8fd23f154c66@weilnetz.de>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ccee5b7e-62e8-ef84-51fe-dd9e98bd02f5@redhat.com>
Date: Fri, 26 Feb 2021 15:04:07 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <326a7231-d5f1-5f08-eac3-8fd23f154c66@weilnetz.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/25 10:42 下午, Stefan Weil wrote:
> Am 25.02.21 um 15:36 schrieb Philippe Mathieu-Daudé:
>
>> On 2/24/21 7:13 AM, Stefan Weil wrote:
>>> Am 24.02.21 um 06:53 schrieb Jason Wang:
>>>
>>>> This patch switches to use qemu_receive_packet() which can detect
>>>> reentrancy and return early.
>>>>
>>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>>> ---
>>>>    hw/net/dp8393x.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
>>>> index 205c0decc5..019d4fe435 100644
>>>> --- a/hw/net/dp8393x.c
>>>> +++ b/hw/net/dp8393x.c
>>>> @@ -506,7 +506,7 @@ static void
>>>> dp8393x_do_transmit_packets(dp8393xState *s)
>>>>                s->regs[SONIC_TCR] |= SONIC_TCR_CRSL;
>>>>                if (nc->info->can_receive(nc)) {
>>>>                    s->loopback_packet = 1;
>>>> -                nc->info->receive(nc, s->tx_buffer, tx_len);
>>>> +                qemu_receice_packet(nc, s->tx_buffer, tx_Len);
>>>
>>> Did you test compilation of that code? It looks like a typo ...
>> With typo fixed:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>
>
> Plural, as I noticed later: there are two typos in the same line of 
> code. The compiler will report both of them.
>
> Stefan


Yes, my bad. Will post V2.

Thanks


