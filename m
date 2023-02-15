Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D7F697F92
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:36:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJoU-0004L8-6q; Wed, 15 Feb 2023 10:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSJoO-0004IW-C5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:35:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSJoH-0000EX-QW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676475303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojPbAJ8klWhmEXakS5SHPg0chcbE4s3CS3Y0ie2+jhM=;
 b=AoVc9XmqjsSjXm63dkWCqOZvQMIGvBFPjbq63lPRMFh/glzZUeVZTVqgOI7z3xREOuYBQO
 z3bURIhnGlkWi+1OS6bl6/xhdF9XdSO+9awstHu+dHcmw14Jj9UqSQfJVZQFv5kXz6XexB
 Lhzitz4W58QmMnhrSuWbBqF9zTQy7v8=
Received: from mail-qt1-f198.google.com (209.85.160.198 [209.85.160.198]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-259-HhyOAWBINZawQ35Qqhsi9g-1; Wed,
 15 Feb 2023 10:33:50 -0500
X-MC-Unique: HhyOAWBINZawQ35Qqhsi9g-1
Received: by mail-qt1-f198.google.com with SMTP id
 v3-20020a05622a188300b003ba183e8272so11290947qtc.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 07:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojPbAJ8klWhmEXakS5SHPg0chcbE4s3CS3Y0ie2+jhM=;
 b=Nv57s+cnsyHcLuElmLqaoRhk6ime3tv7Pp1UEL1daaAt1V4boq7hBpblZVvQ/QhdlF
 BZoH+Jl3fn0N+iv9JAuq6PHLkUONHqopD7R1bQ128huAUgCkBF+WB1Bt/yHZdDK9+37w
 7Fm0fM1vfEb9bbmX8sAjhwNlmvuP+lSOb2uNugaQHEgOy22F6kVA0Ps8UnLn+isbPaMQ
 vJCVtwtB5013hpYjEm+sgjnxtRU1PFEqFAWndGSTKOcZ0nj6yhylGmnBrmhkMSH/dxky
 VsqRVA17b+030/Mkvwt1Wza7vi2ffpK/oEswm4BbKRfxyzYV7+HmioruePY93db16zDH
 /EgA==
X-Gm-Message-State: AO0yUKWPjcNwWvtgeWuhrnHZkpwqvdW3iwVSejvKFKGakTbBeg97I6cs
 54nr5F6lcX7xh5FEkYfwIGoJX0+73RO9hTPVvTMchJpl+6y7jakD7FDt5LtNpk0NZ/B85+iiLSL
 iQyCRa7sUXQGHXKc=
X-Received: by 2002:a05:6214:dae:b0:56e:9dd8:47f3 with SMTP id
 h14-20020a0562140dae00b0056e9dd847f3mr5091658qvh.13.1676475225969; 
 Wed, 15 Feb 2023 07:33:45 -0800 (PST)
X-Google-Smtp-Source: AK7set92wTay5mhq0HKmEQU73EGT6ILK5EUxA3nWaL3hTG4eE1VubGYxoSsChVdAtZwicjLAc5uIcA==
X-Received: by 2002:a05:6214:dae:b0:56e:9dd8:47f3 with SMTP id
 h14-20020a0562140dae00b0056e9dd847f3mr5091634qvh.13.1676475225744; 
 Wed, 15 Feb 2023 07:33:45 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-79.web.vodafone.de.
 [109.43.176.79]) by smtp.gmail.com with ESMTPSA id
 c9-20020a379a09000000b0073b79edf46csm977764qke.83.2023.02.15.07.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 07:33:45 -0800 (PST)
Message-ID: <1ed8e614-d43c-3d7d-b320-27985b521667@redhat.com>
Date: Wed, 15 Feb 2023 16:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230215142503.90660-1-thuth@redhat.com>
 <Y+zzIV2e6UigEIze@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Use artifacts instead of dumping logs in the
 Cirrus-CI jobs
In-Reply-To: <Y+zzIV2e6UigEIze@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15/02/2023 15.58, Daniel P. Berrangé wrote:
> On Wed, Feb 15, 2023 at 03:25:03PM +0100, Thomas Huth wrote:
>> The meson log files can get very big, especially if running the tests in
>> verbose mode. So dumping those logs to the console was a bad idea, since
>> gitlab truncates the output if it is getting too big. Let's publish the
>> logs as artifacts instead. This has the disadvantage that you have to
>> look up the logs on cirrus-ci.com now instead, but that's still better
>> than not having the important part of the log at all since it got
>> truncated.
> 
> Having to go over to cirrus-ci.com is pretty awful user experiance,
> especially as there's no direct link.

It's not that bad, see e.g.:

  https://gitlab.com/thuth/qemu/-/jobs/3775523498

The log shows a link to cirrus-ci.com at the end:

  Build failed: https://cirrus-ci.com/build/4811273133621248

If you click on that URL, you've just got to go into the "build" and click 
through the build artifacts to get to the log that you want.

>> +      type: text/plain
> 
> Does it have to be either/or, can't we do both ?
> 
> 95% of the time the truncated testlog.txt is sufficient on its own.

I'd say 95% of the time the normal console output (without the "cat 
.../testlog.txt") is already enough since meson prints the stdout and stderr 
of the failing tests to the console already.

FWIW, this is the test run with the truncated output that Peter complained 
about earlier today in IRC:

  https://gitlab.com/qemu-project/qemu/-/jobs/3768540680

Even if you click on the "complete raw" link there, you'll have a hard time 
finding the information that you are interested in. So I'd really prefer to 
not dump testlog.txt by default and only have it via the artifacts instead.

  Thomas


