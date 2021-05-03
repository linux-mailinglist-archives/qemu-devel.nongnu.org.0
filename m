Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC77371247
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:11:39 +0200 (CEST)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldTg2-0001gF-1E
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldTel-00011B-85
 for qemu-devel@nongnu.org; Mon, 03 May 2021 04:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldTeg-0001JG-65
 for qemu-devel@nongnu.org; Mon, 03 May 2021 04:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620029412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9D85HJYAKxB47qJ7Jd90SQiyZe8ZzNBdkjU/9SH8co=;
 b=fazKZ2+QyBjiKsskSuNAxgWMmgsN+BUuZEMaI9gXoTovXhDjVTNEHwjNCPEOVm6TJj8mq8
 Ppl/0f58JaG0nZevqXuI/MDcrKkGXsknGMLLhJXNOCpBQjp6Th645NL+Te2sqy51aLLiSO
 lch7d4r9hvBuG+IFADFdLCl8RvHVhyo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-hoZO5noFPoOUk65i36Ajhw-1; Mon, 03 May 2021 04:10:10 -0400
X-MC-Unique: hoZO5noFPoOUk65i36Ajhw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w20-20020aa7dcd40000b02903886b9b0013so4076897edu.22
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 01:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=l9D85HJYAKxB47qJ7Jd90SQiyZe8ZzNBdkjU/9SH8co=;
 b=XceDkuLnOh87lyc6pYZzqekLU2AUbfcA70ReMNA2sQoPdY/zXR8DR410uUJh4YjAkX
 ++MM68zGnPfzIj1RZn97jB4k9VlDvoAVAxsTghdhQM8A13OlgVtwy0q9S9WitMVZP+lJ
 We2T+dIts6c0vxLdgxxtMqC8urRnq2KyXKRbbt7P2o//PtTPahQavhwdJCQm1hu6hfF5
 JC/NANRW8UExutyxb0VMmFKaIdrPxuVYPiLHLRrP1qHjp7i/JDuwn8gmYTB6EbCKay0A
 4hviSMxL/Q7xXZ7wr6/sS19hAcUhM/z5QlZXGRGd25s8lvhruNe/7mGVmcPz+p2t2LEx
 +q0Q==
X-Gm-Message-State: AOAM530EAQmXVDXmu3itWEFH3dz550tequzJUHoiYKVIwmevle9G81iW
 t5DNVmxDd5/xZzwJwiXfgmRiQt4+rbgIwl7eK0dMGFeYKiw22KH5Q84Oe2KP1N7NZNcTXYsKUh8
 M3cT3uB9FzKjCuqU=
X-Received: by 2002:aa7:cd90:: with SMTP id x16mr18389524edv.182.1620029409445; 
 Mon, 03 May 2021 01:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIwxc8LDfg+gVbvJT31Yxc2SASWqJ+wxhWqSdEwMbuH+O2HSNl4HLhe6hPa9ZT1jsfodxfCg==
X-Received: by 2002:aa7:cd90:: with SMTP id x16mr18389490edv.182.1620029409077; 
 Mon, 03 May 2021 01:10:09 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c649f.dip0.t-ipconnect.de. [91.12.100.159])
 by smtp.gmail.com with ESMTPSA id g11sm10720336eje.7.2021.05.03.01.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 01:10:08 -0700 (PDT)
Subject: Re: [PATCH 4/4] pc-bios/s390-ccw: Allow building with Clang, too
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-5-thuth@redhat.com>
 <87r1iofm61.fsf@dusky.pond.sub.org>
 <15271277-98c2-3925-5937-b9f04ad376b3@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3808e5d4-b755-bce5-a25f-2d46ed6a59e7@redhat.com>
Date: Mon, 3 May 2021 10:10:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <15271277-98c2-3925-5937-b9f04ad376b3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.05.21 07:17, Thomas Huth wrote:
> On 03/05/2021 06.58, Markus Armbruster wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> Clang unfortunately does not support generating code for the z900
>>> architecture level and starts with the z10 instead. Thus to be able
>>> to support compiling with Clang, we have to check for the supported
>>> compiler flags. The disadvantage is of course that the bios image
>>> will only run with z10 guest CPUs upwards (which is what most people
>>> use anyway), so just in case let's also emit a warning in that case.
>>
>> What happens when you try to use this bios with an old CPU anyway?
> 
> Interesting question. I was expecting the guest to crash since it would be
> using a CPU instruction that is not supported on the old CPU model. But I
> just gave it a try, and there was no crash. The guest booted just fine.
> Either Clang only emits instructions that work with the old z900 anyway, or
> our emulation in QEMU is imprecise and we allow newer instructions to be
> executed on old models, too.

Yes, that's currently still done. We once thought about disabling that 
(there was a patch from Richard), but decided against it because -- back 
then -- the default QEMU model was still very basic and would have 
essentially disabled all more recent instructions as default.

We can most probably do that change soon as we have a "fairly new" 
default QEMU CPU model. I can glue it to my z14 change.


