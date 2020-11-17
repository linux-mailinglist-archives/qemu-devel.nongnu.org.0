Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B262B5D2B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:45:56 +0100 (CET)
Received: from localhost ([::1]:37420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keyUl-0004Rm-IV
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1keyTR-0003pg-HA; Tue, 17 Nov 2020 05:44:33 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1keyTP-0002ny-NN; Tue, 17 Nov 2020 05:44:33 -0500
Received: by mail-wm1-x342.google.com with SMTP id 19so2767582wmf.1;
 Tue, 17 Nov 2020 02:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jaCOlxWJfUEFGIdyNcvvPL/0r3MhFcqAXX1Hl2EgO2c=;
 b=WQchmgeoZWk7ee4Oq6l1wEdgAWhPaSijXE6ml9/oDKdUVDh9nKqkiPxzxLC435cEhU
 Pi/2eS0d/To0+A2aU1IETk88/ZfbYrewo6W8jkNOF7JmqSAabcEYCQ7GRnaJy3hu7BQP
 1TnVZMXQ7IVsloNCWYZEs05emeYPcGBdF8mZCzO4YIDphLp8fUjJnlmVD6W5JZTBB1tP
 XQ4wApZM69g/qlAQ3gAHFXZxGnpuB6IvFt0319DYVHfDMSMdiWTlz0aWFX2LQcu9Mz1g
 3Gs61heRNU2EVaxjaVRQCO/foWtLaDNTHAE401/ePRAGDClS1q2a9UseOKGmxgfHy5gw
 6afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jaCOlxWJfUEFGIdyNcvvPL/0r3MhFcqAXX1Hl2EgO2c=;
 b=WnUNBKSzrGoFDs1ix8omWMDCfKpMnU4bd2bpRiPqvGO2ywvTopofYXGl+W9jW6TRhe
 BnBtxLSzOmpcBOLYy9po36N9A97esj+Lp/PZzRrKXZMSBSgsfAcqFIzENhUqFXaj+uw3
 DyjECsNNSYJWQIDAMrkHd3UsLpxJqtk8ob+5rMslAtyUeB3pJqsGu20QKgm9gychQVTj
 wqx6rtRqIpv6YzJt9LYbvBKgFpmfDOEgewthaXXWAyxbf7u9SST6AK/uphVo7a5n/sbd
 5yfsLKXccU0mOR9pce7h4nK02RgNm8WuKJ3qapJ85jPhWqmP1dVEAqcI8qR1t/cO6GMS
 zfgA==
X-Gm-Message-State: AOAM531Egtd9RkKLXY4cFHHnLdaAYD8Ivo3TmiqpJEMYFnkzsfSaL3un
 OdDn8JunHm/RcN47qP2Yh/F9M1Fvz2s=
X-Google-Smtp-Source: ABdhPJzqwedsfCz1SgyhWvrrPu61++soatp8vUVX52IozqLzIpX1lu4/nDpV61DmNII/4nPA2vlZxA==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr3793314wmj.112.1605609868487; 
 Tue, 17 Nov 2020 02:44:28 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id c187sm3388159wmd.23.2020.11.17.02.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 02:44:27 -0800 (PST)
Subject: Re: [PATCH] hw/sd: Fix 2 GiB card CSD register values
To: Bin Meng <bmeng.cn@gmail.com>
References: <20201025152357.11865-1-bmeng.cn@gmail.com>
 <10ba2a1c-4e8d-a860-2e8d-99dd32e61c9e@amsat.org>
 <CAEUhbmUSYd4gz0Egs8zSCUhk9Y0CqP4c6cBePmT08zfYxxQ_DA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9d1737ca-6a1c-d25a-d214-2b4105d4542a@amsat.org>
Date: Tue, 17 Nov 2020 11:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUSYd4gz0Egs8zSCUhk9Y0CqP4c6cBePmT08zfYxxQ_DA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/20 2:40 AM, Bin Meng wrote:
> Hi Philippe,
> 
> On Mon, Oct 26, 2020 at 2:56 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 10/25/20 4:23 PM, Bin Meng wrote:
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> Per the SD spec, to indicate a 2 GiB card, BLOCK_LEN shall be 1024
>>> bytes, hence the READ_BL_LEN field in the CSD register shall be 10
>>> instead of 9.
>>>
>>> This fixes the acceptance test error for the NetBSD 9.0 test of the
>>> Orange Pi PC that has an expanded SD card image of 2 GiB size.
>>>
>>> Fixes: 6d2d4069c47e ("hw/sd: Correct the maximum size of a Standard Capacity SD Memory Card")
>>> Reported-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>> ---
>>>
>>>   hw/sd/sd.c | 15 +++++++++++----
>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>>> index bd10ec8fc4..732fcb5ff0 100644
>>> --- a/hw/sd/sd.c
>>> +++ b/hw/sd/sd.c
>>> @@ -386,10 +386,17 @@ static const uint8_t sd_csd_rw_mask[16] = {
>>>
>>>   static void sd_set_csd(SDState *sd, uint64_t size)
>>>   {
>>> -    uint32_t csize = (size >> (CMULT_SHIFT + HWBLOCK_SHIFT)) - 1;
>>> +    int hwblock_shift = HWBLOCK_SHIFT;
>>> +    uint32_t csize;
>>>       uint32_t sectsize = (1 << (SECTOR_SHIFT + 1)) - 1;
>>>       uint32_t wpsize = (1 << (WPGROUP_SHIFT + 1)) - 1;
>>>
>>> +    /* To indicate 2 GiB card, BLOCK_LEN shall be 1024 bytes */
>>> +    if (size == SDSC_MAX_CAPACITY) {
>>> +        hwblock_shift += 1;
>>
>> This is going in the good direction, however now we have an huge
>> security hole, as SDState::data[] is 512 bytes, and you announce the
>> guest it can use 1024 bytes. See sd_blk_read() and sd_blk_write().
> 
> Currently sd_normal_command() ensures that the maximum block length is
> 512 bytes as the response to cmd 16.
> 
> The spec also says in chapter4.3.2 2 GByte Card:
> 
> "However, the Block Length, set by CMD16, shall be up to 512 bytes to
> keep consistency with 512 bytes Maximum Block Length cards (Less than
> or equal 2GBytes cards).
> 
> I don't see any issue here. Am I missing anything?

You are not missing anything, I was confused by the spec.

Patch applied.

Regards,

Phil.

