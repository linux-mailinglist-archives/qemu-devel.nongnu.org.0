Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C54C2AEF59
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 12:14:50 +0100 (CET)
Received: from localhost ([::1]:59702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kco5R-0006PX-33
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 06:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kco3q-0005jh-If
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:13:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kco3o-0003qj-EF
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605093186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dgyGg7qs4sFda5biiP+dwjFzksBO1ayg7k3tx+X9+w8=;
 b=Zkr2onRBCbTiSZ9Y0LPktCcHvYiR+noLIVBUeONkMlb/5IEydZASMyvEHLqztJjKnmyxaq
 g+YHoMGBF2i9CcNWPKUO6Zhkymhi60TMTgxnfe2f5EMRJCWOPwA2ufqtXT3XEsuzBHDJvk
 1PLonCer+SRmkblcCRnQbeCJcFHESVY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-0i5w6K2oMRueckxQDFahPw-1; Wed, 11 Nov 2020 06:13:05 -0500
X-MC-Unique: 0i5w6K2oMRueckxQDFahPw-1
Received: by mail-wm1-f72.google.com with SMTP id u9so649794wmb.2
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 03:13:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dgyGg7qs4sFda5biiP+dwjFzksBO1ayg7k3tx+X9+w8=;
 b=VzHnia5ua2TQ3hLE0KV+2FpTvccucViSgNARcN4vWga4pOy+km5WS3VYUkcYxttEj6
 4YAo6VpcNRZx1X4V7IYviRan+I4sHSb/si+Ifm57N/JlJH6i/0wDG5CFC/rgx4o9p82w
 ZNopcmw80WQNy+Rcl54HRiAqpgJBUwrPdqHkBJAdYZ6g4+E6bJd1Ek97lrDQLGwusAcF
 IiOLpoUwP/Ot5j0yNqIqOk8/dyfAFwnmG+wkfh4c9d5lX0FEfc3aHKiaZFgsHxuChp22
 TnAmXrcbgIONr6Bu8WJz8HrWz4dGuqZNOGxn79bcPNOMM9t3jKfBVODv/0fUCL7OkMnC
 T3Cw==
X-Gm-Message-State: AOAM533otkSZRGJ1JWo1rXTYVlsDt6S8+7NKGMksfhFKuVJyscoup2GY
 7d3uhgtoL9/fJvAh8TXXvwSxgaEB+4bGKqMg3NZGOmzXiLZCO1pTR7biKHvEajU0lFPa+jG1758
 1no/wls+ObDZYTXI=
X-Received: by 2002:adf:f6cd:: with SMTP id y13mr9451371wrp.363.1605093184094; 
 Wed, 11 Nov 2020 03:13:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqbKSHjBUzzqOIEvIa+KFth0Vo1tqXokoV6g3hjpO8/TtnNTrj9CT2o4ux3wKScQFFLiVkIw==
X-Received: by 2002:adf:f6cd:: with SMTP id y13mr9451347wrp.363.1605093183887; 
 Wed, 11 Nov 2020 03:13:03 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id y63sm2122062wmg.28.2020.11.11.03.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 03:13:03 -0800 (PST)
Subject: Re: [RFC PATCH 10/16] gitlab-ci: Introduce the CI "job maintainer"
 concept
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201110160140.2859904-1-philmd@redhat.com>
 <20201110160140.2859904-11-philmd@redhat.com>
 <20201111094452.GA906488@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <24a1ba5f-433a-aa3f-c658-e7b566029646@redhat.com>
Date: Wed, 11 Nov 2020 12:13:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111094452.GA906488@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Bin Meng <bin.meng@windriver.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 10:45 AM, Daniel P. Berrangé wrote:
> On Tue, Nov 10, 2020 at 05:01:34PM +0100, Philippe Mathieu-Daudé wrote:
>> When a job fails, someone has to take care of it. As we can
>> not wait indefinitively of volunteers good will, introduce the
>> concept of "job maintainers". A job maintainer is reponsible
>> of keeping it working, or contact the developers having broken
>> it to fix it.
>>
>> When a job is added, it must have a maintainer. A job without
>> maintainer is not run automatically. It can however be run
>> manually from the WebUI.
>>
>> To declare a maintainer, it is as easy as defining the
>> JOB_MAINTAINER_NAME / JOB_MAINTAINER_EMAIL environment variables.
> 
> I don't think we really want/need todo this.
> 
> The big problem we're facing is that there is no incentive right now
> for maintainers to make sure their code works with GitLab CI before
> they send a pull request. Adding job maintainers is just a band-aid,
> and not a very good one either, because each job covers features across
> many subsystems which should each be dealt with by their existing
> maintainers.
> 
> The primary solution to this tragedy is to make all the jobs gating
> on all pull requests. If a maintainer wants their pull requrst to
> get merged they then have no choice but to ensure it doesn't break
> any CI jobs.
> 
> The main blocker for this right now IIUC is the git repo sync from
> qemu to gitlab. Once we switch to gitlab as primary, we need to start
> enforcing GitLab as gating for all jobs. At this point making sure
> GitLab CI passes is every maintainer's job.
> 
> We'll still have some failures periodically from non-deterministic
> bugs. If a test shows itself to be flaky though, it should just be
> disabled in a very short time frame. Whichever maintainer owned the
> test has the job for fixing the flakyness before it can be renabled.

At this point I'd rather remove everything we have in CI and restart
from scratch. So if someone is really interested in having CI jobs /
runner, this someone will step in and contribute / maintain. Not like
the current state when some are happy to use the result, but nobody
cares about maintenance or fixing bugs (as the last year experience
clearly show).

I don't know if Alex / Thomas are willing to keep doing that.

I personally don't have the the energy to do this in my spare time.

Thanks.


