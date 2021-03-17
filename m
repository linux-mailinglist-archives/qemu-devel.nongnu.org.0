Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C5233F777
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:49:50 +0100 (CET)
Received: from localhost ([::1]:37242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMaIn-0006Is-0T
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMaGC-0004ew-J2
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:47:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMaGA-0000d6-Qg
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616003226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=18FKhwPVTyKYBHM0lWi6QajG5I71vefaEIfeRB8N7YE=;
 b=SytJqm+kYzoXH3tX2hzdd2neT/jfOY1Uy1cS6wRnY9iNz2yKq94pzKnU2NWE/2yfw64hui
 MCLgqvk13/dhU63i4UjYFPBMAyQPKaRUWPqUOv4D7VD6pRq77FuH360x4IeE8WtBTMjhck
 mk7D7GNUVcH0pzpqUMNE/M2PI9dEsu4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-oQBlzbMTOsKunPQFXk-gWw-1; Wed, 17 Mar 2021 13:47:04 -0400
X-MC-Unique: oQBlzbMTOsKunPQFXk-gWw-1
Received: by mail-ed1-f69.google.com with SMTP id q12so4387948edv.9
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 10:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=18FKhwPVTyKYBHM0lWi6QajG5I71vefaEIfeRB8N7YE=;
 b=GbGBfVCQH51xPVKqZXZHv6jiRBNF5tSHhfFNlgRxhJIehvIdko5mJIvVW9KiiKYDLx
 Ba82gdiiZ4HNyLwMLRDbarj1b0Qr0djE8pdIEEGFsndn+V1JAVcag/Zc0S5JYBL22dIT
 MLsZB5pkInSinsdutPXYzxdDVksM/UcXAd8Zt0zT0YKr0lCyU5LycykL7bsBxRjfC5BG
 dEK87jkf7dLvE3dPP+eLamSj1Fj709DoJ84fR5gInMMLmIEzOfHEnu3dPAR+k09i94nh
 RiogYjeC+dIlgbheAqWey003/u+7KzR6QNmSnabxC66sWmYzoj7IlQZZh4iFSqiKNSZG
 oluA==
X-Gm-Message-State: AOAM532emwcu65QKnifQtC4yHbxpsxovMj+XHW7NsNt5DZi6RLrNs8gW
 9DkDrFr4fh1xQQmEevH/8ZuUfqBCehm+QM7H5u9wG9YdbbpXdm5WLiV+wchLPS87VTo2tLeA3qs
 4i1a5oB/eXvGu5gk=
X-Received: by 2002:a17:906:6bd1:: with SMTP id
 t17mr37094362ejs.319.1616003222714; 
 Wed, 17 Mar 2021 10:47:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt/7rGGqECtmOcJ/ynj+wGDiuevvgXIbWjHAR57C8Q/bp+fELmXScAWOxKRsb65ZqS5NN75A==
X-Received: by 2002:a17:906:6bd1:: with SMTP id
 t17mr37094343ejs.319.1616003222569; 
 Wed, 17 Mar 2021 10:47:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ld19sm12229000ejb.102.2021.03.17.10.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 10:47:01 -0700 (PDT)
Subject: Re: [RFC PATCH 4/8] qtest/fuzz: Restrict CPU I/O instructions
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
References: <20210314232913.2607360-1-f4bug@amsat.org>
 <20210314232913.2607360-5-f4bug@amsat.org>
 <1f96a4af-dd90-c67d-adcf-d3e67e2867b5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <22026bca-65b1-ae04-290e-444eedcdfe9e@redhat.com>
Date: Wed, 17 Mar 2021 18:47:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1f96a4af-dd90-c67d-adcf-d3e67e2867b5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/21 06:14, Thomas Huth wrote:
>> diff --git a/tests/qtest/fuzz/generic_fuzz.c 
>> b/tests/qtest/fuzz/generic_fuzz.c
>> index ee8c17a04c4..3e0089f4a63 100644
>> --- a/tests/qtest/fuzz/generic_fuzz.c
>> +++ b/tests/qtest/fuzz/generic_fuzz.c
>> @@ -304,6 +304,13 @@ static bool get_io_address(address_range *result, 
>> AddressSpace *as,
>>       return cb_info.found;
>>   }
>> +static bool get_mmio_address(address_range *result,
>> +                             uint8_t index, uint32_t offset)
>> +{
>> +    return get_io_address(result, &address_space_memory, index, offset);
>> +}
>> +
>> +#ifdef TARGET_HAS_IOPORT
> 
> Sorry, but the qtests are generic code, I don't think we should 
> introduce target specific ifdefs here...?

FWIW this is not a qtest, it's a separate emulator executable and this 
file is compiled per-target.

That said, your objection does apply to patch 5 since libqos is compiled 
only once for all targets.

Paolo


