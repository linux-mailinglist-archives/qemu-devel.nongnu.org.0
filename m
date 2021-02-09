Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ABE3154EA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:22:14 +0100 (CET)
Received: from localhost ([::1]:59806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WiL-0003sv-NV
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9Wbz-0006Qf-WE
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:15:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9Wbv-00013u-7P
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612890934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eW+oRSLtWPVl822CDf3nzcbBbQX4kp3vSdJY6Gcu4Ww=;
 b=PLouAqYDLqiwK4LSJrzxnuHNGua23qBqu6BFTW9zxiDmHvL8hlbKqRuxRFP308zf5L3toX
 ENHHfB5yCIQL4aO38FAsmdBFHVXSyBU184jci/hc3pvS3tO7LB+0S4YWPJ1inapzmWsC5k
 mxDfoKg7F8A5JvBWXNRllx4P9G0pAkI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-qGPIP4XuMKiIoFbj3s6sEw-1; Tue, 09 Feb 2021 12:15:30 -0500
X-MC-Unique: qGPIP4XuMKiIoFbj3s6sEw-1
Received: by mail-ed1-f72.google.com with SMTP id l23so16230172edt.23
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 09:15:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eW+oRSLtWPVl822CDf3nzcbBbQX4kp3vSdJY6Gcu4Ww=;
 b=mcj6tEDiUwyhb9V0yDONX1ySuddrChIX0/LdERI+HUjeQ3hqP9lc4HwVsFT2BAh9Tz
 hOyxSl3KAq9auK+40GA4elioWZBlB+ud/YgTi58s+5xRohl7diznTpTLLkHLln6Oq5Jp
 qXmdUKJJSKFCZj/sfUlD/6Lxet+APRNNwqN9/pdcZZLKeKD9OGkWCGTRamnH8pNp/xnt
 SIWK1vGOsWTwjirLT8hgkIfIkndCMJxRj/itAwg+c/J4jv4TSlft4JnfqhwkZBsQEOXw
 N3WqEyo2/yg3kT6uAngyaumEW42Xl4Najl5iN3mRILc6GUU/R7ZeBaQLpuHc5wF7jXFf
 OKZQ==
X-Gm-Message-State: AOAM533hglAmywkKtjDqtqBu1dEGIy0qu3FHNyJacJvtlplv0esoAo9w
 rz2VuI/rKybKBcGm2dwOtC8zg+3KqFX9+rfl0rZm+JDqB5uclslEKsy05x7aZG2dV6nztsFmZpX
 X+Gra790R8GcqLFk=
X-Received: by 2002:a17:907:7252:: with SMTP id
 ds18mr23446044ejc.239.1612890929229; 
 Tue, 09 Feb 2021 09:15:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqzgT+sSet44uVsnPMnfKJLtZfmB4LNM7+nHhY4mLr51OlCxjpPBtNwQAU93qcW9LVnRSGBA==
X-Received: by 2002:a17:907:7252:: with SMTP id
 ds18mr23446011ejc.239.1612890928928; 
 Tue, 09 Feb 2021 09:15:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v26sm12149834edw.23.2021.02.09.09.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 09:15:28 -0800 (PST)
Subject: Re: [PATCH 07/22] tests/acceptance/virtiofs_submounts.py: evaluate
 string not length
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-8-crosa@redhat.com> <8735ycq80u.fsf@linaro.org>
 <2c1a58b2-e023-4aca-16c7-c850f6069657@redhat.com> <87k0rha2mu.fsf@linaro.org>
 <2bacef90-7533-d439-cf7d-8fba51e64c1a@redhat.com> <87h7ml9z7g.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a64bac47-ac2a-f708-239a-5b17fa365eb7@redhat.com>
Date: Tue, 9 Feb 2021 18:15:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87h7ml9z7g.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Eric Auger <eauger@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 1:52 PM, Alex Bennée wrote:
> Max Reitz <mreitz@redhat.com> writes:
>> On 09.02.21 12:24, Alex Bennée wrote:
>>> Max Reitz <mreitz@redhat.com> writes:
>>>> On 04.02.21 14:23, Alex Bennée wrote:
>>>>> Cleber Rosa <crosa@redhat.com> writes:
>>>>>
...
>>>> Ideally, vmlinuz='' would be the default, but there’s a problem with
>>>> that: I submitted this test along with the patches that added the
>>>> required feature to the Linux kernel, so at that point that feature was
>>>> not part of Linux.  That’s why you generally have to point it to a Linux
>>>> kernel binary you built yourself that has this feature (5.10 does).
>>>
>>> This is where it deviates from the rest of the check-acceptance tests.
>>> Generally I don't have to worry about finding the right image myself.
>>
>> Yes, but there’s nothing I can do apart from just not having the test as 
>> part of qemu, which I don’t find better than to just cancel it when not 
>> run with the necessary parameters.
> 
> No I agree having the tests is useful.
> 
>>
>> Or, well, I could let the test download and compile the Linux sources, 
>> but I don’t think that’s a viable alternative.
> 
> There has been discussion before but I agree it's not viable given the
> compile times for such things.
> 
>>> At the least it would be worth pointing to a part of our docs on how
>>> to build such an image.
>>
>> Well, I could perhaps come up with a comprehensive kernel configuration 
>> that works, but I really don’t think that’s valuable for people who just 
>> want to run the acceptance tests and don’t care about this test in 
>> particular.  I just don’t think they’re actually going to build a Linux 
>> kernel just for it.
> 
> Sure - but I was trying to review the series and as part of my review I
> generally like to run the things I review. Hence why I stopped as I
> couldn't get things running.
> 
>> (Alternatively, I could just build a Linux kernel here on my machine, 
>> upload the binary and point to it somewhere, e.g. in the cancel message. 
>>   That would be OK for me, and perhaps something I could imagine someone 
>> might actually use.)
> 
> I've actually done this with some Xen patches I'm working on at the
> moment. I'll probably decorate the test with:
> 
>   @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> 
> with a comment explaining what's waiting to be upstreamed. Once there
> are upstream binaries I plan on transitioning the test to those.

Instead of a binary AVOCADO_ALLOW_UNTRUSTED_CODE variable, we could
have a list allowed domains/namespaces, that can be increased on the
tester discretion.

For example these are assumed trusted:

. archives.fedoraproject.org
. archive.debian.org
. cdn.netbsd.org
. github.com/torvalds
. people.debian.org/~aurel32
. snapshot.debian.org
. storage.kernelci.org
. www.qemu-advent-calendar.org

Then personally interested in testing ARM boards I'd amend:

. apt.armbian.com
. github.com/philmd
. github.com/groeck
. github.com/hskinnemoen
. github.com/pbatard

and Max's repo since I'm interested in testing virtiofs_submounts.


