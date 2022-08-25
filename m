Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E76E5A09F7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 09:20:41 +0200 (CEST)
Received: from localhost ([::1]:52418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR7AN-000243-PK
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 03:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6pK-0001jL-4N
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:58:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6pH-0002Us-Sa
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:58:53 -0400
Received: by mail-wr1-x435.google.com with SMTP id h5so22555972wru.7
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 23:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=FZYxvVZgR3/EcrFCgkDrd9BChILUT+KUUPfoSjdGIeE=;
 b=p2bFvrkR1Pn+Gco5L1Jxg14eVZMCmW9VK8WIJ214YzzSJJMwsIzhowISIvFbaeK2QP
 9FBG0vMQ2x0ZPqVZN3ostfn6DTlL4ChbTLEnUs+u/L04Pk0YS0EkXl/CxHTLYy2h2ruc
 4UuLg2KBzYVkuUt3W+hJNxWYaSrXfkkXWYq7drkbCdBIZkjyeDlRPL0ayP7K4cyRLLPD
 6NMImvKmJo85NfVyZAtmcS4Y4Ox86g7Oz2X/CO2MtITfnbVKVJiD772KlN0gG8sq4Kro
 HqsF27pO8Q3vvP3UrX52Y5FrnKHjV1DkhrO30tVtnlNcTcXg4NcB/aRWmyP4VOcSgLXd
 dcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=FZYxvVZgR3/EcrFCgkDrd9BChILUT+KUUPfoSjdGIeE=;
 b=dA3rU7vrmL0BFOujCgEvD19MG7fJfv0esJen44RWczHoIGJIr4TJ51GxjiDKNjrekA
 aX8Tq5C8D7mf9U/pVrvDHK3v/NSiKCwgFs46jn1RJrl2fX3w0icMfVvtho9ZBC4pnjuq
 gu4Vo3Q8ND16sbaa6mfJ2GzNF9xSrBnwjxB/LEyrkskdc/VNIHhN718isMa9GbKiHrO9
 SQ2UqQ1EzE64U5W2ScmjZYqDyipFEyiNq7axAALyZkQsdETSs6ANZUd+g+phg1/VVeS/
 C9XirSst+hCyvMh5vPeoJMUjYZdoqc2uud6FRFgcAZk6UT22WKVGKaiAm2dWXmjix5Fw
 YpbQ==
X-Gm-Message-State: ACgBeo0yoAjF5tOLWlnqTciWq6/5B3pEQ02gficlQImMAMiCWF+NvG91
 ENQLlbt/WiN7hW78wt6DSao=
X-Google-Smtp-Source: AA6agR6UwqUzz5+xf91xo0KlSVSX7Y+oXdAr35Xobwx0jMao5lWdRnLZ9EETJpgjyGPorxAeKVKRXA==
X-Received: by 2002:adf:f94e:0:b0:225:63aa:27b4 with SMTP id
 q14-20020adff94e000000b0022563aa27b4mr1252459wrr.611.1661410728330; 
 Wed, 24 Aug 2022 23:58:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 r6-20020adfdc86000000b0021e13efa17esm19377935wrj.70.2022.08.24.23.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 23:58:47 -0700 (PDT)
Message-ID: <20fe4d47-6005-f985-fe9c-d8c57d4bca60@redhat.com>
Date: Thu, 25 Aug 2022 08:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 11/17] target/i386: add 60-67, 70-77 opcodes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173250.232491-5-pbonzini@redhat.com>
 <a86a4669-45da-accb-843c-e75de1c1207f@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <a86a4669-45da-accb-843c-e75de1c1207f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 8/25/22 02:33, Richard Henderson wrote:
> On 8/24/22 10:32, Paolo Bonzini wrote:
>> +static void decode_group_0x63(DisasContext *s, CPUX86State *env, 
>> X86OpEntry *entry, uint8_t *b)
>> +{
>> +    static X86OpEntry arpl = X86_OP_ENTRY2(ARPL, E,w, G,w, .special = 
>> X86_SPECIAL_ProtMode);
>> +    static X86OpEntry mov = X86_OP_ENTRY3(MOV, G,v, E,v, None, None);
>> +    static X86OpEntry movsxd = X86_OP_ENTRY3(MOVSXD, G,v, E,d, None, 
>> None);
> 
> const.

Yes, all of this has to be constified.  Probably I'll just squash 
everything in a single patch and split it back.

Paolo


