Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118E14795C8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:51:18 +0100 (CET)
Received: from localhost ([::1]:37078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myKCD-00046n-6b
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:51:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myKAT-0003QI-I8
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 15:49:29 -0500
Received: from [2607:f8b0:4864:20::629] (port=42899
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myKAR-0007VY-SN
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 15:49:29 -0500
Received: by mail-pl1-x629.google.com with SMTP id u17so2854321plg.9
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 12:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FY1xQzG/V65qXH3lfSVHLfHMhM/GO3DefEyqPjDMCW8=;
 b=lH7O9mgVePWJDo45sm2R1/8XaylASv5u2/ccoIVxUK+iBvGSSnoh9J/n2GYBDfyMzG
 xtutPZeRrDfqiwFUHu1aSZV2SCN1xG8lyzIEy5DYPt+2HKmMvLWVlDMmxXmQvuY93h1a
 DBbwuZlRZ0K6DYI+4didO0Rw3OG8eEcjPMK5gZIPc8eESxV6VoywL432qMP7tLj4BxGo
 5DJrGdwqD7O8BDNiRk40+T23/eTJG0KgzCes/iA70UHnHTvpwTBvlnk6NkS1RVAhFhxD
 HiFUkpJJ5sP0rMNjrswz7iSBbSBNN9/V9m2mF5AoM+Q+2bXOWOpppw7RQLjwech7Ra2f
 VuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FY1xQzG/V65qXH3lfSVHLfHMhM/GO3DefEyqPjDMCW8=;
 b=cnTiQnYVPZBPX7cRuHNZADh/yp1E83qqxpo2e4HMFWNSe/Heqobo2YhW7+A+OZsSd+
 6GslvukW3T5jLgb+sOq+I/+U+bDy8oRZH9NJ7dAaplq66aUk28eLI+NrIxSNk8A2faPI
 U9RaUdR5sH4WHq86VRUk2++VjiYI2OphKaoOr53EuDBl1ZJV+xHl5hbYOyilUAnyTC1K
 zVH/o/1eWS5A0sBQADcsOBXPAoEU8YkGmN3/Dfl0JHem5RUuP0wu49SBES7PI2BTBN46
 UmU5GyrhkQSmSd3iQQ0axbogbX88N9idfruzQ/PZs+QrWFim6XsmZtXH35CRZVfSZJwi
 8yvw==
X-Gm-Message-State: AOAM530v86DHoN36mgJpGHdk/I4V8bz/RbQ7KzBBN6bjWqh3oVOB6lFJ
 IoKb1aoVQBy5OcQI3UmTGIwnVnuY3q3ctg==
X-Google-Smtp-Source: ABdhPJzsO4cGGRz18TmTI+nn+1p8EcfvHrn1Q8SgX7H4vN3tmB92CLAnRTwR/lbyuqG7TCSSELt8ig==
X-Received: by 2002:a17:90b:4f86:: with SMTP id
 qe6mr5824140pjb.198.1639774166315; 
 Fri, 17 Dec 2021 12:49:26 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv12sm10236078pjb.49.2021.12.17.12.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 12:49:25 -0800 (PST)
Subject: Re: [PATCH 04/10] configure: do not set bsd_user/linux_user early
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bbb9e84a-da68-2642-603f-29748ab6d65c@linaro.org>
Date: Fri, 17 Dec 2021 12:49:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216085139.99682-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/16/21 12:51 AM, Paolo Bonzini wrote:
> @@ -541,7 +541,6 @@ gnu/kfreebsd)
>   ;;
>   freebsd)
>     bsd="yes"
> -  bsd_user="yes"
>     make="${MAKE-gmake}"
>     # needed for kinfo_getvmmap(3) in libutil.h
>   ;;
> @@ -586,7 +585,6 @@ haiku)
>   ;;
>   linux)
>     linux="yes"
> -  linux_user="yes"
>     vhost_user=${default_feature:-yes}
>   ;;
>   esac
...
> +if [ "$linux_user" != no ]; then
> +    if [ "$targetos" = linux ] && [ -d $source_path/linux-user/host/$cpu ]; then
> +        linux_user=yes
> +    elif [ "$linux_user" = yes ]; then
> +        error_exit "linux-user not supported on this architecture"
> +    fi
> +fi
> +if [ "$bsd_user" != no ]; then
> +    if [ -d $source_path/bsd-user/$targetos ]; then
> +        bsd_user=yes
> +    elif [ "$bsd_user" = yes ]; then
> +        error_exit "bsd-user not supported on this host OS"
> +    fi
> +fi

Missing the check for $targetos = freebsd.
This looks like it would enable bsd_user on linux, etc.


r~

