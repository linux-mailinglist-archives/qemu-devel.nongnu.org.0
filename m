Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9265840C723
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:12:34 +0200 (CEST)
Received: from localhost ([::1]:35614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQVeL-0005Gz-LE
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQVco-0004EQ-QZ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:10:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQVcl-00073S-MF
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631715054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTUEgNiNJzKWnxdXFkZFihylbm9DV6fXs0JBgE+tmWE=;
 b=ShrNUHS+8mi0GilN+mAMrgWZ7hip8mYuBIknZG//rNvWCdj36UJCcge1FYX3HMdmo9qlQd
 6dpakyN7R9TZaQbq7I6JmEZa5fe7E2KafXF0sWatjRtkDM83D7sgjX/gcqQxAlaeb3peOA
 7qhLBl2brbBxHP6mf7hxMAm9eYjwTD0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-QeK3neKUNA-EhkV8PaDQlQ-1; Wed, 15 Sep 2021 10:10:53 -0400
X-MC-Unique: QeK3neKUNA-EhkV8PaDQlQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 m18-20020adfe952000000b0015b0aa32fd6so1067639wrn.12
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 07:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZTUEgNiNJzKWnxdXFkZFihylbm9DV6fXs0JBgE+tmWE=;
 b=29BWIKGSwJ7Tq+xjFvBLaiV6fK14pbCScFcj99jBs0DTCVUL+2uQblOuJR3UVjvA5o
 1ec93uwYPpa7RTR6fOnTJlRGbYkc0edwzEUlVh6SggDBIKgVfRqlh+7wCwFY5lk4bZqi
 nbTNY2LjXYuHC750eyJ4APXwLJ3Jb0+UZoX1KRnGs34twDgsi1mk0CLUBZys1ajVCmia
 z1Y1fQKcBXdEUf+SswL+t1He1YWphYJkU6D3xVVPQknmgC6cKbzn9LQiK2ISbWe+kiK0
 E2bHpGALF8+awsi8IrrTUpZWkFVZUYNlzyrAwlGCON2Po8H4WUWWyqeKLYxlvyHVkM4W
 8m8w==
X-Gm-Message-State: AOAM530OgMg8uEbfCt1se2099b32TfCaXt7rGl0frXQO5upgfqa5c8lj
 oPJ++cgj/VpmF7m/KbKEBFOmn21zLyQCUIKfcAHqxkbr6dra4fC5BmOm+zg5AOFtzJW+HOOGj5C
 JMV+/drD/H0pYolg=
X-Received: by 2002:a1c:4645:: with SMTP id t66mr22909wma.130.1631715051784;
 Wed, 15 Sep 2021 07:10:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXRvcJSy7AQ8q7/BmTMazZkMNg/Gm2rRzSdGYRU1rSSHj6GkvF4FGyMnIA6wEYAmUAEw082A==
X-Received: by 2002:a1c:4645:: with SMTP id t66mr22890wma.130.1631715051565;
 Wed, 15 Sep 2021 07:10:51 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-145-004.46.114.pool.telefonica.de. [46.114.145.4])
 by smtp.gmail.com with ESMTPSA id k4sm111347wrv.24.2021.09.15.07.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 07:10:51 -0700 (PDT)
Subject: Re: [PATCH 2/2] gitlab: fix passing of TEST_TARGETS env to cirrus
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210915125452.1704899-1-berrange@redhat.com>
 <20210915125452.1704899-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <18bf095c-719c-d6e9-780e-3a7e3c682092@redhat.com>
Date: Wed, 15 Sep 2021 16:10:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915125452.1704899-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/09/2021 14.54, Daniel P. Berrangé wrote:
> A typo meant the substitution would not work, and the placeholder in the
> target file didn't even exist.
> 
> The result was that tests were never run on the FreeBSD and macOS jobs,
> only a basic build.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus.yml       | 2 +-
>   .gitlab-ci.d/cirrus/build.yml | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index 675db69622..e7b25e7427 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -35,7 +35,7 @@
>             -e "s|[@]PIP3@|$PIP3|g"
>             -e "s|[@]PYPI_PKGS@|$PYPI_PKGS|g"
>             -e "s|[@]CONFIGURE_ARGS@|$CONFIGURE_ARGS|g"
> -          -e "s|[@]TEST_TARGETSS@|$TEST_TARGETSS|g"
> +          -e "s|[@]TEST_TARGETS@|$TEST_TARGETS|g"

Ooops, missed that in the review :-/

Acked-by: Thomas Huth <thuth@redhat.com>


