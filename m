Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFABE6E25D0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:33:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKTh-0005LP-FC; Fri, 14 Apr 2023 10:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKTd-0005L0-25
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:32:37 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKTb-0004I9-GG
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:32:36 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 he11-20020a05600c540b00b003ef6d684102so8380540wmb.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681482753; x=1684074753;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EIZ/mCtgm6aE5FkGCfyoNObg0lzUCvxKBnbR7Q8AVD0=;
 b=IMFRMVkHv+P4KzM1gFZyszQJqjz+hkzFD2+aJeE3AG5w5yV2507GqikiyhnYCUydqV
 ED5Cu0iJ22jP94nexLNhwizN9GqkPDTzOrN307uF+9u2I1DOWzBbrLJBDruB34CiWtl9
 4oae0LMT0I2RIL5J/fP1FS4Gg45Uwk1chv9ryfKi0bXfK1BzWdVes58WzCORnU0bWG9u
 6cZqbou7Wb7cM2iqCLMpBdZtESnOWrvwxoI9lEgxWFbAuaQneYBC+JptBhAU/zNrZXrC
 9O0ELnbFuAjGh1NwazqN38MGESjDcv1sjhmJ2pxG/B3OSBVPaypSnmd9NByNGsyRb8Md
 tjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681482753; x=1684074753;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EIZ/mCtgm6aE5FkGCfyoNObg0lzUCvxKBnbR7Q8AVD0=;
 b=WmNdmU07Mf+rfs4WZvZIJGUgSNlrIx53f0gu8sPqYJzC59VMCDGdLZ3m47v6sj2HDF
 RtDM5sQm+UrgXKjwT4WfjgmuSyxJwAoQ1MHxnl/GD9eT0aOXkqlXVXqlP8bsA49OFL+X
 CtlneWhPIzNOu+XUB0Ju1Du11igKDfxsgIRYFK6vsApdoeJvuLwMOIRhwG7aOfIVqR8s
 dIg1t+2Axlb1BxkAR10oNJ/XVHQ4pC7cQ9Lwz4PThEJbFq3KjJ0mIP/rTuRAodbt1gRT
 LcZcDq1B42AvYaBPBqZmjtYbsBWsYDvuybcEGHKrHMBr5oYg1x3/c0jyDa2ScQ40Z7RP
 BwyQ==
X-Gm-Message-State: AAQBX9dVFKuh+dQK9Iss3nsgdz/IMexrAo16TaA3yBCCNuZrv+X9Yyaf
 7XGTTGWVUfo+ynW8YQKoWyQSFQ==
X-Google-Smtp-Source: AKy350ZXFIG6i1jz58z80nmrS5XsKhoAkjBfY50yUx1H8N8Tva5GrEZC/JQ4YvCIhjiTJ6rCLTAhvA==
X-Received: by 2002:a05:600c:3646:b0:3ed:bc83:3745 with SMTP id
 y6-20020a05600c364600b003edbc833745mr4715034wmq.25.1681482753410; 
 Fri, 14 Apr 2023 07:32:33 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b003f0652084b8sm8116681wms.20.2023.04.14.07.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 07:32:33 -0700 (PDT)
Message-ID: <d5f19502-624d-1271-c043-0546a3b8b229@linaro.org>
Date: Fri, 14 Apr 2023 16:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 04/40] igb: Include the second VLAN tag in the buffer
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-5-akihiko.odaki@daynix.com>
 <08449e5d-4ccc-6eaa-f4d8-d21d0bc23786@linaro.org>
In-Reply-To: <08449e5d-4ccc-6eaa-f4d8-d21d0bc23786@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 14/4/23 16:28, Philippe Mathieu-Daudé wrote:
> On 14/4/23 13:37, Akihiko Odaki wrote:
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/net/igb_core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
>> index 55de212447..f725ab97ae 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -1590,7 +1590,7 @@ static ssize_t
>>   igb_receive_internal(IGBCore *core, const struct iovec *iov, int 
>> iovcnt,
>>                        bool has_vnet, bool *external_tx)
>>   {
>> -    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
>> +    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 8);
> 
> Aren't VLAN tags 16-bit wide? Could you convert this magic value
> to some verbose-but-obvious definitions?

Digging a bit more, is this struct vlan_header?

> Is it worth adding a vlan_tag_t typedef in include/net/eth.h?
> 
>>       uint16_t queues = 0;
>>       uint32_t n = 0;
> 


