Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98FC52B379
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 09:38:42 +0200 (CEST)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrEGX-0006PU-Qm
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 03:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrECJ-0004Tl-Jg
 for qemu-devel@nongnu.org; Wed, 18 May 2022 03:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrECG-0007Sd-Hy
 for qemu-devel@nongnu.org; Wed, 18 May 2022 03:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652859254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PB0t2G5bXN3J+uguqk6tHGGQcyiTou/PJtO0ezU3R8=;
 b=JcSp2W41U7v++GSdehHCRalVww0SxmP9po8VrrCXsJ6jkBzfjB4ZvUtQVmrySJPwVsU/Lw
 KX0KwqqLZP0QNvNmDLyfEvLOcNMNzAGMABLaqImagbDnzlRUvqurY+VdvhobpmLDISZCBt
 N7jJBLmH93cBEGYEYh2NREA/7A7XEY8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-NiFc7pLmO4iVYW1wffVHBg-1; Wed, 18 May 2022 03:34:13 -0400
X-MC-Unique: NiFc7pLmO4iVYW1wffVHBg-1
Received: by mail-wr1-f71.google.com with SMTP id
 d7-20020adfef87000000b0020e621f932aso234009wro.18
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 00:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7PB0t2G5bXN3J+uguqk6tHGGQcyiTou/PJtO0ezU3R8=;
 b=W89lJoxxTAcqivlXmZa3zHcUyWiIOIwl8dDO+94WU5LyespFrUA2lTQe+UgorgcQmj
 EgaX4WpmGcJYHgLUPLkVNCFSn6E8wAygRud7AJOAUClMfny0rNObBigBPAwSrgP2wlOo
 RmgEdsvk0YsrNrmW2Is2GEaga/l0+E/FoY88xxUytIzZrmCcfb36hJ1jtaz+30WXiKYI
 5h5C8d6vrZ6HDD6aiqsJxz2vJkci4QQsZQ75yDxnlSipkMJC/tHdhXii21IovJTrwnXP
 JJZ/6dSt9o4O02pb4cFO/9TpijnVLTKHsm9hDtwCJ5BCaPnwInGnTYfxYkt5n/nc0n5/
 LrvQ==
X-Gm-Message-State: AOAM533+HKAas3ybFt+7VCG5T4Ubk8gJrhAkd3Pv287+z6f9JY7L0bdC
 sQ7Q2JxTYIDv9Yot5Idd3fRH+8/Mwdgo5KSGPCwrS8IwFmKQqP4bVzCj3b6TAVtiLohfG+afc4L
 30McKM2Rrmv05+GE=
X-Received: by 2002:a05:6000:10d0:b0:20d:7d3:9972 with SMTP id
 b16-20020a05600010d000b0020d07d39972mr12486234wrx.554.1652859252419; 
 Wed, 18 May 2022 00:34:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdWYaQZmeDaOWeps1YnvJbivxt0TYRP2yAPVOIwJnub76DG6vjgwIb9jojkdOeQ9ruUzAzSg==
X-Received: by 2002:a05:6000:10d0:b0:20d:7d3:9972 with SMTP id
 b16-20020a05600010d000b0020d07d39972mr12486213wrx.554.1652859252171; 
 Wed, 18 May 2022 00:34:12 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adfc04d000000b0020d0351dbb6sm1168716wrf.80.2022.05.18.00.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 00:34:11 -0700 (PDT)
Message-ID: <d050c8cd-d3b9-46da-ba89-398702a0a6eb@redhat.com>
Date: Wed, 18 May 2022 09:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH] tests/qtest: pass stdout/stderr down to subtests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220407150042.2338562-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220407150042.2338562-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/04/2022 17.00, Alex Bennée wrote:
> When trying to work out what the virtio-net-tests where doing it was
> hard because the g_test_trap_subprocess redirects all output to
> /dev/null. Lift this restriction by using the appropriate flags so you
> can see something similar to what the vhost-user-blk tests show when
> running.
> 
> While we are at it remove the g_test_verbose() check so we always show
> how the QEMU is run.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/qos-test.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
> index f97d0a08fd..c6c196cc95 100644
> --- a/tests/qtest/qos-test.c
> +++ b/tests/qtest/qos-test.c
> @@ -89,9 +89,7 @@ static void qos_set_machines_devices_available(void)
>   
>   static void restart_qemu_or_continue(char *path)
>   {
> -    if (g_test_verbose()) {
> -        qos_printf("Run QEMU with: '%s'\n", path);
> -    }
> +    qos_printf("Run QEMU with: '%s'\n", path);

I think I'd rather drop this hunk since it breaks the usual output of the 
qtests. And adding a --verbose when running the test isn't that hard either, 
is it?

  Thomas


