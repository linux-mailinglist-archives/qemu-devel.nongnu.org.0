Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7607F35E2E9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 17:31:19 +0200 (CEST)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWL0Y-0001Y8-3K
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 11:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWKyg-00011a-0I
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:29:22 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:35548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWKyb-0000x3-PM
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:29:21 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so10895253pjb.0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 08:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5GXGdgwwlopyCuqkeNWtEb/GQlWcQcutjkSBSRXRyew=;
 b=NMEdAQJzE7E3C3g2jVOvYeYdvBYFsJIm78mf7uxA8+fOuTxDg0JQ6sAB1dLs4kkBfH
 XL47G8Iqj0fdwkEC8XP6gHzxxfA4hVspFPR9IsWNYgjdi2y7bGPDB00/YD4zvgL3Tj08
 e1a/g+PKg+fFlskNtdMpCoWathBu/RHBTQoDS9kMsUgHM2Y0/HYgcoigfzKvuDujTwGn
 rUq07j7gAf5SNgJdxzChQ2FOs1+eH6pe5TULoylmSJLxtBbB2WPbDDCkkO40bmrvkF8E
 1S1H8FqaUygym8FEKx4bIYjEeQMEl4lACBpfAUa2Li7VLzbGD3UWuty6il/XUAr3WpIg
 p6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5GXGdgwwlopyCuqkeNWtEb/GQlWcQcutjkSBSRXRyew=;
 b=BMIqFCVdKbBbf6ZJ+dCMClCiaQFuEGXj32PQ6cjSst1fIAxEvi7TqjdF9BrgS0hkRR
 1SiePyQQf/SUuHohc0uR3Nb0l3BWzgSR8rtROeiZQnUqrt0yvn+sLRxWisbEUPKjINsT
 sFc+5B4p3SNfGPB4HypOWAU694+3sMi2OrbTJ6NUNntX0WCfwiOn5koTmtr5sv7u6Y7V
 L6cwvKlM8CsqgX9auiYn0840PN91WMUCBeLp8jFVE/hHip4/oUIdIDR2ttgzcWpDAkLp
 WF6TC8oRhwTwmdYU7VsGfmrZdrgyIdS3CKI3g289GYTCJCy50eVXED6crFA8p2ZbBF7e
 Cgvg==
X-Gm-Message-State: AOAM533QSG7hG2oMEAQZNb/5n7XJNuYWFYX4uGkqWEZ+08ZEnxA3+A58
 9ycQ1lgJ55+/8WY4Gd0R/rMNlw==
X-Google-Smtp-Source: ABdhPJwdqQZgvGaNxzQekTcSf5bA+PWIF5ulVU5KEEq0w/qYBZpPhjROkrEraNRNwerSDM63TqJRSA==
X-Received: by 2002:a17:90a:a22:: with SMTP id
 o31mr592913pjo.127.1618327756080; 
 Tue, 13 Apr 2021 08:29:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id c11sm14463708pgk.83.2021.04.13.08.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 08:29:15 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: Fix translation exception on invalid
 instruction
To: Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210413132349.20520-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c89ee64c-6aaa-c0e3-5044-f1c507151497@linaro.org>
Date: Tue, 13 Apr 2021 08:29:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413132349.20520-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 6:23 AM, Ilya Leoshkevich wrote:
> * When tb_gen_code() is called on that page, tb->size ends up being 0

This is the bug, in target/s390x.  Perhaps we need to add an assert that size 
!= 0 after translation...


> Fix by special-casing tb->size == 0: since there is no useful code, we
> don't need to link pages in this case.

Yes we do, because we need to link to the page to notice when changes to that 
page occur.

While this won't happen in the specific case of uretprobe, it affects every 
other instance of a TB which begins with an illegal instruction.


r~

