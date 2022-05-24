Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E98532F65
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 19:06:52 +0200 (CEST)
Received: from localhost ([::1]:46060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXzf-0006tM-MP
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 13:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntXig-0007WK-Fr
 for qemu-devel@nongnu.org; Tue, 24 May 2022 12:49:18 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntXie-0008SL-In
 for qemu-devel@nongnu.org; Tue, 24 May 2022 12:49:17 -0400
Received: by mail-ed1-x52c.google.com with SMTP id d22so151540edj.4
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 09:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MjYY553/vcEYfTvcvu5s93uFvMkb0WMfvCxrsIN9Jo8=;
 b=kRVSh+QTonoYZop5ZElyUxYxXTJfOSYsnbkHyOVTwFeC5CxdrwX0ipaXywg9iGdA6+
 nsZ6IedTp2J6Pa7R/49y2meZQ4/Nxzvv9M9nwCBKEjRx0D2av+LjLJ1G4WO7lDcU3pB4
 W0lwQn2Jd2q8zRhBSlT+Y68s24Wqx6wriT6U34+4su/NbBCGBC3koeGcNew/LdDppz7C
 w8pViBKZaBIrtFNssO0HKueGpOprQJ+nodqRKg8DpAiQNV0J+Jh+WylmwLiwdlq3d0dn
 xtxXUH+d7lgj+QqQK0V6q+t1Stce6DbEnask55DukYP7XmS/BMLW8KuCCB9BP4w5uGte
 vrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MjYY553/vcEYfTvcvu5s93uFvMkb0WMfvCxrsIN9Jo8=;
 b=AlWXVJ4vF1thiabWzTbiFpaWPuDzwYMfGTzH6OHjIqJZOvQO7YSgPc+bEII7+BMzPi
 rDJ3hJNLrqzEYZMeunS+S8Qfh2n3KGMMqSw0bP4BdZ92pgTj761BxxC96ePLJ1MJDeov
 d32LV0ImnA+gVBuNGjq1/g27YBz6TDiGQnNmzhmLXdEafxmi2IfrisxE/0Dh0sa7s4ix
 Vww5UnHwDI7MgyCIbA9O9cqrYz5YbvEwyeMLvZ+AnbDX9ygM7AnL+01DrBpNo+6poSTg
 tWIClbcqgS9TT9+dR1jtzUd4/gvRPgRxP0i6FVctg3ZJAb/ZjLQLunb11v4vMHLAxHYr
 RskA==
X-Gm-Message-State: AOAM530l8KXV8lGNwiuV4ZSKGKzmRVZEIl5cLg34Bm+lXIMiOrIotMwr
 nsRzqtmVVU/+uquDOth8Xr0=
X-Google-Smtp-Source: ABdhPJyenc1c1tGsSb5+dAe3pklyA52x7aiRbGiyg5CnGmTHa0vSpNnqA4aSOjAsqidU12+TUzSuZw==
X-Received: by 2002:a05:6402:4020:b0:42a:d19f:88df with SMTP id
 d32-20020a056402402000b0042ad19f88dfmr29897460eda.56.1653410954846; 
 Tue, 24 May 2022 09:49:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020aa7c39a000000b0042617ba63cbsm9657957edq.85.2022.05.24.09.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 09:49:14 -0700 (PDT)
Message-ID: <596096e7-1717-99e6-1c1c-58b4392fb083@redhat.com>
Date: Tue, 24 May 2022 18:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 7/8] qmp: add filtering of statistics by name
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Mark Kanda <mark.kanda@oracle.com>
References: <20220523150509.349412-1-pbonzini@redhat.com>
 <20220523150722.349700-1-pbonzini@redhat.com>
 <20220523150722.349700-7-pbonzini@redhat.com> <87mtf7w00s.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87mtf7w00s.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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

On 5/24/22 15:08, Markus Armbruster wrote:
>> -typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
>> +                              strList *names, strList *targets, Error **errp);
>> +typedef void SchemaRetrieveFunc(StatsSchemaList **, Error **);
> Did you drop the parameter names intentionally? 

No, I didn't.

>> +                    /* No names allowed is the same as skipping the provider.  */
> 
> Long line.
> 
>> +                    return false;
> 
> Any other elements of filter->providers that match @provider will be
> silently ignored.  Is this what you want?

Hmm, key/value pairs are ugly in QMP.

I'll see if I can make it work nicely without inlining 
stats_provider_requested() in the caller.

> Uh, do we leak @p_names if earlier elements matched?

No, it's not copied so there are no leaks.

