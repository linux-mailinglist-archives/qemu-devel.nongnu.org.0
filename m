Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC433210B4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:07:36 +0100 (CET)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4Nb-0007TP-Nw
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4Le-0006Of-Pu
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:05:34 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4Ld-0008Oj-9o
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:05:34 -0500
Received: by mail-pf1-x430.google.com with SMTP id c11so5932136pfp.10
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RjUQl0wdE9tIDCPkyPZB5D5kCWMRdYyAVShF+dcZsWM=;
 b=qS2V+2C4jF5yyWLR1COVSJJKW0YldCHQwi14AHcE2dNhRx6XS9APPM2wRCA6n085/n
 uLBz1vKZs7Aa0I//96EnQmoWeiVC1/W0xIzWsy0uYAScaEHpcbTs7bclpYb0IrdiOsVB
 OnSV/fGxhJTfm3Jj5dglRUc5ZoBWJf3NOODQCXxaR1C6ECpOCeJG7oXzozKjXn/iOJZ5
 bBZxiPmEZY5kASm8mqQe3nXRdrGee7A6zk9CUXXDD7qPKN3jprYDXa9yCUI5aA73nfXx
 egHDYYFZeRntSNgQGkZ/hKWrCigM+X5wy1aR5M1MyCbGWXU0602v8Vy2eHhxsk8f2cBb
 dFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RjUQl0wdE9tIDCPkyPZB5D5kCWMRdYyAVShF+dcZsWM=;
 b=D0TPaGloniz4C0Tkx5kJnI25gtt4/gU2tBo2ai6cZYgiVcTTEy0dU6Mic/y5NDPJns
 yD/NC97EGDlQHZzdsvMI6lLaDNNDe0yzEvLix0pfjI4VnsFLOef6Wef5fhqIRoShpL0p
 dF9rJMY3iYy+xXmHT1JEKh3uvia43jIkohMQOf8gU+t9C8Oh+k0eyvNkzoVUdN2JNbBb
 L49GOsfvC2tySatoWAbHykbocPusL+uTsFkR+NTnOCnrExE45EUoaVb2Rlh52XiuzKI1
 4JGA8/7N5rhOdivyrghN+sE4Zza5+zC0O+zo1R/87/kn0soNvg3MBuObOAIRcUnhPPfy
 y6tQ==
X-Gm-Message-State: AOAM532kBvHwqyknI4esgnYETIdOTIJAUWu+YzykKb9ossUQFsS3cWRz
 eeTdiw4MWiTGB3v2wrkYflM6PQFoOl5TCQ==
X-Google-Smtp-Source: ABdhPJxcoxtpFAQkj3jnOKSAPiMjbaBPNQS5805jP17NbaK32g7ceXhqAKyVFLDN/fDk6O5ihZcCsQ==
X-Received: by 2002:aa7:9571:0:b029:1e6:5f49:24a0 with SMTP id
 x17-20020aa795710000b02901e65f4924a0mr20289542pfq.25.1613973932076; 
 Sun, 21 Feb 2021 22:05:32 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id u18sm16590711pfn.11.2021.02.21.22.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:05:31 -0800 (PST)
Subject: Re: [RFC v1 26/38] target/arm: move sve_exception_el to cpu
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-27-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69794c4d-4131-e713-96bf-a8ba0ee65bfc@linaro.org>
Date: Sun, 21 Feb 2021 22:05:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-27-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:24 AM, Claudio Fontana wrote:
> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
> 
> it is needed for KVM too, move away from tcg helpers.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu-softmmu.c        | 60 +++++++++++++++++++++++++++++++++
>  target/arm/cpu-user.c           |  5 +++
>  target/arm/tcg/softmmu/helper.c | 59 --------------------------------
>  target/arm/tcg/user/helper.c    |  5 ---
>  4 files changed, 65 insertions(+), 64 deletions(-)

This is related to rebuild_hflags, I assume.
Fix that and this isn't needed.


r~

