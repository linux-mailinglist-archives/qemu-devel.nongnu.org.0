Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C568DC30
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:55:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPNM-0008TY-F2; Tue, 07 Feb 2023 09:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPPNI-0008Px-OS
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:55:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPPNF-0004qS-Mu
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675781709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1m9xxu9z3ycvJmrdyqZHSYqoc6js4a0pDw6USQKgdc=;
 b=ddKr3UBAuuZFCK5YbYlhsxefOlm+R4fNboroV5mx5TpHu29k+sGugoJBunkQQuiu1K+NYW
 XLPiRV+C9iUBiI8tdFRtdrFzzhQORL4n50CBTkGhI+CEG1xCJWCBM0yqfO4CU55X61J9ja
 Moc9Px4LU9rvNuX1Pofhr1rPlOU+sVw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-450-O4WR6cyONHOcXICZn8WK9w-1; Tue, 07 Feb 2023 09:55:07 -0500
X-MC-Unique: O4WR6cyONHOcXICZn8WK9w-1
Received: by mail-qk1-f200.google.com with SMTP id
 w17-20020a05620a425100b00706bf3b459eso10003405qko.11
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a1m9xxu9z3ycvJmrdyqZHSYqoc6js4a0pDw6USQKgdc=;
 b=AqzdZcgizX6IU876sRO8Rvpu0DyYmZJJY+N0yUeZK/IpM0O+FHmLMkHq01iJr+bVaz
 ImlGutfYq89eZ8BkxQW9bp6hvveHPM9aN/uKyNVZOLqzqfNwI/kfbeXrQv1zktiOP/jX
 iwMbo81h+WSZPuZSsUoMvcKZjpFS2OvOI3J/Db4k1lUTdlWv1c/ISGyCygPo+94lYYyY
 3dqu2NPpWY7FjicLNpqPBlG4DM4v0phnrARE/GSM3klKwh92IzlemLJeDp719JjCGELU
 xpXy6m2uQ2hERkLPffIi6543bsK0eJ2BiZxXbj8oXuPYxFVwstYlzxs4FiVoO+lFowBj
 Z5bA==
X-Gm-Message-State: AO0yUKUiI8c5CKgVLMDoJe/OpQDONX1Faqw5y2ACOFnkjtToUY4ZlfOd
 cbgt5vpBhllQQk6ThcOxpZul4M4fppx/4fLa0hMKi10CYgqaYk/uXR3ytzwP8GTvV+jrGLOEI9I
 MAcUgbml4zRY5EUw=
X-Received: by 2002:a05:6214:20ab:b0:56c:37a:58b2 with SMTP id
 11-20020a05621420ab00b0056c037a58b2mr5768444qvd.15.1675781707377; 
 Tue, 07 Feb 2023 06:55:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9R8XUU6F83HRd9JT1/Zm4yE9l/RHhj3+qR/yYC/E7F+PndWzS9CoewRt5MZDL+1ic8iUf5mg==
X-Received: by 2002:a05:6214:20ab:b0:56c:37a:58b2 with SMTP id
 11-20020a05621420ab00b0056c037a58b2mr5768417qvd.15.1675781707155; 
 Tue, 07 Feb 2023 06:55:07 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05620a450f00b006fa43e139b5sm9707496qkp.59.2023.02.07.06.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:55:06 -0800 (PST)
Message-ID: <8a4b8438-98a4-71fa-cf73-005139b97b95@redhat.com>
Date: Tue, 7 Feb 2023 15:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-13-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 12/12] [NOT FOR MERGE] tests/qtest: Introduce
 qtest_validate_args
In-Reply-To: <20230206150416.4604-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/02/2023 16.04, Fabiano Rosas wrote:
> The QEMU binary can be built with a varied set of features/devices
> which are opaque to the tests. Add a centralized point for parsing and
> validating the command line.
> 
> Tests can now be skipped with the following pattern:
> 
> qts = qtest_init(args);
> if (!qts) {
>      return;
> }
> 
> For now, the only validation is that the -device options all
> correspond to devices that are actually present in the build.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> Would this be better than checking for missing devices in individual
> tests?

This is certainly an interesting idea! ... some things still bug me, though:

- We still need to change all the calling sites (to check for
   !qts) ... so the effort seems to be in a similar ballpark as
   adding qtest_has_device() to the various problematic tests

- This will now call qtest_has_device for each and every device
   in the parameter list, even if it is not necessary. And at
   least the first call to qtest_has_device() is rather expensive
   since it has to fire up a separate QEMU to retrieve the list
   of supported the devices. So adding this to all tests might
   cause a slow-down to the tests...

- It could maybe even hide bugs if you don't look closely, e.g.
   if you have a typo in the device name in a test, the test then
   gets skipped automatically instead of failing ... ok, that's
   unlikely for new tests where you look closely, but still, it
   gives me slightly bad feeling.

So I think I rather tend to go for explicit calls to qtest_has_device() as 
you did in your first 11 patches.

Anyway, I'm interested in what do others think of this? Any other opinions?

  Thomas


