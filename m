Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331EB33B3CA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:23:40 +0100 (CET)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnC6-0004ll-A6
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLn7S-0001Vs-4y
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:18:50 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:36957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLn7Q-0007Rk-8m
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:18:49 -0400
Received: by mail-qk1-x72c.google.com with SMTP id s7so31530394qkg.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+4vxrRIHBWNKkZtdbo1LqyITVjVL3GGyPtaFPggtrmw=;
 b=Vxv7Q7C1oUMGweWTdZgyvPH+IMPSeXyUdMylfcc7JwsDIPkVgCPwkAqKCq/AbvpSwA
 81qiBXPq9TYIsEfm+RSFEXgCJ785ywj/9FAzThKxoXsGB6RUG1kncSyZUR7RxxO1Mp4A
 Ys1SPjKLI1umVyPaSuThHcylI03M8D8ndbnX0ufqvwVRcJF77JkgMo4vhbcumEyctIV7
 TYbcvRz3K/2MPCQGZazWXhtYSL9WM5viLSFK6PUG10y5ElfHDVeq6B/fASJ3KThn5i0w
 uc7A465I1DJM7EZXYRXNoDexrTt16+bPuTm1erUsdziwlOH1retEQwkXG+xwXbJbfU5w
 OJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+4vxrRIHBWNKkZtdbo1LqyITVjVL3GGyPtaFPggtrmw=;
 b=gckU96n052ZuFIhGaaXndogpxmSJpyNfBHjuhQ8Kr5AzVeBbOYtx7Z9/qH6seMWnpA
 efDr4XdIjsr0Z0MbzVQIqfgv4dWnNly3ZMe4NTd4bKdWYFHyu1WicAZrKMk5KlrklGTV
 /0nZCrduG+skyHfYpag2WsQgd93mWSlYI6M9rEIQdq5uH53OwcYeV5IoXyoXco/GeSQb
 /SsPF3HO4pGAS1JAIpt7ASfm4mp5TAj2ZCWPyBiSiu59bq1ISxL+YBVlQkP1Bx7Zgw8+
 2eJ4dXxXw3HVRNrApQVyfAkCT+FHMIF361Z6muWE/YJo7q9AyfH9zX4ODZejrhUzwER1
 Zzig==
X-Gm-Message-State: AOAM531ECBtxqBOaOzkMddgRvFjqPAyH/upcmaHKWJ2NypO54XZBeeC1
 mYimteiMvYJ6vO88kCs4ZSnlHw==
X-Google-Smtp-Source: ABdhPJzjPwpPkMZqfMQpD4/QUTAThyZbE2bBMmE9m/OuDkyCpdUoEne381NEtKFNt9tuOziDTB1tPg==
X-Received: by 2002:a37:8181:: with SMTP id
 c123mr25251705qkd.287.1615814326329; 
 Mon, 15 Mar 2021 06:18:46 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 17sm12234168qky.7.2021.03.15.06.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 06:18:45 -0700 (PDT)
Subject: Re: [PATCH] utils: Reduce chance of rounding inaccuracy in
 qemu_strtosz.
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210311200702.1302855-1-eblake@redhat.com>
 <f5648ec4-2a02-2c4e-a865-5c0fcda04436@linaro.org>
 <d9f498ab-00b8-291d-821b-66c82de90fa2@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8dd4a71a-7fe9-a6c3-290d-81adf5c53a4d@linaro.org>
Date: Mon, 15 Mar 2021 07:18:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d9f498ab-00b8-291d-821b-66c82de90fa2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 5:33 AM, Eric Blake wrote:
> On 3/13/21 3:48 PM, Richard Henderson wrote:
>> On 3/11/21 2:07 PM, Eric Blake wrote:
>>> +        /*
>>> +         * Add in a fudge-factor (2^53 when double is IEEE format) for
>>> +         * all scales less than P (2^50), so that things like
>>> +         * 12.345M with unit 1000 produce 12345000 instead of
>>> +         * 12344999.
>>> +         */
>>> +        if (mul > 1e49) {
>>
>> The comment says less than, the code says greater than.
> 
> Shoot. A demonstration that I did not have an environment that actually
> reproduced the bug

Any i686 vm will do.  I had a debian 10 vm hanging around in which I could 
reproduce it.


r~

