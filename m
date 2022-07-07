Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0BF569A96
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 08:38:18 +0200 (CEST)
Received: from localhost ([::1]:35716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9L9V-0005UM-No
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 02:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o9L58-0003uL-9z
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 02:33:46 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o9L53-0006Ce-1k
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 02:33:42 -0400
Received: by mail-pf1-x432.google.com with SMTP id d10so3656778pfd.9
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 23:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G+kbmL48vWTa/opXdAIknMMGBpNMklkFBqIbtWLjxJ0=;
 b=Twao0iJD+BkzkneI7OQ2t/sQvyVUXroML19LWdMPR3vp5zNoBwBmfyX3HgTVqWaqeg
 NZZLeWWekIsZglo7h0EuPPquTsFCaVnus11IotncRsyIFP0HDBo1ZRT5ngLPhXl5dYPG
 hcECKz5DaYjFsRKtxRHFJoxmmLy6DMDq/vQhVuax17m/IkkFeqmGUsi7wBqSPFRz2/6A
 huTG1HFEM14pS67xluX5yVYKH6dWUHoQ1b0sBeobH/VCZfLyUK8p4UC/BD2V+AnZXE+q
 FdlEuTx8nLl/3o9I2YwuY54Y41eB0CTLbE+0WgNnAwTdxcb6pUExAbNC74dQyvXye78k
 EX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G+kbmL48vWTa/opXdAIknMMGBpNMklkFBqIbtWLjxJ0=;
 b=UYkACmofBy2RkNr+f/WS7jCVNA6opDyXxOxn1y3NxiNWeWgQU6qcuyd3UuBFPeXhD/
 SLgHI64I7GRfeuIzH/7MQ6VYHWaStU8utNMq4UgolxobSI2bdRLEk4GqRBiX7cIqPvsd
 hAL6JCHEmyqZQlnBrbsi6Qhn0neoSlOg0gnLpKPNL3mbRaj8xbHTDPRTRNBD2vIFOW74
 y6cOXSetU8BwwoxoYJQH37dx0on/Pm0f2GASaHvRvXVv9pb4hlGIZxLsMXPZ04wtvE+k
 x9RwJiGLgFgF9IxgHv2jlNDB+16kjpM5mw33w5E1jXVtmbXvajOCxL48RCERAL/lA8Q3
 nKAw==
X-Gm-Message-State: AJIora9X3M99Yz6pNM/d2v9Wcjx8VxKOB/s3PDNdvjWphYmJTb4W2JUS
 NOvLb+F5s92o7YrmBJsI2Btr0w==
X-Google-Smtp-Source: AGRyM1uO46uqHh4k4tQyQ3VYVfBSsnaRdMz4wlPar+yBIqjo95Le13T8ASgOUQzFyoBkLlrJ8xPTrQ==
X-Received: by 2002:a63:4d61:0:b0:412:6081:4bbf with SMTP id
 n33-20020a634d61000000b0041260814bbfmr13722245pgl.109.1657175618646; 
 Wed, 06 Jul 2022 23:33:38 -0700 (PDT)
Received: from [10.76.15.169] ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090a384800b001ecd954f3b6sm16080887pjf.7.2022.07.06.23.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 23:33:37 -0700 (PDT)
Message-ID: <c29fe789-a063-26c8-bcb3-0ffb56f47016@bytedance.com>
Date: Thu, 7 Jul 2022 14:28:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Re: [PATCH v4 1/2] qapi: Avoid generating C identifier 'linux'
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: michael.roth@amd.com, kkostiuk@redhat.com, marcandre.lureau@redhat.com,
 qemu-devel@nongnu.org
References: <20220707005602.696557-1-pizhenwei@bytedance.com>
 <20220707005602.696557-2-pizhenwei@bytedance.com>
 <87edyxiglb.fsf@pond.sub.org>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <87edyxiglb.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 7/7/22 14:26, Markus Armbruster wrote:
> zhenwei pi <pizhenwei@bytedance.com> writes:
> 
>> 'linux' is not usable as identifier, because C compilers targeting
>> Linux predefine it as a macro expanding to 1.  Add it to
>> @polluted_words. 'unix' is already there.
>>
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   scripts/qapi/common.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
>> index 489273574a..737b059e62 100644
>> --- a/scripts/qapi/common.py
>> +++ b/scripts/qapi/common.py
>> @@ -114,7 +114,7 @@ def c_name(name: str, protect: bool = True) -> str:
>>                        'and', 'and_eq', 'bitand', 'bitor', 'compl', 'not',
>>                        'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
>>       # namespace pollution:
>> -    polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386'])
>> +    polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386', 'linux'])
> 
> If this list gets any longer, we better keep it in alphabetical order.
> 

OK!

>>       name = re.sub(r'[^A-Za-z0-9_]', '_', name)
>>       if protect and (name in (c89_words | c99_words | c11_words | gcc_words
>>                                | cpp_words | polluted_words)
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 

-- 
zhenwei pi

