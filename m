Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C096526531
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:48:52 +0200 (CEST)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWb5-0007g3-AM
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npWaE-0006zn-LM
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:47:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npWaB-0006wF-EF
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652453274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=81A/WOOUOlbxwlf7xHz2Nkl5opY4ZMbXABYhjtmPT/I=;
 b=IrFdrrNM+X2Wty2t1ht98wRT4mqbIg6Nrplhbvmn7GWwvooqUGVkNpDGZ88Hatbg6Nl3pV
 E9hl8m3KEvyj1IGXpc/Xu3TJzHGLkx+WeIglI1r2tSYwYyftyMGmH81RmN6ueh5Dpa9B0G
 8Nbg1MCDx/uJcMGU4t17PUGxF1omznY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-KEetPK1QPtCCmqseretoWQ-1; Fri, 13 May 2022 10:47:53 -0400
X-MC-Unique: KEetPK1QPtCCmqseretoWQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v16-20020adfd190000000b0020c8fb5106dso3001390wrc.19
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=81A/WOOUOlbxwlf7xHz2Nkl5opY4ZMbXABYhjtmPT/I=;
 b=XmM8NWT0Didh+zVSEQDd2KimhQdTeyPj3xnSPLzkhmbQlH+zrWdvHsdUKTL7DLUnZ5
 6DxKuujs1cmuCMutIu+tpgjHktJermG0U2eCCjMDVXPLoLWCrr7tLdK/r9kNLyIHu6iU
 He8JDmIF6KJaY8SY1yoNTwu7B5MVI6thO2bzqTN2KACMGw22jaN/jXS9znPL3qpNRY8r
 RX+CazLbwct0FB+Qlm13q1klObgbY/qM1gzTb2L/2/X13jjMtA3PP+A42hm62VsoG5IL
 orcvmsNl/q5jBfhHGwhkCBiF8nH7H+GNE0vzidhvCzi65MJ8k7BgxZnsMseL17iQSXrW
 G51w==
X-Gm-Message-State: AOAM532rdfuB7z4QDlKBzjlVe+YDdTB03el7RfratDnAEb99Ln0lFv2q
 BNODebVyxBmPQCDH99SIlZziVPJK0CLl5ktsM2HsRi5eQZbpD31wCFWFRj6l+aQ2L2wbycvSHxM
 295tZ8THs5oqLC+I=
X-Received: by 2002:a5d:5707:0:b0:20a:c768:bc8 with SMTP id
 a7-20020a5d5707000000b0020ac7680bc8mr4356714wrv.565.1652453271926; 
 Fri, 13 May 2022 07:47:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG5OVJNToh9vQOY3ToiNTOx5rVknmyw0xaFp6dY36jC2DKa1FMYXEULFMSVdU1QU5X528ofQ==
X-Received: by 2002:a5d:5707:0:b0:20a:c768:bc8 with SMTP id
 a7-20020a5d5707000000b0020ac7680bc8mr4356695wrv.565.1652453271581; 
 Fri, 13 May 2022 07:47:51 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 f2-20020adfb602000000b0020c5253d906sm2288587wre.82.2022.05.13.07.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 07:47:51 -0700 (PDT)
Message-ID: <0377cbbc-1d6c-67bc-eaef-aec105694088@redhat.com>
Date: Fri, 13 May 2022 16:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] tests/qtest: kill off QEMU with SIGKILL when qtest exits
 abnormally
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20220513143743.198390-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220513143743.198390-1-berrange@redhat.com>
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

On 13/05/2022 16.37, Daniel P. Berrangé wrote:
> If a qtest program exits without calling qtest_quit(), then the
> QEMU emulator process will remain running in the background forever.
> 
> Unfortunately this scenario is exactly what will happen when a
> g_assert() check triggers an abort().
> 
> Prior to switching to use of 'meson test', this problem would
> cause tap-driver.pl to hang forever. It was waiting for its
> STDIN to report EOF, but that would never happen due to the
> ophaned QEMU emulator processes keeping the pipe open forever.
> Fortunately this doesn't happen with meson, but it is still
> desirable to not leak QEMU processes when asserts fire.
> 
> Using the Linux specific prctl(PR_SET_PDEATHSIG) syscall, we
> can ensure that QEMU gets sent SIGKILL as soon as the controlling
> qtest exits, despite being daemonized.
> 
> Note, technically the death signal is sent when the *thread* that
> called fork() exits. IOW, if you are calling qtest_init() in one
> thread, letting that thread exit, and then expecting to run
> qtest_quit() in a different thread, things are not going to work
> out. Fortunately that is not a scenario that exists in qtests,
> as pairs of qtest_init and qtest_quit are always called from the
> same thread.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/libqtest.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 228357f1ea..553e82e492 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -19,6 +19,9 @@
>   #include <sys/socket.h>
>   #include <sys/wait.h>
>   #include <sys/un.h>
> +#ifdef __linux__
> +#include <sys/prctl.h>
> +#endif /* __linux__ */
>   
>   #include "libqtest.h"
>   #include "libqmp.h"
> @@ -301,6 +304,21 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>       s->expected_status = 0;
>       s->qemu_pid = fork();
>       if (s->qemu_pid == 0) {
> +#ifdef __linux__
> +        /*
> +         * If the controlling qtest process exits without calling
> +         * the qtest_quit() method, the QEMU processes will get
> +         * orphaned and remain running forever in the background.
> +         *
> +         * Missing qtest_quit() calls are, unfortunately, exactly
> +         * what happen when a g_assert() check triggers abort() in
> +         * a failing test scenario.
> +         *
> +         * This PR_SET_PDEATHSIG setup will ensure QEMU will
> +         * get terminated with SIGKILL.
> +         */
> +        prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
> +#endif /* __linux__ */
>           if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
>               exit(1);
>           }

Would it make sense to install a signal handler for SIGABRT instead and make 
sure that we tear down the QEMU instance there? ... that would then also 
work for other non-Linux operating systems?

  Thomas


