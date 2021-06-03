Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECEC39A930
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:28:53 +0200 (CEST)
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lor9I-0004Os-Fr
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lor8K-0003c1-Ci
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:27:52 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lor8I-0006de-S3
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:27:52 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 lx17-20020a17090b4b11b029015f3b32b8dbso5911833pjb.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3f9760pTVsJ4Q2NfkNsK/NcAhciUAei9YB4PW6oUUH0=;
 b=kNbVjQmciauPrzmMjy9yyrDlwty4vLvebcsHWD67NdI5swQH6VcDRXENcQG0aIeNsE
 qiJknRTfEcN9jz5e8cNzFq9aXCR8fCI8mltXEgdfva+WBM2XkQNt7lKiAi6d+LeXTo4G
 9ui5dVUIrZPUQjJzdpgtP1FYhUViG5vrW1zpS2W5ummI8BcGb+YZphiU3UY8HNnaeeAy
 Gw5VNrzU0EdtMhJRmXMfD+FJ79DBaroeeZuOQfhckuRl2PXUlEG+KbRuHc9mFG1yvmLA
 qXdJnc7QW2Nqfft169zjD0R2cB+oxrskEeaFnpnNdg3S9o4PUo0k35REYxNYXXWjZ0Jo
 SNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3f9760pTVsJ4Q2NfkNsK/NcAhciUAei9YB4PW6oUUH0=;
 b=IlSNo2Twt7uTzNdygEwMGQ6ncGfIfvXNRqDdW3kM5EYMjutjhMMb7ueBSy1i0pbu0P
 /PvSepQZGugdfM27J4kv+r3yQq//dIOVKqNoCm7Vsy7HEUJ5anu1A1s0hQaAuYlf9tfP
 nfy7lXaChhGPOsc45tTSqgXi+QVLUAHlvcealjAXfpwiXKE7i4hbRIwLwgGvhOZ91+XH
 NIQctBzDChU5I0HXUGGGQbM+S/mEoEPLZDNJokEPu4YaDdILx2R7K2GCaXiLiLK83iL6
 5xwspDMEvKgj3+iztndin40fNs/1Jlewt3U9u2eEFihm8o3Uq5UfmGGF86NYju9i8tsh
 3/Rw==
X-Gm-Message-State: AOAM530VPA1UFYlO0ZJ6DHe3BHfvVzHDIb8/LBRK1nz414cdw1QBhlm3
 I9IIS+W179Q02H6gfoDTTUV+MA==
X-Google-Smtp-Source: ABdhPJwz79w5S9VB38gKwsygFWjqymY2CVpqN1t08VYqR06zdK+CBqdMpOWo2z1I+hL3lJU3Ji/emQ==
X-Received: by 2002:a17:902:bd87:b029:ee:e0ae:cf0a with SMTP id
 q7-20020a170902bd87b02900eee0aecf0amr138476pls.1.1622741269524; 
 Thu, 03 Jun 2021 10:27:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 125sm2744221pfg.52.2021.06.03.10.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:27:49 -0700 (PDT)
Subject: Re: [PATCH v2 10/26] s390x/tcg: Simplify wfc64() handling
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-11-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <900a5789-c829-4a08-bb61-c4bf6b0dbe71@linaro.org>
Date: Thu, 3 Jun 2021 10:27:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-11-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> ... and prepare for 32/128 bit support.
> 
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/vec_fpu_helper.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

