Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2AF528859
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:18:16 +0200 (CEST)
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcUB-0001Mp-4V
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqc35-0005gO-Fk
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:50:15 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqc1s-00085l-GN
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:50:09 -0400
Received: by mail-ej1-x634.google.com with SMTP id m20so29109879ejj.10
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vxToW9UzemjSPe4LtMTEjmookjnxdLO1Q1Vz8u5JnLo=;
 b=IkufMpLZHYx+iCaMq7CpTdQGx7AYP7QzOpV29oubD+9wQJbOzCvS9JiK7Nv7q4L+YP
 YErvFir2bfGnp3gaOu9wVuijZLaYiUQoqVfF2PW+se6NSIixQ81rMNWOFXrdjcMJk/8H
 NMkjnCnPnYIfKWeiFw2R0g3DSUblcO4kbtRgfIX5peUy0tjw4ZX4enSzgdoAnhw9VkRs
 6nev1rbor3FQ7deXWoaduooT6W393xI6jHc9xpLrQG0Gjr4beiXelhcOQFTu5dw+42cS
 miHxbQFpSJM3PVr8Gl8SLyqeemYeWfWfnkHTDll1TLKNfvwjxcJUcJ+GtXRt2CxndwD/
 ks4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vxToW9UzemjSPe4LtMTEjmookjnxdLO1Q1Vz8u5JnLo=;
 b=MZuMFCZ/dY+tIw8skN/vmDGIylavQoaX/90YmWw9zW3D1qRzOImyc4DE4zX1T8GmGX
 zlMvr461aISHq5JiSxpNzRumMsvf9DJYfs3u1f7nFr2aQAD+dRjqwUokfJfIz0lcXr5l
 PVE6Toz3hK5AOEJ42XUE+YGs0KxPq5LTPmQyoaYfRdciuYEZzqyorlbgy7nAgSJAxcXF
 LYH85qTbmfv+IlBh96U4VKN7QnZPMHVuWGuB5utbhgiy0fR0GlirPmxKQdE5k6AYxw57
 ka1uCaQSDon91zq1L+4dPeR2aeTnUqaaZm1/cqA2r8PTRHlXnvXc1Hhn6l1MrkYUp4a8
 M5qQ==
X-Gm-Message-State: AOAM531KAgFQ6tbJMDmEKrRN60L7Pp6is8UAj+cukREA3hDxbi3yz+Ir
 YNsg53NFGDwzb8hKzCHruWk=
X-Google-Smtp-Source: ABdhPJy+gGihMpCRGnjgVQRQJVVC+1LnUkWF6f6No3TSQ8qAWcm8Qrluu1lv4sipBpBRUDQnQRjTkA==
X-Received: by 2002:a17:906:9b94:b0:6f3:fd8d:8a00 with SMTP id
 dd20-20020a1709069b9400b006f3fd8d8a00mr15632386ejc.90.1652712521319; 
 Mon, 16 May 2022 07:48:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 j5-20020aa7c0c5000000b0042617ba63c7sm5228564edp.81.2022.05.16.07.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 07:48:41 -0700 (PDT)
Message-ID: <780390b7-8d74-5558-19bc-175b59d8eb71@redhat.com>
Date: Mon, 16 May 2022 16:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/8] qmp: Support for querying stats
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, dgilbert@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
References: <20220516090058.1195767-1-pbonzini@redhat.com>
 <20220516090058.1195767-2-pbonzini@redhat.com> <87pmkdy9f3.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87pmkdy9f3.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
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

On 5/16/22 14:00, Markus Armbruster wrote:
>> +    StatsCallbacks *entry;
>> +
>> +    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
>> +        entry->stats_cb(&stats_results, filter->target, errp);
> If more than one of these sets an error, then the second error_setg()
> will trip error_setv()'s assertion.
> 
> What's the callback's contract?

I'll change it to free any partial results and return NULL on error. 
Same below.

>> +void add_stats_entry(StatsResultList **stats_results, StatsProvider provider,
>> +                     const char *qom_path, StatsList *stats_list)
>> +{
>> +    StatsResult *entry = g_new0(StatsResult, 1);
> Suggest blank line between declarations and statements, like in the next
> function.
> 
>> +    entry->provider = provider;
>> +    if (qom_path) {
>> +        entry->has_qom_path = true;
>> +        entry->qom_path = g_strdup(qom_path);
>> +    }
>> +    entry->stats = stats_list;
>> +
>> +    QAPI_LIST_PREPEND(*stats_results, entry);
>> +}
>> +
>> +void add_stats_schema(StatsSchemaList **schema_results,
>> +                      StatsProvider provider, StatsTarget target,
>> +                      StatsSchemaValueList *stats_list)
>> +{
>> +    StatsSchema *entry = g_new0(StatsSchema, 1);
>> +
>> +    entry->provider = provider;
>> +    entry->target = target;
>> +    entry->stats = stats_list;
>> +    QAPI_LIST_PREPEND(*schema_results, entry);
>> +}
> The order of elements doesn't matter in either list, right?
> 

Indeed it doesn't.

Paolo

