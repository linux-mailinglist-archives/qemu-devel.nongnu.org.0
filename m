Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1944D602983
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:43:54 +0200 (CEST)
Received: from localhost ([::1]:60436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okk4f-0004YM-6G
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okjxq-0000K9-Lk
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:36:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okjxp-0006o5-3T
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:36:50 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u10so22787215wrq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 03:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LRm/bD55cAGvvbLoRuoEY+C5CxSkSc+CxoagFIv6EY4=;
 b=Xw9k0Flx7FHqTLPSS8TrxHQYoqZq+PDPLSF07lUpLeuAzttzZkg/KLXVS2d2jobB9W
 nansvobJ/L2KOt5WPfhZpjJSXkIk6vVozI+EQeMChbnu6naxty7WfAfr19wsQT5b0GQP
 23eF1NykD89jneNufxVAYl5nm6Ihiugva2E7Y9ZkxvnkuQs7PkUXkGSWqmt+VcbexWuP
 Syb5l9CTvfzHaV3KjXbl75SmqAlpqpGjyuHGRcrX9hHGwHA1nKj0IulZ2moBLYBt7b9Z
 VIpux9MAIPel92bCw6ezVYs2A9GtTv61RxdtwP3ZfCPlsIDMK9FStSdu1bZi+YR8xtPl
 ioxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LRm/bD55cAGvvbLoRuoEY+C5CxSkSc+CxoagFIv6EY4=;
 b=EDVFNivOHgF9nyB7Yyh6w5VSs2WxFreI/Y+jcIDe3saNi1WHXXsBPA5vizd92Kd6Kx
 SrW6qdDYZfib0ZE6JYbT+4RW48g+TqePlw76z1KDod37kxy+b1gyq1cb7tdTb+3EPHQW
 GQT/aKp6XdTVaMurAPLapljfxzPGMjmTNBm0UwjsTc1qFtk2o8mRdpKJzxmPN6954kqG
 n0QCeDuiQ8eWEdVkwJInoRSSZRIMef4eaU3O7j/P+nS+Q/ygEeTuod8DaBed9Sdl1e2B
 i8zLt2i1szYSk8Clv8uTKKbF84zZ1h4Q+a+lGUZ+m2SIoWUFKJGdPegDq3m0pUnyNAT3
 2ijg==
X-Gm-Message-State: ACrzQf2mFPcHUsFGn5MmPhVH/4U1+EH51ROsd/YGBExeEqBQ40NJmq/H
 vGvXi3rQNTigIfZnP5W0Kn2xHA==
X-Google-Smtp-Source: AMsMyM60ZWcawsBaPgJNfiTHxGbMGFLEI8LHxr3zrGBsFrrb5fK29jCMHwX1vFbelfwJsmJYQJGAZg==
X-Received: by 2002:adf:eb41:0:b0:22e:fb16:cc43 with SMTP id
 u1-20020adfeb41000000b0022efb16cc43mr1345802wrn.489.1666089406563; 
 Tue, 18 Oct 2022 03:36:46 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a5d6acc000000b0022ae0965a8asm10427456wrw.24.2022.10.18.03.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 03:36:45 -0700 (PDT)
Message-ID: <5c196d8d-7bd3-ea88-eeb9-98e84e4dbed8@linaro.org>
Date: Tue, 18 Oct 2022 12:36:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH RESEND] hw/i2c: Enable an id for the pca954x devices
Content-Language: en-US
To: Patrick Venture <venture@google.com>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
References: <20221011154637.1383553-1-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221011154637.1383553-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/22 17:46, Patrick Venture wrote:
> This allows the devices to be more readily found and specified.
> Without setting the id field, they can only be found by device type
> name, which doesn't let you specify the second of the same device type
> behind a bus.
> 
> Tested: Verified that by default the device was findable with the id
> 'pca954x[77]', for an instance attached at that address.
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>   hw/i2c/i2c_mux_pca954x.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

