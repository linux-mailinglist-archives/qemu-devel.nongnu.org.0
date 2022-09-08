Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E0E5B2844
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 23:16:56 +0200 (CEST)
Received: from localhost ([::1]:38470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWOtL-0000Fx-Pw
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 17:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWOqs-0006bf-VO
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 17:14:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWOqr-0005Nl-9Q
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 17:14:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t7so23315999wrm.10
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=pQB/WNHEt2WAAIqNZ5SlTaLI6qBoLxKU2CI7ivdELJk=;
 b=X0Pnkxebil9aggdufYAInTwkaCakd/nNe+mgWQeGn6b7ToKk+BSMZ3sX+lYV5XlWB6
 c9UibKu73yGnu2wnBKpcWHoozU1bd92gpM7IDmCYoyUWxCDm5m0J3dQh7PN0sx5V1B9E
 BmpIocD0wDSeFIerwMC9yxHOD7WoAEemJ4QmGW2etoCCiaIEyK6zEjqF4n/fQBmcDyb6
 +zzSjHnd+/M5V7X3nUa8jW1IovvV+9oJ0VAaPO4dxLSUvJrJYBuOOyv5DuSH8prCeHqW
 aOXIgvnvIw6aUaLSDlJRpiCbvSRuQN9NPtOsKZJU7iRfeS5ShA+2APzrgce4Ia/snJ0d
 Z9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=pQB/WNHEt2WAAIqNZ5SlTaLI6qBoLxKU2CI7ivdELJk=;
 b=NPXpU7uYB9QXUfy4gPKP3Jdea3kCCEqG+WWUTYNo4KUCstIxjKBiGKuurZnJ8tFsxH
 wgKt3I99EhqlLWLmGzU44S8ikapqQJk7ZQhtNy7QwOvD8nJ5sqXa8fyzHhiuQ5wRDYdw
 yfSWvAAb1bWl5wq+r8wQMWO9pe8stIxLZ+kANS/IpBVQUuzacE0jWkoqbXXYf3uwKjw5
 X+PErVKRqZEpAy0iGzEQtrq9Wwot4O5LfQlHlN3eTZ/nYER8aQxHswnUx6BVsRpuISO6
 ngFBA7wlHcd2mw87H2VGu2KgIUnI/oVT+miCWr87bcQ5XBHRoPTWwwLSg5BqdN1Z/ozK
 AOUw==
X-Gm-Message-State: ACgBeo0TXR+vKS8MoacrTYffceoo09G+01jgy/C2iaHrS+pXlR4mS/s1
 mLrv9eyBOVSlF29A8v2O1Y4pjA==
X-Google-Smtp-Source: AA6agR47P+LiFXtRSzyflJvbWe3vA9yWQ+E3TsXGp/hGq2r/DnKRjrTHOBCDeZtTjzTH0myQAnvVOA==
X-Received: by 2002:adf:eb52:0:b0:223:9164:b5b4 with SMTP id
 u18-20020adfeb52000000b002239164b5b4mr6280596wrn.518.1662671659143; 
 Thu, 08 Sep 2022 14:14:19 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c1d0f00b003a317ee3036sm48464wms.2.2022.09.08.14.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 14:14:17 -0700 (PDT)
Message-ID: <275b5287-9c81-13da-f57a-0069d19158d9@linaro.org>
Date: Thu, 8 Sep 2022 22:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 12/20] disas/nanomips: Replace std::string type
Content-Language: en-US
To: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>,
 "thuth@redhat.com" <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cfontana@suse.de" <cfontana@suse.de>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "vince.delvecchio@mediatek.com" <vince.delvecchio@mediatek.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Djordje Todorovic <Djordje.Todorovic@syrmia.com>,
 "mips32r2@gmail.com" <mips32r2@gmail.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-13-milica.lazarevic@syrmia.com>
 <dc7ac467-b881-b353-a63a-ff5a744df5da@linaro.org>
 <VE1PR03MB6045ED62A423FBD5D3A617C1F8409@VE1PR03MB6045.eurprd03.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <VE1PR03MB6045ED62A423FBD5D3A617C1F8409@VE1PR03MB6045.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
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

On 9/8/22 20:16, Milica Lazarevic wrote:
>     This would be better written as
> 
>           char *reg_list[33];
> 
>           assert(count <= 32);
>           for (c = 0; c < count; c++) {
>               bool use_gp = ...
>               uint64 this_rt = ...
>               /* glib usage below requires casting away const */
>               reg_list[c] = (char *)GPR(this_rt);
>           }
>           reg_list[count] = NULL;
> 
>           return g_strjoinv(",", reg_list);
> 
> 
> In the implementation you suggested, there's one comma missing in the output.
> For example, instead of having:
>    > 0x802021ce: 1e12 SAVE 0x10,ra,s0
> We're having this:
>    < 0x802021ce: 1e12 SAVE 0x10ra,s0

Oh, right, because SAVE of zero registers is legal, and even useful as an adjustment to 
the stack pointer.

> So, I'm assuming that there needs to exist one more concatenation between the comma and 
> the result of the g_strjoinv function?
> Maybe something like
>      return g_strconcat((char *)",", (char *)g_strjoinv(",", reg_list), NULL);

Well, written like that you'd leak the result of g_strjoinv.

A better solution is to first element of reg_list be "", so that it's still just a single 
memory allocation.

>     I think this interface should be
> 
>           char **dis,
> 
>     so that...
> 
>     > @@ -746,25 +647,26 @@ static int Disassemble(const uint16 *data, std::string & dis,
>     >                                    * an ASE attribute and the requested version
>     >                                    * not having that attribute
>     >                                    */
>     > -                                dis = "ASE attribute mismatch";
>     > +                                strcpy(dis, "ASE attribute mismatch");
> 
>     these become
> 
>           *dis = g_strdup("string");
> 
>     and the usage in nanomips_dis does not assume a fixed sized buffer.
> 
> 
>     r~
> 
> 
> I'm not sure why the fixed size buffer would be a problem here since the buffer size has 
> already been limited by the caller.
> I.e. in the print_insn_nanomips function, the buf variable is defined as:
> char buf[200];

There would be no such declaration with the above change.


r~

