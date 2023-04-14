Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E606E25BA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:29:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKPz-0004GS-6v; Fri, 14 Apr 2023 10:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKPv-0004GE-52
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:28:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKPp-0003Tu-IZ
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:28:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 he11-20020a05600c540b00b003ef6d684102so8372483wmb.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681482519; x=1684074519;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3JIPET52U7d8hZzdNKjCOOqebEMYvt7zIqgrNR+vAys=;
 b=mZ+U0hyGaqpTosIqsKrGv6VmL481mF2f9vsWMPq9j93hhkpKNhlbywTW4eSS95A96l
 Fs1inftg6CVRPVA/B76QpdUWqFZyxifZej7a6sy0WFD1SltiQQSbMDRFJ9WS4/XxoHSo
 nXpDD9PZjMkpL/419H6oiNBcUBpZTo/YIZAGIbD2g7GrJWE0BWs78sSJ0MSRLDQQhZ7M
 BJL7mx6P2g2n/hqqmYqDC6i6lIG5gOUx/avZNrt2IBJre2oOIn/JNi5hgwd5s3Aeos+H
 T5OusYZOnxKYeF0d1XzpQeP8pUZViJfQXEKiQsG4XQRDm7y4Ml3hO2R3N+0+iZOfXn//
 xWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681482519; x=1684074519;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3JIPET52U7d8hZzdNKjCOOqebEMYvt7zIqgrNR+vAys=;
 b=JMRGhn7uyZShPC1Eqxt0HauBCqJv9x/aGN9Cd5hoFxJNNF3XruIgZKj9zURNUDCQd5
 OGQLkmyuSRyuKwN1Yl/jXoqQ/eBapTWWGzgpO1iRukLAkOCtViLpTN6k+Ze2bg9KNkG2
 zxU5R/UMNZhVSdLH40VIFSCLwEaAPSUOUb1lAnpZa/Ua7BARLWIUDug4TFJWRlfmW/1Q
 qNvX3WCG69IzbDy07g2YxLBYkTS3kmEfGk8nLUYBwPjk1BlzkTiq701H04y+bZ9XEJg9
 HJiMZUDbP0wMw1sTHOdtMng5eO80nz5cyTqZ89nSDOXpRPLBcktfzats9B7ASEOjH9NQ
 Rt9A==
X-Gm-Message-State: AAQBX9fJt/bVL7DcdnYNMyCK6CpyoUqIDoS37ResWaTz+ixRtF7qcXX7
 FOI4hOlmCIIK3kX+14GCv0cR0w==
X-Google-Smtp-Source: AKy350a+slmFHjoou1arMGvE0ZBm/JawKbi0i47q95WEZUquCjYUlyIHmzMR9LeFR6Xv6scbSV/J4A==
X-Received: by 2002:a1c:7506:0:b0:3ee:3e07:5d26 with SMTP id
 o6-20020a1c7506000000b003ee3e075d26mr5032085wmc.24.1681482519498; 
 Fri, 14 Apr 2023 07:28:39 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a7bc7c8000000b003f07f0405b5sm4380237wmk.43.2023.04.14.07.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 07:28:39 -0700 (PDT)
Message-ID: <08449e5d-4ccc-6eaa-f4d8-d21d0bc23786@linaro.org>
Date: Fri, 14 Apr 2023 16:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 04/40] igb: Include the second VLAN tag in the buffer
Content-Language: en-US
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-5-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 14/4/23 13:37, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/igb_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 55de212447..f725ab97ae 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -1590,7 +1590,7 @@ static ssize_t
>   igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>                        bool has_vnet, bool *external_tx)
>   {
> -    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
> +    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 8);

Aren't VLAN tags 16-bit wide? Could you convert this magic value
to some verbose-but-obvious definitions?

Is it worth adding a vlan_tag_t typedef in include/net/eth.h?

>       uint16_t queues = 0;
>       uint32_t n = 0;


