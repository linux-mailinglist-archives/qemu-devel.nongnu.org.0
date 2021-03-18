Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF9D340385
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:39:35 +0100 (CET)
Received: from localhost ([::1]:35444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMq3x-0005k2-Qn
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMq2S-000566-DP
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMq2K-00015c-HZ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616063871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYZRtoGnAtRHf2a0RJnopb9ib12xm90CssJqJB0uoX8=;
 b=QQ8I3Cu30Cgb9HDCMi+B4+6AYqprSx6f7nnri09I5evz3zuq//Afqy86SqJ2k6iBTUftE3
 IeWPnfFfs1HNvoocIxMxyhhNcDkUIbADX/xM8ffHFk19tvYxxgdGmt5vT7D9GyZEaq02Nu
 eKpbXidlgr9I2Z+mfye52c/jgaSs9BI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-3nFwt_mCPCabVsSR9Xl7EA-1; Thu, 18 Mar 2021 06:37:48 -0400
X-MC-Unique: 3nFwt_mCPCabVsSR9Xl7EA-1
Received: by mail-ed1-f69.google.com with SMTP id w18so18117290edu.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cYZRtoGnAtRHf2a0RJnopb9ib12xm90CssJqJB0uoX8=;
 b=me1BtH+RxPqQtSnghk3mzD+pPnUFCei1lpubCjmXZNgYNDtoaChNfH/8DMtHNH/UmW
 5/MKF/aLuxuUZVJniCg4b224ouyO2JEqP3kD9ufefqW9lmeRw7elEJPsvK00q3ntZmft
 GbJ6ehGCBOWKWPOhhLkfHJv8PqAnE5DP3O7m/a/D02ypoX7G8uUu/3QDQ98R1QZfxg+l
 sn5QaS5SrnQOS1XQbbHm6BRIjOy3FxOwLOqqSI/K1FxvDtRNu9wAcl+9Ovp4WLU27jeN
 9MPMVbeJkTb7OwTA95lN9vxFPco9BEyDqOoDHY9HHeN2jdbhaUaBt5/MYpfG/nB8EJrt
 SkTw==
X-Gm-Message-State: AOAM53193hWe1hujllqIgyHFG5cDWk7i1pWx5c1UEH1IFMDJesSllMxH
 oIwSrJsu4vN692VV16NORt+dvFZ6mW9x0BqrEMsA6mnTzMS4/T9ekd2Z8FDvBJIKR/Z7jWcdmHC
 NZ4xIOQtULZctytM=
X-Received: by 2002:aa7:d687:: with SMTP id d7mr2726310edr.118.1616063867215; 
 Thu, 18 Mar 2021 03:37:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmm1x2EVuP+JueYPZXxxhfr7r1T8nQuoojM52szPg3VF4jJV4LC3osTIJymeQXVVa3A80dAg==
X-Received: by 2002:aa7:d687:: with SMTP id d7mr2726295edr.118.1616063866993; 
 Thu, 18 Mar 2021 03:37:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a22sm1667407edu.14.2021.03.18.03.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 03:37:46 -0700 (PDT)
Subject: Re: iotests failing on gitlab CI check-system-fedora job
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA_cZYF9u8RfW5mUY7TgOLsRYh1sN7oioztfSV8_990peg@mail.gmail.com>
 <6f3cd467-5013-a372-28f7-f1ca0b1f1d03@redhat.com>
 <CAFEAcA9vqEgoYzaCg0_GNyqjm5LA4-9+9p5XvBfGb1NLYpTCwQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <df8af780-70ae-b702-77a0-2a2077ad2579@redhat.com>
Date: Thu, 18 Mar 2021 11:37:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vqEgoYzaCg0_GNyqjm5LA4-9+9p5XvBfGb1NLYpTCwQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 11:07, Peter Maydell wrote:
> On Wed, 17 Mar 2021 at 23:26, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 17/03/21 23:23, Peter Maydell wrote:
>>> The check-system-fedora job in the gitlab CI seems to have
>>> started reliably failing on iotests 040 041 127 256 267:
>>>    https://gitlab.com/qemu-project/qemu/-/jobs/1106977551
>>>
>>> Could somebody have a look at what's happening, please?
>>> (This is probably a regression that's got into master because
>>> I stopped using "did gitlab CI pass" as a gate because gitlab
>>> was running massively too slowly to be usable for that.)
>>
>> It's caused by adding virtio devices to the m68k target.  Probably it
>> can be fixed by moving i386-softmmu to Fedora and m68k-softmmu to Debian.
> 
> Why are the iotests not specifying what machine type they run
> on if they care about the machine type ?

Because the intersection of people building only "uncommon" targets and 
people running "check-block" is usually empty.  Adjusting 
tests/qemu-iotests/testenv.py should be quite easy though.

Paolo


