Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4D406765
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 08:50:05 +0200 (CEST)
Received: from localhost ([::1]:55368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOaMN-0002TD-Tc
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 02:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOaJE-0007QN-1F
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:46:48 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOaJB-0003qH-2g
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:46:47 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso636215wme.4
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 23:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JZwVYff2olTKH4aZVpxOQc2TZr/YmofPRDMpeuN43uQ=;
 b=oL9xe0b8sEeHGs8Ygo4HpTeWlqJ1Z97hRRVOwUPAR6jCLEQi9dU04h4qxcfxYd6g0b
 RCf5Ah7Z4YImJad5zso/uz36uSipMHtNZlULvDh0v+G6MRjozDlYSMmHHVX+NcYio2q9
 CrG5zqn1nBEwO8Ynm5XtS6uq/wVOPaabiZmJr1orgE4UgYUF9RFPfuI1nZaLsmTVYCGR
 CvfGx1M0usQN2s/tgXjMlilqEGtJoG00vHVO2WobmgbLJlBSFbsth458NOTqld8QdtbV
 Gn1ZlPt2EcuG79Hh1Izw3CVbBTVmxs1TpPOXtA32etj1et9SKcuTcENVRC6XKv0y8Jnt
 9FUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JZwVYff2olTKH4aZVpxOQc2TZr/YmofPRDMpeuN43uQ=;
 b=lHokz/XDRR2yno3+25dizXqNpTpTF7stHuqcbl4hiAiD20pUbNkbE8rXVvNku/Vmmo
 wMiFVDllrPk7++gczUgfkJ10qam5IGqHDInfwCM2vKggvsTbOeDAESvEqutW72wQebqF
 bze200zOdLoVqlWm4amb1hNARmonnMF96CXlWGnnVytYWUMMZusVcy9ZzSQcaONExivp
 RScN4A4ZlJ7SdOJJVWNRTfu0h3Yiu/ZYlGwW+t9dppGV/TAg2NzBidwm8r15+B2bgP0x
 o9we1c2UJ4q/CnyK/6cm3RVjKVWwL6BSif2PfBu/0U41yS4p5hZRp3cX/dwCuCtmAwpv
 WB8g==
X-Gm-Message-State: AOAM531rv7ecjlcE5ZW1bZir/iOkrchQxcj5BWjHJ90qwCeHM2T+TGGE
 FdL8EnFiN3EDUNgiCjpzoRJ33OSWP+J5XGX3
X-Google-Smtp-Source: ABdhPJxgGRr+COa8W3R6/LadqJdDSbxD9Ev9BcGr1MT32ptAGKsSfNxIDMuIdh/1gAsCBZ8/OLXPvg==
X-Received: by 2002:a1c:35c1:: with SMTP id c184mr6645132wma.68.1631256402954; 
 Thu, 09 Sep 2021 23:46:42 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id d8sm3994363wrv.20.2021.09.09.23.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 23:46:42 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA_xUSMEoT34fkwiGef8D5Rwfkvre8o03YqgEw-qD86o=Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2263937-aa85-c51c-9a2b-bc50043e10c7@linaro.org>
Date: Fri, 10 Sep 2021 08:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xUSMEoT34fkwiGef8D5Rwfkvre8o03YqgEw-qD86o=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.975,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/21 3:46 PM, Peter Maydell wrote:
> On Fri, 3 Sept 2021 at 14:58, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> I think you need to go ahead and end the TB and resync immediately.
>> Just set dc->base.is_jmp = DISAS_UPDATE_NOCHAIN instead.
> 
> Is there a rule for when we should set is_jmp to DISAS_UPDATE_NOCHAIN,
> when we should set it to DISAS_UPDATE_EXIT, and when we should call
> gen_lookup_tb() ? We seem to use all three methods at various points
> for "I changed some CPU state and want to end the TB"...

UPDATE_EXIT is for when you need to return to the main loop; UPDATE_NOCHAIN merely avoids 
goto_tb.  Direct use of gen_goto_ptr should be reserved for branches (which I think is 
already the case).


r~

