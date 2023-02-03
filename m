Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A196897A7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:23:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNuA1-0002FH-VZ; Fri, 03 Feb 2023 06:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pNuA0-0002EF-3z
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:23:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pNu9x-00060N-QE
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:23:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675423393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4f0/w4S38kTN+wNWDH1zv26CFk01/FktF/t4MGdnfYg=;
 b=h/014w2l5tVnTfTi/kDyqblYwEFJu0UQecruIY/3PnTwAhA+qGzb7ZllumfNuUuBqSSEtr
 kroEsX3YWiCaev+mSpbjGsZ/FDHDyZnc3lL0+aXc8JHB7HKj7gs4ZsIVK//jDBiCXvSqMm
 u5kgObNlwfDW7U7nNcUiGeqRxjcxWZA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-wMVb6a7TP-2FPOuH9bpeaw-1; Fri, 03 Feb 2023 06:23:11 -0500
X-MC-Unique: wMVb6a7TP-2FPOuH9bpeaw-1
Received: by mail-qt1-f198.google.com with SMTP id
 cr22-20020a05622a429600b003b694a9f291so2475856qtb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4f0/w4S38kTN+wNWDH1zv26CFk01/FktF/t4MGdnfYg=;
 b=KZzn1UzYw5J/m/u4KZ49uxAKDasIV2MXkVE4boQ/mlJslKNwrVhy41yreLqvqRBePl
 0FEQ6DBCmcaGP84Ye+us0Xl1H1sRq0BP6FDL4wkgNW5OkNKf5QT2VyRK60j04TgF2ibt
 HSIRxVPkicx6I0tMMt4BylQ9pE1RZykXSnYxMYnlFbiPhh7eK1R66RksOy0p+P749Hxl
 6Pw25h26mayD9KDTc7DesolYNapsrqNrlXDmxUW8SU/no9XSe5p7x5OzJNBo9Ez5v8ln
 eCqCZvGA/jQti6ydFp3Zv0G4IlEXzH55RCGKyij0XqwTc8lCpHYBaRLzRL6HO2aPANSG
 t2VA==
X-Gm-Message-State: AO0yUKXWMFGsbqiD6z6URcUKkbqF+fzQcA3CXvajRTpg0oucx+u0KZSw
 /bRev+Ptda7AcksB7jU6nkh5aa7jtorHSFXH/TlfUIK8cqb6RpcKJYEsfVfcj5EJdi2eUpTL2Mp
 FbMGueTgrxUG14wY=
X-Received: by 2002:a05:622a:1a88:b0:3a5:977e:d05d with SMTP id
 s8-20020a05622a1a8800b003a5977ed05dmr17101679qtc.52.1675423391277; 
 Fri, 03 Feb 2023 03:23:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+at8bsUMlKFI9GFpk+1V88qP1WWIDGgzrb/adHfQNvu3jL99w4veCxmB5dcRF3c0vhbs4/dg==
X-Received: by 2002:a05:622a:1a88:b0:3a5:977e:d05d with SMTP id
 s8-20020a05622a1a8800b003a5977ed05dmr17101659qtc.52.1675423391046; 
 Fri, 03 Feb 2023 03:23:11 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-40.web.vodafone.de.
 [109.43.179.40]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05620a210c00b00725fd2aabd3sm1633824qkl.1.2023.02.03.03.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 03:23:10 -0800 (PST)
Message-ID: <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
Date: Fri, 3 Feb 2023 12:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, hreitz@redhat.com
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com> <Y9eizgN9UYo5kbgx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
In-Reply-To: <Y9eizgN9UYo5kbgx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 30/01/2023 11.58, Daniel P. Berrangé wrote:
> On Mon, Jan 30, 2023 at 11:44:46AM +0100, Thomas Huth wrote:
>> We can get rid of the build-coroutine-sigaltstack job by moving
>> the configure flags that should be tested here to other jobs:
>> Move --with-coroutine=sigaltstack to the build-without-defaults job
>> and --enable-trace-backends=ftrace to the cross-s390x-kvm-only job.
> 
> The biggest user of coroutines is the block layer. So we probably
> ought to have coroutines aligned with a job that triggers the
> 'make check-block' for iotests.  IIUC,  the without-defaults
> job won't do that. How about, arbitrarily, using either the
> 'check-system-debian' or 'check-system-ubuntu' job. Those distros
> are closely related, so getting sigaltstack vs ucontext coverage
> between them is a good win, and they both trigger the block jobs
> IIUC.

I gave it a try with the ubuntu job, but this apparently trips up the iotests:

  https://gitlab.com/thuth/qemu/-/jobs/3705965062#L212

Does anybody have a clue what could be going wrong here?

  Thomas


