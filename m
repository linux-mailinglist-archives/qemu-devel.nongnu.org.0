Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD72639C9CC
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 18:14:37 +0200 (CEST)
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpYwW-00005J-6M
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 12:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpYvc-00077X-7e
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:13:40 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpYvZ-0004Is-Pd
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:13:39 -0400
Received: by mail-pl1-x632.google.com with SMTP id q16so6210377pls.6
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 09:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h+szCBhzMiCn6CJHS2uBIvx4TkM83BKnUPeiPrnLMAw=;
 b=qm/zQ+vTdxK8QV3DOYgiDFHz97cPFA4v1fwK8uEtka/fPIoU3MWhGJymtiaPOq0T2f
 iETZMd2f45w65hsHQAXXukxXFx/nWWAp3WB0lnYqo+qRNWvLpQrrbHPi+x7dRcwSAxiE
 uRr/2xiBntJx7RiU69IVVZZQI2Zd0KPiamUbMHLDW1GH08VVH7OqIEwRZgByJ8VrR8wX
 2AdAQ3w0Gd4meUmGa6Wh94KCKqb2x71HvwdEMpEK5xm9L18SwIozyZobF+fztKJzFTyA
 SXzviayeqXDeBplO1gAKs5HBVwuuTcTPSFdWu8wOVCY9DBTiWOa946pJPnp6Tr6o3qkk
 0/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h+szCBhzMiCn6CJHS2uBIvx4TkM83BKnUPeiPrnLMAw=;
 b=EBrnbm/oWoHPJk/dv9FOhsCLeTT3q/TrqyuYyYxDFWHAoIv1rZJm8XhhvHEb+7/4F3
 dBl6EZYQfdZfAQRW7k4dOyIS+D61lDsG8OVWzTWz8Ehsr5zOlSzOSotyJebaLD5jB004
 s1aA1e6RQhnbEnuWCbQ6i9WkC3QOMckzuirERpncES6hUyjjT8NA3yqB76Kqq/OdoV4v
 QvJSErS7V9gjNg4rqYpAa77drL5YqfUIlvixTCUeaMb74ksWwo72VvYZfODK2+GFQoSJ
 y5X0EstOoS+I1b2P02AreSnqA4mV3qPlcQKoz+sGzHTK/7zSfERuUNmZypp8t4b/0AJp
 E9UA==
X-Gm-Message-State: AOAM533nAHM8Ap5u1a5deE5+zdRld0eb4ekYD+myLqre4Fru4xwwunkh
 ajGw1AO6WpIL2HyUbYpBmHDkEg==
X-Google-Smtp-Source: ABdhPJxcvssoLJv8srXzRFxKY7hjDXCygZ9k6Fv8QgnWPaHX2oOF/Z085wSpjMutdiY7Siij1fzILw==
X-Received: by 2002:a17:90a:5b0c:: with SMTP id
 o12mr23323380pji.108.1622909615869; 
 Sat, 05 Jun 2021 09:13:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q91sm7848589pja.50.2021.06.05.09.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 09:13:35 -0700 (PDT)
Subject: Re: [PATCH v16 61/99] target/arm: remove broad "else" statements when
 checking accels
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-62-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <563f5b9e-fd9c-e8b0-e395-24fb166670d3@linaro.org>
Date: Sat, 5 Jun 2021 09:13:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-62-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <jgrall@amazon.com>,
 Olaf Hering <OHering@suse.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> There might be more than just KVM and TCG in the future,
> so where appropriate, replace broad "else" statements
> with the appropriate if (accel_enabled()) check.
> 
> Also invert some checks for !kvm_enabled() or !tcg_enabled()
> where it seems appropriate to do so.
> 
> Note that to make qtest happy we need to perform gpio
> initialization in the qtest_enabled() case as well.
> 
> Hopefully we do not break any Xen stuff.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Julien Grall<jgrall@amazon.com>
> Cc: Stefano Stabellini<sstabellini@kernel.org>
> Cc: Olaf Hering<OHering@suse.com>
> Cc: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu.c     |  9 +++++----
>   target/arm/cpu64.c   |  9 +++++----
>   target/arm/machine.c | 18 ++++++------------
>   3 files changed, 16 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

