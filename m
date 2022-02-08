Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147C34AD7AC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:39:33 +0100 (CET)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOqK-0006ON-4L
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:39:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHOJM-0000o7-KF
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:05:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHOJJ-0004Vk-2B
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:05:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644318324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhpJ1961AgN4vNQjh7FsZLVhEG2vwK1EvGuGHocKItw=;
 b=YTQjfbMXJ8CubSNSWnQNxidyq6MyJSpXMgPAR+djzoqgq9+CKHzro5OLELyF6A/bMaj5kf
 Ve1KzilrCRKC3TUwjpF3TKxn0QXTUP1v1UnAwCbGr5p7zt27T72hLLpgNeB3hCcePzznhQ
 owlKdomYsVOb84T+JEA/XBkxCEX2xhg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-YlA6FcjZM4KbIwuS9UAl3Q-1; Tue, 08 Feb 2022 06:05:23 -0500
X-MC-Unique: YlA6FcjZM4KbIwuS9UAl3Q-1
Received: by mail-qv1-f70.google.com with SMTP id
 14-20020a05621420ee00b00423846005d4so10640516qvk.15
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZhpJ1961AgN4vNQjh7FsZLVhEG2vwK1EvGuGHocKItw=;
 b=dJ3TQnoMMYv84l10cpN+lp/f09GveBnjjmZrvNDrc4UkbCtzI/B48gtKql5dOAJZhA
 fo5Unm3pN5J56Ah4DefULNoVbou3sgtHP7koPHULSbP0XAlUOx5As/NNSqSrundqPGew
 /x46p95drB6WX8DCjvdXzj/EA+ZulXkMRfjdlY88ljZ898gEcOFohWhuLsKG9hXfUMIT
 PWuPyAfHGpTPCRhbopsuKhI97RInPAAdJ2hyN05Ita6I2Od4ycJfJO2rQ7FebQh7Oo1p
 VMEkTsJ38yYt3k4MiSBP92QAXc7cY8lay3YZYy2SiITXpGLzOhCYWrcn30ILjNE+wCA0
 baaw==
X-Gm-Message-State: AOAM531EKusLO+KjLv8GxK8wRs4+9WrB5TF1ghyIGBNl/fqjXUmmeLnc
 GVgNWfpFwmravxfJhOAg9cLN/0+UiG2WWwovhtQ4GdSSOokQva2iB3ZhRHQP0QqJzBxqCFFvqz4
 WIhcXaTDlzKGZKPk=
X-Received: by 2002:ac8:704f:: with SMTP id y15mr2484873qtm.550.1644318323161; 
 Tue, 08 Feb 2022 03:05:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytrOvV5Ddl3l6hrjBA2wrq5i05sgtiQ+sScB00S8641lugsoSwEAE9KA5pslTeLI2PnDh9/w==
X-Received: by 2002:ac8:704f:: with SMTP id y15mr2484808qtm.550.1644318322307; 
 Tue, 08 Feb 2022 03:05:22 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id u9sm1931807qko.130.2022.02.08.03.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 03:05:22 -0800 (PST)
Message-ID: <7c9a8f96-9f8d-c475-8778-ba0ec019559c@redhat.com>
Date: Tue, 8 Feb 2022 12:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 31/33] include/qemu/job.h: introduce job->pre_run() and
 use it in amend
To: Kevin Wolf <kwolf@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-32-eesposit@redhat.com> <YgFhdrOXde2CdyOE@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YgFhdrOXde2CdyOE@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/02/2022 19:14, Kevin Wolf wrote:
> Am 21.01.2022 um 18:05 hat Emanuele Giuseppe Esposito geschrieben:
>> Introduce .pre_run() job callback. This cb will run in job_start,
>> before the coroutine is created and runs run() in the job aiocontext.
>>
>> Therefore, .pre_run() always runs in the main loop.
>> We can use this function together with clean() cb to replace
>> bdrv_child_refresh_perms in block_crypto_amend_options_generic_luks(),
>> since that function can also be called from an iothread via
>> .bdrv_co_amend().
> 
> How is this different from having the same code in the function that
> creates the job, i.e. qmp_x_blockdev_amend()?
> 
> Almost all block jobs have some setup code in the function that creates
> the job instead of doing everything in .run(), precisely because they
> know this code runs in the main thread.
> 
> Is amend really so different from the other block jobs in this respect
> that it needs a different solution?
> 

Are you suggesting to simply call .bdrv_amend_pre_run before job_start()
and just leave JobDriver .clean() to call .bdrv_amend_clean?

Yes, that will work too. I will delete .pre_run().

>> In addition, doing so we check for permissions in all bdrv
>> in amend, not only crypto.
>>
>> .pre_run() and .clean() take care of calling bdrv_amend_pre_run()
>> and bdrv_amend_clean() respectively, to set up driver-specific flags
>> and allow the crypto driver to temporarly provide the WRITE
>> perm to qcrypto_block_amend_options().
>>
>> .pre_run() is not yet invoked by job_start, but .clean() is.
>> This is not a problem, since it will just be a redundant check
>> and crypto will have the update->keys flag == false anyways.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> I find the way how you split the patches a bit confusing because the
> patches aren't self-contained, but always refer to what the code will do
> in the future, because after the patch it's dead code that isn't even
> theoretically called until the final patch comes in.
> 
> Can we restructure this a bit? First a patch that adds a new JobDriver
> callback (if really needed) along with the actual calls for it and
> everything else that needs to be touched in the generic job
> infrastructure. Second, new BlockDriver callbacks with all of the
> plumbing code. Third, the amend job changes with a patch that doesn't
> touch anything but block/amend.c and potentially block/crypto.c (the
> latter could also be another separate patch).

It is more or less what also Hanna suggested, I have it for the next
version.
> 
> This change with three or four patches could also be a candidate to be
> split out into a separate smaller series.

Makes sense.

Emanuele
> 
> Kevin
> 


