Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686EA37BE64
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 15:41:30 +0200 (CEST)
Received: from localhost ([::1]:33400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgp7A-0003rb-LW
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 09:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgp68-000336-Mh
 for qemu-devel@nongnu.org; Wed, 12 May 2021 09:40:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgp62-00075V-MM
 for qemu-devel@nongnu.org; Wed, 12 May 2021 09:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620826816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nv8/cIW7Aex1P/YQ0RNxu8mfcUPXOYWg6oQVn+UYxdQ=;
 b=iK3bT9grPrr3oLtfEG1FZOgVDpx7nayjUwvG+j4hjS+x6eENY/qFNqkVMPRoEbIv3dRSgb
 2HigYonpZ/LBC4ByC16MPnUxbg0xUuNj6dxBqMde9YZs2+M9St4f6y0qNr4wHCOJude4hv
 zJXUw1DgCzQj/OpsZv82dBSAKn7yFSY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-3sZXhtj1OvOuzkDQc0YIWw-1; Wed, 12 May 2021 09:40:14 -0400
X-MC-Unique: 3sZXhtj1OvOuzkDQc0YIWw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v10-20020adfc40a0000b029010eb3c9a689so2412377wrf.16
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 06:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nv8/cIW7Aex1P/YQ0RNxu8mfcUPXOYWg6oQVn+UYxdQ=;
 b=ESdp9fsRZXouLCnTVLSxgqris20oKsFXFJeWqdV42Sb4XXsvRqDBYVP9JiDp05Gqvt
 EElTZoxjy4Lui4f0pCDcDlhoc+pETHq9sL9Wxm+EAasbfXiDVxYOrxjAZeUkBS4mWaEk
 OKU5MOOxCBVNb4HnLHNVs2ppL6JwynuXF3uCwiaaD0FCpexU7YlWilnwB1POm3taVwgn
 GjXq1fw4Bcs+9PJiPcqb30+l9mysnuzT47hwglPGiv8ZzF3fCPubOgc/YAllm50CB9Ty
 qoopBoC1sRJHxNTe7fUw0zhkVDSa+4VJw3seUFJhlP323OmL8AMLjwd8NZLfUk7zFh3J
 TOug==
X-Gm-Message-State: AOAM530nOOv04NBvXMMpT4zOPLvnvAR4C0XkObU6AhJ0yKBCp6++3bUE
 p4WY4AJgXrVTThGp2prIZjDqA1ZPK2Dp+uuhcfuMP1jJ2X4TDkRodKmrQMK+FO1SdQ/AvZgeBId
 zxn6omP4nE4fDs/I=
X-Received: by 2002:a05:6000:1863:: with SMTP id
 d3mr45581603wri.126.1620826813107; 
 Wed, 12 May 2021 06:40:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyyRuSj8zw4LLEKMgLC0i4e06DD/102vsA+BdAvPzeLD4A0CR4rFoPxMrTosIxDMI1qznjBw==
X-Received: by 2002:a05:6000:1863:: with SMTP id
 d3mr45581568wri.126.1620826812857; 
 Wed, 12 May 2021 06:40:12 -0700 (PDT)
Received: from thuth.remote.csb (pd9e832bb.dip0.t-ipconnect.de.
 [217.232.50.187])
 by smtp.gmail.com with ESMTPSA id j10sm30818124wrt.32.2021.05.12.06.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 06:40:12 -0700 (PDT)
Subject: Re: [PULL 8/9] pc-bios/s390-ccw: Allow building with Clang, too
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20210510073524.85951-1-thuth@redhat.com>
 <20210510073524.85951-9-thuth@redhat.com>
 <e35749b2-2452-4a6c-2eb3-81a969a2704a@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0b9763cb-f593-011a-0ca8-467c74c04069@redhat.com>
Date: Wed, 12 May 2021 15:40:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <e35749b2-2452-4a6c-2eb3-81a969a2704a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2021 13.53, Philippe Mathieu-Daudé wrote:
> On 5/10/21 9:35 AM, Thomas Huth wrote:
>> Clang unfortunately does not support generating code for the z900
>> architecture level and starts with the z10 instead. Thus to be able
>> to support compiling with Clang, we have to check for the supported
>> compiler flags. The disadvantage is of course that the bios image
>> will only run with z10 guest CPUs upwards (which is what most people
>> use anyway), so just in case let's also emit a warning in that case
>> (we will continue to ship firmware images that have been pre-built
>> with GCC in future releases, so this should not impact normal users,
>> too).
>>
>> Message-Id: <20210502174836.838816-5-thuth@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   configure                 | 9 ++++++++-
>>   pc-bios/s390-ccw/Makefile | 3 ++-
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 4f374b4889..5ebc937746 100755
>> --- a/configure
>> +++ b/configure
>> @@ -5417,9 +5417,16 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
>>   fi
>>   
>>   # Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
>> +# or -march=z10 (which is the lowest architecture level that Clang supports)
>>   if test "$cpu" = "s390x" ; then
>>     write_c_skeleton
>> -  if compile_prog "-march=z900" ""; then
>> +  compile_prog "-march=z900" ""
>> +  has_z900=$?
>> +  if [ $has_z900 = 0 ] || compile_prog "-march=z10" ""; then
>> +    if [ $has_z900 != 0 ]; then
>> +      echo "WARNING: Your compiler does not support the z900!"
>> +      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
>> +    fi
>>       roms="$roms s390-ccw"
>>       # SLOF is required for building the s390-ccw firmware on s390x,
>>       # since it is using the libnet code from SLOF for network booting.
>> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
>> index 83fb1afb73..cee9d2c63b 100644
>> --- a/pc-bios/s390-ccw/Makefile
>> +++ b/pc-bios/s390-ccw/Makefile
>> @@ -34,7 +34,8 @@ QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-stringop-overflow)
>>   QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
>>   QEMU_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
>>   QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
>> -QEMU_CFLAGS += -msoft-float -march=z900
>> +QEMU_CFLAGS += -msoft-float
>> +QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS),-march=z900,-march=z10)
>>   QEMU_CFLAGS += -std=gnu99
>>   LDFLAGS += -Wl,-pie -nostdlib
> 
> This broke the travis-ci  "[s390x] Clang (disable-tcg)" job:
> https://travis-ci.org/github/qemu/qemu/jobs/770794417#L1776
> 
> Description:	Ubuntu 18.04.4 LTS
> Release:	18.04
> Codename:	bionic
> 
> $ clang --version
> clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
> Target: s390x-ibm-linux-gnu

Darn! ... I guess we should switch to the clang-10 package which should be 
available there, since Daniel also plans to raise the minimum Clang version 
to 7.0 now ... I'll try to come up with a patch...

  Thomas


