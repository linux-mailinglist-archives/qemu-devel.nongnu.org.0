Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF22D4B8EC4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:03:18 +0100 (CET)
Received: from localhost ([::1]:34500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNi2-0002Jp-0h
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:03:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKNEI-0004DI-Rs
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:32:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKNEF-0002el-Vr
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645029151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+3emj8dnyJscD7xsA/uVcdsjkKIrDq/qPalGVAdvrc=;
 b=B+7owA2AnT+S3rUKyW1jMSRxUFUVloBwQsYNjarY6ZIVfovw8NEi3ofJvy9LNChLIqzmwR
 7ZoHDzkGGxasO3D+C8kFequ2pighScK49fz1374yygoNgqSZDw092nCzii+ezKwJnsLMJE
 IBrEs2uxJ1rm4ql80eD1znOo61GQNHg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-wNJ88FUFNc6EwU5xoWOGnw-1; Wed, 16 Feb 2022 11:32:29 -0500
X-MC-Unique: wNJ88FUFNc6EwU5xoWOGnw-1
Received: by mail-wr1-f70.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so1269195wrg.19
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 08:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y+3emj8dnyJscD7xsA/uVcdsjkKIrDq/qPalGVAdvrc=;
 b=LG1zla//jQ/lRFWg4w4AJx8DmhB5i/foH0dGt0Lb7ASN3NHkHUDS/5bEr4/xtUrRJP
 aJfHqIPKqpxNi0m/w89IwNbmfEDoiXQSbPcajkoa9WRKofjmEUYRbUGguD+JJ5Tc+J+w
 o/s14J0YNeyvJPXkO9ElsGwHYRgArCzuZMyHo0w33NYQXABS4xeKM7ujJWdqUJ3BqPsn
 D0z+1cDzc1K+wtpABeWlB1cNu48eEzJ0eJ+8o3g9VcAvbekibkUEkdKdLYxYJWo3q6cM
 timtbDpGulLlJp0oCEQgoVDCSMLq3VEtRlh44lwt724WZnxaErJTjmhVY4COvQudYzUq
 AH6Q==
X-Gm-Message-State: AOAM530MhPPmcufQW09hyidDtsj2JHLGf5rnvmHYRS/gjCdNcgv3zfvP
 XMPbHBHK7KyBXt/Fusb4eobf3cf8Z0FuMpwVbch/jh+4jiEYSvkJoOmY4bOG2CgDnPZOMY4z7d1
 e6EpbLKgiFcBfsWM=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr2922544wri.219.1645029148469; 
 Wed, 16 Feb 2022 08:32:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIj3fwwBpb2E6bNhjjJYZl4s/Pk9i21NR5UL240UN4YqnAnYDALOde48dS+UDUI9ifuS/V7A==
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr2922529wri.219.1645029148224; 
 Wed, 16 Feb 2022 08:32:28 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id t4sm18703783wmj.10.2022.02.16.08.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 08:32:27 -0800 (PST)
Message-ID: <0a36d4b2-965d-84ad-1e04-ab4cd8c437f1@redhat.com>
Date: Wed, 16 Feb 2022 17:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: QEMU's Haiku CI image
To: Alexander von Gluck IV <kallisti5@unixzen.com>,
 Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <c13291ec-ed73-a62d-24bc-e4282aad2031@redhat.com>
 <777cb005f1c2197ff3fd610f89215b4d@unixzen.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <777cb005f1c2197ff3fd610f89215b4d@unixzen.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2022 16.52, Alexander von Gluck IV wrote:
> February 16, 2022 6:31 AM, "Thomas Huth" <thuth@redhat.com> wrote:
>>
>> while researching the different "sed" options on our supported build platform today, I started
>> "make vm-build-haiku.x86_64" in my QEMU build directory for the first time since many months again.
>> And I had to discover that this is completely out of date. The image does not contain any version
>> of Python 3 yet which we require for compilation since more than a year now already, and the Haiku
>> version in there seems to be too old to do a "pkgman install -y python3" ... so this has been
>> completely been bitrotting since more than a year now. Is anybody still interested in keeping the
>> Haiku support in QEMU? If so, please help to get the VM image updated. Thanks!
> 
> I submitted
> https://patchwork.kernel.org/project/qemu-devel/patch/20220216154208.2985103-1-kallisti5@unixzen.com/
> to fix this issue.  The build runs as expected after that patchset.
> 
> Likely cause is us no longer packing a "python" binary, deferring to "python2" vs "python3"
> 
> I'm still the most likely maintainer.  Are there still plans to automate the tests for Haiku to
> prevent this from happening again in the future?

AFAIK we still don't have a machine where we could properly run VM-based 
tests in the CI, do we? Peter? Cleber?

I recently added NetBSD and OpenBSD via KVM on Cirrus to the gitlab-CI :

  https://gitlab.com/qemu-project/qemu/-/commit/f11b0a4892ae22b872

But the jobs are marked as "manual" since the setup is rather fragile. We 
could still at least try to add a job like this for Haiku, too, so that it's 
at least semi-integrated into our CI setup?

  Thomas


