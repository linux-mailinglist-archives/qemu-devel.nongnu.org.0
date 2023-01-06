Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D08660A3A
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:25:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDw4t-0005L7-90; Fri, 06 Jan 2023 18:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDw4q-0005Ig-NY
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:24:44 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDw4p-0004xx-7o
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:24:44 -0500
Received: by mail-pf1-x42a.google.com with SMTP id w203so2169865pfc.12
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JJT6Ee48V1sBgOv3U5R6L8EiytFVlnnoZy5mC9JBaWI=;
 b=W4ThJnsR0jA2nrafJaSmewXMgxKAoRcXOh9GcFgqlWdz3A+mmWYcUs9fFj34cTHtYX
 jlNZkpDoTDJcZEhfKos+VeSgWuSRxEjAJljhhHgdmbSnorclULZbe3XYYvUKnZW/Rs2s
 Jzui5JrIKN1IUBRiFdi07n8C3XGFG38CZVDh4sUSF9oqq8+LC51WHec1GB6lpQcjuTH5
 O05OsTpsigCVlRHeUWhNdlW9cbF6jVKCAWn02VuayjD/JtI+fZuhb/JcSC91agjzPLLJ
 Ayis4vUy0n1uCTfEmw/hAP0hvP2umEp/4zsLHtrG2MHvJ8YlVg8HDfxEuW2XJOL2iGxh
 kySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JJT6Ee48V1sBgOv3U5R6L8EiytFVlnnoZy5mC9JBaWI=;
 b=cYNe47ykp+NI+hHfUZzmaW+7cY1mlUogS0jTerpmCPiGylkosgtkBH2FDxxhUAlpuO
 ibk1ts4VXswYagF8NOumpX8bGnSWpPqCkCmsmFvhR+i8FOZ2Tj1kwrnkvrTflIAH9pml
 bsEL52DPKpIrxE8N5y1BG0UvFVRfLzMrRSIwObnKe2/TV3hKGmwYev/wXGIkDmTssVKU
 JjmaD6WNjWC7dzmAH5xjDaOYQ+1trU536uYmDnTlbGXiIEtIe8+ULqItsYB9k1zq2LLM
 r0gGc1RDSNDvakZbMx0C8mTY1V7WInKG2z/ogrXFKrecj4rUvSs3ZoCiu1Msi/VOh+p9
 l9PQ==
X-Gm-Message-State: AFqh2krHt/1K0AtkIQaraS5SzjgUF90LSpYuK8J5KO+LwZgAm6aZx1qb
 dF5D8GeAhfvJQCXl/bNh5epAGQ==
X-Google-Smtp-Source: AMrXdXsv6JSWzCevdtGviZu2u/EUaHI669nMx3Bkr/UU3+w/4slXlw1HgEC0hEsX+5vjfnwMDwpbug==
X-Received: by 2002:aa7:91d9:0:b0:575:2337:17bf with SMTP id
 z25-20020aa791d9000000b00575233717bfmr67495413pfa.12.1673047481631; 
 Fri, 06 Jan 2023 15:24:41 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 a197-20020a621ace000000b0057737e403d9sm1566562pfa.209.2023.01.06.15.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 15:24:41 -0800 (PST)
Message-ID: <992b8a69-210a-34ce-4cfa-ff622caf1290@linaro.org>
Date: Fri, 6 Jan 2023 15:24:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 18/21] gdbstub: don't use target_ulong while handling
 registers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-19-alex.bennee@linaro.org>
 <7d8fc0af-93ba-c79f-4c53-0cb52db40fa5@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7d8fc0af-93ba-c79f-4c53-0cb52db40fa5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/5/23 09:28, Philippe Mathieu-Daudé wrote:
>>   static void handle_write_all_regs(GArray *params, void *user_ctx)
>>   {
>> -    target_ulong addr, len;
>> +    int reg_id;
> 
> 'unsigned'?

No, match the third argument to gdb_write_register (int).


r~

