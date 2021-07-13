Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185A23C758E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 19:11:32 +0200 (CEST)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LwP-0005mi-23
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 13:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LvJ-0004v6-Pd
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 13:10:21 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LvI-0000Bn-9D
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 13:10:21 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 62so22218703pgf.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 10:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cv7Fjpdc7jq1HBD9gV3d0qi7EnUVmzspIYGTqdoNE9A=;
 b=xXBjoXm0ksEoi8NyRBh0u473R52HMoHKAir/u2dGOyPTpBSTs7JyJ/omzhPYELiPg9
 gVhSdef+2JuTJfBlK4qanYGrWD6etoCFfGZGDir4CkHeEnHwsnQ1MSPThMfjAkBymWQb
 4Pbn7SJlswmOOuzWTXH/mcgl2ECh3C7UXG5jccW4JENpES6hFUveLEWFt05mBfP3VWnU
 ujfL7Jw6sTwnOixqxDpo6eCFg8zpaf3l4UTm1/lemyIE/fxdj0pFb8l7LJCLD18c5zmi
 NNpuF7CXRrdXJ3Mk8RoIKe0mhR8kS3Y9AfphHeqIQKhbYgGAUBL7PZiABav5tv1qlsDo
 xeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cv7Fjpdc7jq1HBD9gV3d0qi7EnUVmzspIYGTqdoNE9A=;
 b=KU7qMDJsL7rbo6A3eR0zgeb3BoI7ZGHHc3xXktRD/T9m6bqokITM0a+FrNHIMdNBdH
 bI3TVVg62oidR7LY3QL0zJGik+41qhyMLt/clfvFcMowC+iY1G+/5NEb61sR39ZSC5yj
 OYjoCMOgFAT4NcoqYlXEWoL40FiCRPyoycNkygtXdC4seVySpzNl86wOYOjH2f5jaioZ
 Y/LKMoqwxWEjq1TC2qFLt8oaOsYZ3DYejtY15tuXxmczd6EyTipMv65gnpNbxRPoMQKl
 AUK2/tTxJoV3piTAJlaCchWjdBDOeufJKtHOPMy6ReA0oIgk2bvXGQVu0Jhr9WEBGVlo
 E0BA==
X-Gm-Message-State: AOAM530WyknTO7+AdtRrLa6TXs+Jj+DkJ5D0mqb5JzZdJcByw9hEA62z
 ap1bKM7KXRzkI42zkLUr7bdOZg==
X-Google-Smtp-Source: ABdhPJySlmRG7HYYokLgTAPvgVoP7Clc1XpzNBxIFHCrAag7t4hxFiuu+ykhIhTqFHE+I6JdvweqTg==
X-Received: by 2002:aa7:810e:0:b029:32e:43c2:902a with SMTP id
 b14-20020aa7810e0000b029032e43c2902amr2801055pfi.34.1626196218653; 
 Tue, 13 Jul 2021 10:10:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u37sm20332693pfg.140.2021.07.13.10.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 10:10:18 -0700 (PDT)
Subject: Re: [PATCH 03/11] util/selfmap: Discard mapping on error
To: Eric Blake <eblake@redhat.com>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
 <20210712215535.1471256-4-richard.henderson@linaro.org>
 <20210713160659.kxrjl6nnswoguncv@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <831fd0d5-e431-9a7c-a60d-a516e87ba769@linaro.org>
Date: Tue, 13 Jul 2021 10:10:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713160659.kxrjl6nnswoguncv@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.368,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 9:06 AM, Eric Blake wrote:
>>                   e->dev = g_strdup(fields[3]);
> 
> e->dev now contains malloc'd memory...
> 
>> -                errors += qemu_strtou64(fields[4], NULL, 10, &e->inode);
>> +                errors |= qemu_strtou64(fields[4], NULL, 10, &e->inode);
> 
> ...and if this qemu_strtou64 fails...
> 
>>   
>> -                /*
>> -                 * The last field may have leading spaces which we
>> -                 * need to strip.
>> -                 */
>> -                if (g_strv_length(fields) == 6) {
>> -                    e->path = g_strdup(g_strchug(fields[5]));
>> +                if (!errors) {
>> +                    /*
>> +                     * The last field may have leading spaces which we
>> +                     * need to strip.
>> +                     */
>> +                    if (g_strv_length(fields) == 6) {
>> +                        e->path = g_strdup(g_strchug(fields[5]));
>> +                    }
>> +                    map_info = g_slist_prepend(map_info, e);
>> +                } else {
>> +                    g_free(e);
> 
> ...you've now leaked it.  Oops.

Yep, thanks.


r~

