Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EC42F94B9
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 19:50:57 +0100 (CET)
Received: from localhost ([::1]:34254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1D8a-0001KF-G1
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 13:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1D6g-0000Qe-JG
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 13:48:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1D6e-0001IP-FZ
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 13:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610909334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPNJvDm30lAy33pP41sYUe/j1roL6iMFtA8ueIcbZuk=;
 b=Pmvt+/+RZi+seYUVl0ScD0BdqP+jvsp4b2kHhy7QJ6S52OWw428A20mRm/U0jpx86fMtY9
 T4VQQDpvUmYHgUFEDcc7zke778DcHR4W/MAtcvxGmsr81N/QcOnF/Uue3Vm8o5PrtaL5wk
 6+GUeI8Ng/aU2uroDjCf44Tb1NA1aZs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-L3_0ld9pPXyx7GUz5UlXog-1; Sun, 17 Jan 2021 13:48:53 -0500
X-MC-Unique: L3_0ld9pPXyx7GUz5UlXog-1
Received: by mail-wr1-f72.google.com with SMTP id z8so7193854wrh.5
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 10:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UPNJvDm30lAy33pP41sYUe/j1roL6iMFtA8ueIcbZuk=;
 b=TFsfeeYhl0VuGt8lUh7lAc2NATlnaUkmq5vJx5gWKh+vCDDczH22HSp182bfoAUqcT
 cKIK1RnMTWV6piL24tMrZdBkKjLPQATGyjz49/krBafjGosvQ0Ir1AMGvLHJdiMRbFWl
 btNg36SKbR7wwUZqZC24HOvBCFg4zHQg6xRbaZWpod8qA7d/d9VbdJmsQwFlzevD0xVu
 rnxVoguzlZ+0oTs5NdF8odJTH3hGqJ8S1aUyS12VVRznPhX8Rq7UHpnaM7l/VNUT27Cm
 ovc1a45ESzGOXgeqNSMmSvvEzlvUDEYaLs/CGxcNwn7ph/UsHkM+wcQv1L6XwDfoxwfY
 PXOw==
X-Gm-Message-State: AOAM533gmAcmWnJ2c90MK3dap/4myeW979t+2917atY75Aq2Eu514Tl4
 +Ur8EiMlDT+meQ5wZNWFg8RXcfTWYPg3JXvY6xpQKen9kG/Bp1AMyzPWKqNgsHRNw09LNqorEwZ
 zaKRDuWOe1H7wBX0=
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr18150131wmf.150.1610909331910; 
 Sun, 17 Jan 2021 10:48:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwX9/jtseURkmBCPfi1sMVvt/oO2rw9Zy4F8WDEy3kbU0lTBnf5pF7LPXJUy+X7/yXaYV62Q==
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr18150114wmf.150.1610909331677; 
 Sun, 17 Jan 2021 10:48:51 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q7sm16830345wmq.0.2021.01.17.10.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 10:48:50 -0800 (PST)
Subject: Re: [PATCH-for-5.2 2/2] gitlab-ci: Avoid running the EDK2 job when
 not necessary
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201110121606.2792442-1-philmd@redhat.com>
 <20201110121606.2792442-3-philmd@redhat.com>
 <20201110153505.GH869656@redhat.com>
 <3ec6bc01-906b-2e34-b760-76138bbff7cb@redhat.com>
Message-ID: <1d3ef711-9509-f43b-11e0-d9ead8cc95af@redhat.com>
Date: Sun, 17 Jan 2021 19:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3ec6bc01-906b-2e34-b760-76138bbff7cb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 10:18 AM, Philippe Mathieu-Daudé wrote:
> On 11/10/20 4:35 PM, Daniel P. Berrangé wrote:
>> On Tue, Nov 10, 2020 at 01:16:06PM +0100, Philippe Mathieu-Daudé wrote:
>>> The EDK2 jobs use the 'changes' keyword, which "makes it
>>> possible to define if a job should be created based on files
>>> modified by a Git push event." (see [1]). This keyword comes
>>> with a warning:
>>>
>>>   Caution:
>>>
>>>     In pipelines with sources other than the three above
>>>     changes can’t determine if a given file is new or old
>>>     and always returns true."
>>>
>>> In commit 922febe2af we moved the YAML config file from the
>>> repository root directory to the .gitlab-ci.d/ directory.
>>>
>>> We didn't respect the previous warning and disabled the
>>> 'changes' filter rule, as the files are now in a (directory)
>>> three above the YAML config file.
>>
>> This description is a bit wierd. I don't see how the location
>> in the directory tree has any relevance here.
>>
>> IIUC the caution docs quoted above are referring to what triggered 
>> the pipeline. They're saying that if the trigger was not a "branch", 
>> "merge request", or "external pull request", then the "changes" rule 
>> always evaluates true.
>>
>> The "branch" source us a bit wierd though, as I'm not seeing
>> how gitlab figures out which commits are "new" to the pipeline
>> and thus whether the files were modified or not.
>>
>> Strangely qemu-project/qemu CI for master seems to be behaving
>> correctly and skipping the jobs.
> 
> What about this one?
> 
> https://gitlab.com/berrange/qemu/-/jobs/827459510

Ping?

> 
>>
>> Something is fishy here and clearly not working, so clearly
>> changes are needed, but the commit message is not explaining
>> it for me.
>>
>>> This jobs takes ~40min, and needlessly burns the 2000 minutes
>>> available to GitLab free users. Follow the recommendations in
>>> [3] and disable this job by default (except if we push a tag
>>> or the branch contains 'edk2'). Note we do not remove the job
>>> from the pipeline, it can still be triggered manually from the
>>> WebUI.


