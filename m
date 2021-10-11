Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9157429372
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 17:33:18 +0200 (CEST)
Received: from localhost ([::1]:34050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZxIi-0004Gs-W7
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 11:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZxHf-0003Wd-Ka
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:32:11 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZxHd-000762-HQ
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:32:11 -0400
Received: by mail-pf1-x434.google.com with SMTP id m26so15160848pff.3
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gG2qD1Gc0h3+yZ/kc9GVN4oo8JYSlHb21COGBuKsWmw=;
 b=F+8bK1xC9NV4lVwH6CKSthlMUSZj3YjGExal7+89bsEWeJrjR7uYO0+Wis9zbCUDQt
 M/YyM+OyS3/5qNtsSPMAT4OcET5CkFzWHlfmSCmnrLl9iuaPqKWjSTwaiDoersnScGZz
 /X7NDUUddnaWlTRSGUOKoN0WO4VPf7Y1DyiobTGfRyW1z18kvp/9ThRkoEFywWp8jFRu
 Wfr3FDtS1bLzTL6SGSQgaWZzb/jCjELH+Xpm7j79BbV2yUO5nT5ttML3uQ2yVNYXIY9n
 UwFtq8s7EgIYT2AO6e57rhaktJtzCVviAin7d4TMb/vVeN70pgp6Gh/KwEdyz+B7zuvA
 YfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gG2qD1Gc0h3+yZ/kc9GVN4oo8JYSlHb21COGBuKsWmw=;
 b=J5/7viNI6VJMCK7vzamxgJSiygADXT+utYqb90tmS36cCVEAlzZ080o/XEQ+bXI+/Q
 6EaPCv1vwy2Qc8h7Uv19Wn6rt25nQCADLO9qFAwA6kYxvCNbeDlhVOZeFbPHPYTfRfMh
 pVrGZdWVs3zlwN5O8xM2pSlrPvXaFV2WzcdU8vNr5yOfk9NOR6p6hIqxUZKx2eCdGb1r
 w6St+l+/F5/bxIduHFVQl7Yk5sJiuiizhlANwWL6FkQu1OIxStURgpxpH6O57kLKAoCK
 n240E6YfGLXhQyeqBrVN0I4/rqpIQuTJSwRgCMa4WZ8EJgqtbeoAYWncVLNzpqBHczjh
 RIaQ==
X-Gm-Message-State: AOAM533sUkJeCWOfTNxBWhHJDcbmmmq7sCcHwW2I3m42x1RbIMdr8LdE
 AiAOaabrWwb3B9Vw9xAfJAPdORijk9wQ2g==
X-Google-Smtp-Source: ABdhPJz/eFKjV4R+UNxNcI+qYjqX81Yz2qB5MPPULM6h4LSG6mrBgAFKiXhskxkADad1ro1b/h+yBQ==
X-Received: by 2002:a63:7e11:: with SMTP id z17mr18667640pgc.114.1633966327840; 
 Mon, 11 Oct 2021 08:32:07 -0700 (PDT)
Received: from [192.168.71.106] (50-205-213-50-static.hfc.comcastbusiness.net.
 [50.205.213.50])
 by smtp.gmail.com with ESMTPSA id c11sm13946342pji.38.2021.10.11.08.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 08:32:07 -0700 (PDT)
Subject: Re: [PATCH 5/8] linux-user: Support TCG_TARGET_SIGNED_ADDR32
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-6-richard.henderson@linaro.org>
 <87bl3vyi0p.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <709bfead-acb8-16fb-5f97-9d584a694610@linaro.org>
Date: Mon, 11 Oct 2021 08:32:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87bl3vyi0p.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 3:22 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> When using reserved_va, which is the default for a 64-bit host
>> and a 32-bit guest, set guest_base_signed_addr32 if requested
>> by TCG_TARGET_SIGNED_ADDR32, and the executable layout allows.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/cpu-all.h |  4 ---
>>   linux-user/elfload.c   | 62 ++++++++++++++++++++++++++++++++++--------
>>   2 files changed, 50 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
>> index 80b5e17329..71d8e1de7a 100644
>> --- a/include/exec/cpu-all.h
>> +++ b/include/exec/cpu-all.h
>> @@ -278,11 +278,7 @@ extern intptr_t qemu_host_page_mask;
>>   #define PAGE_RESET     0x0040
>>   /* For linux-user, indicates that the page is MAP_ANON. */
>>   #define PAGE_ANON      0x0080
>> -
>> -#if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
>> -/* FIXME: Code that sets/uses this is broken and needs to go away.  */
>>   #define PAGE_RESERVED  0x0100
>> -#endif
> 
> Can we reference why this FIXME is being dropped in the commit message?

I'm not sure to what pbrook was referring with "... and is already broken" there.  I need 
something here to reserve a page, PAGE_RESERVED seems like a good name, so I took it out 
of the cupboard.

I'll do some archaeology.


r~

> Looking at the current tree state I can see several uses of it due to
> moves in 5b6dd8683d (exec: move TB handling to translate-all.c) which
> post-date 2e9a5713f0 (Remove PAGE_RESERVED).
> 
> Otherwise looks reasonable:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 


