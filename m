Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBDE533DBD
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 15:21:52 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntqxR-0007SW-Kt
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 09:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntqsR-0006Tg-NC
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:16:42 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntqsN-0007Pq-Eb
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:16:38 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g20so1418120edj.10
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xZ51hT9SY9fy0I0sQL2fp0MfYTGQvfB6/EWkp3nPH7s=;
 b=mpCTIblkTunPKTn+xrvO/40EhSKTW5I+cuC/Rjeg6DJ/QwNYUn3Y1y1sUN7d7tXerp
 cbrJdwxA79TJT4i2BaMde63G7of2am6naVzBEum8oGFXO+4sI91ttJFAx7w4FHXfoVp3
 MKK1rO33qpDuiXXzw6tqnJNSpLwpZvT2rciKuMLK/EVMqhVjGh5rdiW+02w9Fs9St34m
 QuVU451IqjVwzKR42eQEb1tlme2gg4XOnU20EbWRVuBQIsmftaIzIEIcVEwsVZ7+wCn6
 +BTUYLELCtf22kM2fE2XBEk7mlVTR5gtLIUEJiGqRcgZDLkv+zQOCdGNwR85oKtOxZnf
 xf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xZ51hT9SY9fy0I0sQL2fp0MfYTGQvfB6/EWkp3nPH7s=;
 b=PJPRpT548pab9GsZHSA8Xz316GEBt96Txn0qayGniUlDGCKCSmTCylBSkTFPaQTsvj
 ZBsCiUTbodjEFjPGRqjdiTesHtUl8wYiP42ek4nlsyLjwzZCfEIgW5+Xcdzr7TvLCpF7
 +LhqAa719en7B69rgJlNJu43warg4G0lNdzvTU1hXzjqwv9x2sg2fJvFMXyMLZ9Lvz7b
 30TiT6QYeVqy0mzmpGcI6qbhMRZ9gFprvg43cp3eaAywY+cL/mFM9TcQwMyiJcQKziet
 Xh2bINvt4tfXyyBOazk40biAp/KrT6khz362y8tctLCvpKo9OVqKc7bGhdRb80HprkEM
 CgIA==
X-Gm-Message-State: AOAM532UCfgQTWCSO1W9oxaybMok+q+grnK2rmFkaraGSZFevsq1EpHK
 TU4M2z1/hhf16LZpqfa/Xvg=
X-Google-Smtp-Source: ABdhPJxNS6/sVZY+USvCfHaNl2axjFp76ZmsajILJeUnJiD0N9Zy6xB+EjcIBhL9kB3/fxRPuowy+Q==
X-Received: by 2002:a05:6402:270a:b0:42b:3721:4e76 with SMTP id
 y10-20020a056402270a00b0042b37214e76mr24702843edd.51.1653484588298; 
 Wed, 25 May 2022 06:16:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 14-20020a17090602ce00b006fe89cafc42sm8126036ejk.172.2022.05.25.06.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 06:16:27 -0700 (PDT)
Message-ID: <94613517-ac1a-2107-d001-5ee489760cfc@redhat.com>
Date: Wed, 25 May 2022 15:16:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/16] Cross compilation of embedded firmware
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
References: <20220517092616.1272238-1-pbonzini@redhat.com>
 <87zgj753kc.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87zgj753kc.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/24/22 17:53, Alex Bennée wrote:
> 
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> This is the next part of the firmware cross compilation story.  It only
>> looks at firmware that's strictly part of QEMU (optionrom, s390-ccw,
>> vof), and does not do docker cross compilers yet; but it takes the
>> infrastructure from tests/tcg/configure.sh and moves it in the main
>> configure script so that others can use it.
>>
>> I actually expect the compiler tests to move back to tests/tcg, running
>> at Make time after the docker images are built.  For now, the file is
>> moved as a whole, including both compiler detection and the tests.
> 
> Isn't that just creating a bunch of unnecessary churn? The
> tests/tcg/configure.sh sciprt already has a bunch of special casing in
> it to detect various compiler features for the purposes of tests. It
> would be nice if we could keep it's history of warts intact.

Honestly, I don't know what things will look like one year from now.  I 
don't have 100% of the vision of how things will look, just enough to 
make informed guesses at each step.  So far I think it's gone pretty 
well, at the expense of some churn indeed.

What I know If the compiler tests do move back to tests/tcg, they 
probably won't look anything like the code that is there now.

In fact, they might even be done in Makefiles instead of configure, 
similar to the "cc-option" macro in pc-bios/optionrom/Makefile.  My plan 
was to experiment with that in pc-bios/optionrom, in the context of 
supporting docker-based cross-compilers, and then move whatever solution 
I come up with to tests/tcg.

If you prefer that I first try moving them to Makefiles to reduce future 
churn in the main configure script, I can do that, but probably not 
until ~August.

Paolo

