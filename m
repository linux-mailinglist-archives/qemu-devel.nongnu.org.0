Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160215AD850
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 19:23:16 +0200 (CEST)
Received: from localhost ([::1]:41668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVFoY-0000DV-Mt
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 13:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVFld-0005hF-VJ
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 13:20:13 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVFlc-0001R1-7q
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 13:20:13 -0400
Received: by mail-wm1-x329.google.com with SMTP id k17so5571279wmr.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=OmjI9smpj183vhTjryUBgE3Pv9lmHbAG6TKLgNdTtjg=;
 b=tMu54TxMJcIUNWnKnsTHJyMWjlhdj6J2wtEaNTk3EtBttQ5lXYS/j077TZQol8YJDw
 i7xySVlj4kdH+GBWjT/iNVpdm1jzYqd/ijbon8B7ENXdPY22ulIBx2eog+QOSHa/a9ph
 NmCaGkfnx8Wbv0fsgww5trdkoZiQCKTb57in9b9bNIEda0kEkRClvhFFensL4CI+5/SY
 hgy6/rurfa1nEG8reti8LxgtX2iEH+U6MoQv9lhrInJsq4HNiPFjmhhEleP9gvBa+Wx7
 kei2ev/gXvzG2BNzPzIBU6zQFpc+OzEWZyc3JRvrmBF9nL4Gw0vJGlEjQLuiK1CJCPW4
 2iGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=OmjI9smpj183vhTjryUBgE3Pv9lmHbAG6TKLgNdTtjg=;
 b=pTdinE14WteSzJwhDyj1JYcNLf9djgGBz8lZQGb/39zoAztjTjSSNwqh+AOCLryelZ
 tJ4+RurMAhNasQHA0UkE2rIUF11YK1abYxdtdJKZGw4vBxHPEnEo5e4zGguvWuz3TpWz
 stYL9zjcz8H6mKqDzGeKn1Qt/juQZrrhHKN8aSPAbi3DGKHXTsOD85RC35LfKbyMqY4G
 44/y3BOPby9TqD9zIZW9wOCtbW3gFhM/vdJcTxtTPCwgDP05ouz8M1oBK/29rOA8KokM
 cP6Wu0TAZp1gFpOQMahTGdCWAUsfXMIkyqZayJJvypIp9/RnXDsIIOPlI1JKar3TNdnI
 KTKw==
X-Gm-Message-State: ACgBeo2cRQhGgn+3uOAfZsuc9KmIegJnjEkW1PeoMK6sF9eNHvJ6IE0B
 L+k+1Yob+1CIQN8vIdCAGiXdEA==
X-Google-Smtp-Source: AA6agR5ssF1zuRNMcYZ6jS6yWbnyqIh7VW7CFYUpPoejbzGA6DjrVOTPZXHw+D9TG0y6PMa9RoAwrg==
X-Received: by 2002:a05:600c:601f:b0:3a6:28e:be81 with SMTP id
 az31-20020a05600c601f00b003a6028ebe81mr11372550wmb.35.1662398410424; 
 Mon, 05 Sep 2022 10:20:10 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9?
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adffbc9000000b002205cbc1c74sm9338525wrs.101.2022.09.05.10.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 10:20:09 -0700 (PDT)
Message-ID: <6af72233-3e87-c35d-b581-3777d5992d9a@linaro.org>
Date: Mon, 5 Sep 2022 18:20:07 +0100
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
 <6dbd2eb5-efd6-073a-a106-4afbb8abcfc2@linaro.org>
 <20affe6c-fc70-78fe-ae3c-da5b66518320@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20affe6c-fc70-78fe-ae3c-da5b66518320@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/22 17:31, Víctor Colombo wrote:
> I have a message bookmarked here ([1]), but I don't know if there is a
> previous one with a more in depth scheme.

There may have been a previous, but that's the one I was thinking of.

> Anyway, I was also analyzing recently the idea of removing all these
> reset_fpstatus() calls from instructions helpers. I think this would
> require to actually call it from the end of the (previous) instructions instead of the 
> beginning? Like adding the call to
> do_float_check_status() and float_invalid_op_*() as a focal point to
> 'hide' the calls to reset_fpstatus().

Well, there would of course be no separate call, but do_float_check_status would:

     int status = get_float_exception_flags(&env->fp_status);

     set_float_exception_flags(0, &env->fp_status);

straight away.  No extra call overhead, and the steady-state of softfp exception flags 
outside of an in-progress fp operation is 0.

> However there are also insns
> helpers that don't call these auxiliary functions, which I think would
> cause the refactor to not be worthy overall.

Anything that can raise a softfp exception and doesn't do something with it, either 
immediately within the same helper, or just afterward with helper_float_check_status, is 
buggy.  With those fixed, helper_reset_fpstatus may be removed entirely.



r~

