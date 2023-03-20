Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEBA6C1444
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:03:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peG5s-0004Gg-EX; Mon, 20 Mar 2023 10:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peG5h-00048u-Rf
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peG5g-0001W5-AQ
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679320943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GCc9FPyoxARudWplxcdVkZOAjmXn9RJqswdCWIwtIE=;
 b=d96LUIQOz70QuRUancSsoyBWAANMLUYQ77C68cKBaZV9xHaeS/rgYQvzVgEWQZ6tiHQ/fy
 6x/5BqfH/cbsg3NpJEVRvbb5ThSleQ+Ge+hzgFixfVSXw66crNaSbDUlgxSLRVS5Yv/1mv
 FjUmPTXY62TblqOy7E6YYX8U4EP1FBA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-cPnCq_qtPeqz_Zwb0mrA4A-1; Mon, 20 Mar 2023 10:02:20 -0400
X-MC-Unique: cPnCq_qtPeqz_Zwb0mrA4A-1
Received: by mail-wm1-f70.google.com with SMTP id
 iv10-20020a05600c548a00b003ee112e6df1so658161wmb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679320939;
 h=content-transfer-encoding:in-reply-to:cc:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1GCc9FPyoxARudWplxcdVkZOAjmXn9RJqswdCWIwtIE=;
 b=KuedDjzjuid5njKcNaNACUbpbdgEgSAjKcUZX8rP8ykYqFux3ho9yMysLrDKWfDte9
 kA5vi9qCqqjXS2N0a2+GQbSJRLsYnb31WSXOuKNyXfbr+EaJlFlvib7AYlYxhRdkc/V0
 +VaCsRe8JARqbSdn7cy5tqvJImz/FG0JpFAud4LOtZQVIeFXwPbhqkt42E962mulBJzq
 SbyVCKSZuoyp93BsaZRGeuACVi14A3loV19ua4vAYOyoYW6BmhBKiu3KFAUOsYIleIT/
 ARoqQy6wvmF4YcUgvJ5swDczLBcqimCimo7RLQ2+CjR4EPoF9q0KRctqQU4ybJGBGF12
 kmVA==
X-Gm-Message-State: AO0yUKXdo05Yrd6JL+a9vR5hAlBcKMyTV3fkwj1h4EDg+MbKuZz2Q8BB
 Izi3kZ1RLPPjoyLJ8gfNmVBRWINotNgJR6vleWpv4M4lQf8OaBV8xpRLpioWw+kJTWfZs1ijt8b
 EtaCMiq8bHllRlZ4=
X-Received: by 2002:a05:6000:14b:b0:2cb:9d29:7242 with SMTP id
 r11-20020a056000014b00b002cb9d297242mr13166820wrx.27.1679320938926; 
 Mon, 20 Mar 2023 07:02:18 -0700 (PDT)
X-Google-Smtp-Source: AK7set9rKSF+7/l3TWSv7dw5WE55twLJSFDFKMobjR0pnJJN8GJtXZojopowIbMnRmFVOiSan9KoOA==
X-Received: by 2002:a05:6000:14b:b0:2cb:9d29:7242 with SMTP id
 r11-20020a056000014b00b002cb9d297242mr13166797wrx.27.1679320938548; 
 Mon, 20 Mar 2023 07:02:18 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-234.web.vodafone.de.
 [109.43.179.234]) by smtp.gmail.com with ESMTPSA id
 b7-20020a5d4b87000000b002cfe0ab1246sm9008052wrt.20.2023.03.20.07.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:02:17 -0700 (PDT)
Message-ID: <539ae95e-7e81-586c-b1d3-e8e41145cc42@redhat.com>
Date: Mon, 20 Mar 2023 15:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 00/24] s390x and misc patches for 8.0-rc1
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20230320130330.406378-1-thuth@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 20/03/2023 14.03, Thomas Huth wrote:
>   Hi Peter!
> 
> The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2f5:
> 
>    Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-20
> 
> for you to fetch changes up to 48805df9c22a0700fba4b3b548fafaa21726ca68:
> 
>    replace TABs with spaces (2023-03-20 12:43:50 +0100)

  Hi Peter,

FYI, since you likely did not put this into your CI branch yet, I did a 
small fix on top: I replaced the patch that fixes osdep.h with the one by 
Philippe, since it was slightly better (removing the "extern" keyword 
instead of swapping it).

New commit ID for the tag is now: c29e73f7e65299ed9261abce3950710d89c64724

I hope that's ok, if not, please let me know.

  Thomas


