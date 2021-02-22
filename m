Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCD3321E80
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:50:27 +0100 (CET)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFLn-00022i-1o
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEFCx-0000Ic-Cc
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:41:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEFCu-0000wA-7a
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614015675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=77VYX8qyvFFdVxjrkL962xLS4W9z5d8KO6lHL7cyqdE=;
 b=gMxHdIIHOM2T6L9of/7hNsuIN7YNyonQ8NfjlNtuEbeQ5arJW/EFbJHQ+rnli66iC+Xsp+
 9nrJCrNI2IIvNbVyW0MtkYUAntspIIimh/FaAmWd8ShgmpxcOWXgFFrpDCA1ZehXPnkyIJ
 d1mdW7iZVuelVhQ6exDYruKfpDzJSmQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-ag6Uis18MPSnG_q2b-YdAg-1; Mon, 22 Feb 2021 12:41:12 -0500
X-MC-Unique: ag6Uis18MPSnG_q2b-YdAg-1
Received: by mail-ed1-f72.google.com with SMTP id z12so7405820edb.0
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:41:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=77VYX8qyvFFdVxjrkL962xLS4W9z5d8KO6lHL7cyqdE=;
 b=BLojOl7UGazwkkVGrM9ysJTvHnhAptdpqFNlSQek0izc4GeYlR6DrzLAC//Axc0a8X
 07W6TUPfqmDngU8EpT+8thtUTAERMh6lfHd2ih8pOZ+VwDDI1KUKnOtq1Rj+vvA2/51v
 G8s00yptW1WM1Dwpxq1SC5d6lxoEZqvUesZvMBC6k0eYJ3jlrwh5wgQcXln3crUCU8bv
 kPQYyYFhwTPWY95ACrIbM8KR9BDjimgJDxVIS57KzxlOmdPpIGS3vx4QuisYSXaQiakU
 u6LTQblmHAwQxIxUZeAhWuUgrXF+JWPGghII2BLw0Zueks8STsnt7KtG84MXYhr6k7D+
 qbrg==
X-Gm-Message-State: AOAM532I1tOwcZrHkjB8ZA/GO5/AWt/3MEoiynxXGyHe9yvtLV70AOWG
 VnYkY4BcGUtMBinwTPmbjTeUnuEXDJI/OLMteqGYBZj8GUCKRWZdJKvhaL+5sVsVbH0LTsALx77
 FH1Gs0dOknwkKAzw=
X-Received: by 2002:a17:906:3916:: with SMTP id
 f22mr21981069eje.328.1614015671134; 
 Mon, 22 Feb 2021 09:41:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHW8/h+A0Q0TqQKsXXcDdlUdoA+aX8vZ+NMqUGfMGQKgJyne7vdUySnR2jDa7GViPMBbw/Eg==
X-Received: by 2002:a17:906:3916:: with SMTP id
 f22mr21981048eje.328.1614015670962; 
 Mon, 22 Feb 2021 09:41:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 35sm12703670edp.85.2021.02.22.09.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:41:10 -0800 (PST)
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type() return
 value
To: Cornelia Huck <cohuck@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-2-philmd@redhat.com>
 <20210222182405.3e6e9a6f.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
Date: Mon, 22 Feb 2021 18:41:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222182405.3e6e9a6f.cohuck@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 6:24 PM, Cornelia Huck wrote:
> On Fri, 19 Feb 2021 18:38:37 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> MachineClass::kvm_type() can return -1 on failure.
>> Document it, and add a check in kvm_init().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/hw/boards.h | 3 ++-
>>  accel/kvm/kvm-all.c | 6 ++++++
>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index a46dfe5d1a6..68d3d10f6b0 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -127,7 +127,8 @@ typedef struct {
>>   *    implement and a stub device is required.
>>   * @kvm_type:
>>   *    Return the type of KVM corresponding to the kvm-type string option or
>> - *    computed based on other criteria such as the host kernel capabilities.
>> + *    computed based on other criteria such as the host kernel capabilities
>> + *    (which can't be negative), or -1 on error.
>>   * @numa_mem_supported:
>>   *    true if '--numa node.mem' option is supported and false otherwise
>>   * @smp_parse:
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 84c943fcdb2..b069938d881 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
>>                                                              "kvm-type",
>>                                                              &error_abort);
>>          type = mc->kvm_type(ms, kvm_type);
>> +        if (type < 0) {
>> +            ret = -EINVAL;
>> +            fprintf(stderr, "Failed to detect kvm-type for machine '%s'\n",
>> +                    mc->name);
>> +            goto err;
>> +        }
>>      }
>>  
>>      do {
> 
> No objection to this patch; but I'm wondering why some non-pseries
> machines implement the kvm_type callback, when I see the kvm-type
> property only for pseries? Am I holding my git grep wrong?

Can it be what David commented here?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html


