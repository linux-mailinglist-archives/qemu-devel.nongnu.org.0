Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019D43FDD86
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:56:30 +0200 (CEST)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQj6-0007Mc-GK
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLQhx-0006bY-Qf
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:55:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLQhv-0001H5-Od
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630504514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZxL6XsF30k6Et+bMh/3eDKLdiCkk1Sgdh9RB9XX5XDo=;
 b=EOzE599afbKTEa5JrCdrUIf5BEX6lc4t6YQnj5UKitSYhKYzRe9RZUbsoHMptk5TcQBnSo
 FP1/xEHxHJd+BX+QLJWNY40K5CiMM375PG7f2XkdSAfxj0VGM6DoLXYOVUGvKTv0R0dFSj
 EdIs0NfUfhhwIdCPbRrDpYqvY2e26rs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-2gNFKA1GNii7jnEe4xz4FA-1; Wed, 01 Sep 2021 09:55:11 -0400
X-MC-Unique: 2gNFKA1GNii7jnEe4xz4FA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so835031wrl.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 06:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZxL6XsF30k6Et+bMh/3eDKLdiCkk1Sgdh9RB9XX5XDo=;
 b=cN2cojCs/+Un/tO+G6Lvq+8DOt/CwVq0fwUm/gfB4/H2wH/2C8N+hUce40PPcMHyJx
 VIm2+EyrtPuRYyVvQXfyBXD9FGRcAFJe6ybWsyUJyyC+QG7k0BmvhD510kJFa5SI2juj
 3IvNnRT4blJceY+i6u8e7BdHjkZL5zbpsR6X3Oso+6RoMzYfqgu+rDY8EAEj/NeRt+64
 KO+gfxq1ZqcMYib/JqpN1nmehswcYaKeZj5TmshUKJ6U4enbD9/g0yNVhelTEIdwqknP
 ZCx9KY4jyELK29hy1kgeDdtxlBDn36p1AY4y9w0A9VLy8+1HJNPR010F8ndDAEo6/vfL
 D69Q==
X-Gm-Message-State: AOAM530/41O2Mh1fftwlL5SB3wVv3n9dQubvhdleatyhi0sGQHStRWvU
 eZdufvvF3bEG8irBr1Vy1iXhmvKKQ3xuLZsCaejYQ2qBbdSlLwVKjmfTryxmbL/zJa6OpYqkyOD
 U+NyQaJD2Sh/QLE8=
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr25674468wrc.158.1630504510408; 
 Wed, 01 Sep 2021 06:55:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLmrmBTr4I24WDKvpQPnEkIqCFeoJbWM5wN5MeennOaKLhJo93oYQ55qxUL9+hBuOzgcTQmg==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr25674450wrc.158.1630504510207; 
 Wed, 01 Sep 2021 06:55:10 -0700 (PDT)
Received: from thuth.remote.csb (p5791d006.dip0.t-ipconnect.de. [87.145.208.6])
 by smtp.gmail.com with ESMTPSA id c3sm22316130wrd.34.2021.09.01.06.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 06:55:09 -0700 (PDT)
Subject: Re: [PATCH] libqtest: check for g_setenv() failure
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210820163750.9106-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <11999a17-9f3b-e558-a90d-4f23297d02e1@redhat.com>
Date: Wed, 1 Sep 2021 15:55:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210820163750.9106-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/08/2021 18.37, Peter Maydell wrote:
> g_setenv() can fail; check for it when starting a QEMU process
> when we set the QEMU_AUDIO_DRV environment variable.
> 
> Because this happens after fork() reporting an exact message
> via printf() is a bad idea; just exit(1), as we already do
> for the case of execlp() failure.
> 
> Fixes: Coverity CID 1460117
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/libqtest.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 825b13a44c7..73f6b977a66 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -301,7 +301,9 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>       s->expected_status = 0;
>       s->qemu_pid = fork();
>       if (s->qemu_pid == 0) {
> -        g_setenv("QEMU_AUDIO_DRV", "none", true);
> +        if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
> +            exit(1);
> +        }
>           execlp("/bin/sh", "sh", "-c", command, NULL);
>           exit(1);
>       }

Thanks, queued to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas



