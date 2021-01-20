Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B12FD042
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 13:41:57 +0100 (CET)
Received: from localhost ([::1]:42032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Co8-0007R5-EZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 07:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Cmh-0006z2-2n
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:40:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Cmf-0004CZ-BF
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611146424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6YCSBM6s5t0MyncO9jWg6QTEwY52soDkELoKR9cEZA=;
 b=N/6+Hdozn1JBNs0e2jUYGeJZxWRpOyP7hDOMyGwk82goT812ztaI5IesAIxUxXlE6tMA5J
 R/D8azjj5dkwqGvsBwcL/8M42bgNVBwvKun3diouLxIa97nHlf23YGcT7tnCCw9REOXyvT
 JmQTUgbHCszUGyzkr8wQNq8DwlAP62A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-8u5FJgmCOKKE34dX20_Tfw-1; Wed, 20 Jan 2021 07:40:23 -0500
X-MC-Unique: 8u5FJgmCOKKE34dX20_Tfw-1
Received: by mail-ed1-f72.google.com with SMTP id n8so9040153edo.19
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 04:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K6YCSBM6s5t0MyncO9jWg6QTEwY52soDkELoKR9cEZA=;
 b=R98ynt/dxyfw3k08ibVtHiZ1up5FyU+M/JxwgHZ7dU93D1Zut5Bc8YCl2kBYlB4SwG
 VjEe7xJBKlEBgo8XoH3NEO08o+3IrdoATfpECqTVVXftrRUKmP0aaxHtft4Y2WaPKXdb
 gi8OqPCewEr7AVj5n43MLiO9xaODPDSz7iIxgU1Eo87c1U0L8hnIcSMlJQtZ2Tu+Xlfw
 wAHo8t4+nn6M0qKh2xSRvlElusirQHLKcpsbzOgZy16r4KQ/XaUDMhk2LFCUQtgE4gT2
 rO0a4VaOEPcKJOxVeaLr8/DBggl0nFEFGP4EF9MGnY20S7GPoYv7RyKY1cykLZOV0Bx3
 MCCQ==
X-Gm-Message-State: AOAM531DzGba0EEp5xazhoi8xTWjtDxaB6F49ZtJAR2WQg/kNnLEgQEH
 Ufy3g9roMInDqucQm2AaIKI716jmVW6lZu6AJDfchlWjcHSftHHAIDxrZ95kW0yIacjWDDzt0QU
 4m+RHwbeQG9HP5Q560IJ8HHQgjZGRnQXwsKJ2WK3yQMst+WyYMHq+QBgrhdcdDcidrtc=
X-Received: by 2002:a05:6402:3510:: with SMTP id
 b16mr6893988edd.242.1611146421621; 
 Wed, 20 Jan 2021 04:40:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHhdTMNxi6bRAvKmk7afRflEgkVJoq7ombwgg6lVimapbS8Gp6CgOs4AXoeoGQGvYMlaHbhQ==
X-Received: by 2002:a05:6402:3510:: with SMTP id
 b16mr6893971edd.242.1611146421397; 
 Wed, 20 Jan 2021 04:40:21 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id b26sm1073537eds.48.2021.01.20.04.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 04:40:20 -0800 (PST)
Subject: Re: [PATCH 03/25] qemu-option: warn for short-form boolean options
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-4-pbonzini@redhat.com>
 <87o8hkx6n9.fsf@dusky.pond.sub.org>
 <99a014a0-5d9c-07d6-250a-c56e6337cf69@redhat.com>
 <878s8ovw2j.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <06a7838d-8649-2db1-4559-2a3110eaf49a@redhat.com>
Date: Wed, 20 Jan 2021 13:40:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <878s8ovw2j.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/21 09:42, Markus Armbruster wrote:
> The alternative is to *outlaw* parameters "help" and "?" in QemuOpts.
> I'd be cool with that. >
>> My solution would be to deprecate the QMP "change vnc" command, and
>> postpone switching -vnc to qemu_opts_parse_noisily to 6.2.
> 
> QMP command 'change' was deprecated long ago, in 2.5.0 (commit
> 24fb41330, in 2015).  This predated appendix "Deprecated features"
> (which has since become docs/system/deprecated.rst), and remained
> missing there until I corrected it in commit 6d570ca10 (v4.2.0).

Removal patch coming then, together with switching vnc_parse to 
qemu_opts_parse_noisily.

That would restrict qemu_opts_parse to tests, and implicitly outlaw 
parameters "help" and "?".  The other problem would be solved, albeit a 
bit indirectly.

>> The main reason to warn for short-form boolean options, is to block them
>> for command line options that are switched to keyval[1].  Adding a
>> warning does not necessarily imply removing in two releases.
> 
> Understand.
> 
>> [1] This series already does that for -M, -accel and -object.  This
>> means that applying this series would change the command line
>> incompatibly without a two-release deprecation.  It's up for discussion
>> whether to do so, or delay the application of those patches to 6.2.  It
>> would be a pity to hold the dependent changes for effectively a year,
>> but it's not a big deal.
> 
> Concur.

Verbose please. :)  Do you think we should delay the conversion of 
-M/-accel/-object to keyval until 6.2?

Paolo


