Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79751323C74
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:56:34 +0100 (CET)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtiT-00027z-Gq
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEtdU-0005GV-F4
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:51:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEtdR-00041v-Ba
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614171080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WjpltYo+vjV62WrSG43rQSExKdZQjwjKzfRZCjWc+yk=;
 b=NqAxJ4/tm49cngmLNPc2mHM6mGzSUVP4S6i4W9Lq9hwML292VBMVF5vgPHj0wN3v98T7d6
 Op1NmkXOEXOdxSzxf+X+rbCW6JKPUVhtceYlhgVyKbH07SNbA8oMxFaExsupES8H1ELDTK
 b5lleqD/oBlBO3lXVjNaeFh6XE60FjM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-D3yhzEQUM1GRX83vCTgedg-1; Wed, 24 Feb 2021 07:51:18 -0500
X-MC-Unique: D3yhzEQUM1GRX83vCTgedg-1
Received: by mail-wr1-f70.google.com with SMTP id d7so991481wri.23
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 04:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WjpltYo+vjV62WrSG43rQSExKdZQjwjKzfRZCjWc+yk=;
 b=jt9YyRH5/vhGTrwi6qsl4Lg5gXn1IFdyBks/4VLMLV31c02cCiXOQyPwieIvxxeIue
 E163c+BLQo0bcDgZbNgaCMNh4ZgAlncdta2zcw5+nVWjUIbtOqb3avAAGPtOEOZ3mw80
 COrlFQHpk0z8vsEdLQQklXsaZzHGzv4QcfcSz/1liaByCX/iXTAJbUE0QbTzSDzgvl3m
 vHBCqpzz3IjnfQMXMVpzHRKYe7zymFYUBOsw3xgmNqcpl1otV9YaIY1gACOEXkUhlm44
 gCPaA+mW0mqw6P6xMXiOIEVLeApFV3tbNwsjzSJj9MXm+GkbkEZ9EwnsEn+NBSEUfEvY
 uDeQ==
X-Gm-Message-State: AOAM53272e7uKBF+AUP/kz/C+KTxUXjUp4PPrF8ivZNqMg5lNgzVkTWk
 wu5wc99h3S044W3N1M7UPrhmKexhlae3tDzKWTZ7yiqkcnvnDKNhRDMbNXIutNGDhhQAklDzp4B
 vuScrd47bWshxXiA=
X-Received: by 2002:a1c:bc41:: with SMTP id m62mr3662109wmf.164.1614171075346; 
 Wed, 24 Feb 2021 04:51:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsqrv1SQBY/Ss0/m05UYY5JwOO/7gdg+w9/CmHK8K3p3os2LYPgGhLjGd1m2x7pVJnM6gDLw==
X-Received: by 2002:a1c:bc41:: with SMTP id m62mr3662091wmf.164.1614171075189; 
 Wed, 24 Feb 2021 04:51:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v5sm2751045wmh.2.2021.02.24.04.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 04:51:14 -0800 (PST)
Subject: Re: [PATCH] meson: Only generate trace files for selected targets
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210224120923.3154325-1-philmd@redhat.com>
 <39cc99dd-54d5-9dd1-d66a-7947686dbada@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <11b6e7ad-9ac9-45fe-ebcf-1db7e396d33a@redhat.com>
Date: Wed, 24 Feb 2021 13:51:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <39cc99dd-54d5-9dd1-d66a-7947686dbada@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 1:26 PM, Paolo Bonzini wrote:
> On 24/02/21 13:09, Philippe Mathieu-Daudé wrote:
>> We don't need to generate trace files for targets we
>> are not building. Restrict the the ones selected.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   meson.build | 10 +---------
>>   1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 05a67c20d93..c9b0433667d 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1826,15 +1826,6 @@
>>     trace_events_subdirs += [
>>       'accel/tcg',
>>       'hw/core',
>> -    'target/arm',
>> -    'target/hppa',
>> -    'target/i386',
>> -    'target/i386/kvm',
>> -    'target/mips',
>> -    'target/ppc',
>> -    'target/riscv',
>> -    'target/s390x',
>> -    'target/sparc',
>>     ]
>>   endif
>>   @@ -2166,6 +2157,7 @@
>>     t = target_arch[arch].apply(config_target, strict: false)
>>     arch_srcs += t.sources()
>>     arch_deps += t.dependencies()
>> +  trace_events_subdirs += ['target' / arch]
>>       target_common = common_ss.apply(config_target, strict: false)
>>     objects = common_all.extract_objects(target_common.sources())
>>
> 
> Is this still okay if there is no trace-events file for a given arch?

No problem in my usual build configs, but I kicked a CI build to check
the all of them and be sure.


