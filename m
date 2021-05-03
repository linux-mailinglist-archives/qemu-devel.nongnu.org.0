Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7923712F2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:25:31 +0200 (CEST)
Received: from localhost ([::1]:40800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUpW-00015E-Oj
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldUmW-0007Li-54
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldUmU-0002CZ-66
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620033740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ec0/YaIBRVZYcdEDHpMqtg+sbK7W5f13wh2Fubwh4hs=;
 b=bpNbzTFpYFKr5nvY9xmWucRdfB6wnEQFf/cZ6ixSa7fePy5sHhHgLB56va1qCW23DPYIlk
 Ysj0JVRZCxCScqlTyOo7HFDaEixdcmYGzZYDxn+g0fEjZbUNm8UJb13l7MB9qPcTfR41r8
 NcmlpQk+LjbpLbvUKAT92EzHLphf96k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-9TBi5bdQMiG9Mngo5ftMew-1; Mon, 03 May 2021 05:22:19 -0400
X-MC-Unique: 9TBi5bdQMiG9Mngo5ftMew-1
Received: by mail-wr1-f70.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso3550743wrf.11
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 02:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ec0/YaIBRVZYcdEDHpMqtg+sbK7W5f13wh2Fubwh4hs=;
 b=KlLwn/uqRlbq1Z5GzupSF56za8jgEnT04/7/Q3Rehys/P5pDCOjyaeUBSK5psj+jn3
 dYtLQXaGTCtVSQjC10WOcUpo9q6DkdVNibEur3DwCNsT7UBBxbs7qL9F3UlVIrdtMsMx
 jusWDliSZgGEgXpxM8fqBNOKUpapiK5j8sWYnU3dHDgGRQi8Y51V0YOInjf3y5TlCU9c
 +crGKEcC5sGT6xIs/4TWyk7eJy3rntZbgw8kU9/hik1n+SaYWn95Zp/+2f+3dxVJgPfv
 WiQNP1r+AOtaMyLLwWaMDAz75KEzk19QsnFXKTSCucz3Wxdd3NTkGzjaTFuTUyIzRoaQ
 Xj2g==
X-Gm-Message-State: AOAM531FsH6HWhRqRizCtp4oq5BL/lWbKnbcsSwqu7wjXmQppww9//pQ
 saMb0Lks6iLJD3hclGBYXhX/dUP0PzwyVzcWlMquLrDIaoh+xQ2XVLdKBjS4kRCFvtv1eIrMk4z
 BW+A9vq05wsIp7R4=
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr12362034wrt.220.1620033738047; 
 Mon, 03 May 2021 02:22:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2o4OiKspVE8WiajLL4O3sBiEK8YTZMazpj1shwNchvE5J716fkH3mKWcQlSo3n66ZZDF5WQ==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr12362011wrt.220.1620033737835; 
 Mon, 03 May 2021 02:22:17 -0700 (PDT)
Received: from thuth.remote.csb (p5791d0bc.dip0.t-ipconnect.de.
 [87.145.208.188])
 by smtp.gmail.com with ESMTPSA id a15sm11469686wrr.53.2021.05.03.02.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 02:22:17 -0700 (PDT)
Subject: Re: [PATCH 04/15] gitlab-ci: Replace YAML anchors by extends
 (acceptance_test_job)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-5-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4ade3b15-5f39-d319-0c3e-27f3c3cd39d5@redhat.com>
Date: Mon, 3 May 2021 11:22:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210418233448.1267991-5-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/2021 01.34, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> 'extends' is an alternative to using YAML anchors
> and is a little more flexible and readable. See:
> https://docs.gitlab.com/ee/ci/yaml/#extends
> 
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.yml | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 11bda3abf33..07e5e737685 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -48,7 +48,7 @@ include:
>       # Avoid recompiling by hiding ninja with NINJA=":"
>       - make NINJA=":" $MAKE_CHECK_ARGS
>   
> -.acceptance_template: &acceptance_definition
> +.acceptance_test_job_template:
>     cache:
>       key: "${CI_JOB_NAME}-cache"
>       paths:
> @@ -111,7 +111,7 @@ acceptance-system-alpine:
>     variables:
>       IMAGE: alpine
>       MAKE_CHECK_ARGS: check-acceptance
> -  <<: *acceptance_definition
> +  extends: .acceptance_test_job_template

FYI, I'm getting "YAML invalid" errors when adding this patch to my staging 
branch. I guess you cannot use extends twice in a job and you should extend 
the .acceptance_test_job_template from ..native_build_job_template instead.

  Thomas


