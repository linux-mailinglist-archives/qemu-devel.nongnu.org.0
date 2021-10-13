Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F8842B974
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 09:47:59 +0200 (CEST)
Received: from localhost ([::1]:57634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maYzW-0005vo-Rd
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 03:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maYyC-00054G-1k
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:46:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maYyA-0002uj-F4
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634111193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rC1Ry0l0F/SASZ8arODcnIKs/tKw9o+3jI5go+g+RgY=;
 b=VPGPbT33vLXTQkrgZIH4Gs2Ar+SRxC/W9ZoH9y873yjrfiHd24YrWy+qszlEcMPTTWdebW
 zR4t4LKse/PTMEndIwBEEYR2egTO+xV0J0Al4hQus9EqHR37/A8yC9wyEg1+Mx2+/JujWr
 l8uu01kxjMBueLafqXF8QfnHFncldz8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-yhajNWTqMdu8BFs4xzeM1w-1; Wed, 13 Oct 2021 03:46:32 -0400
X-MC-Unique: yhajNWTqMdu8BFs4xzeM1w-1
Received: by mail-wr1-f70.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so1228445wrv.19
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 00:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rC1Ry0l0F/SASZ8arODcnIKs/tKw9o+3jI5go+g+RgY=;
 b=64/oH4YCRbpKSgqRZcgHgmCUsDP9v+yqeSgLtbNYBFa50VPLi/m7TgKr4ej5faHAxR
 beGtFwnm/bu/f4dTnEPdm49ZTl4lqZz5L2iJ+9+dre+zjzw256v0h7p4MrtlWGznrR8O
 sV8dewXHXmyHy/O2Fx7ILplZgb+5uA4KFb4P7bBQEmUjrqO61uChYAr2z7sa7xPkHuhM
 ii4QSxiVUfc++OO0LjGos1yqN4YpNoTZSEzbFxlsGQvKDi+ohLpZ6pJCjmfsJC6XM548
 SZOF/Ls52KOb8nWOgTv3IjJnAb3bIvMNMP1avH5mgRRyrUBMOBQTyurgo7khs4RQkuem
 ND0w==
X-Gm-Message-State: AOAM532HzVJy5CaCsgEZqq+pVMZS19kKN71bJoTDQgQebvo+2K0jUf1h
 4QwHo9sw0iHwexFMC0SqXCCIu75t9ubyUsNWFk+AEXXQ2l3uAlvVsUe2oGQFInydVy5R2WCxIx0
 3y1Dayg8vlqEakks=
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr38734947wry.87.1634111191205; 
 Wed, 13 Oct 2021 00:46:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhxcrAfNfRdFKczJJ12EEgD/LxSfiuGcQHwLeJre48cAInC0p2kkvZBTNZTVnF2e66w/NBxQ==
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr38734928wry.87.1634111190961; 
 Wed, 13 Oct 2021 00:46:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j15sm1510410wrr.8.2021.10.13.00.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 00:46:30 -0700 (PDT)
Message-ID: <e16817c4-3628-387d-e571-df1566520686@redhat.com>
Date: Wed, 13 Oct 2021 09:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 13/24] configure, meson: move remaining HAVE_* compiler
 tests to Meson
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-14-pbonzini@redhat.com>
 <730e39f2-69c2-b26e-24b7-1be52ae4e23d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <730e39f2-69c2-b26e-24b7-1be52ae4e23d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 15:17, Thomas Huth wrote:
> 
>> @@ -1609,7 +1626,8 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not 
>> cc.compiles('''
>>           return printf("%zu", SIZE_MAX);
>>       }''', args: ['-Werror']))
>> -ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
>> +ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
>> +    'HAVE_GDB_BIN']
> 
> That HAVE_GDB_BIN shows up here a little bit by surprise  ... maybe 
> mention it in the patch description?

It was handled below by the "elif" clause that has been removed.  It 
does not appear in C code so it can be completely ignored; I can make it 
a completely separate patch.

Paolo

>>   arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
>>   strings = ['CONFIG_IASL']
>>   foreach k, v: config_host
>> @@ -1624,7 +1642,7 @@ foreach k, v: config_host
>>       config_host_data.set('HOST_' + v.to_upper(), 1)
>>     elif strings.contains(k)
>>       config_host_data.set_quoted(k, v)
>> -  elif k.startswith('CONFIG_') or k.startswith('HAVE_')
>> +  elif k.startswith('CONFIG_')
>>       config_host_data.set(k, v == 'y' ? 1 : v)
>>     endif
>>   endforeach
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>


