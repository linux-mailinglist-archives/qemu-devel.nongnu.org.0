Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCAC675165
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 10:42:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pInu7-0005X1-DL; Fri, 20 Jan 2023 04:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIntd-0005Eq-Ka
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 04:41:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIntb-0002Gn-SL
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 04:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674207674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpjbdeOCUtHr6bFXc4pwY5IvpJJXHxUpRRQKzqoXawg=;
 b=QZUgpOz9dOG5CJCENXa44LNo6XqtuFX4kmBAIiQL1+JgyBMBMz0OaNjdv1L+O74Ku10zvu
 UoOmzuyiolAWHVL8JcN+eki5twJ2x+VG/IoDnZbevfx7K1aLQjuJvdyeHR9QNY6G8RxZ+1
 87apcqh4uTC0cQWAyN77o0wnH8VSRrs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-8Ul8MTxHOgKm9ImUeelSig-1; Fri, 20 Jan 2023 04:41:13 -0500
X-MC-Unique: 8Ul8MTxHOgKm9ImUeelSig-1
Received: by mail-qk1-f198.google.com with SMTP id
 v7-20020a05620a0f0700b006faffce43b2so3095422qkl.9
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 01:41:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SpjbdeOCUtHr6bFXc4pwY5IvpJJXHxUpRRQKzqoXawg=;
 b=KfkUNdyu7MZ4Ok3UfkqPlTBV48hh+0SGlQsU6LVNIv+KWHIECK+W+m8KwsIsBddfhx
 02wLeUyLRAHfN8IgclnDjFWz012PtQ2jn76bUt9x+awIsm7aamhDpvHJ/f/g2WoR/cRD
 ULv8jZ+V5Z0dFBfPNlm/GtIyA19dVSzmUWZsBZhGPjPzCcTX9e33FinfCY39tBbsvgVF
 mMYvHIBJoawly+lGp2AM1sBml5RKF1NDy9240C7zLEvWPXUzveon42vSeGhDwt+YLEUa
 JmvoREWXzTXJiie8qFdcjy8oQMRJVbhkbZZsy+o/9PiM3/Vi9RGYJm8TyL0CJpFJ0jHX
 aJmw==
X-Gm-Message-State: AFqh2kpT8fmQo0qbqLF34h7ZNzZPFDURBEa3V+APgzIIva01g1wqYOOL
 QTWG8ZvjJ8KfVuwtxcbbUnM1y0hGpIiHXqrto7xfYsFii9bpQlKTwqsrWINMYXDL8/uiACzK5vv
 zPn571asML7LYTQo=
X-Received: by 2002:ac8:4a16:0:b0:3b6:2f3a:54ce with SMTP id
 x22-20020ac84a16000000b003b62f3a54cemr15567884qtq.46.1674207672487; 
 Fri, 20 Jan 2023 01:41:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsSy9FACTFFwO2jv4wMs8VNhWFTywH6z5aG1xZFCz58wApQSGwaGaViStNM7JjwIbQijd3tWA==
X-Received: by 2002:ac8:4a16:0:b0:3b6:2f3a:54ce with SMTP id
 x22-20020ac84a16000000b003b62f3a54cemr15567875qtq.46.1674207672223; 
 Fri, 20 Jan 2023 01:41:12 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 hj4-20020a05622a620400b003995f6513b9sm19931715qtb.95.2023.01.20.01.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 01:41:11 -0800 (PST)
Message-ID: <2c1eb92b-91f8-34d5-c5f7-a56a41ec807b@redhat.com>
Date: Fri, 20 Jan 2023 10:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 0/5] tcg patch queue
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Cc: peter.maydell@linaro.org
References: <20230116223637.3512814-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230116223637.3512814-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 16/01/2023 23.36, Richard Henderson wrote:
> The following changes since commit fb7e7990342e59cf67dbd895c1a1e3fb1741df7a:
> 
>    tests/qtest/qom-test: Do not print tested properties by default (2023-01-16 15:00:57 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230116
> 
> for you to fetch changes up to 61710a7e23a63546da0071ea32adb96476fa5d07:
> 
>    accel/tcg: Split out cpu_exec_{setjmp,loop} (2023-01-16 10:14:12 -1000)
> 
> ----------------------------------------------------------------
> - Reorg cpu_tb_exec around setjmp.
> - Use __attribute__((target)) for buffer_is_zero.
> - Add perfmap and jitdump for perf support.
> 
> ----------------------------------------------------------------
> Ilya Leoshkevich (3):
>        linux-user: Clean up when exiting due to a signal
>        accel/tcg: Add debuginfo support
>        tcg: add perfmap and jitdump
> 
> Richard Henderson (2):
>        util/bufferiszero: Use __attribute__((target)) for avx2/avx512
>        accel/tcg: Split out cpu_exec_{setjmp,loop}

  Hi Richard, hi Ilya,

with the recent QEMU master branch (commit 701ed34), I'm now seeing failures 
in Travis:

  https://app.travis-ci.com/github/huth/qemu/jobs/593786529#L14411

Everything was still fine a couple of days ago (commit fb7e799):

  https://app.travis-ci.com/github/huth/qemu/builds/259755664

... so it seems this is likely related to this pull request. Could you 
please have a look?

  Thanks,
   Thomas


