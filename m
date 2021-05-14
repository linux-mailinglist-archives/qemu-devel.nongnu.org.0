Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B270A38095F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:21:09 +0200 (CEST)
Received: from localhost ([::1]:45414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWoV-0005Ta-Ds
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWgv-0006F2-Sx
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:13:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWgs-0003dc-FN
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNIDjowjNS4dlA29L2BooQaDMS0GOpsUVVLoVPA+MOk=;
 b=DfKQLlhuqKT0RZ4Zjsv18gL5/dov7e0vJ6AOZNDYueuLN2guQI5vpVssOAY5LrtXPnlvb6
 UfIE3hvn4fzWVgGmKBHclWfWkMc5VdJ/EmRC9S6vKLHwjpCVyi3jf8wjzkkIsbR/MeqX5W
 y0CFM1ELGHWcrY1xqwDCuYbtjDtVkMw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-RFpP-1zmMEiBTJolS5scaw-1; Fri, 14 May 2021 08:13:12 -0400
X-MC-Unique: RFpP-1zmMEiBTJolS5scaw-1
Received: by mail-wm1-f72.google.com with SMTP id
 a184-20020a1c7fc10000b0290168b3365353so1347124wmd.5
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vNIDjowjNS4dlA29L2BooQaDMS0GOpsUVVLoVPA+MOk=;
 b=XPQxPet8lq/VvifCX2NlwO8hH8Hs7RwmtUunZVJTnMDj5FxyGsElz51avCL1X/OVTd
 xBavpLmOWGNzVUt3KZVONkHcayYSMhy83O4+vSFmPELfTnFJHurz3qiZ/Q5/6UcuLV6H
 Qa73wTlYWRm3kOeC8jf2HopbzQ7+kfLZWYIFO+6S5ZPfxwQPJop/iMN9YJYRcGIr1DJk
 5sNgmye8KpG1HotA8Td+NkZ3x8oX9mm9P2jA5/bvwJUAvxmcud3iBHfthlSwT/e2LYHV
 6YmLXvC7XbR4h+L5NFzkXjUOy5MJTkXx1bFLuVUw5LJDjroNsIH0atfc9x8M6iYD0L3F
 Er8g==
X-Gm-Message-State: AOAM530JDuq5paHiCLXvfSyP9Ggog2JxT1kAnA9Zmsz/G2fSeiw9KF+w
 8w1y67yDKu4girSH0E7HlelprKyCBO9StXDLb72UzrOfs9dq/dznD0nBhMVOtR+tB3rwbNO5hdK
 MEpFiZmEoe3brwJg=
X-Received: by 2002:adf:e684:: with SMTP id r4mr22004228wrm.378.1620994391172; 
 Fri, 14 May 2021 05:13:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3BG0S+nhO0sBQBycqGxWQ2eXuiZFEWUkZvaMmTh3TkUxcWwfvJAiteKEX2B/wFXFu2SWA4w==
X-Received: by 2002:adf:e684:: with SMTP id r4mr22004210wrm.378.1620994390985; 
 Fri, 14 May 2021 05:13:10 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83cd9.dip0.t-ipconnect.de.
 [217.232.60.217])
 by smtp.gmail.com with ESMTPSA id u16sm5057648wmj.27.2021.05.14.05.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 05:13:10 -0700 (PDT)
Subject: Re: [PATCH v2 01/12] gitlab: drop linux user build job for CentOS 7
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b17935c7-324f-da5c-b294-7164406f64fe@redhat.com>
Date: Fri, 14 May 2021 14:13:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514120415.1368922-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/2021 14.04, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target.
> 
> The build-user-centos7 job was to detect a failure specific to CentOS
> 7 and there are already other linux user jobs for other platforms.
> Thus we can drop this job rather than move it to CentOS 8.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.yml | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index dcb6317aac..726450a46d 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -441,15 +441,6 @@ build-user-plugins:
>       MAKE_CHECK_ARGS: check-tcg
>     timeout: 1h 30m
>   
> -build-user-centos7:
> -  <<: *native_build_job_definition
> -  needs:
> -    job: amd64-centos7-container
> -  variables:
> -    IMAGE: centos7
> -    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
> -    MAKE_CHECK_ARGS: check-tcg
> -
>   build-some-softmmu-plugins:
>     <<: *native_build_job_definition
>     needs:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


