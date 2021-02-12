Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B8D31A61C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:37:56 +0100 (CET)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAfCN-0000uX-GO
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAfAX-0008BG-2e
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:36:01 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAfAV-000454-Lg
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:36:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v14so741202wro.7
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 12:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UfO1iaw8uKvW0to636FiKAeuT6HMlhTznYUx2yYrBxM=;
 b=MWwj7AZ3IG1bkYPKv28I8q4ry+OZ1i9WwsC2QASQmdEaAkypJgzIR8BfY5TWAPos8C
 OAzvSOIGF8HIJJMoIQ28sdH/JZS8c+7Q/RREkD3gTMHAqQID3TCKf4EVaQiqb0e/M/R4
 76667aJKmyoieoqiYJgh9h4Jf5HaXh1khqgNfIQeWSdmHG0OzJjMtlb3edPXP9je9ojp
 Ehx4CUzCq9LCHOKB9CAZiQ26k6wNM2Ls70/+zinvPq2LH3FrA+k28nevnXOaT3lm0VmV
 RR+xblz75mTgkEpOA+F8H4Agu3nPk8I7yClslXOq/Vc0kNuvJt5E22Ni4nwMgACFX2ky
 Ehww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UfO1iaw8uKvW0to636FiKAeuT6HMlhTznYUx2yYrBxM=;
 b=tKXrqIYKyw5TMtHuFCsieJBzZYD7eZvHp+2oa7T1il05xjp7juOSQdkcrS+dmyFZKy
 xrfr+w4bYapyv+p+rUOSqeLzCnWLoTcq6mEDqaic95h3aVid3FT5x7Y+m4qSs0disrlk
 F4P2TpIuVnaEz0XArGpKdUoHqo9A+TqSb7pgDZiP/skbTNI7xdErYRK0J74g8sTIJCar
 TWLroihqpP1oo5s0+uL7InEejquAsuuTbqOMcARSz/yXAZrJHWxLVaeQ3P9FoAGl/IuA
 epQxhAejv/xjYPDy0Ktl3EWEKWZvorSMTIbFEGmVW0KiQHYkG91BIxcabBkfjz6kaOsM
 nr8Q==
X-Gm-Message-State: AOAM530FvqE7gJX0kO1sIXSAEdIPi9plcNT3m39875VwXMOJEM2BYPo4
 nyfyw+MJPBi5rrNVmBA6uF7nPbWaF7U=
X-Google-Smtp-Source: ABdhPJzBbgFPqXYfltokRdKZsneD5EXuDJ/I3sUsvqoug5RsgzC9NNjlwkfJq7FWr5u9Lb74kYa79w==
X-Received: by 2002:a5d:518a:: with SMTP id k10mr5535740wrv.214.1613162158130; 
 Fri, 12 Feb 2021 12:35:58 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z63sm16181494wme.8.2021.02.12.12.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 12:35:57 -0800 (PST)
Subject: Re: [PATCH v7 17/31] linux-user: Move lock_user et al out of line
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
 <20210212184902.1251044-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2744adf4-48cb-bdcd-2a97-813ab4f789d1@amsat.org>
Date: Fri, 12 Feb 2021 21:35:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212184902.1251044-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 7:48 PM, Richard Henderson wrote:
> These functions are not small, except for unlock_user
> without debugging enabled.  Move them out of line, and
> add missing braces on the way.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/qemu.h    | 45 ++++++-------------------------------------
>  linux-user/uaccess.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+), 39 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

