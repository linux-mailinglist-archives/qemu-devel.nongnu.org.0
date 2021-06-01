Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B596397D1F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:44:17 +0200 (CEST)
Received: from localhost ([::1]:60126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loE3T-0006sg-Ud
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loE1J-00063q-Ny
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:42:01 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loE1G-00045t-HF
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:42:01 -0400
Received: by mail-pf1-x433.google.com with SMTP id f22so792560pfn.0
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 16:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SY+mEMPAo69kxYayzljb4OA+rGYzE5f0HkfsNKsf3Fk=;
 b=CrOFb5c9xtZOxHt+aEvtmJcY2n27wRROPXNQN8zH1hJO4mWNovKQuvavP9uEnVuZ7D
 BUvxQMhhe6WlDoHLKnAODMw6SGYBMXcKJIAkPuGSntUFF4CUnJjSyRuTosIL2ZSSyS0e
 5c+25Bjq/pq6fXtl1s3oZjQnRLYyWCqVgUpR0QAHbEkYVDekRO9uyFUhW1ybS6rO3U54
 rJ0ltvacPe0tuK1duuY67tSqKQoR8leJ6ZPjPF+T/Wn6DFXFZ5F8P0fERhuqyOx7YuzZ
 peDxPmWbGYvuqn8gIWCk6OSHJPBikGldHSwosN2dA7RYr74XVpSM9UwPADbsL4Rf+mFp
 lxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SY+mEMPAo69kxYayzljb4OA+rGYzE5f0HkfsNKsf3Fk=;
 b=Po/7a1MrsP6Sz11guGIbW47rHEjxfhnn9Y669uxv9vemkpeCDRL/gmkqq0bJsieiHo
 ynnvKTrF+2B3YLJs0ULC7yuP8VSPFBHUkj3o4sBIBiU1FSxFOI/xaO41/Oa5x7gY/ToQ
 haBrCQtwwVlu/LR7eRL2YfS4DAQ9fuiGX5w0xyeR1pdOJKAoZ4UAcDLabMBUqLO7Dvzk
 UMNFV4xxl5d2RfPifIAUTpQwcgud0neGu+HX7leofNfJHYRQUbjQLCkkfiMeGpYunymo
 wYP+wpI3S5t+SROKx5ZRqU9PWrgfom4stBdY8qojrtuFY3o3GYnagGQUp7/5Ko7OEqj1
 0vjQ==
X-Gm-Message-State: AOAM533fdJgR0bINVnREEMFo2s0JUiXWtxV7iuDOUDfrAX4U3I7nYhvZ
 16f7odBpwrvjZe4DuOIPnV03cg==
X-Google-Smtp-Source: ABdhPJwjZEGTpTHzmi/eshs6ETzb8WqU88ar3cMhwV8DK0FqHz9Ff005ZOJ4TiprqA6q4fSzsen2ag==
X-Received: by 2002:aa7:9216:0:b029:2e5:6989:4f1a with SMTP id
 22-20020aa792160000b02902e569894f1amr24204345pfo.50.1622590916659; 
 Tue, 01 Jun 2021 16:41:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j17sm14080574pff.77.2021.06.01.16.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 16:41:56 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] Hexagon (target/hexagon) fix bug in fLSBNEW*
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1622589584-22571-1-git-send-email-tsimpson@quicinc.com>
 <1622589584-22571-2-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41a0ee79-edf4-4047-7a09-843d574c9a7e@linaro.org>
Date: Tue, 1 Jun 2021 16:41:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622589584-22571-2-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 4:19 PM, Taylor Simpson wrote:
> Change fLSBNEW/fLSBNEW0/fLSBNEW1 from copy to "x & 1"
> Remove gen_logical_not function
> Clean up fLSBNEWNOT to use andi-1 followed by xori-1
> 
> Test cases added to tests/tcg/hexagon/misc.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/macros.h    | 27 ++++++++++-----------------
>   target/hexagon/op_helper.c |  5 -----
>   tests/tcg/hexagon/misc.c   | 39 ++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 48 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

