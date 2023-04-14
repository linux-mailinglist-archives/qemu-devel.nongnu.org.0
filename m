Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A76E25E0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:36:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKWh-0006TX-Ku; Fri, 14 Apr 2023 10:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKWf-0006TB-0R
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:35:45 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKWW-0005GD-6L
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:35:44 -0400
Received: by mail-wr1-x432.google.com with SMTP id j12so1477696wrd.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 07:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681482933; x=1684074933;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kctvUTDXmxKUDKK7yIYxW2/otmcFLLtRhuWJHJYZlGw=;
 b=SOjJ+JVcYn3in51Qp/3WptvwQCPvGvKfKNlPARHeG0yVlb3cWCOxqE+ItxcjmBlkeq
 /4IhvqgK5YWhjowUMZqOPsi320VcsQIvSOsGowGUYHzzUpQBLgBMmeF1FtPGKb/1h0H+
 ZVoB6mOPiI6ZygnlqMGxHKWq/GKc08dFQsY5A9BMcRXQ9iunshspx3SDKZcHNH5sC+R2
 Y17hXRTMbeM3r8JjdQV626N0bP0xmsBwCkx+9Az/318xzUgTR65R4sqc8RFIsRr8wir7
 gN6piF3jAKroiOHto6AWgIrZmOZgniiJPoX/ber5bCGJH9kc3qKgajXUJt+p2I+6Ei0l
 Wm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681482933; x=1684074933;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kctvUTDXmxKUDKK7yIYxW2/otmcFLLtRhuWJHJYZlGw=;
 b=LYR7/r38N+tujQaCQpe4C1InkALX6+/E1HT0FpU9sqpGB5E3daUT7yk4qXuXPVOzm8
 GU+NqC2eajhHMwWJmhHdwAtN5ZFyklfZ2cO4w8Bhw/ukV2AmxUlp7+FnRgJdrcyFdYCk
 ChImGWrRx0kiJAptnsmMwa9SOl3buWJAhhwbWKDZwbIA/3eBpPQSP6hiTHMmbLvyRN2w
 oD9cpeoIcUBUrWSH0Y16qKrWJL68A66CY5bRH4UxLqRWJ6/B6JwVjOjr/Db0KWwbeBUr
 s31w+KsokaD862+7FfD5hHt/7m+no0FS1MPARFvyvIspQS4PFGb2YabGYFuWFL3EElVP
 bcDQ==
X-Gm-Message-State: AAQBX9cdFAf2+Luv9yVr/fjqfoJGBxre5FDi/90dRG/DiLWIIC+5ss4n
 glD99i+q8aFyix4K1D4iyfbBPg==
X-Google-Smtp-Source: AKy350aKeF6Uz7vYgKTImUHeLbHWjf/H9p8u5NibEY0+CjjvXscDHLW3R+38/p8uXKnUIA/wIHIW0A==
X-Received: by 2002:adf:dfcb:0:b0:2ee:cd5e:903f with SMTP id
 q11-20020adfdfcb000000b002eecd5e903fmr4902469wrn.50.1681482933372; 
 Fri, 14 Apr 2023 07:35:33 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a5d58c5000000b002f47ae62fe0sm3695679wrf.115.2023.04.14.07.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 07:35:32 -0700 (PDT)
Message-ID: <bd50a829-689d-716b-c04e-e0c636df1045@linaro.org>
Date: Fri, 14 Apr 2023 16:35:30 +0200
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
 <d5f19502-624d-1271-c043-0546a3b8b229@linaro.org>
In-Reply-To: <d5f19502-624d-1271-c043-0546a3b8b229@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 14/4/23 16:32, Philippe Mathieu-Daudé wrote:
> On 14/4/23 16:28, Philippe Mathieu-Daudé wrote:
>> On 14/4/23 13:37, Akihiko Odaki wrote:
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>   hw/net/igb_core.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
>>> index 55de212447..f725ab97ae 100644
>>> --- a/hw/net/igb_core.c
>>> +++ b/hw/net/igb_core.c
>>> @@ -1590,7 +1590,7 @@ static ssize_t
>>>   igb_receive_internal(IGBCore *core, const struct iovec *iov, int 
>>> iovcnt,
>>>                        bool has_vnet, bool *external_tx)
>>>   {
>>> -    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
>>> +    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 8);
>>
>> Aren't VLAN tags 16-bit wide? Could you convert this magic value
>> to some verbose-but-obvious definitions?
> 
> Digging a bit more, is this struct vlan_header?

And now I see in patch #08 "igb: Always copy ethernet header":

   +typedef struct L2Header {
   +    struct eth_header eth;
   +    struct vlan_header vlan[2];
   +} L2Header;

Maybe add it first, and use sizeof(L2Header) here directly?

