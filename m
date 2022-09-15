Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137455B975C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 11:24:50 +0200 (CEST)
Received: from localhost ([::1]:38372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYl72-0000PY-MK
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 05:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkKb-0005CU-Uj
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:34:47 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:34438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkKa-0007L2-5D
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:34:45 -0400
Received: by mail-io1-xd29.google.com with SMTP id e205so10294770iof.1
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=8sm1dnljVcGfpUWzGXMI6cALE1bI/kZYqPvsPAWJFjE=;
 b=Nk/WxncXxaVdJq52LPpUbZ258KDASckn3M/WHNSUIbV+rDFkeLEqCFceYqYrUZrAQJ
 PiK3dtR8GJ+QH0v+HscR/thegXuS9lsipePtyBk7m/xIcOH7ekd/8Mudnwd0N0o2JQvY
 CwMcBjshBlQLy97bKYQ/Vgstv6vNT2y6j+tTGWXUvBx25ML1uqrpiomS2Cl2hJqTI+fJ
 2bmYpG5yArCqZChraAaAioRm+aekmorOdcDWdxhRHHO760DbrI3orHP3p2W1G125M1BW
 1tiotO5bGmXZIuw+IIShNwUclo/pjdOhqIdWU6aciEpmU4zZJqdA8g6HDot9aOOkiCVK
 IeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8sm1dnljVcGfpUWzGXMI6cALE1bI/kZYqPvsPAWJFjE=;
 b=EnDzAbhS9wKegyhC7lpOWOpedYDLXZ73SM6NpCH73TSd5uIPzBZlL7nkwZTJvWkZrx
 y7Kmm0GkqC85lVPGO5HjYuJDQ2NsVRjyx5e1k4KEabcbLOX3pniwQ1KUMfa0nzM/9rX2
 eb+H9BnhkX7LF/6frchkVZmnJVCE1dnhwSscBEQjZBzFNkACd8Il9G+M1zZ/lgx5aWnf
 kPKDp2pg62wQbmPg3XJVLZZxqc1LLD0g7iPtoNP/wADXqywuA5bUpXPqNx1wyiGAZ8Tg
 0sqdGGaCDq9cTcPVZu7d5wb6WBXohUG3wNRS0hlizOxj6HqxAb58SWQXuawS9eFpYEdH
 9BBg==
X-Gm-Message-State: ACgBeo2PVcfs3xvWoutmW+UPSQhTha5VuW1uwszk8uQ26nm6gcnyvak2
 1Qerq26gu8I79BYGc+cfRpGZrQ==
X-Google-Smtp-Source: AA6agR7u/l1qsqsBQYo1i1KVC0GwkY/LiHO9QBqIfa4N2t9MDa5QeTbtheOvTN5fuwzphv+XQ91YAg==
X-Received: by 2002:a05:6638:160e:b0:35a:5882:db1b with SMTP id
 x14-20020a056638160e00b0035a5882db1bmr5736798jas.299.1663230882793; 
 Thu, 15 Sep 2022 01:34:42 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a056638051800b0035a3be50accsm844200jar.9.2022.09.15.01.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:34:42 -0700 (PDT)
Message-ID: <8d64e197-7002-79fd-4e97-cc224099f26f@linaro.org>
Date: Thu, 15 Sep 2022 09:34:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 21/30] Deprecate 32 bit big-endian MIPS
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd29.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/14/22 16:59, Alex Bennée wrote:
> It's becoming harder to maintain a cross-compiler to test this host
> architecture as the old stable Debian 10 ("Buster") moved into LTS
> which supports fewer architectures. For now:
> 
>    - mark it's deprecation in the docs
>    - downgrade the containers to build TCG tests only
>    - drop the cross builds from our CI
> 
> Users with an appropriate toolchain and user-space can still take
> their chances building it.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Reviewed-by: Huacai Chen<chenhuacai@kernel.org>
> Message-Id:<20220826172128.353798-16-alex.bennee@linaro.org>
> 
> ---
> v2
>    - explicit little endian instead of LE
>    - s/A/As/
>    - restore mips to dockerfile
> ---
>   docs/about/build-platforms.rst                |  2 +-
>   docs/about/deprecated.rst                     | 13 +++++++
>   .gitlab-ci.d/container-cross.yml              |  1 -
>   .gitlab-ci.d/crossbuilds.yml                  | 14 -------
>   tests/docker/Makefile.include                 |  5 +--
>   .../dockerfiles/debian-mips-cross.docker      | 38 +++++--------------
>   6 files changed, 26 insertions(+), 47 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

