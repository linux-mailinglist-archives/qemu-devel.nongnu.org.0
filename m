Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D82393504
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:40:06 +0200 (CEST)
Received: from localhost ([::1]:35542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmJzD-0000nu-Es
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmJxL-000053-1C
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:38:03 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmJxI-00083X-P7
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:38:02 -0400
Received: by mail-pl1-x633.google.com with SMTP id v12so304043plo.10
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 10:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gZFG1G67Pu7lEKlqtDunPW3ttYuoxyhYul8oFlCoiqw=;
 b=Fw7GIZ5g//miNk2CYGDPVCxeXTNJRQ6HBfHDF5e23bfFJwde/tUMvl8IBmLGiZWsZf
 g8hLv3es0BJL7ygGhk3cCsPta+SU9vus95QbZIUJA+/qmXZWnMk+4AjEJF6VSWrc4I8e
 2Q3JGyjWoFmOczzarMu+ORsR5lPc3FBMjzEZ8huy3JX9qJIm79LYZ3N5weUSuN+r44k1
 HXwJ7wg+T77RhAGrfZCVU0xxFZrHlqEWpR0FffrfyQ3qcskwODerdDgQLgfOWB4NSZfs
 1ufU5BW6U8SXXhSddPQbnUnavMY5aktwrDakUT2BCO8YGflf8PoyZ184AbInlGuqm/NZ
 xjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gZFG1G67Pu7lEKlqtDunPW3ttYuoxyhYul8oFlCoiqw=;
 b=hC/tw727pQtUvpqg0GyQfL6nLylhkmV2f7mB+SHoLa+CDxPZvfEjOUfdODLIkOM+VN
 skuhEuAOIYBXPkkD6D02Lh3b7tW46gk7WSbOUHlaW0z4hHoZ5+rNTyc9YVUCmbCAiO+l
 As8agOKNu1USVFLKIaucWvp8uTh6rYhIsNaH4hFGo2rE6MjF1oEBpfU6+Z6LFdALhyxG
 HvGuqDkjPDr3zmtZxD5cQ/o2yNrvuXFRAHiOEnXhLFgtrVSJ/Jo7F5Py+WyV+8HkC358
 tbGbJIDzJXXGuW3oV9uclunEE1ydJxJD3US1XsXQnohjhEBlknw2Jsk334E/cUVuijaA
 apXQ==
X-Gm-Message-State: AOAM532Pe63q6hiQseSXr7fLFUjS/oq9kEMBRdYSdDyemeTS8HU5ruXt
 1lwSo+s96eqTjHl3yOsAEFhROw==
X-Google-Smtp-Source: ABdhPJxnUa2suJn1yBQ9nWqBuOnup7nKQyIqMZMMh0Ba0lF6FItCJa9luVEVVdtJ8L3mR0AZ2ZngsQ==
X-Received: by 2002:a17:902:7684:b029:f4:b82b:b893 with SMTP id
 m4-20020a1709027684b02900f4b82bb893mr4034772pll.67.1622137077713; 
 Thu, 27 May 2021 10:37:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x187sm2358411pfc.104.2021.05.27.10.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 10:37:57 -0700 (PDT)
Subject: Re: [PATCH v1 1/6] tests/tcg: add a multiarch signals test to stress
 test signal delivery
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210527160319.19834-1-alex.bennee@linaro.org>
 <20210527160319.19834-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <844cd889-672c-66c9-5b8a-d05fefe3abfb@linaro.org>
Date: Thu, 27 May 2021 10:37:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527160319.19834-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 9:03 AM, Alex Bennée wrote:
> This adds a simple signal test that combines the POSIX timer_create
> with signal delivery across multiple threads. The aim is to provide a
> bit more of a stress test to flush out signal handling issues for
> easily than the occasional random crash we sometimes see in linux-test
> or threadcount.
> 
> [AJB: this is still triggering intermittent failures in some guests so
> will probably be kept out of PRs until that is fixed.]
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210504100223.25427-29-alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/signals.c       | 149 ++++++++++++++++++++++++++++
>   tests/tcg/multiarch/Makefile.target |   2 +
>   2 files changed, 151 insertions(+)
>   create mode 100644 tests/tcg/multiarch/signals.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This has flushed out quite a few bugs.  We could do more, but this is good 
without treading into target-specific territory.


r~

