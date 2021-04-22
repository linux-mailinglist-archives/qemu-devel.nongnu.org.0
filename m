Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD42368431
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:48:33 +0200 (CEST)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZbZA-0000Qh-IP
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZbUt-00061L-Fg
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:44:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZbUq-0007fU-DA
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619106242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmiIuis8dnFMKsFA4f8dDFAzxrmJZRCzpS0aR4Hr+yU=;
 b=NaGkvASKGC6TIjcNy7ZCc9PC18WuSLUVNRXDsuLN0ubc+COjDO8KHI6nPWOMvS6SM2hz7n
 0u94e6q4eobuMnTF0Yfs5DQV9Io70NxRpgxwSf2JY5J3Re2vlGoS+h7pxX4sWp91Z50dLY
 JfUAUUi8qDejAcF0MtGOManphhG+5fc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-9STbx9L5Mf6ZWB7bo_tIng-1; Thu, 22 Apr 2021 11:44:00 -0400
X-MC-Unique: 9STbx9L5Mf6ZWB7bo_tIng-1
Received: by mail-wr1-f72.google.com with SMTP id
 f15-20020adffccf0000b02901028c7339ccso14009870wrs.1
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bmiIuis8dnFMKsFA4f8dDFAzxrmJZRCzpS0aR4Hr+yU=;
 b=HSpTExTO5yhnIZfVDwjsUCtZOp3TLJmI5pgVkY+119PhNoklTH32ICUbkvtY+RbYFS
 BGQyerRT++1Yv7u4kVxNsPRlwb03Hz6nMe/gPBViJWQDoQk7hLpOGD+gvo6D61ekxE3s
 EzMaKJVcuyG33nTxTBObtK4EcVcq+aFu14sku29WqUl4Coc0tM8pzrmjxX4oAnL0M+OW
 VLMNHJa+G4FglBdnhoPbys1BdmmzIaIyFnMnnEBDfZqnLmCwIeq1bDQlbd7YH1VXPNG5
 TvW2Qs0w0Ic7/sQOa5c5ihGThRNF9F5OOkJSzSEGsp9zgFjWq2dki1y4fjGgAyYh74kk
 yfrA==
X-Gm-Message-State: AOAM530owc4DKF0HKsyARFONrkjMPI6ciPngXMlg0jwbr+cZ4TleoQo1
 Eitu8nJ35W+mOanD7mqbg8R11j0jzBRimZegClna7kkhzpxsPieeVKexq0UvPtyMRPx1ZeFM+au
 AVbIyTJLc/RK7+qs=
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr4522661wma.164.1619106238945; 
 Thu, 22 Apr 2021 08:43:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyecEYpM6tLGNIAfnKxGFUd0Rz7o+tWcPfkDGoODWsjVoMnC/6rY4l/+tDD2EQNB8kskCDmrQ==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr4522622wma.164.1619106238618; 
 Thu, 22 Apr 2021 08:43:58 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a142sm7157042wmd.7.2021.04.22.08.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 08:43:58 -0700 (PDT)
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
To: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
 <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
 <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
 <8afd0f34-7e75-2661-9ea5-3ebadff3b85d@redhat.com>
 <2ec6e995-6833-1ebd-03c8-a3fede7fddb8@de.ibm.com>
 <e4116908-7172-fd9c-1837-82c489b61620@redhat.com>
 <c95369e4-ffc9-d01d-45c1-4daad0ead6a5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0d8d75bc-fe1c-b144-dd0f-27aeb04e5b9c@redhat.com>
Date: Thu, 22 Apr 2021 17:43:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c95369e4-ffc9-d01d-45c1-4daad0ead6a5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 5:38 PM, Thomas Huth wrote:
> On 22/04/2021 16.31, Philippe Mathieu-Daudé wrote:
>> On 4/22/21 2:41 PM, Christian Borntraeger wrote:
>>> On 22.04.21 13:47, Thomas Huth wrote:
>>>> On 22/04/2021 13.24, Philippe Mathieu-Daudé wrote:
>>>>> On 4/22/21 12:30 PM, Peter Maydell wrote:
>>>>>> On Thu, 22 Apr 2021 at 11:18, Daniel P. Berrangé
>>>>>> <berrange@redhat.com> wrote:

>> We are good with:
>>
>> -- >8 --
>> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
>> index 29fd9019b8..dcec09b6f9 100644
>> --- a/pc-bios/s390-ccw/Makefile
>> +++ b/pc-bios/s390-ccw/Makefile
>> @@ -8,6 +8,9 @@ CFLAGS = -O2 -g
>>   quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 &&
>> $1, @$1))
>>   cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null >
>> /dev/null \
>>                2>&1 && echo OK), $1, $2)
>> +cc-c-option = $(if $(shell $(CC) $1 $2 -c -o /dev/null -xc /dev/null \
>> +                >/dev/null 2>&1 && echo OK), $2, $3)
>>
>>   VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
>>   set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath
>> $(PATTERN) $1)))
>> @@ -30,6 +33,7 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o
>> menu.o \
>>            virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
>>
>>   QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
>> +QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS),
>> -Wno-stringop-overflow)
>>   QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks
> 
> I think you don't need the "cc-c-option" magic here. Just add the
> -Wno-stringop-overflow. All supported versions of GCC and Clang simply
> silently ignore unknown -Wno-something options (try e.g. "gcc
> -Wno-yadayadayada" on the command line).

Indeed, TIL :)


