Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19BB3DBEDA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:15:52 +0200 (CEST)
Received: from localhost ([::1]:49990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Xz5-0002QH-I3
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Xxg-0001Qo-CR
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:14:24 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Xxd-0007uh-Q9
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:14:24 -0400
Received: by mail-pl1-x635.google.com with SMTP id d1so12260718pll.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HWTHvKwdKomUUSmcYj0zNGkv8JvI5L/356UjqLXSDdE=;
 b=dSE0YQauJVYzbyUp73ZCqIDbDuBuuJ2s7JuoNY/pxKCB5gkCWjXgAbcS148TGG4t6a
 9oLs3bqXlq3LiN5emzfnYU/EKIoJNpj0nqbcjf4PoGyjzbewKTeDW2Rr9gpZZbR4MG0G
 yeDUsBNR6L2Vj7NIDTb6T1gRSp9nVspfKo5dsVA1uK56BNC5Qd806p5Sl1iOAznNMMnB
 4qqn/iqhnFMa8WdmiKNt4ARwh1gn1R3rvRbf4q+sXS63E5FYLSlo64btOxnhpecWAEjK
 GLAU6eyAkuQe3Hi1PqzKk/xppWyHh9QCizdjj1uZyGfAPAN0y82f2wozwwDgZDbEg69i
 DOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HWTHvKwdKomUUSmcYj0zNGkv8JvI5L/356UjqLXSDdE=;
 b=huPv+S23jypuxxZ62wkIfUXmqz8JOJZk/1R1JCcBbHycqX89wkF95U3WEKxVOcyG4n
 wTrYxsklZUDqEs+PcBtDeSr/3iD8zWSithGHNFQ6+dqli5eNc05HVST57btt5NCyyR7e
 iFjyEOkNOUMgaWO3nVi24m/fwdHUbRPEgmN26NMqwD+GqXuqbjF4Y45Jdyjw2BVe/zFY
 7avld1QiUWGPw6Y4utEHXB3voPS+UdPbSzhcaAq84gqVrMbIAQO99qGb9L/vFYJKgKmq
 f52hnzOJt8m2Qn6JFIWlgXfFm4Lqqhb9C8B39/5Y6qJ0wp3y83ghua1iMQvApg3dUGHB
 FGLQ==
X-Gm-Message-State: AOAM530knZi8fgixrGFGZbxkvZEnZ221mbWo2EA6eCYmEnHRrVvyEy8G
 pUh4NSH+n0PUY0FPL6CEz3bKpXUpUbEONg==
X-Google-Smtp-Source: ABdhPJxYV0tF7fhclKgFfaR1CAZifc+q50cyBS5+QMUEmxfzJkuDZcgos0O+1TawbWcS31Gn2n99Gg==
X-Received: by 2002:a17:90a:7505:: with SMTP id
 q5mr4612627pjk.64.1627672460174; 
 Fri, 30 Jul 2021 12:14:20 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id ge21sm2994354pjb.55.2021.07.30.12.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:14:19 -0700 (PDT)
Subject: Re: [PATCH for-6.2 10/53] target/arm: Fix VPT advance when ECI is
 non-zero
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f593a136-7307-61c2-637c-55885ef0c71f@linaro.org>
Date: Fri, 30 Jul 2021 09:14:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 1:14 AM, Peter Maydell wrote:
> We were not paying attention to the ECI state when advancing the VPT
> state.  Architecturally, VPT state advance happens for every beat
> (see the pseudocode VPTAdvance()), so on every beat the 4 bits of
> VPR.P0 corresponding to the current beat are inverted if required,
> and at the end of beats 1 and 3 the VPR MASK fields are updated.
> This means that if the ECI state says we should not be executing all
> 4 beats then we need to skip some of the updating of the VPR that we
> currently do in mve_advance_vpt().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

