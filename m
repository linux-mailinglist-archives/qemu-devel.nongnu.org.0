Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4105AD765
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 18:23:16 +0200 (CEST)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVEsV-0000Zc-M5
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 12:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVEqd-0006bj-EK
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 12:21:19 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVEqa-0000Vh-Tl
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 12:21:19 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bz13so8579909wrb.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=qhgbOgq6vTct5OgZZw/vuzp7HsKabhGLks5EecFwBaM=;
 b=Ve27IRi+S4yK7wjHUrUaCsMIW4ZrY0GNqpcuLi55tBpotFSSmWuIvmXlhlF6Eq+Lz0
 SflEtmv+B+1JhUgaLCOjKac1LCxQ/OgxHyK9HUzU/ePyB3+lFarITL3G0+4vSWROgPOu
 G4p+iUvr/EvDjFr3gKR9Pms+U+m92YsnQyyUYlJ2q4NnYhVLWF3lCKmwAHt5U0rWlffH
 RmMw8UuZ7IVwRTdDnv0LviBa9qC1lIM7ey74/64N4tX7FJ/p28VAOUgNkNJ5CgqMJTmW
 R1AYitD4uyuB/Won6Dhd+xGDMIT7LXkyME6TYHa83TY/I8sh+VbMMIC0GWugK8dmyCj7
 3H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=qhgbOgq6vTct5OgZZw/vuzp7HsKabhGLks5EecFwBaM=;
 b=bi3RwjTguRW89TAIp+Jg/NPnq7Hdu+fvTUoPaU653AbziwOT7yfft3fGVFH3VXbR72
 gpu9YG4AMIluTFapImafN+7MWTXb44zXtEkz4JVVstjjy09UAqI1HsNoFsGetrkmMkwa
 dUWZkTygDMEBO7enl3+krP7T5SUwZLx6VtmowPhx4SzEAUIT3mSw631X7sFWIo6U/9ky
 n5WciUIHTwM8qKOfZDatkcH+yEvXcnL7hjeP8B2dVCkVdKYZxyOTMvG3vdFPl+lX4NT7
 H8rmH+LjrPGlYBCnv8qlNcGofp6TrGxPE0tqL8QGvGuWs9G8rQmz1cnTZCreWApjQVC2
 +yYA==
X-Gm-Message-State: ACgBeo23WUJr746W6sSFsDPHm3JYTeq7Bm7tbY79o8uqadH2kceaksn9
 I9uM5C+1cN+ry7AWes8avrCO5A==
X-Google-Smtp-Source: AA6agR7FWH/XVVWIguwBlTLOQT2lYMmrLwUISALTRK3muZUn/IYvFvW8DbnH+HnKivpSxhpklSaqgA==
X-Received: by 2002:a5d:46c2:0:b0:228:d33b:6060 with SMTP id
 g2-20020a5d46c2000000b00228d33b6060mr678634wrs.290.1662394874340; 
 Mon, 05 Sep 2022 09:21:14 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9?
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 q10-20020adff78a000000b0021e6277bc50sm11063215wrp.36.2022.09.05.09.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 09:21:13 -0700 (PDT)
Message-ID: <6dbd2eb5-efd6-073a-a106-4afbb8abcfc2@linaro.org>
Date: Mon, 5 Sep 2022 17:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] target/ppc: Merge fsqrt and fsqrts helpers
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, matheus.ferst@eldorado.org.br, lucas.araujo@eldorado.org.br,
 leandro.lupori@eldorado.org.br, lucas.coutinho@eldorado.org.br
References: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
 <20220905123746.54659-4-victor.colombo@eldorado.org.br>
 <f2fac00a-cacb-25b3-f6ae-9f35a82ab440@linaro.org>
 <e3153a0e-4451-3b21-7821-6877d78868e8@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e3153a0e-4451-3b21-7821-6877d78868e8@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 9/5/22 17:19, Víctor Colombo wrote:
>> Existing bug, but this is missing to clear fp status to start.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> r~
>>
> 
> Hello Richard, thanks for your review!
> gen_reset_fpstatus() is called by the inline implementation in
> do_helper_fsqrt() before calling the helper (patch 1).

Oops, ok.


> It's probably better to move the call to inside the helper.

I did write about a scheme by which all of these calls should go away.  I guess it has 
been a while...


r~

