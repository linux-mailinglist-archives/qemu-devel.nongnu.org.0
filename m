Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F546A16CA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 07:57:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVS0n-00036b-Gi; Fri, 24 Feb 2023 01:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVS0k-00036D-IJ
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 01:56:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVS0f-0007kU-Cn
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 01:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677221808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9UsjbPYfVVpHq3t2lTckJQJPUeneLWw/b3Hs4fn9f0=;
 b=Y5FiSxbwsFRJzmhrA2xqW/OAoHrY4psJM/p6L7Dm4O9Ni9+XTxNpn8BmRr3G1Ww5aTlZw+
 q47bLSWb/+yR8EhWK9qf1XQYdsuh2rb+3Yy0/SGPFbEeA8v2CG7EZyIhVgcZOnK0DsLcj1
 hWiPK9DfM9vNLVQU0ZKxGJcPsPi26/g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-BZsTfT6tNbepWXNQjaTiQQ-1; Fri, 24 Feb 2023 01:56:44 -0500
X-MC-Unique: BZsTfT6tNbepWXNQjaTiQQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so813667wme.9
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 22:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n9UsjbPYfVVpHq3t2lTckJQJPUeneLWw/b3Hs4fn9f0=;
 b=lPKxyI9Ss1nsd/xnf5erehIuO4vaIIhAkNsq0ZJfVCMyrsWe740C4n2taQMKDlwNAE
 dxXUHr9iURl0K+It8Np6pqRR3UwadStV7iXUlwpSybr/ob0omAKPFriLPlgM9/vRt5VZ
 ri5/hPXq4YrIbG/QnsoHW5fmgq60+B8ZBO/aUZmU1EA9/WmuAMACnET4JSfzZKkzjpZk
 cv+FQPnVW4oRGxjL/dT5OXj2Ut47AWr3OQ9BY4wCcZjFFJn1y1mFXiFtmzhD3mqDO4FD
 xXqJb4Zks2KmB+1jlKpwk9CF43qjqcQmwGneLF6VCnQ78Vgyfh+y4p0Gl2XYksVNiXFB
 64iw==
X-Gm-Message-State: AO0yUKXDIY4Ztbepn+zzaWnsop6uOSuxZm+kU3X0ens3HVhDFJJkrfNY
 ivV9aLzlFd0Z/xofJAlmm3j6A92eyIL+1oG5fL5Pi4JOAiQ1sBAEkqoj0XC6BS85BXpzsk4sjIQ
 zTSgQHkzteICxXjU=
X-Received: by 2002:a05:600c:2e87:b0:3ea:f91c:38b6 with SMTP id
 p7-20020a05600c2e8700b003eaf91c38b6mr1433792wmn.33.1677221803683; 
 Thu, 23 Feb 2023 22:56:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9tu4OEPuDbkIpz/K5jDU6l/hSR392+NKWdOD0AYTjXTKEVrmM7qPJe6mCSPSPkhojWEsZ11w==
X-Received: by 2002:a05:600c:2e87:b0:3ea:f91c:38b6 with SMTP id
 p7-20020a05600c2e8700b003eaf91c38b6mr1433781wmn.33.1677221803345; 
 Thu, 23 Feb 2023 22:56:43 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c205400b003daf6e3bc2fsm5205982wmg.1.2023.02.23.22.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 22:56:42 -0800 (PST)
Message-ID: <ffe100bb-b2b9-1c74-5b66-4f7ebee6d5ee@redhat.com>
Date: Fri, 24 Feb 2023 07:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 bmeng@tinylab.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <mhng-61abd1f7-4d76-42de-85b2-42466ec0673f@palmer-ri-x1c9a>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 0/9] Fourth RISC-V PR for QEMU 8.0
In-Reply-To: <mhng-61abd1f7-4d76-42de-85b2-42466ec0673f@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

  Hi!

On 23/02/2023 23.49, Palmer Dabbelt wrote:
> On Wed, 22 Feb 2023 07:56:10 PST (-0800), Palmer Dabbelt wrote:
>> On Tue, 21 Feb 2023 08:43:47 PST (-0800), Peter Maydell wrote:
...
>>> This seems to have caused CI to decide it needs to rerun the
>>> 'docker-opensbi' job, which doesn't work:
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3808319659
>>>
>>> I don't understand what exactly is going on here -- Alex,
>>> Bin, any ideas?
>>>
>>> Why do we build the firmware in CI if we have checked in
>>> binaries in pc-bios?
>>>
>>> Should .gitlab-ci.d/opensbi/Dockerfile really still be
>>> starting with Ubuntu 18.04 ? That is already older than our
>>> set of supported platforms, and falls out of support from
>>> Ubuntu in a couple of months.
>>
>> I just sent along a patch
>> <https://lore.kernel.org/r/20230222154938.9201-1-palmer@rivosinc.com/>.
>> I have no idea how to test it in the CI, though...

1) Fork the qemu repository in gitlab to your account
2) Add a remote to your repo on your PC to point to the
    forked gitlab repo (git remote add ...)
3) Read docs/devel/ci-jobs.rst.inc - you basically want
    these two things:

   git config --local alias.push-ci "push -o ci.variable=QEMU_CI=1"
   git config --local alias.push-ci-now "push -o ci.variable=QEMU_CI=2"

4) If you now do a "git push-ci ..." to your forked repo,
    you should be able to see the CI pipelines there

> Nobody's replied, so I'm inclined to just drop the OpenSBI bump and re-send 
> the PR.  At least that way we can avoid getting blocked on the CI issues.  
> There's some more in flight so there'll probably be a 5th round before the 
> freeze either way, at least this way the stuff that works can avoid getting 
> blocked.

Please note that pull requests are currently not processed
anyway ('til March 1st), see:

  https://lore.kernel.org/qemu-devel/CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com/

  Thomas


