Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363963DA596
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 16:06:07 +0200 (CEST)
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m96fm-00071s-Ab
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 10:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m96ey-0006FQ-W7
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:05:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m96ev-0002S3-Ct
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627567511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rUvhO8Gt2xALndgu76or/PMeqHgvUKP6K7hzWm+H+w=;
 b=Bixk/BOu2ga5/b2qy9NnltWLAmmzmNG8JrWHxqXgp5AJ9pi1Z3qFSV+wg5SVv5Zj8JyrjT
 ar/YcSc0b+e2nCvTbva4tjM9in2NFRiDQn4MWnbgNIL/q2guvhcXtkCsCQxHQNe0oltqK7
 WrjopjK6siJBR5SwQz3X1JXkCXLPbQ0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-9IhcGXgvOkaHFzlYRLzszw-1; Thu, 29 Jul 2021 10:05:10 -0400
X-MC-Unique: 9IhcGXgvOkaHFzlYRLzszw-1
Received: by mail-wm1-f69.google.com with SMTP id
 132-20020a1c018a0000b029025005348905so2032062wmb.7
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 07:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1rUvhO8Gt2xALndgu76or/PMeqHgvUKP6K7hzWm+H+w=;
 b=mQjXp1pRq/uEJQibJlfY4NTjYsDb6HMwAWn/PTfVtywiydB3VH8VOyHzfvTowyZ4rK
 INpWStlMtBBil0P3K+e354gCkp3a12TgAtOnwOFPy1lIHsK7VBehPvkSOq4zVBi4wW1k
 5yP36Afbx+GoG6tRwtoWQkwmuCr8nSU1UI9Okh9xvmZCEZXuqzB/pK9eMSSsky5WO71h
 fcZC171ZTlFe9fMhZnTpi2LbqXPgj2Ykm/feiksEdLuY5ZHY+Es/IQtFef+H3m5ej8Qb
 MfjRApZP0npbKTtgwNZn+i//DjjxZK44JQ1f4uIuom/Bn5pNMq11n+Htv4XC2jo8WB7y
 XIrw==
X-Gm-Message-State: AOAM530FfwYCvke6NjKKJUJDifmxnKESe9vzo+DbDeRc+NJIulx69qAG
 kCf2ih58ZXh5ZJY2Ehb7ujocQr2qqteDbzO5Rue/rtJOAPzZ8H77mPnj9dmNhtVPK7KJpmlUecB
 4/SPD0SxXtPVVNHWBJbfIj+agBojx9tQ3d/sKvItxy0Kyp9kI1GAPlwpJoayv3Uo=
X-Received: by 2002:adf:de06:: with SMTP id b6mr5078603wrm.316.1627567508897; 
 Thu, 29 Jul 2021 07:05:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8eKeP2qJsPJ1e0Pq5zZTC5hqubLpl63s0H27UQBRo/69qeKoUtR2mELgKszAB/i5Odol/NA==
X-Received: by 2002:adf:de06:: with SMTP id b6mr5078563wrm.316.1627567508562; 
 Thu, 29 Jul 2021 07:05:08 -0700 (PDT)
Received: from thuth.remote.csb (pd9575141.dip0.t-ipconnect.de. [217.87.81.65])
 by smtp.gmail.com with ESMTPSA id z137sm776827wmc.14.2021.07.29.07.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 07:05:08 -0700 (PDT)
Subject: Re: [PULL 6/7] meson: fix meson 0.58 warning with libvhost-user
 subproject
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210729124713.208422-1-pbonzini@redhat.com>
 <20210729124713.208422-7-pbonzini@redhat.com>
 <CAFEAcA8UO1J-N1cXdJiaeXUEX_MkhmTqHzgdSHNmogtTcpkqtQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bca156a1-d567-b003-4dd9-9b72ad2c4572@redhat.com>
Date: Thu, 29 Jul 2021 16:05:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UO1J-N1cXdJiaeXUEX_MkhmTqHzgdSHNmogtTcpkqtQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/07/2021 14.58, Peter Maydell wrote:
> On Thu, 29 Jul 2021 at 13:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Meson now checks that subprojects do not access files from parent
>> project. While we all agree this is best practice, libvhost-user also
>> want to share a few headers with QEMU, and libvhost-user isn't really a
>> standalone project at this point (although this is making the dependency
>> a bit more explicit).
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Message-Id: <20210505151313.203258-1-marcandre.lureau@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   subprojects/libvhost-user/include/atomic.h       | 1 +
>>   subprojects/libvhost-user/libvhost-user.c        | 2 +-
>>   subprojects/libvhost-user/meson.build            | 6 +-----
>>   subprojects/libvhost-user/standard-headers/linux | 1 +
> 
>> diff --git a/subprojects/libvhost-user/include/atomic.h b/subprojects/libvhost-user/include/atomic.h
>> new file mode 120000
>> index 0000000000..8c2be64f7b
>> --- /dev/null
>> +++ b/subprojects/libvhost-user/include/atomic.h
>> @@ -0,0 +1 @@
>> +../../../include/qemu/atomic.h
>> \ No newline at end of file
> 
>> diff --git a/subprojects/libvhost-user/standard-headers/linux b/subprojects/libvhost-user/standard-headers/linux
>> new file mode 120000
>> index 0000000000..15a2378139
>> --- /dev/null
>> +++ b/subprojects/libvhost-user/standard-headers/linux
>> @@ -0,0 +1 @@
>> +../../../include/standard-headers/linux
>> \ No newline at end of file
> 
> 
> Should these really be missing the trailing newline ?

It's a symlink, so yes, there does not need to be a newline in here.

  Thomas


