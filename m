Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A03D2C80AD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:13:07 +0100 (CET)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjfF3-0006XM-JW
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjfDW-0005aV-EO
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:11:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjfDU-0003RU-6U
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606727486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5NthhL1tGRYmLBk9fRLiPGq0LrM1oMvr0h7SVtXb78=;
 b=f6hQx1ssl7x6MCaNjT12So3jkYo39ayM1L2RbRfpM7ZVUIhLibbida89doOLW5A373+k55
 /L7oTqlPZmYhxYFs3fOyUkf2qyHYTqbLvrqZCRmxVxG1x6PVdoNv/6hiFjUdRczMQv7hig
 lMp3YOWnRoopJid1/sQcgr6Pe8tm6H8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-a8F9UnR_M82jO_qU1BxdUQ-1; Mon, 30 Nov 2020 04:11:24 -0500
X-MC-Unique: a8F9UnR_M82jO_qU1BxdUQ-1
Received: by mail-wr1-f70.google.com with SMTP id v1so2055958wri.16
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 01:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q5NthhL1tGRYmLBk9fRLiPGq0LrM1oMvr0h7SVtXb78=;
 b=lDhKkCWHJXRfLbhZxxVivIUpFJ0FXGw2rWwxhrjMsYR5qw9MIffjrD+v1NxcTq/5p7
 hwIbD+SaOlOW33vtHgJv68/y9EwE9F9Vth6G9W5y0UE6H4vJw4KFvp1LW11unmfOsIVN
 1SAQ3BhfzRM26LvwuPUoi3JahLPQM+FjHsZRJ05Ufh2oeo5hWcu+3kWKZqyshIPscBwS
 6REKxeg0hFREQEVdsQyhN79l9VyWwPLxtX/8cvapnuwa6Z9lIqhTtaZ8DBrmxGCXeGPW
 o9ob7krkK6VZ1Uip/huYIKsZywO9f0cU2n9R+6BLJeoS6eddZASUeL+O726TCqwZiBOE
 +0vQ==
X-Gm-Message-State: AOAM532spOEG4weiN8Ccs4rsxPh38Fdp+7aKUnH+tmUvAO1gpIJzJTkC
 mVDdS++GvHFiMAGozaJ/Yd9KC4jXNRBOnkZqx0jAJoqpiirYHSNAdTa84CCKvPokcw3LnB4uW+h
 kMn37ak3w3j0SQgw=
X-Received: by 2002:a5d:5651:: with SMTP id j17mr27159801wrw.221.1606727483154; 
 Mon, 30 Nov 2020 01:11:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWPTQPmWZqpewaUSdNZ6H9pfNZGWoTxecdBO5OPWHGrRdXKVujiClEvmJNbNj3bJ+XXw1PcA==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr27159776wrw.221.1606727482977; 
 Mon, 30 Nov 2020 01:11:22 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id y2sm27817804wrn.31.2020.11.30.01.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 01:11:22 -0800 (PST)
Subject: Re: [PATCH v2] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
To: Thomas Huth <thuth@redhat.com>, "Cho, Yu-Chen" <acho@suse.com>,
 qemu-devel@nongnu.org
References: <20201130042659.29333-1-acho@suse.com>
 <70cc2a9e-a496-f959-3fb9-46c69903ceff@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <66732c36-80d2-2856-d9dd-d5deec84b2fe@redhat.com>
Date: Mon, 30 Nov 2020 10:11:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <70cc2a9e-a496-f959-3fb9-46c69903ceff@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: fam@euphon.net, Liang Yan <lyan@suse.com>, wainersm@redhat.com,
 brogers@suse.com, cfontana@suse.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 9:28 AM, Thomas Huth wrote:
> On 30/11/2020 05.26, Cho, Yu-Chen wrote:
>> v2:
>> Drop some package from dockerfile to make docker image more light.
>>
>> v1:
>> Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
>> Use openSUSE Leap 15.2 container image in the gitlab-CI.
>>
>> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
>> ---
>>  .gitlab-ci.d/containers.yml                   |  5 ++
>>  .gitlab-ci.yml                                | 30 +++++++++++
>>  tests/docker/dockerfiles/opensuse-leap.docker | 54 +++++++++++++++++++

Can we have this file covered by Yu-Chen in MAINTAINERS
(at least as Reviewer)?

>>  3 files changed, 89 insertions(+)
>>  create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker
> 
>  Hi!
> 
> Sorry, I was too busy to reply last week ... you could also simply ping on
> the v2 that you've sent last week, but anyway, let's now continue discussion
> here. I gave it a try, and runtime is much better now, indeed:
> 
>  https://gitlab.com/huth/qemu/-/jobs/868942587
> 
> So:
> 
> Tested-by: Thomas Huth <thuth@redhat.com>
> 
> Patch looks also fine to me, you should just not put the version log above
> the "---" but below, otherwise the version log will show up in the final
> patch when it gets picked up with "git am".
> 
> No need to resend just because of this, though, I can fix that when picking
> up the patch. I'll queue for my testing tree and send it once the hard
> freeze is over.
> 
>  Thomas
> 
> 


