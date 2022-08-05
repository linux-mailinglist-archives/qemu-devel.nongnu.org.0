Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3352658AEC5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:19:56 +0200 (CEST)
Received: from localhost ([::1]:46662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK0zK-0005XD-TI
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oK0wL-0002jB-QB
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:16:58 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oK0wJ-000277-C6
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:16:48 -0400
Received: by mail-ej1-x629.google.com with SMTP id dc19so6056170ejb.12
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/MXaJOIb/WXpaQdhvGsRhjG2UGZfOJ/f1GMAlc4X3jQ=;
 b=aiIVez/hODjTDnbQQTXYGCz4Q4eahGIyq72AD5qY1tBhToWsyJcn+pvdFhVseP2OCp
 Of/v1Hg/BMIuT2qQt3KZuxJM9jwSstLvqFQVdFnrl/6w+DLCMDreoCnjYDGp1ef92hU9
 Dg6AP0TtEVeQ2oJK/eUpngT2GMNoclg9+m1EPK0vzahurELdiPTxbEfmBB2uTuXuFNcy
 zWgDCGd/k8lDbsoebAbyMYfqyDOOy03aXQdXYfzxQt1NFNbVRoCnwOUIbAyNYfc1Bynn
 8ViZL4CoOzs9b6ZZSOI8LEkMKjmCjFN2Rr0M8ayDj7L4iBEhesmb/m4+dn/1QUZ59q+D
 vQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/MXaJOIb/WXpaQdhvGsRhjG2UGZfOJ/f1GMAlc4X3jQ=;
 b=jXz/A1sUVrs9oRW5b6KLfgM5f8SMFS7SzWKAgktpTr4o1+erzL/OpKFadyA/+OqGit
 gbht2T59AvduUZW9NrptdaTWTdVqCSvO+Y3V1lppiBmTlBAibESsTXwwbApBUakFdbi/
 JtqDONph9JOTKrlUrIEfa20cWjXwkMS6JAYGxZbyC8ouVbtcZOAvotQGsyrLf9o2myxw
 TXMC/ahedwxN4ZXFWnUDuTWoXrLTfOUAGDdXwajROa4CYBUSllwdI7G8Xuu+GY9b/eH+
 5p7aQ3RXyNqJG7RrJEWuVWU5lu+g1SPLjQhWE6BSx2ghmppMTkRY6eWqegTlwxZmCw+/
 7sJQ==
X-Gm-Message-State: ACgBeo1bq9xdX9lITqRXoNFrxIbxLmqoyB5MIT3YWZo4HJuQ8koK8d32
 76m01ukKtq97MNsaYqFtb9k=
X-Google-Smtp-Source: AA6agR6elxNDoCwWqCcjG7BRwMeknP+X3SU4Aspk/XtnWFjZoxXQNlhvsxu5pl+8yUf7c9hk7TVEZQ==
X-Received: by 2002:a17:906:8461:b0:730:a43a:9981 with SMTP id
 hx1-20020a170906846100b00730a43a9981mr5901724ejc.552.1659719805157; 
 Fri, 05 Aug 2022 10:16:45 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 l18-20020a1709063d3200b006fe0abb00f0sm1736028ejf.209.2022.08.05.10.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 10:16:44 -0700 (PDT)
Message-ID: <438ab33b-62c8-d114-4360-9baa2300cc58@redhat.com>
Date: Fri, 5 Aug 2022 19:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1] vl: fix [memory] section with -readconfig
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220805100635.493961-1-pbonzini@redhat.com>
 <875yj66c6f.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <875yj66c6f.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 8/5/22 15:40, Markus Armbruster wrote:
>> +    loc_push_none(&loc);
>> +    qemu_opts_loc_restore(opts);
>> +
>>       prop = qdict_new();
>>   
>>       if (qemu_opt_get_size(opts, "size", 0) != 0) {
> This treats "size=0" like absent size.  Before commit ce9d03fb3f, we
> instead checked
> 
>         mem_str = qemu_opt_get(opts, "size");
>         if (mem_str) {
> 
> Makes more sense, doesn't it?

True, on the other hand before commit ce9d03fb3f we handled "-m 0" like 
this:

     sz = 0;
     mem_str = qemu_opt_get(opts, "size");
     if (mem_str) {
         ...
     }
     if (sz == 0) {
         sz = default_ram_size;
     }

Now instead, the "-m 0" case results in no qdict_put_str() call at all. 
  So the code flows better with qemu_opt_get_size(opts, "size", 0).

In addition, using qemu_opt_get_size() is what enables the dead code 
removal below, because it generates an error for empty size.

> Also, with the new check above, the check below...
> 
>             mem_str = qemu_opt_get(opts, "size");
>             if (!*mem_str) {
>                 error_report("missing 'size' option value");
>                 exit(EXIT_FAILURE);
>             }
> 
> ... looks dead.  We get there only when qemu_opt_get_size() returns
> non-zero, which implies a non-blank string.

Makes sense.  Separate patch?

>>   static void qemu_create_machine(QDict *qdict)
> Commit ce9d03fb3f changed this function's purpose and renamed it from
> set_memory_options() to parse_memory_options().
> 
> This commit is a partial revert.  It doesn't revert the change of name.
> Intentional?

Yes, though honestly both are pretty bad names.  set_memory_options() is 
bad because it's not setting anything, it's just putting the values in a 
QDict.  I kept parse_*() because it does do a limited amount of parsing 
to handle the suffix-less memory size.

Paolo

