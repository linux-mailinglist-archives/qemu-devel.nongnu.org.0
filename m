Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C385239C21D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 23:12:16 +0200 (CEST)
Received: from localhost ([::1]:49266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpH71-0006df-Bk
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 17:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpH60-0005lS-7u
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:11:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpH5x-00024p-1s
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:11:11 -0400
Received: by mail-pj1-x1035.google.com with SMTP id h16so6239993pjv.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OyD2sjNyY1BjO4Be+Z5lea6RN8tHriObliOV2pRNFBM=;
 b=lRZXDanRMs/CdVc4kV+uaO8fEZmfs3+Fb7NT7LPzsQrLbi/J0KQkjQ4qhqwIADO5iA
 bG8DdeFrNalluNa1PAAkDb5FNCzh0VS82zb4ecq21mhr++AL8Cs2vT6E89uffzBOqGhu
 3qGqOnMpd/XnlXatRt4pL+PRGN2qLPnaVXTdgXEWQ0OhXwee2UVtnX5yjxzp9RtXKqgL
 3hAAxSWIuMEti+3DI4Y0iE91zkzVrMMdB0Z9s9Cvpaejj1O3whEfQLg4gdLOL/Z+6eaf
 cQ+3P0DAUkcy61VPwRYiUJqe7W/4Z5pqFwmMQHdCWd6kWI8rI8MgbO9vH7aHPuhi9T1R
 /dMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OyD2sjNyY1BjO4Be+Z5lea6RN8tHriObliOV2pRNFBM=;
 b=mVs5S/L5EtLoc60p6gPGmhVFtjMZFY305XvgC9gI/8r1ZaZbIdF9iD+yH6bLOsrCbS
 +PqN5hgwnnJrWb+rM5+4tzAr98AWtzKPrVELKoQkI+MeaPxGRzdXHnie9sXeNbEUNjCY
 dSOhjxgdsLsslkRzNPnxAbYi+88GNHqwa7ay0t1dD6zao3XQRY/1GREVdtelkrUYlpo1
 NxwUgJLMjtxiijGjZwu35mAYVjofB9VDGaPg44OxTTjDllbXt5ozfSxcw1/xkHDN9ecn
 ic7YHqRkYml0dlgG/gAPtrETEN3n1UG/hTOgBJig+TQ3rYwJ1Y/WUm9H30xjSRe3WQGE
 yeyA==
X-Gm-Message-State: AOAM530q3dW2l4eL3XErZ5C2Xw5PRgs9aOgardBzzzg6xHRNlXMU0NMt
 H2+nHY1CQ0Hr+zdr0f2zcCT6lQ==
X-Google-Smtp-Source: ABdhPJwR/Va6Qq6yndizYOZzPaDjrBWMse84sI57fGlhbXlEdm1uppQfEAPPUGdVZqRMLYDZ40vnow==
X-Received: by 2002:a17:90a:b10a:: with SMTP id
 z10mr6972142pjq.226.1622841067326; 
 Fri, 04 Jun 2021 14:11:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v11sm2476220pfm.143.2021.06.04.14.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 14:11:07 -0700 (PDT)
Subject: Re: [PATCH v16 08/99] qtest/migration-test: Skip tests if KVM not
 builtin on s390x/ppc64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <115f0f77-96e9-7eb1-c22f-d7dd0114d8a8@linaro.org>
Date: Fri, 4 Jun 2021 14:11:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:51 AM, Alex Bennée wrote:
>       if (g_str_equal(qtest_get_arch(), "ppc64") &&
>           (access("/sys/module/kvm_hv", F_OK) ||
> -         access("/dev/kvm", R_OK | W_OK))) {
> +         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
>           g_test_message("Skipping test: kvm_hv not available");
>           return g_test_run();
>       }
> @@ -1398,7 +1398,7 @@ int main(int argc, char **argv)
>        */
>       if (g_str_equal(qtest_get_arch(), "s390x")) {
>   #if defined(HOST_S390X)
> -        if (access("/dev/kvm", R_OK | W_OK)) {
> +        if (access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm")) {
>               g_test_message("Skipping test: kvm not available");

I would have sorted the kvm test first.

For s390x, we has the HOST test, but ppc doesn't.  So we're doing the access() 
on any host, e.g. x86_64, where kvm cannot true for this test.


r~

