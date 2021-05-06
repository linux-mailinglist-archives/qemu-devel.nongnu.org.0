Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23319374D81
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:27:02 +0200 (CEST)
Received: from localhost ([::1]:58532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTjB-00086s-70
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leThJ-0007FT-81
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:25:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leThH-0008Oh-Hm
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620267899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0UyFQEWn0IpDk1vKGIpp1NrFbgpHW1NlLLkTrt03XqY=;
 b=ZkDDQ//qegVLyBzRrDViWCPzvTDQopa2TFP0tobfVjgCpFzf0e9nPJjXZmMbf5Id05w2Lz
 VwjrXGO71Iq/SGwQFTDSYlf2eE1uzBeb9DXhekHwBx81roQlpdfUf82+7logTIb2JAdul4
 A4Kx55uttlzGyyh5f3Hpu9b57d9+ew8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-nh-RmmtdPMqIQvVz2JOQXg-1; Wed, 05 May 2021 22:24:57 -0400
X-MC-Unique: nh-RmmtdPMqIQvVz2JOQXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BEFF1800D50;
 Thu,  6 May 2021 02:24:56 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-159.pek2.redhat.com
 [10.72.13.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F6EBBA6F;
 Thu,  6 May 2021 02:24:53 +0000 (UTC)
Subject: Re: [PATCH] hw/net/imx_fec: return 0xffff when accessing non-existing
 PHY
To: Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
References: <20210502160326.1196252-1-linux@roeck-us.net>
 <CAEUhbmWC_jVkrF9V=rs+A2A021ahqefimFtehsxgfvTxphwKZQ@mail.gmail.com>
 <bffabe57-013a-1aca-e854-38a211738049@roeck-us.net>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <982bc15e-1e88-8871-54b4-3dc74f540727@redhat.com>
Date: Thu, 6 May 2021 10:24:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <bffabe57-013a-1aca-e854-38a211738049@roeck-us.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/3 上午12:14, Guenter Roeck 写道:
> On 5/2/21 9:09 AM, Bin Meng wrote:
>> On Mon, May 3, 2021 at 12:03 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>> If a PHY does not exist, attempts to read from it should return 0xffff.
>>> Otherwise the Linux kernel will believe that a PHY is there and select
>>> the non-existing PHY. This in turn will result in network errors later
>>> on since the real PHY is not selected or configured.
>>>
>>> Since reading from or writing to a non-existing PHY is not an emulation
>>> error, replace guest error messages with traces.
>>>
>>> Fixes: 461c51ad4275 ("Add a phy-num property to the i.MX FEC emulator")
>>> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>>   hw/net/imx_fec.c    | 8 +++-----
>>>   hw/net/trace-events | 2 ++
>>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>>> index f03450c028..9c7035bc94 100644
>>> --- a/hw/net/imx_fec.c
>>> +++ b/hw/net/imx_fec.c
>>> @@ -283,9 +283,8 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
>>>       uint32_t phy = reg / 32;
>>>
>>>       if (phy != s->phy_num) {
>>> -        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
>>> -                      TYPE_IMX_FEC, __func__, phy);
>>> -        return 0;
>>> +        trace_imx_phy_read_num(phy, s->phy_num);
>>> +        return 0xffff;
>>>       }
>>>
>>>       reg %= 32;
>>> @@ -345,8 +344,7 @@ static void imx_phy_write(IMXFECState *s, int reg, uint32_t val)
>>>       uint32_t phy = reg / 32;
>>>
>>>       if (phy != s->phy_num) {
>>> -        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
>>> -                      TYPE_IMX_FEC, __func__, phy);
>>> +        trace_imx_phy_write_num(phy, s->phy_num);
>>>           return;
>>>       }
>>>
>>> diff --git a/hw/net/trace-events b/hw/net/trace-events
>>> index baf25ffa7e..ee77238d9e 100644
>>> --- a/hw/net/trace-events
>>> +++ b/hw/net/trace-events
>>> @@ -413,8 +413,10 @@ i82596_set_multicast(uint16_t count) "Added %d multicast entries"
>>>   i82596_channel_attention(void *s) "%p: Received CHANNEL ATTENTION"
>>>
>>>   # imx_fec.c
>>> +imx_phy_read_num(int phy, int configured) "read request from unconfigured phy %d (configured %d)"
>> nits: could we put this below imx_phy_read(), like you put
>> imx_phy_write_num after imx_phy_write?
>>
> Sure, makes sense. I'll wait a bit for other feedback and then resend.


Ok, please send V2.

Thanks


>
>>>   imx_phy_read(uint32_t val, int phy, int reg) "0x%04"PRIx32" <= phy[%d].reg[%d]"
>>>   imx_phy_write(uint32_t val, int phy, int reg) "0x%04"PRIx32" => phy[%d].reg[%d]"
>>> +imx_phy_write_num(int phy, int configured) "write request to unconfigured phy %d (configured %d)"
>>>   imx_phy_update_link(const char *s) "%s"
>>>   imx_phy_reset(void) ""
>>>   imx_fec_read_bd(uint64_t addr, int flags, int len, int data) "tx_bd 0x%"PRIx64" flags 0x%04x len %d data 0x%08x"
>>> --
>> Otherwise,
>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> Tested-by: Bin Meng <bmeng.cn@gmail.com>
>>
> Thanks!
>
> Guenter
>


