Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C964123F5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 20:28:14 +0200 (CEST)
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSO1U-0002DT-WC
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 14:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mSNzE-0000my-Ed
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mSNzB-0004kl-3a
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632162345;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHY6lsIAwJ5lesJ7ldGrpwFgcoivYGxSmNc4PfzBKRg=;
 b=jSD8rYub2iXedIfH4l4F7SJ0GnsffeUoZyRYo+1gA0o4I1l6gm1/wnsHtvyg2BJKOKX/Hm
 UkvhcDW/E3zA4bmSFty7rS+vYbPPxLRIopLp0R3NQg0/D7I9pLJrJ2MZYBJhPOqL5y2Sxm
 KKY6nOktNR+cFfgsRazl/4K6IzT9T7I=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-oRaxml1yMma51RpuyCareQ-1; Mon, 20 Sep 2021 14:25:44 -0400
X-MC-Unique: oRaxml1yMma51RpuyCareQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 e2-20020ad45582000000b0037e7bdc88d4so146035438qvx.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 11:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=rHY6lsIAwJ5lesJ7ldGrpwFgcoivYGxSmNc4PfzBKRg=;
 b=oolM1MjviQc34IG1aNleCYatPvTyKDDszHebPo5SesK/qKsqfsMf7RlE88rsEufG4c
 namRzImFyeC7VlVwtw8ZVsu4Ib5yShXkHZfnKFIVbjFBfFRlks32EtMCQbUr/49LY8dL
 0oq1PWJlskPrqdLRu5BanQdb1PsvPHlYyE3VA6mfs816CUhvyYbDkz3itySd17bf73p/
 /JF07ZXbqszzRVzwb/vAU8j0Fv++vP8KbMD+p0u6n+zc2lEBcyFdDBIplSblkCIET6tq
 Gxf4k0b4G96+jDLsvkmLO5AzfkB/x4ZCMry5VFhfWUboM0JGtc8Yvac7e3C2t3UiIGHO
 R01Q==
X-Gm-Message-State: AOAM532oaKgNFmScUpKjAiariKxEXr898GKHAbasp9f/UliLc3IN5X0i
 Kqw1x94pRI51f1O3E2LNRxHhMnZlztRklYRvCfDnc+rLqJQrug7SBBaL4/7idDdukLMlCrf178M
 BeINKl0AbvcisSpI=
X-Received: by 2002:a37:ea16:: with SMTP id t22mr26114373qkj.507.1632162338474; 
 Mon, 20 Sep 2021 11:25:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDLoKCcy6pGe404p+aOjNy6YsD6e3A1GAZ9S71ecjgXow9PTK29X6OXFBgP/LBYLO3Xyb1ew==
X-Received: by 2002:a37:ea16:: with SMTP id t22mr26114351qkj.507.1632162338267; 
 Mon, 20 Sep 2021 11:25:38 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.154.246.21])
 by smtp.gmail.com with ESMTPSA id 90sm9685773qte.89.2021.09.20.11.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 11:25:37 -0700 (PDT)
Subject: Re: [PATCH v2] Acceptance Tests: add standard clean up at test
 tearDown()
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210920151832.60803-1-willianr@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <7c89fa16-67d1-af31-ba3f-7d6ddcb90c99@redhat.com>
Date: Mon, 20 Sep 2021 15:25:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920151832.60803-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: wainersm@redhat.com
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 9/20/21 12:18 PM, Willian Rampazzo wrote:
> From: Cleber Rosa <crosa@redhat.com>
>
> The avocado.Test class, used as the basis of the avocado_qemu.Test
> class, performs a clean of temporary directories up as part of its own
> tearDown() implementation.
>
> But the avocado_qemu.Test class is currently missing the same clean
> up, as it implemented its own tearDown() method without resorting to
> the upper class behavior.
>
> This brings avocado_qemu.Test behavior in sync with the standard
> avocado.Test behavior and prevents temporary directories from
> cluttering the test results directory (unless instructed to do so with
> Avocado's "--keep-tmp" option).
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> [willianr: respin to new Python super format]
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
>
> ---
> v2
>    - adjust super call to conform with PEP3135
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 1 +
>   1 file changed, 1 insertion(+)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 2c4fef3e14..d9e1b32aa1 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -276,6 +276,7 @@ def tearDown(self):
>           for vm in self._vms.values():
>               vm.shutdown()
>           self._sd = None
> +        super().tearDown()
>   
>       def fetch_asset(self, name,
>                       asset_hash=None, algorithm=None,


