Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7722E6A943F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:36:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1pn-000857-CK; Fri, 03 Mar 2023 04:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1pk-00083R-Nt
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:36:12 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1pf-0005Ii-Jp
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:36:09 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso3480654wmq.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677836166;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/F3ZNLmTHCITwoT1uPJ0GCKQVMa0/fl3kytYyGRwMiE=;
 b=lYsYpWv0EZKck5oY18uAU97WhBUA1hTSe0UAFRtwm7mFtcuqNYOVNhaBPp31NgyAQU
 oYDZjnHmwtZQevVBk54bOvtM1GL9EhPVrJxzROBSHqWi51HF3M921NXwG27eRJEfVl6q
 AW7RkXxYJ4x3PZVA9oAxqZR2nvOD4AODx5Ny8fU7HKY0WJZCKp1SZh75DhWEwUeF53Gl
 uyI0as8EeQG19uQCbhCIFHHpXZIBm1hQi95Fy7wNGTfbOoGgGTUOaNMrartiJmlWvBOW
 V1l1FLG0GxkZA0z3SvIB8lNy2y81HMsJlxZM0fnNW0d0QRYy5fZHBNNSeaaoF/KZfbs7
 fInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677836166;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/F3ZNLmTHCITwoT1uPJ0GCKQVMa0/fl3kytYyGRwMiE=;
 b=E3CV97+lVb0dG46/0P+fZoyAuzDhRSdl10e4l5sqOluyiV/4u7KOmWLj8KwqYQui/v
 9UIZJGY9quaprm+Qh/7ByAU0z4Abh0DbCEpaJ9cVdc/g+ELEwDvDusnGGkwnr0Jhrxir
 PhAQNwDbyp0gPPeivdSlWlz/dS6T8FPvGaVyC/f8V3VfmMNq1r0Dmq4HYbI4I9LnRDog
 +B6NxDw8vkp2KH+0mesqelQj/LARpqN7nOMaIkgQSg8AhgF6yuPn6o/ftKfEjYqC2SHT
 y5dAZ1pUGXUufGo6jLhDZvUFNXC6ZXXYbZHT8yB5F6ggfNO6OAvyAP24vZ2O0xLfm4sW
 BlCA==
X-Gm-Message-State: AO0yUKUjj5myBl2NAIHnMQmS+5WoN4Fu7F8XYHAprpYsWSTKyr34GL8v
 rB8CAUsWLBoGD08ebPIYDitfqg==
X-Google-Smtp-Source: AK7set/QV3zyEwsdfx/oEbZbTIwm/CMShnACFO3fI/h4PHmHYTCfuE6lOUSde9q9KDtOB4oaiuUcXA==
X-Received: by 2002:a05:600c:5127:b0:3ea:dbdd:66df with SMTP id
 o39-20020a05600c512700b003eadbdd66dfmr1005981wms.2.1677836166073; 
 Fri, 03 Mar 2023 01:36:06 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c33aa00b003e215a796fasm1818221wmp.34.2023.03.03.01.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:36:05 -0800 (PST)
Message-ID: <3958a606-1e36-9a66-0ea0-ef2bc9749fb4@linaro.org>
Date: Fri, 3 Mar 2023 10:36:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: Emulating graviton G3
Content-Language: en-US
To: Robert Henry <robhenry@microsoft.com>
References: <DM6PR21MB1497F02E1C66D07A066B1D63D6B39@DM6PR21MB1497.namprd21.prod.outlook.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <DM6PR21MB1497F02E1C66D07A066B1D63D6B39@DM6PR21MB1497.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Cc'ing qemu-arm@ list

On 3/3/23 08:20, Robert Henry wrote:
> I cannot figure out how to make QEMU TCG emulate aarch64 Graviton G3.  
> I'm working against master/head of the QEMU source.
> 
> I come up with feature names by consulting 
> https://marcin.juszkiewicz.com.pl/download/tables/arm-socs.html 
> <https://marcin.juszkiewicz.com.pl/download/tables/arm-socs.html> which 
> is compendium of the /proc/cpuinfo info crowd sourced from linux running 
> on real systems
> 
> I'm trying to either (a) add features to QEMU's '-cpu neoverse-n1,...' 
> or (b) take features away from '-cpu max,...'
> 
> Unfortunately, many names of implemented or unimplemented features are 
> not known by the -cpu mechanism.  For example, from max I want to kill 
> "smeb16f32", or from neoverse-n1 I want to add in "svei8mm", but neither 
> name is known.  Indeed, the only names known by -cpu are those exposed 
> via the qmp mechanism are of the form  "sveNNN" for vector bit width NNN.
> 
> Is there some trick I'm missing?


