Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872AA39BF07
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:44:37 +0200 (CEST)
Received: from localhost ([::1]:38602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDs4-0000PA-Ca
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lpDVk-0005FT-Tl
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:21:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lpDVh-0005cM-L8
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622827287;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rCNett3RagXRidK3irFDBoXSbtW5dUMTYeVudJBETQE=;
 b=CtjT57NHh9WDS7T91BCAWCn5acaos3SM4OZVSSDtr/VTAzsSI5me3477V8kYD4uG/1GunT
 tM0qOkfFninab6axUcQvgUATTDgABVMVcVCzPrGTbaqvSepw0HubHWvvte70T20W+KOy2D
 jKrYskJQ+4SqJC599oIkh0d0A1NWQB4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-CQyDN2miOHmJmBL24FdutQ-1; Fri, 04 Jun 2021 13:21:25 -0400
X-MC-Unique: CQyDN2miOHmJmBL24FdutQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 b24-20020a0cb3d80000b02901e78b82d74aso7141231qvf.20
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 10:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=rCNett3RagXRidK3irFDBoXSbtW5dUMTYeVudJBETQE=;
 b=DgZs6pUJl7qVL/xffyRppfDUVOOGlOTyNhpKSuJMOYUf3xWW4e2EY1FRRqpOh/BTuz
 oy19vZNRkluhF2twtGXWIW6ljdTZdh81MEocSxEc+mwU9rppb+wZ7u+6TApGOBubzf27
 erGYFXV2HFLktYYwPDjFxhMZ2JyH0niK6C+4DlqhNJjAig9ynv42lbHCLoSamr0OpjdY
 +jftdtUryPzbDk34b5343tDSEqY2RZJBAKdf982uwTgdLfDWtMPcVXZEUhJW1NiSe+Wr
 KI6ih7WWWNdqHxViJm+7Osr4mHKnQmoJAI0jVf5GpvWwR7DVcVoSmAKePiIsxMlllJpn
 X4eg==
X-Gm-Message-State: AOAM5309RcE9OcMXNQYOBa/XzkoNMGmwI+o4wg6yFC5POy2rLSRI3ypy
 tZ8B1uVRkgsrtvDD+hsY04pl2qm7qwwiw57x10i6CutGjAJdNE9VT128Xt/7gnPVfzYN9Jhbbgz
 RxDv473rP1Owtf60=
X-Received: by 2002:a05:620a:15a2:: with SMTP id
 f2mr5421227qkk.310.1622827284688; 
 Fri, 04 Jun 2021 10:21:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFW55NoM5mA3jQGX7OSfAk2SwT/vQGuLBKMXDrwcU6DQGN6hJb1xG59rh2pggp3n2Mf0/OpA==
X-Received: by 2002:a05:620a:15a2:: with SMTP id
 f2mr5421207qkk.310.1622827284499; 
 Fri, 04 Jun 2021 10:21:24 -0700 (PDT)
Received: from wainer-laptop.localdomain ([170.78.230.77])
 by smtp.gmail.com with ESMTPSA id g63sm4307543qkd.92.2021.06.04.10.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 10:21:24 -0700 (PDT)
Subject: Re: [RFC PATCH] gitlab: work harder to avoid false positives in
 checkpatch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210602153247.27651-1-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <277eb902-e344-6104-920c-6b1da9b2a6cc@redhat.com>
Date: Fri, 4 Jun 2021 14:18:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602153247.27651-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Reply-To: wainersm@redhat.com
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/2/21 12:32 PM, Alex Bennée wrote:
> This copies the behaviour of patchew's configuration to make the diff
> algorithm generate a minimal diff.

I was intrigued on where you had found that configuration. Then I found 
it myself here:

https://patchew.org/logs/20210604155532.1499282-1-jsnow@redhat.com/testing.checkpatch/?type=message

Assuming patchew has been doing the right thing, I think it is a good 
idea to configure Git alike on CI.

Thus:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/static_checks.yml | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
> index 91247a6f67..ec09da799d 100644
> --- a/.gitlab-ci.d/static_checks.yml
> +++ b/.gitlab-ci.d/static_checks.yml
> @@ -3,7 +3,11 @@ check-patch:
>     image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
>     needs:
>       job: amd64-centos8-container
> -  script: .gitlab-ci.d/check-patch.py
> +  script:
> +    - git config --local diff.renamelimit 0
> +    - git config --local diff.renames True
> +    - git config --local diff.algorithm histogram
> +    - .gitlab-ci.d/check-patch.py
>     variables:
>       GIT_DEPTH: 1000
>     rules:


