Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4733462F9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:34:55 +0100 (CET)
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOj3W-0002QN-9s
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOiyQ-00072f-TT
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOiyN-0007hP-KL
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616513374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WWiD3t8bHzOUwFYdUWdQyI/2soZ8LW+MZufVQTvpzI=;
 b=iha9FHsbrjXM17yZ55wo2EL08Mh6ptQqF016+1pHFIfyBzbZHZ4Ekx2IPWkHsAeTZjaFHE
 G37sTrzxFb6AMEX93Td2HaU3Urr/mZM14kWxdARDUAAZxY811pkVaeLquL6CShsPcZkPxN
 WBKoSVQmmAMSNKKU9khoX135X0JvzEc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-knMp1IQTNRee-eUBNQ9wrQ-1; Tue, 23 Mar 2021 11:29:33 -0400
X-MC-Unique: knMp1IQTNRee-eUBNQ9wrQ-1
Received: by mail-wm1-f72.google.com with SMTP id k132so903937wma.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+WWiD3t8bHzOUwFYdUWdQyI/2soZ8LW+MZufVQTvpzI=;
 b=FOIM1B9ZZneMaiOvXWEKZ/DQfUaItSwK3Fw4DkV/g2RKYy/LWVLfdsI2CvV49IXkxl
 cZRaXSr0D7W4NyyEJiMcrjclOv+5i9ooNZrHMfEzhZ9U8L074PE1nAY6pfOGk/O5BiL4
 G4M6en3hubvsbkhbJTURA4rSvjPDW2h3QnTrD0zCC/q9I67rJU9weAZF47wikRfGBPbV
 KantkSSFKMlwh+UhBCNDckXPKZOdVbZUAcGvYNoRFjDrTYgJIY3iukPD6S8tfAsW241j
 +uELmUhRfzbGiOLKhCaKdxlDaG5aKK/1bIYH1tf34ob3jVgR4YvXjIKe+syiLD0Jo0Be
 pW6g==
X-Gm-Message-State: AOAM533yX71mW88kxdHC2FsoCtM7OTtCCDbiHRgf0z9V0COoIk3GcAO6
 7lczKjdgTWNC3IAUrVo1KzbebpIbT3Cf6SdvYsxUMtNAk7YMtnqrn306xBt4Dmh+KJp3BJ3TU65
 8XsoqzolQCuMTNmw=
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr3813881wma.141.1616513372004; 
 Tue, 23 Mar 2021 08:29:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2VcT6qqx+8gaUwL211pLqUi2FQ+rcQtruOtS+9gMGWzLkHr/TOJQzoaBLbKs/qk+NLpX1nw==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr3813866wma.141.1616513371756; 
 Tue, 23 Mar 2021 08:29:31 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 21sm3061401wme.6.2021.03.23.08.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 08:29:30 -0700 (PDT)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-2-pbonzini@redhat.com>
 <f2d648c7-1b80-bec6-f17c-78d36cf998b1@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/4] qemu-iotests: allow passing unittest.main arguments
 to the test scripts
Message-ID: <97e7aa7e-dcf0-17d0-3a4b-2d293e9c89ed@redhat.com>
Date: Tue, 23 Mar 2021 16:29:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f2d648c7-1b80-bec6-f17c-78d36cf998b1@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: eesposit@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/21 15:34, Vladimir Sementsov-Ogievskiy wrote:
>> +    def __init__(self, *args, **kwargs):
>> +        super().__init__(stream=ReproducibleTextTestRunner.output, 
>> *args, **kwargs)
> 
> over-79 line (PEP8)

Ok, thanks.

>> +
>> +def execute_unittest(argv, debug=False):
>> +    """Executes unittests within the calling module."""
>> +
>> +    # If we see non-empty argv we must not be invoked as a test script,
>> +    # so do not bother making constant output; debuggability is more
>> +    # important.
>> +    if debug or len(argv) > 1:
> 
> It's native to rely on converting sequences to bool. Empty sequence is 
> False and non-empty is True, just like
> 
>    if debug or argv:

No, this is checking if there is *more than one* element in argv, 
because argv contains the program name as argv[0].  It's trying to catch 
the case of "./run testclass.TestMethod" or "./run -v" and not buffer 
the output, but it sucks.  Really this patchset should have been marked 
as RFC.

A better implementation is to create a class that wraps sys.stdout and 
overrides write() to ensure reproducibility.  There is no need to buffer 
the output in the StringIO at all.

>> +        argv += ['-v']
>> +        runner = unittest.TextTestRunner
>> +    else:
>> +        runner = ReproducibleTextTestRunner
>> +
>> +    unittest.main(argv=argv, testRunner=runner,
>> +                  warnings=None if sys.warnoptions else 'ignore')
> 
> This thing about warnings seems unrelated change and not described in 
> the commit message

The default settings for warnings is different when you instantiate 
TextTestRunner and when you use unittest.main.  Currently the tests have 
some warnings, they need to be disabled otherwise the tests fail. 
Honestly, I don't have time to debug the warnings and they are 
pre-existing anyway.  But you're right, at least I should have a comment 
describing the purpose of the warnings keyword argument.

>> +
>>   def execute_setup_common(supported_fmts: Sequence[str] = (),
>>                            supported_platforms: Sequence[str] = (),
>>                            supported_cache_modes: Sequence[str] = (),
>> @@ -1338,7 +1348,7 @@ def execute_test(*args, test_function=None, 
>> **kwargs):
>>       debug = execute_setup_common(*args, **kwargs)
>>       if not test_function:
>> -        execute_unittest(debug)
>> +        execute_unittest(sys.argv, debug)
>>       else:
>>           test_function()
>>
> 
> Why isn't it simpler just to add argv argument to original function, and 
> on "debug or argv" path just pass unittest.TextTestRunner instead of 
> constructing the object? Why do we need new class and switching to 
> atexit()?

mypy complains because you set the variable to two different types on 
the two branches.  So I decided it was cleaner to write a new runner 
class.  I think this is the only remaining part of the patch that I like. :)

Thanks,

Paolo


