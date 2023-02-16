Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA3D698DD6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:34:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYlC-0006on-Lk; Thu, 16 Feb 2023 02:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSYl9-0006h0-7t
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:32:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSYl6-0003cU-MK
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676532767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vpYWYfCv9xvpyVMbEw/vB0QdfPlqAFjQcuseLsJL8RI=;
 b=UM7WJ4pUUOxYJKPTwikEqb+K9poICv7RwO+0R0oFbiriFqsGz5BzasiCcqYZEDayAKKxwU
 1zHbMVKejyPZBbmWpvR6yK7MG3RQviOx6K3JJAf9kuxA+/SMI1xEEmFL17+0BeAW6PV96b
 AiqQ73lWMjg1p9pltXeJ3B8oqF/ZIl8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-AzNodK_JMLudHzXsSpK8og-1; Thu, 16 Feb 2023 02:32:44 -0500
X-MC-Unique: AzNodK_JMLudHzXsSpK8og-1
Received: by mail-qk1-f197.google.com with SMTP id
 x14-20020a05620a14ae00b0072f7f0f356bso717899qkj.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vpYWYfCv9xvpyVMbEw/vB0QdfPlqAFjQcuseLsJL8RI=;
 b=fxmmgiFHGrywsWENOEt69GlEZH8wKDvIO5udvihzDTtNG62dEgE08r9qVuy0v6paTz
 jF3tdeFtNCb2U2f24CfDHce/AK83tpztoXswW6xb8k5hnsH6Mo+YNjFyw0IFKkF5m1fM
 xc4iqvsbvc2VTL6UqLzwtBIatgZJ7AzipmizLRSzmxccjQ6VJYpKZl3QNUwd6QnHmT63
 5Vju1j3TDBpd2S8/zVVsq20X00PmP/OAZ/k1DlTGZuikDbFzCWqGEk2ucO77pVCOutWE
 pdMpI3/VdUqsuVbgWr6AxNoRECaPU+SkKTp3OwiW0wXXlaWoxfK4jVHpOzRs+ygd8Lw/
 UW6g==
X-Gm-Message-State: AO0yUKXS8kWnsc5pytJsQZro71WbvxnoZfG0WBU6lm25hen01jsqC5Ys
 jvGD5++2NKi6G4U8c+tQHqwBYXdEtSKcy9lqI7D9BQtzdDfkR5XsqFNwRTWlju5sg3Bopg5gvtY
 ux+ur2SUq8ljcMFk=
X-Received: by 2002:ac8:570f:0:b0:3b9:abfb:61cd with SMTP id
 15-20020ac8570f000000b003b9abfb61cdmr8301760qtw.26.1676532763733; 
 Wed, 15 Feb 2023 23:32:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+M0J7mbHrih0auHvwQNXzd8yPspj7V/RuKf80/WfGvHFHA7ZSEvU0V+MUoSN7k7rNWAQH6NQ==
X-Received: by 2002:ac8:570f:0:b0:3b9:abfb:61cd with SMTP id
 15-20020ac8570f000000b003b9abfb61cdmr8301728qtw.26.1676532763497; 
 Wed, 15 Feb 2023 23:32:43 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 e4-20020ac84e44000000b003b9bca1e093sm814019qtw.27.2023.02.15.23.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:32:43 -0800 (PST)
Message-ID: <9d47c51d-07bb-d951-0656-688abb625062@redhat.com>
Date: Thu, 16 Feb 2023 08:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 01/12] gitlab: tweak and filter ninja output to reduce
 build noise
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 15/02/2023 20.25, Alex Bennée wrote:
> A significant portion of our CI logs are just enumerating each
> successfully built object file. The current widespread versions of
> ninja don't have a quiet option so we use NINJA_STATUS to add a fixed
> string to the ninja output which we then filter with grep. If there
> are any errors in the output we get them from the compiler.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index 73ecfabb8d..3af51846cd 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -21,7 +21,7 @@
>         then
>           ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
>         fi || exit 1;
> -    - make -j"$JOBS"
> +    - env NINJA_STATUS="[ninja][%f/%t] " make -j"$JOBS" | grep -v "\[ninja\]\[.*[123456789]/"
>       - if test -n "$MAKE_CHECK_ARGS";
>         then
>           make -j"$JOBS" $MAKE_CHECK_ARGS ;

Not meant as a veto, but just for the records: I still don't like the idea. 
Having a log of the files that got compiled is still sometimes useful for 
me, e.g. when I want to check whether a certain file has been compiled at 
all or not (when e.g. debugging meson.build problems). So I'm still in 
favour of dropping this patch.

IMHO if you want to shorten the build log in the CI, please get those chatty 
softfloat tests fixed instead.

  Thomas


