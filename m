Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B65567594
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 19:26:28 +0200 (CEST)
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8mJf-0000U4-4y
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 13:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8mFj-00050x-06
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:22:23 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8mFh-0000bV-8C
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:22:22 -0400
Received: by mail-pj1-x102e.google.com with SMTP id fz10so6728949pjb.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 10:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fvdhwApury59JZntvrx9PZ72Igwe+2fZT9hxfm7IGNk=;
 b=cpe2tfsZTYTd3VRjtICWzSIbz9yL3iKFbvJy19Gq/zPSjtpeb2tCGraZWeGHT2JHLS
 xegZ4eU4/jmqCrTp2a/vJshDwvX3RlRC/p8CPhEw0JleA4VELdxWcBuhE59OePzYFkfJ
 mxYpYakj9+G7E/FYEnNkNfDEYqkV3s0I2k1eLBp3fZXPqw3Scp3T+eWVkSF3M1A5t3cE
 XjpncfmvvVpz3As4rjfavn+2ngQXYg75XcG5EsC8B8Gb9o/t13Q5TuQOyoqmZb62RNOv
 4Uw+ny4Hyrqo7Npl1aSBl8yvloSlGD57s8NRoUjrZc8oFrZokSswDeWVBQ9LWkH/wTh8
 1uyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fvdhwApury59JZntvrx9PZ72Igwe+2fZT9hxfm7IGNk=;
 b=dHQMd5ZEZUCvgqQGj5F4T28yq4Y9xjzoF99iky1s5HXzvUcscPGI5GFcYmGugLYBJs
 KCKuDnx3TARKsdEg8C+XF7esPod7zGURjGoc5mCF1yO89/wiu27hlz8xpwp2pgXr+vXl
 UVzP/BNU6EefEVz4F0CsppVv1yX2R33YtaOtMqcoIBfjXA1nXPTreP+s0CxIu0iz/WJW
 ezhePRnT8ieDxgHbI+2HX172DCr8dP+7fTpZOhLf45S/GxNaBxIWL2oMVmlsIvIjKJz7
 Sb/L3ack08s5r4x1NlFEmi5YRE4CJTyTu/JJUQjC6j9Jz7l0j+wEdiwNJ6lRSeBn//ZK
 QTdA==
X-Gm-Message-State: AJIora88uNuH7E7BnGts2Q8naQZVP9SBXNmv0AYwzv2omxRoNLst7SY6
 yojqW+/R/7jG98Zs4mRvNVwDoA==
X-Google-Smtp-Source: AGRyM1sBYd2xHk9M7MNw9E1gjA1ft4ODPVWeNdnvApmKCmM3WdTA1fNZNxWdo3SkU78a63gzuGu5AA==
X-Received: by 2002:a17:902:aa47:b0:16b:8e4c:93d2 with SMTP id
 c7-20020a170902aa4700b0016b8e4c93d2mr41730969plr.27.1657041739704; 
 Tue, 05 Jul 2022 10:22:19 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a170903111000b0016bdd124d46sm5887784plh.288.2022.07.05.10.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 10:22:18 -0700 (PDT)
Message-ID: <e5fa4843-31e1-9ce2-fd13-ffa1b6ee6f1e@linaro.org>
Date: Tue, 5 Jul 2022 22:52:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] iotests: fix copy-before-write for macOS and FreeBSD
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 thuth@redhat.com, jsnow@redhat.com
References: <20220705153708.186418-1-vsementsov@yandex-team.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220705153708.186418-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/5/22 21:07, Vladimir Sementsov-Ogievskiy wrote:
> strerror() represents ETIMEDOUT a bit different in Linux and macOS /
> FreeBSD. Let's support the latter too.
> 
> Fixes: 9d05a87b77 ("iotests: copy-before-write: add cases for cbw-timeout option")
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
> 
> As John and Thomas noted, the new iotests fails for FreeBSD and maxOS.
> Here is a fix. Would be great if someone can test it.
> 
> I tried to push it by
> 
>    git push --force  -o ci.variable="QEMU_CI=1"
> 
> to my block branch, I get a blocked pipeline
>    https://gitlab.com/vsementsov/qemu/-/pipelines/580573238
> but it doesn't have neither freebsd nor macos jobs.. How to get them?

You'd have to have an attached cirrus token.
Better to just use 'make vm-build-freebsd'.

>       def test_timeout_break_guest(self):
>           log = self.do_cbw_timeout('break-guest-write')
> +        # macOS and FreeBSD tend to represent ETIMEDOUT as
> +        # "Operation timed out", when Linux prefer
> +        # "Connection timed out"
> +        log = log.replace('Operation timed out',
> +                          'Connection timed out')

Um, really?  Matching strerror text?  This is ultra-fragile.
Dare I say broken already.


r~


