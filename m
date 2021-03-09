Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4F3326F4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:24:35 +0100 (CET)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcLi-00074k-KQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJc51-0001k8-0b
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:07:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJc4y-00026y-VV
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615295235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJhmQBbZCkOsOGflPt2V334CdR5LFAy01KLLlkoJV5E=;
 b=L8DFp2A7Nv/vi0AQEpG+U8PoJiNnQ3aJMEfnB68IzN6GmWmMAwclOlyKKpJ80GGXtm3Ypz
 +Ior8Q1+NzqHDrlK5eDCXIwjAt4Fc4Yn4ID/EhvLw+ImU+EmoR4Ur6zRh85Bt8aMnX4Vpn
 E5Ti0bu+iv8JsajZ5Ei1FaJN0/AW2ug=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-VUGq4eUEOwWuyV7iIuiAhQ-1; Tue, 09 Mar 2021 08:07:14 -0500
X-MC-Unique: VUGq4eUEOwWuyV7iIuiAhQ-1
Received: by mail-ed1-f71.google.com with SMTP id a2so6696646edx.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 05:07:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DJhmQBbZCkOsOGflPt2V334CdR5LFAy01KLLlkoJV5E=;
 b=OIT2lq2IFLQJJ2RgQbLsPRgyIHOpxNRYLJ2fdzO3Rx7fu79yxJc8PYL8GnrjiETrJ1
 fzQSSIh/gZ7wR2CF8/zL1Cts3NuVZO7TsX54Myr+z9r8EVDi9svGqeyzsyW8vraZ0cub
 uOXMrF7t2IXfmr4BfCr3MFKEm6DspKjEKKBf75TLyTsBhNlDzNqvU6fPvl2QlZYyb5p3
 kUqhrFUVWh+RccIyjqZ9yOybtTv9gdi33fciM5fsDW8P571cM60onEWE6ofnmbJKCoc7
 on0K5SGEWhZ2OVdJoigRhkEKyYdNxOcsQTlTI39BS7zBWL1d9oTYKa1LMvKPnopA5IgT
 d3cQ==
X-Gm-Message-State: AOAM532Gz7eKU4q2AHUm0BXRpAr9tjKkamWeIchPu+HcobTsTy1NNmMX
 EcCMCZZcwe7Mqna6k+vI0ss3Y3dCd+rEEVBwJqr/2/Vdr/G+Tj7cO+lDFgO9zQMWEjxGKqJPHwb
 Jm4VI/7VA/hf5cFg=
X-Received: by 2002:a17:907:7637:: with SMTP id
 jy23mr18893772ejc.12.1615295232844; 
 Tue, 09 Mar 2021 05:07:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx536ZrtxTaRidOZSoSxwnpOkuCvHmCu4onq/OUu9unjQB3clAIP/it65093rHhhvKn/+31RA==
X-Received: by 2002:a17:907:7637:: with SMTP id
 jy23mr18893722ejc.12.1615295232322; 
 Tue, 09 Mar 2021 05:07:12 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u59sm9159032edc.73.2021.03.09.05.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 05:07:11 -0800 (PST)
Subject: Re: [RFC PATCH 1/4] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Edmondson <dme@dme.org>, qemu-devel@nongnu.org
References: <20210309102157.365356-1-david.edmondson@oracle.com>
 <20210309102157.365356-2-david.edmondson@oracle.com>
 <34865f4c-dc32-4298-6ec9-c8690d738435@redhat.com> <m2mtvch72g.fsf@dme.org>
 <e71f897d-29a5-5efd-70f5-6ab7a7318b13@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3573c0b9-3211-d425-da75-333b924f56ab@redhat.com>
Date: Tue, 9 Mar 2021 14:07:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e71f897d-29a5-5efd-70f5-6ab7a7318b13@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/21 13:06, Philippe Mathieu-Daudé wrote:
>> Newfangled witchy magic!
>>
>> I'm happy to change it if you think it beneficial.
> 
> I then saw the next patch which keeps modifying the same
> function, so this might not be a great improvement after
> all.

Yeah I was also going to suggest it but considering patch 2 it doesn't 
really flow well.

paolo


