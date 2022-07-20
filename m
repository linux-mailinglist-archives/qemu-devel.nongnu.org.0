Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32BC57BA88
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:37:02 +0200 (CEST)
Received: from localhost ([::1]:49150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBl0-0007co-5b
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBeP-0007Mi-VB
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:30:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBeM-0005vc-QG
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:30:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658331009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qwlk8BPR9pWcqVU77HQGY58b/JqJT6Bsb1QHTNDKnuQ=;
 b=dnB8Ba0ohXcPO2SrC0TvcHCqzKY3rQkNNIVGpdKYQNlTDmPGIjHoAFgA2+yXvrYjnYqs5V
 Z+NnbvwOMwqiHIh3spXp/oGU9xJR06XSi4wg2sHYfixRMjPyzy2KEgMc2c/82RD99vJWcv
 03VQhsXqHQt8MGy2AjTYfi/Zb9Kq7GA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-mMgjlPB9MzWcjdYWszlPlg-1; Wed, 20 Jul 2022 11:30:05 -0400
X-MC-Unique: mMgjlPB9MzWcjdYWszlPlg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a18-20020a05600c225200b003a30355c0feso922978wmm.6
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qwlk8BPR9pWcqVU77HQGY58b/JqJT6Bsb1QHTNDKnuQ=;
 b=Xk4JOQgPPaGMq5c+4FT/faDLi+ySmCQrTQLcvR53vKIEw1ls5FpgA6w0FeZf84ymDj
 KrY0eUEcZJ7wHqSAQ/s/YCPNxZSucLUyMmhlP+FhbFBt3r9HI3woyThA0gOot30vPJzk
 qMz23ZckNsN/qJsP0tUXXL2c5E7fLmGUVOQpxhnvsk9c4JXTwF0++hfZs8booPv1zs0g
 8UJM55O3GoLH+T6P/TwH6Gtdh1hnXrE0sqK/z4L+6dTPK8ArtLqjgbO8rusdhdFCgoRW
 K2vHcTGCRts4TP0JpNNorzN8sCJPi6+uRu8wQMHE1Y81JKPIq8XadLhnKvpQcjmuu9lH
 tfYA==
X-Gm-Message-State: AJIora+bfMfSh/8BcwZzT5l/HiP1WxHyTp4O8e2nYQOirBsi2cNhW5lK
 fdvdfCg3AUbkhbOQfrXS5fBTyqOcsDunc23rUWzXdv1UKZ6jcEwJre6/8mXp7VqzrW56SPD3TQi
 7aRLT6ZUFbNHDqqs=
X-Received: by 2002:a5d:64cf:0:b0:21d:b70f:2711 with SMTP id
 f15-20020a5d64cf000000b0021db70f2711mr31153022wri.642.1658331004194; 
 Wed, 20 Jul 2022 08:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vP9LvdduyIDLpqrxlCcbfazs0Cv4954SLqd1ADgbVDbCBYkVahni4f1yHEr0BSDENggGaE4g==
X-Received: by 2002:a5d:64cf:0:b0:21d:b70f:2711 with SMTP id
 f15-20020a5d64cf000000b0021db70f2711mr31153000wri.642.1658331003864; 
 Wed, 20 Jul 2022 08:30:03 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 c15-20020a7bc84f000000b003a3188bef63sm3053606wml.11.2022.07.20.08.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 08:30:03 -0700 (PDT)
Message-ID: <bce89530-2a10-6529-d788-5f80a8ca3cbb@redhat.com>
Date: Wed, 20 Jul 2022 17:30:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/5] configure: Add missing POSIX-required space
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
 <20220720152631.450903-2-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220720152631.450903-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 20/07/2022 17.26, Peter Maydell wrote:
> In commit 7d7dbf9dc15be6e1 we added a line to the configure script
> which is not valid POSIX shell syntax, because it is missing a space
> after a '!' character. shellcheck diagnoses this:
> 
> if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
>      ^-- SC1035: You are missing a required space after the !.
> 
> and the OpenBSD shell will not correctly handle this without the space.
> 
> Fixes: 7d7dbf9dc15be6e1 ("configure: replace --enable/disable-git-update with --with-git-submodules")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> David Gilbert noted the OpenBSD issue on IRC -- I have not tested
> this fix there myself.
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 35e0b281985..dec6f030346 100755
> --- a/configure
> +++ b/configure
> @@ -2425,7 +2425,7 @@ else
>       cxx=
>   fi
>   
> -if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
> +if ! (GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
>       exit 1
>   fi
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


