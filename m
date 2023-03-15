Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFBA6BB3B5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 13:55:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcQdj-0004e0-4j; Wed, 15 Mar 2023 08:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcQdY-0004SX-V8
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 08:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcQdU-0003Vg-BA
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 08:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678884820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HX8qeuEMesZEFkB2vC5BE/6xfuLZeNPnXa1uf21GqAw=;
 b=bP8lJ5l1Sn5URzu5ExPaXSTRCSpinqFQUWpNS7kkOH94TyegPXIL+SA8dh8Jjqe1q1xTyc
 2X5FqaOxAHv9vOOMiAk89B+30Y6oedCsvjey/u9fbDq8OM+sXr6sp+/GyxP/VkwajG5Mjs
 7FuPDnbgrsQDK7YMqyEnvnhmpSGRJs8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-9it-cdKQOTyhJvPhz9NXfg-1; Wed, 15 Mar 2023 08:53:38 -0400
X-MC-Unique: 9it-cdKQOTyhJvPhz9NXfg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r14-20020a0560001b8e00b002cdb76f7e80so3237430wru.19
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 05:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678884817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HX8qeuEMesZEFkB2vC5BE/6xfuLZeNPnXa1uf21GqAw=;
 b=BX4L0QWWvWEuA9/OpR5Qd+HFd2pGAotDQlKwfQSvchceK0PndMUUwO63YjXA5nUqci
 oMHufm8+HPmUssNUK/SvmRgo03gaCi6Gbo6fX+kHYr7+uFEESWLgj//mfSi0YxMVA/lp
 WLW+2RZ1A50wj6pVroDSsAITKFGd38MEh2/ZPQLI/iEN6eH9ZbxhNx1lSrzEnMVHJa9h
 JqRzEqPokEDgrBe68VLQbhroDCtT0w6PKW8tZ410ER7kq9poeZSeg7oO9rQg7lbLCNmZ
 9RvA4BDBdelYhje0chjNKY5rt7mb9+aLYDUwcQHqGKQp+A+lxbE9tWTrxXDTgj91rYWS
 6PVw==
X-Gm-Message-State: AO0yUKVfP6u3VUn3soK58uYQn4wwsDnyNjvIzVly+d5PHDmuZPAi4871
 A3qQKODe+kYYY0l08dzcn0rQtonxMRXx8p/a4eKEVNRWQhuSo6tBIuB7WIVhXbEWH8nk0eTYv9P
 pJRT/z91GLREfdnI=
X-Received: by 2002:a05:600c:4592:b0:3e2:201a:5bcc with SMTP id
 r18-20020a05600c459200b003e2201a5bccmr17620322wmo.33.1678884817706; 
 Wed, 15 Mar 2023 05:53:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set9MXh5OWK+8RZ+42iJwxhXTbLnMXluHMOwgcTjt+tnPdtJIfNK141wZwGluKcS/13ZvYY7G3w==
X-Received: by 2002:a05:600c:4592:b0:3e2:201a:5bcc with SMTP id
 r18-20020a05600c459200b003e2201a5bccmr17620309wmo.33.1678884817447; 
 Wed, 15 Mar 2023 05:53:37 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 bg7-20020a05600c3c8700b003eb2e33f327sm6859226wmb.2.2023.03.15.05.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 05:53:36 -0700 (PDT)
Message-ID: <3086c94d-678b-426f-540d-e81dcad6571e@redhat.com>
Date: Wed, 15 Mar 2023 13:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/10] Python: Drop support for Python 3.6
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, peter.maydell@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-10-pbonzini@redhat.com> <ZA9Xv0Mt2b39lVmS@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZA9Xv0Mt2b39lVmS@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/03/2023 18.05, Daniel P. Berrangé wrote:
> On Wed, Feb 22, 2023 at 03:37:51PM +0100, Paolo Bonzini wrote:
>> Python 3.6 was EOL 2021-12-31. Newer versions of upstream libraries have
>> begun dropping support for this version and it is becoming more
>> cumbersome to support. Avocado-framework and qemu.qmp each have their
>> own reasons for wanting to drop Python 3.6, but won't until QEMU does.
>>
>> Versions of Python available in our supported build platforms as of today,
>> with optional versions available in parentheses:
>>
>> openSUSE Leap 15.4: 3.6.15 (3.9.10, 3.10.2)
>> CentOS Stream 8:    3.6.8  (3.8.13, 3.9.16)
>> CentOS Stream 9:    3.9.13
>> Fedora 36:          3.10
>> Fedora 37:          3.11
>> Debian 11:          3.9.2
>> Alpine 3.14, 3.15:  3.9.16
>> Alpine 3.16, 3.17:  3.10.10
>> Ubuntu 20.04 LTS:   3.8.10
>> Ubuntu 22.04 LTS:   3.10.4
>> NetBSD 9.3:         3.9.13*
>> FreeBSD 12.4:       3.9.16
>> FreeBSD 13.1:       3.9.16
>> OpenBSD 7.2:        3.9.16
>>
>> Note: Our VM tests install 3.7 specifically for freebsd and netbsd; the
>> default for "python" or "python3" in FreeBSD is 3.9.16. NetBSD does not
>> appear to have a default meta-package, but offers several options, the
>> lowest of which is 3.7.15. "python39" appears to be a pre-requisite to
>> one of the other packages we request in tests/vm/netbsd.
>>
>> Since it is safe to under our supported platform policy, bump our
>> minimum supported version of Python to 3.7.
> 
> In the above list of versions, there's no platform which actually
> has 3.7 as a limiting factor. THe only mention of 3.7 comes from
> our own VM scripts, which for freebsd is outdated compared to
> their default, and for netbsd the 3.7 choice appears arbitrary
> on our side given their lack of default.
> 
> Ubuntu 20.04 on 3.8 would be the hard constraint out of the above
> list of distros.
> 
> Our normal practice wrt the support policy would be to go to the
> baseline from the above distro list. IOW, if we're dropping 3.6,
> then going to 3.8 would be the normal course of action, rather
> than stopping at 3.7 which doesn't appear needed by our targetted
> distros.

Additionally, Python 3.7 will be EOL by upstream in June 2023, if I've got 
that right ... so when QEMU 8.1 will be released, it will already be out of 
service...

  Thomas


