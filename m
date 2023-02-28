Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FCB6A6201
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:59:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7zh-0002M5-9b; Tue, 28 Feb 2023 16:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX7ze-0002Ld-Uz
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:58:43 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX7zd-0004ik-Eo
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:58:42 -0500
Received: by mail-pf1-x434.google.com with SMTP id c4so3826558pfl.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6GYo7wbZd52mTlrCXXJcNkvNv93XXgrXyozi/Dkxtis=;
 b=Uekv7MkUUjNI8wCVA59NUKTq/bBtSH6wxM4WBSItoy9SvoR+cZPkDkr7YNMh6UuQ8/
 S18Wd1sYPH229M3f+80+h1AC/LvaLjA+5a8is2bl/e5Ow6DotfLPftirslQvyJTGaX2E
 ON8OX1oXRxWE4axIZAPUNF2OdMbJgtfTEP3sgveUn5IdTC3Avei9dkocI1Qhh0SeSHxm
 5opBBj84JV0YSo7de6E41N1JG3GSeztCD5mAfiyvVizQC/vnNJc4BODGjMi1RxZB1C0B
 UMk/pO08PdscEHcFxXGBmRRofPz2ZdFLaGTn+fF7ljEl3MW5uJ3BEOU2elw4+of1lX2o
 KgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6GYo7wbZd52mTlrCXXJcNkvNv93XXgrXyozi/Dkxtis=;
 b=os3yrsKxXrVMIlJl1WQlh+LeD0JN9iOzuV7EEprSKsgU5Eg78Cj8t5Fx9Fa3PEeEC6
 vtnieM3HsRdq5EFYYtknt0LuKztIinoLR2vrHUuTevbUUfSFiPEyrJ4o2XWFDGcsUNNf
 2Rv8unlAHoBCYGEYzuS3JFMGIUi4dYWitcDygYmtHGhwr8h9h5WyCrDuopcm4vow1zxm
 pK7xRN+8mmJMwog/6KKfLrTaRuJ4f8tq15fCWN1wS/MI+8iosSP4sIbTTM7bhNYEyiAT
 uoJd72H9JSpIX7lTORElsxTKf+BnrXkG1MEylkXqWHX39DTmyO9Rd0+6vWTPFQ6W+gku
 iyWw==
X-Gm-Message-State: AO0yUKVzn7IJQ/KiuMFtm6XS0gr57jeBy2cfWbzaBi93JXoc1gFwCHka
 KsGsXEt0wmQgh66VGYxYWM8iAA==
X-Google-Smtp-Source: AK7set/Y6yYDNQwT8HAsRcvdGETELh80NczBGvQh3nQqPrsM83RWWdQ6HGUuQJ4VPhkWfOAQ+F2zbg==
X-Received: by 2002:a62:1901:0:b0:5a8:ab87:eda with SMTP id
 1-20020a621901000000b005a8ab870edamr3776113pfz.20.1677621519785; 
 Tue, 28 Feb 2023 13:58:39 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 i22-20020aa78b56000000b005813f365afcsm6515525pfd.189.2023.02.28.13.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 13:58:39 -0800 (PST)
Message-ID: <d9cda3a5-2c24-1202-d615-6f16477f120e@linaro.org>
Date: Tue, 28 Feb 2023 11:58:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 04/24] tests: make fp-test less chatty when running
 from test suite
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230228190653.1602033-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/28/23 09:06, Alex Bennée wrote:
> As we like to run tests under CI with V=1 flags the softfloat tests
> can add up to a fair amount of extra log lines. With an update to the
> testfloat library we can now call fp-test with the -q flag and reduce
> the output to a terse one line per function tested.
> 
>    make check-softfloat V=1 | wc -l
>    759
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Message-Id:<20230221094558.2864616-6-alex.bennee@linaro.org>
> ---
>   tests/fp/fp-test.c            | 19 ++++++++++++++-----
>   tests/fp/berkeley-testfloat-3 |  2 +-
>   tests/fp/meson.build          |  2 +-
>   3 files changed, 16 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

