Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65BF4E2337
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:21:30 +0100 (CET)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWEEC-00038l-VG
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:21:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWEAp-0000ki-4B
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWEAm-0004d3-BI
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647854275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjrqT4Qka+KYJvNuWWonewHoTSTZzADIa7sCf1HgawE=;
 b=Y0AuMQEL/+De8zq6hofHl27UTBEq0Q0Qc0HGmMkXdldghZ84q6k3iaAlIHxNsyUsu1yJi7
 2QbQpXhtXRS/CPBVa4gVw30SNLk8PuLNIHR3TkpX6tkQVdVjfILf6Y0C7HJjKUOpm0xn5w
 85gsl72Yy1FJoaXYpnjEpY8DfuyOkiQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-OvCHfgrdPNG3fW6Hx1S9Jg-1; Mon, 21 Mar 2022 05:17:53 -0400
X-MC-Unique: OvCHfgrdPNG3fW6Hx1S9Jg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v2-20020a05600c214200b0038c7c02deceso4205735wml.8
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 02:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AjrqT4Qka+KYJvNuWWonewHoTSTZzADIa7sCf1HgawE=;
 b=1y2OFYAPCnSiHa6cy7vbVi24hugsgUEwxQd/nQPVCrfo9OJP+TVTTu+o95aUf8/f7v
 r6qSYYVHWkRXCmakF54wTtyt4K84o0JVrk5oCjgZ1R1clUojcDWDKQ6QYhGcgjgkv6fZ
 +JHzHcXgMiWpWtqQFGaYekM7xpccCfzoihL/mMw4W6LtgKSd8UmxgNIMoZ++jO5WIbHJ
 3010CVxMrExYmdAo72nw3/xS4K0VUApmwpMPGt/d7oLpqOYdg+K3WAOd3mHDKeY8U13W
 3zK4wXy+RKA8oKxS8pTj3nLoy4P0gW2fOnbK7VrbB2qffPMxD7Y0q+3LLBct88TML9fn
 YwUA==
X-Gm-Message-State: AOAM530F8bQm8edrPSXMATo3mw5yAs+kOVFl62CeHZVMm7RSWgG+ov6c
 9dAsXTWN13/JK1wglhZEX3qeAd/LgP2m+3VP85fW/GyHZ9nCCVaHBlyx3ppPv4VCqqYWas5C1RV
 xhyHWKKHQIMw10L8=
X-Received: by 2002:a05:600c:3d12:b0:38c:9768:b42 with SMTP id
 bh18-20020a05600c3d1200b0038c97680b42mr8467604wmb.151.1647854271852; 
 Mon, 21 Mar 2022 02:17:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9kD9ybbiOBQUZTWyPHDp8vW3q7dN1KkLPpVbNLKUjgPKRAmDUI5mUlYc+3tnQ0s/IjTSrNQ==
X-Received: by 2002:a05:600c:3d12:b0:38c:9768:b42 with SMTP id
 bh18-20020a05600c3d1200b0038c97680b42mr8467585wmb.151.1647854271525; 
 Mon, 21 Mar 2022 02:17:51 -0700 (PDT)
Received: from [10.33.192.213] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a5d46ca000000b00203fd86e198sm6448073wrs.96.2022.03.21.02.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 02:17:50 -0700 (PDT)
Message-ID: <f30fe79c-cebd-037c-043e-6eaaeed7070c@redhat.com>
Date: Mon, 21 Mar 2022 10:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4] tests: Do not treat the iotests as separate meson test
 target anymore
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220310075048.2303495-1-thuth@redhat.com>
 <2a2dadb8-24ba-50c4-617e-ab6d08166e83@redhat.com>
 <d59847b7-98cb-9e9c-0c42-74576f152737@redhat.com>
 <ed1c97e8-8a70-8808-cbeb-e6b4f6d1dccf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ed1c97e8-8a70-8808-cbeb-e6b4f6d1dccf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/03/2022 10.06, Hanna Reitz wrote:
> On 18.03.22 18:36, Thomas Huth wrote:
>> On 18/03/2022 18.04, Hanna Reitz wrote:
>>> On 10.03.22 08:50, Thomas Huth wrote:
>>>> If there is a failing iotest, the output is currently not logged to
>>>> the console anymore. To get this working again, we need to run the
>>>> meson test runner with "--print-errorlogs" (and without "--verbose"
>>>> due to a current meson bug that will be fixed here:
>>>> https://github.com/mesonbuild/meson/commit/c3f145ca2b9f5.patch ).
>>>> We could update the "meson test" call in tests/Makefile.include,
>>>> but actually it's nicer and easier if we simply do not treat the
>>>> iotests as separate test target anymore and integrate them along
>>>> with the other test suites. This has the disadvantage of not getting
>>>> the detailed progress indication there anymore, but since that was
>>>> only working right in single-threaded "make -j1" mode anyway, it's
>>>> not a huge loss right now.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>   v4: updated commit description
>>>>
>>>>   meson.build            | 6 +++---
>>>>   scripts/mtest2make.py  | 4 ----
>>>>   tests/Makefile.include | 9 +--------
>>>>   3 files changed, 4 insertions(+), 15 deletions(-)
>>>
>>> I can’t really say I understand what’s going on in this patch and around 
>>> it, but I can confirm that it before this patch, fail diffs aren’t 
>>> printed; but afterwards, they are
>>
>> It's a bug in Meson. It will be fixed in 0.61.3 and later (so this patch 
>> won't be needed there anymore), but the update to meson 0.61.3 caused 
>> other problems so we also can't do that right now... so I'm not sure 
>> whether we now want to have this patch here included, wait for a better 
>> version of meson, or even rather want to revert the TAP support / meson 
>> integration again for 7.0 ... ?
> 
> I don’t have anything against this patch, I just don’t fully understand what 
> it does, and how it works.
> 
> So as far as I understand, check-block was its own target and used --verbose 
> so that the progress indication would work (with -j1). Now that causes 
> problems because of a bug in meson, and so this patch drops that 
> special-casing again.  The only disadvantage is that the progress indication 
> (which only worked with -j1) no longer ever works.
> 
> (Is that right?)

Right!

> I personally don’t mind that disadvantage, because on CI systems it doesn’t 
> really matter anyway; and on developers’ systems, I would assume `make 
> check` to always be run with -jX anyway.

Right again. So currently the only question is: Do we want to see a nice 
progress output with -j1 and do not care about the error logs, or do we 
rather want to see the error logs with -j1 and do not care about the nice 
progress output? For -jX with X > 1, the patch does not change much, and 
we'd need a newer version of meson to fix that.

  Thomas


