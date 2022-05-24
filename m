Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E1532F2F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:45:32 +0200 (CEST)
Received: from localhost ([::1]:42704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXf1-0000RH-A1
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntXc0-0006eF-JQ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 12:42:24 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntXbv-00077c-MS
 for qemu-devel@nongnu.org; Tue, 24 May 2022 12:42:24 -0400
Received: by mail-ed1-x535.google.com with SMTP id q15so664245edb.11
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ePsHHhuLxBHxcW0sz4YYh0GBbv0Z70+S0bPU1zfBnhE=;
 b=Z/T7eVvpcBN1BlDKDUMfxQnQ5upVensMgOXT/FQ/itGUDUcJyOhyxg9dFluWAA4tKA
 Eh55rkQHl4vssuIVVskuWhc+I+YBRbTy+b3l+mTJ2SESRZTyHTPuQedHvoaFb1ViLuZH
 ihkt2IJb6QPwo931Ih6aKTHX6m+jlQtzXAswQ589T+q7aTbAXGEfSP4WLvRbVtyq8b8A
 BCOG8LV5O7GS0xcJl6/FnwcvGQlEieIE0E7ZDArx5WxgVl9Raqfe2iflGm6YBSxMhbdL
 SbcuErvl+99hdm59xpGAX49AHKGyFIr9XqfTruLPqQ7fX3BWwldBv9U5GqlOQKVAAVm+
 3s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ePsHHhuLxBHxcW0sz4YYh0GBbv0Z70+S0bPU1zfBnhE=;
 b=q0tXOScHrKSyZXv4k/RoTs0k+iZVjerB0suF5/WA9jU9nk4EijlrLIMUeHlHZlfXIM
 WyFBmCwwPOSpfH74R2wC5kqe+9md1ysY1T4JGu9D4zfvyjYqXcMb+cp+l5yFwYlTTRc1
 0yAdJLLLOkmBz1NqMydeM3ojI6xSzEC6ems9PDQAJPB6ue74F3XZGWwHaABF+gs883q3
 7JN3as3SuqeHEXcmP54iaV5pGKUFexlCfd4dqZJF6IvtWtKC6vDW9zhFDH6j/MTKHEgM
 jHtNoHG9Q9ZPXA0qiYn2ltjFnlPG2BVWy9mZlke5sOisn+1kCFuQAeWKG0gQ9XuRW4ug
 NdGQ==
X-Gm-Message-State: AOAM531YlRDS1K8l7/Icn103GunRCcUni2g7fVxsouRaO9zDbUH9Akcd
 XhGmP/wlB/47deh2QyP7L/E=
X-Google-Smtp-Source: ABdhPJzbS6gpUsVRilWLGdCNfN8TBFiKKAPoMip9RHsvPwt1MkIFolh42DG2Ik+YLIu4hNmnAO9tvQ==
X-Received: by 2002:a05:6402:4306:b0:42b:694a:b84b with SMTP id
 m6-20020a056402430600b0042b694ab84bmr11747247edc.67.1653410537811; 
 Tue, 24 May 2022 09:42:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 d1-20020a50fb01000000b0042617ba63basm9457214edq.68.2022.05.24.09.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 09:42:17 -0700 (PDT)
Message-ID: <b1809a3c-cb27-ab90-b339-92548f36ca87@redhat.com>
Date: Tue, 24 May 2022 18:42:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 5/8] qmp: add filtering of statistics by provider
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Mark Kanda <mark.kanda@oracle.com>
References: <20220523150509.349412-1-pbonzini@redhat.com>
 <20220523150722.349700-1-pbonzini@redhat.com>
 <20220523150722.349700-5-pbonzini@redhat.com> <877d6bxg9a.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <877d6bxg9a.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 5/24/22 14:32, Markus Armbruster wrote:
>> + * @provider: stats provider
> Argument documentation that merely paraphrases the type is redundant.
> May I have a proper contract?
> 

"stats provider matched against QMP command arguments"?

>>
>> +static bool stats_provider_requested(StatsProvider provider,
>> +                                     StatsFilter *filter)
>> +{
>> +    StatsRequestList *request;
>> +
>> +    if (!filter->has_providers) {
>> +        return true;
>> +    }
>> +    for (request = filter->providers; request; request = request->next) {
>> +        if (request->value->provider == provider) {
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
> 
> This is just like apply_str_list_filter().  Good!  Could we make the two
> names similar, too?

It looks similar but there is a difference in patch 7, in that it also 
returns the "names" filter.  I can rename it to 
find_stats_provider_filter() if you prefer.

All other suggestions applied, thanks.

Paolo

