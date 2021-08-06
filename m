Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB83E29B7
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:32:58 +0200 (CEST)
Received: from localhost ([::1]:55098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBy5x-0004BO-Rn
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBy4T-0003JB-TX
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBy3y-00011Z-3X
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628249453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zTc/udI9/i3P/ppdI8dhoXZsyuNLeGElTm+99f9ZuU=;
 b=MAPZejDFzjTqQXuyOgOKAa+oy1fBxPEiVRSaP2i/Sw/ITg0Jmxq+HlX1l4gr/yjezkV8d4
 PCltxGRfD/DfXMuwNYLmpZPBmwknHbd295wZa6/EpnlA9SanVcxdq/3DMFRkY1qD/1ljno
 C9dHWYWaLVzeP+hFATt+8AOMJQyJv/I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-ls8RvIjrM8SPv0uXRneGQQ-1; Fri, 06 Aug 2021 07:30:51 -0400
X-MC-Unique: ls8RvIjrM8SPv0uXRneGQQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so3027640wrs.13
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 04:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/zTc/udI9/i3P/ppdI8dhoXZsyuNLeGElTm+99f9ZuU=;
 b=V83FMRs+A/J7z0BfVYDFBRfRW41ZTS/BDDAxOSTR8zcjOTB3WnjTtQv97YAGirPg1E
 p5xjIbzS+QxYDIVVhi4MYSKMLF7g8XBMzmooexDBxGm45bOeA4YKwDHvxN4UlF6qWucs
 EvYSEVat8ILq8RrL16o5W9ERykOmihyYcCrdI/bDJwTVcm/ZEX//POCptaF6BL2/ZDkZ
 V+kQweMgZeTOyyxOrXsZL6Mv2IfeT5jskDO1rMEIKTJ8hCQWN+RdpUsRrNQl9Mt3uf1H
 IEnTjgiRluEo0zWs2cXpH94M1v8BhTQfG1CBk9dzAvUL5UgvyqQMNnEp4yi46/Ta8Rvg
 UZVg==
X-Gm-Message-State: AOAM5326AvWnSoFO8Yw3cN1pZWdXbP1dSKaxT65s3wzzOZvkby8Xxw+2
 mQS3PFRdeYs14rLIrMmQsDtE9r1c8tPUSuvCCzzM9kAxJY7dC7XvWmVddpMgXmbTs60tG1G1PV+
 oFEwLfVAPtuh1dRs=
X-Received: by 2002:adf:cf07:: with SMTP id o7mr10133788wrj.216.1628249450743; 
 Fri, 06 Aug 2021 04:30:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaCHFcrQK99QhqeCqi0jTZcntbMHmDyHPRc20hG96oco3x2spvCiODHnuw5fZVHevw86tlJg==
X-Received: by 2002:adf:cf07:: with SMTP id o7mr10133778wrj.216.1628249450625; 
 Fri, 06 Aug 2021 04:30:50 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id o28sm5112161wms.14.2021.08.06.04.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 04:30:50 -0700 (PDT)
Subject: Re: [PATCH v1] s390x/tcg: fix and optimize SPX (SET PREFIX)
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20210805125938.74034-1-david@redhat.com>
 <878s1ezusz.fsf@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <4b2cd02f-6612-cc81-eab1-863d20b6d989@redhat.com>
Date: Fri, 6 Aug 2021 13:30:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <878s1ezusz.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 13:17, Cornelia Huck wrote:
> On Thu, Aug 05 2021, David Hildenbrand <david@redhat.com> wrote:
> 
>> We not only invalidate the translation of the range 0x0-0x2000, we also
>> invalidate the translation of the new prefix range and the translation
>> of the old prefix range -- because real2abs would return different
>> results for all of these ranges when changing the prefix location.
>>
>> This fixes the kvm-unit-tests "edat" test that just hangs before this
>> patch because we end up clearing the new prefix area instead of the old
>> prefix area.
>>
>> While at it, let's not do anything in case the prefix doesn't change.
>>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
>> Cc: qemu-s390x@nongnu.org
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   target/s390x/tcg/misc_helper.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> Is this still -rc material? Especially as we are late in the -rc cycle
> already.
> 

It's been broken forever, this can wait I guess.

-- 
Thanks,

David / dhildenb


