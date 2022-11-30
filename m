Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E00563D334
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KDv-0002gF-5O; Wed, 30 Nov 2022 05:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KDs-0002fZ-U9
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:21:48 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KDo-0001IY-An
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:21:48 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so1032558wma.1
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y9HkffyHoTFcChBig7t2s1R9YtKjRE9M8KuCGcTgWRY=;
 b=kZa1dkS+Zzy+qebjOr2kk99JHv0omYKxa5isQXgWE3AvDqBTf00dHqOJCHKcQaOgak
 6IgpYVtTWY209/DuVLmo1lJdtiqaEQmeouUC/Wbt1djBrWI96xsE/lEptWtXHPUk0wpH
 N/bDjGxK0U14iOhYxp/hUurrcLeOQ8KCbEwFaQeBHmjGusUhhe7QAohI6wzkOVfBcIgA
 bKmWnDvLZ9j4CBwwi2yxZGYj3isIhBo3+zH6dKyhIf60OOrJXmHP42e+vF0C8CKtJ9nk
 QMbb37a4xN2vHLVJ3c0WrBggB9H8L7B3p1GOtR9cMQbQU4GUnv8sni+7AvfxFWZS53dS
 JhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9HkffyHoTFcChBig7t2s1R9YtKjRE9M8KuCGcTgWRY=;
 b=6JtxtPUjbuCzfResDgb2oXomdsDcAriRB+wCNhQ9E+m/iX1Hu92FvlUFg7Rj3Y50bg
 K3HvNUgxPLYOVLWCRF8JxP7M+S0sfCIj8F8W0aDvPKwG+fBcUJRPQMFv6SGfUPNxzxHb
 mjrdwzzOS/OfCfoAnUa+Q2yLjWSRU2pkPlhIvP1LoKf7i/8C4aoMYDhT1rhvLHYIzEDc
 nsuO75HCb1M4oRjFi5Iqes27sCjU4iL1o+pEjt3RX5zGF1hiWANPpK21wLkGBy2R51CF
 mm2UCkojFzPvaFBNgmjSqkGHy3Ox2B96B2cfcmExi8jTTOg36f/sP48unKiNXc1xUedZ
 63WA==
X-Gm-Message-State: ANoB5pl1LemC5VjSAOWDuE9qg7lNICylgptxZHHhrOuyz2ak0BpGqpdv
 XuRuLodyrWactOaOrdwkauj+Og==
X-Google-Smtp-Source: AA0mqf7SLlV4jCj6+EZC7BZLStKBQEqWNceX1izMZ8cxZDtUsgAVFQxJNXz4W7rGcKFoJ1JCvEqHlQ==
X-Received: by 2002:a7b:ce05:0:b0:3cf:7c1b:3c29 with SMTP id
 m5-20020a7bce05000000b003cf7c1b3c29mr34833105wmc.23.1669803702757; 
 Wed, 30 Nov 2022 02:21:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b4-20020a5d45c4000000b00242209dd1ffsm1178348wrs.41.2022.11.30.02.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:21:42 -0800 (PST)
Message-ID: <d5479846-19e7-4b1d-44da-82f15ad1b6b7@linaro.org>
Date: Wed, 30 Nov 2022 11:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 5/7] hw/intc/xics: Reset TYPE_ICS objects with
 device_cold_reset()
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-6-peter.maydell@linaro.org>
 <61ea8b5c-a8ae-1fc9-a54a-6a95c8b914fc@kaod.org>
 <20221125144539.4106a542@bahia>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125144539.4106a542@bahia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 25/11/22 14:45, Greg Kurz wrote:
> On Fri, 25 Nov 2022 13:24:00 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> On 11/25/22 12:52, Peter Maydell wrote:
>>> The realize method for the TYPE_ICS class uses qemu_register_reset()
>>> to register a reset handler, as a workaround for the fact that
>>> currently objects which directly inherit from TYPE_DEVICE don't get
>>> automatically reset.  However, the reset function directly calls
>>> ics_reset(), which is the function that implements the legacy reset
>>> method.  This means that only the parent class's data gets reset, and
>>> a subclass which also needs to handle reset, like TYPE_PHB3_MSI, has
>>> to register its own reset function.
>>>
>>> Make the TYPE_ICS reset function call device_cold_reset() instead:
>>> this will handle reset for both the parent class and the subclass,
>>> and will work whether the classes are using legacy reset or 3-phase
>>> reset. This allows us to remove the reset function that the subclass
>>> currently has to set up.
>>
>> Nice !
>>
> 
> Seconded.
> 

Thirded :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>



