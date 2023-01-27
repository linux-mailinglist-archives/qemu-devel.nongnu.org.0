Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BFC67EA7C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 17:11:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLRIy-0001Y6-Qu; Fri, 27 Jan 2023 11:10:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pLRIw-0001Xy-Rw
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 11:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pLRIv-0004iB-87
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 11:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674835816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OvU+LrSTH0wSIp6QJVkik6Tg18FONhiOE6ZSUUpEFI0=;
 b=YSNHcqcM8Bww2j5kvYBgMQvfuaXy5sZOeeE2T5QkVInRo/KgOMR0InlM6ikxMG9EleTGc1
 0mW4fNEFKu9lNGDRsW58K2OGB0dkrRcGG24X3AjFXkLaZFidRn+D4vFJQam3q7OB51yDZg
 RplZ6SEsSEPapPY1VwWHo1+3DQUnBpM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-a-wq_5TFPGyFaiyBP0Ez2w-1; Fri, 27 Jan 2023 11:09:55 -0500
X-MC-Unique: a-wq_5TFPGyFaiyBP0Ez2w-1
Received: by mail-wm1-f69.google.com with SMTP id
 e38-20020a05600c4ba600b003dc434dabbdso183750wmp.6
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 08:09:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OvU+LrSTH0wSIp6QJVkik6Tg18FONhiOE6ZSUUpEFI0=;
 b=6dcyympWP4ZMmB/qRcDH72VGBqu+j7pNkz5yCTEJE64VEQjypx+dAjjZmJjlPGfs96
 emh6Tst0pGNa/rIs5jLqoa1E4vwF4KXlNxpKFwGMvU5IR7mFRVDU7zQFg9YvdYDoS0Z0
 mfsokM5bXHXgvZHrnXjnS5P7PUoDWWBVqDF+6xVvd9fWY3kCEYtfun2ctoDaAQQm4PnU
 W2FKfMTO/NZQ1VoWpEu8bKyAqZyP9C7wRKfdVB6c18UPkbvck+ZihJe72z/eSVD2iDrI
 AWpYsxxyb6JscUbLQtvmshkFQf4D978zikFUW16wAE0Ip3ewBiEgDpK4ZTbq5JuXucrV
 7yRA==
X-Gm-Message-State: AO0yUKUqyzUOEqGVmySHWYcT+3GDXRDlWewaw3UgeI55xbl9GxsFYzle
 b4/JjBrnWx5n96Pj9v4BDz3DNzwvocMgeNMsYIYzER3i1uiolu2YLUAahrjyIujHJf0HDVVByQu
 RewH2Gw1jPeTfRvE=
X-Received: by 2002:a05:600c:3d92:b0:3dc:3b29:7a4 with SMTP id
 bi18-20020a05600c3d9200b003dc3b2907a4mr2441581wmb.0.1674835794591; 
 Fri, 27 Jan 2023 08:09:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8w+xz6nwszjRbsYoR6UGHLB1nSuNU/XzuA+YEF7663sZEsKy9R5dSIQnXCMR5wdcqMNfjZxA==
X-Received: by 2002:a05:600c:3d92:b0:3dc:3b29:7a4 with SMTP id
 bi18-20020a05600c3d9200b003dc3b2907a4mr2441563wmb.0.1674835794344; 
 Fri, 27 Jan 2023 08:09:54 -0800 (PST)
Received: from ?IPV6:2003:d8:2f16:1800:a9b4:1776:c5d9:1d9a?
 (p200300d82f161800a9b41776c5d91d9a.dip0.t-ipconnect.de.
 [2003:d8:2f16:1800:a9b4:1776:c5d9:1d9a])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a05600c420a00b003c6b70a4d69sm4512379wmh.42.2023.01.27.08.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 08:09:53 -0800 (PST)
Message-ID: <40962115-a8f3-ac9f-d505-8ac94165b68b@redhat.com>
Date: Fri, 27 Jan 2023 17:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 32/36] target/s390x: Use tcg_gen_atomic_cmpxchg_i128
 for CDSG
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-33-richard.henderson@linaro.org>
 <b3fcf846-1bc9-84e7-0adb-4a7eb1e9ec80@redhat.com>
 <49c17ab2-c179-724a-0f60-5ff43e9af54e@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <49c17ab2-c179-724a-0f60-5ff43e9af54e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 26.01.23 22:01, Richard Henderson wrote:
> On 1/26/23 01:27, David Hildenbrand wrote:
>>>    static DisasJumpType op_csst(DisasContext *s, DisasOps *o)
>>> @@ -5419,6 +5410,14 @@ static void prep_r1_P(DisasContext *s, DisasOps *o)
>>>    }
>>>    #define SPEC_prep_r1_P SPEC_r1_even
>>> +static void prep_r1_D64(DisasContext *s, DisasOps *o)
>>> +{
>>> +    int r1 = get_field(s, r1);
>>> +    o->out_128 = tcg_temp_new_i128();
>>> +    tcg_gen_concat_i64_i128(o->out_128, regs[r1 + 1], regs[r1]);
>>
>> I really wonder if we should simply move the tcg_gen_concat_i64_i128() into the op and use
>> a generic "allocate out_128" instead.
>>
>> At least that part here confused me heavily.
> 
> Just the prep_r1_D64 bit of it?

Yes.

> 
> Better for you as
> 
> 
>       C(0xeb3e, CDSG,    RSY_a, Z,   la2, r3_D64, 0, r1_D64, cdsg, 0)
> 
> 
>    static DisasJumpType op_cdsg(DisasContext *s, DisasOps *o)
>    {
>        int r1 = get_field(s, r1);
> +    o->out_128 = tcg_temp_new_i128();
> +    tcg_gen_concat_i64_i128(o->out_128, regs[r1 + 1], regs[r1]);
> 
> 
> The existing generic "allocate out_128" is named "new_x", which I thought was also
> confusing, since this isn't an "x" format operation.  Since there's only one use, I did it
> inline.

LGTM

-- 
Thanks,

David / dhildenb


