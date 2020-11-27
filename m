Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812782C6B13
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 18:58:34 +0100 (CET)
Received: from localhost ([::1]:46930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kii0t-0007Ee-Sy
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 12:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kihzc-0006Wl-DL
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:57:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kihzZ-0008Ko-VE
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606499828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCq6wIWci5DpptHtNpQSEhSIHHLVPde7TTr7AXLjqNo=;
 b=Jhc9Od51oGhRaqZl2qyjhGP3bj3z+k94oJdeSRmE9sKgs/inbKT6tUMzD8wocZWU1J/RnC
 yu1sPpi4ajDsy8XHgyqcVWYTg1o94O6EZsyBtdF29cdm3r1echrWpiAdpF2PCn154x4o8Q
 18mTc+T1mQoos24l9ifiQcvOUtW9YSY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-odX33ZauOC2Wjtxd4POU-w-1; Fri, 27 Nov 2020 12:57:06 -0500
X-MC-Unique: odX33ZauOC2Wjtxd4POU-w-1
Received: by mail-wr1-f70.google.com with SMTP id n13so3784300wrs.10
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 09:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XCq6wIWci5DpptHtNpQSEhSIHHLVPde7TTr7AXLjqNo=;
 b=XguYmwiF/Q6NZGD567TJqfZPFLeXx/XV8+Gcaz25iwVLNQ1gr25wH2PZq/kO+X0tDZ
 r0vFbcU6+PvbPoinPKNhnrTp/qSkOioFxlfy4k8SiU4d6/PjmJNQGETH+kwj8J5d0o7y
 NlwhhIGtqr45b0mmRvzxFTyMaZw+wee4oOR6iDVVQ1AUmQD9wfcc2o+kIQ7LdJEsai2/
 ZbF1/pXuXgbjkqTcxD+jq6hnQiTFLlkzNO2eNgdFpKaQ8htbfGR85uLzt/Kbgar7uMnp
 tNuFwc4D3MWp8EfQDK7XI4VBOKQoLvz0jO0mwNlNhtKDbdPTOkIFxXWfyc/1UlB3XiaT
 wgkg==
X-Gm-Message-State: AOAM530VeuVM1J+VQhl0rjbenNLtes1vZBAkTcP5sJgFibKbIL9hT/ZO
 smaDKXpoChVzlgtl69902fCFdFRthcmaQc0+qjZ3AMCiKTw8U2GiV5dLr/XJdXgNmmdd/skiy/c
 5Mh/D/cajWqqzeEw=
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr10372263wma.105.1606499825266; 
 Fri, 27 Nov 2020 09:57:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJgI+JdeF41HTt2vhEkVM9UZADape9ui5rIoTsgG+u1ZvMFm7jWSxndMlLCKrQwx/WBfwIwg==
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr10372227wma.105.1606499825013; 
 Fri, 27 Nov 2020 09:57:05 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a1sm16017066wrv.61.2020.11.27.09.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 09:57:04 -0800 (PST)
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20201127174110.1932671-1-philmd@redhat.com>
 <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
Date: Fri, 27 Nov 2020 18:57:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 virt-ci-maint-team@redhat.com, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 6:47 PM, Thomas Huth wrote:
> On 27/11/2020 18.41, Philippe Mathieu-Daudé wrote:
>> We lately realized that the Avocado framework was not designed
>> to be regularly run on CI environments. Therefore, as of 5.2
>> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
>> current users, it is possible to keep the current behavior by
>> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
>> (see [*]).
>> From now on, using these jobs (or adding new tests to them)
>> is strongly discouraged.
>>
>> Tests based on Avocado will be ported to new job schemes during
>> the next releases, with better documentation and templates.
> 
> Why should we disable the jobs by default as long as there is no replacement
> available yet?

Why keep it enabled if it is failing randomly, if images hardcoded
in tests are being removed from public servers, etc...?


They are not disabled, they are still runnable manually or setting
QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE...

We realized by default Avocado runs all tests on the CI jobs,
triggering failures and complains. Developer stopped to contribute/
review integration tests because of that. We want developers be
able to contribute tests to the repository fearlessly.

If we don't change anything, we'll keep having CI failures due
to Avocado design issues (artifacts removed from remote servers,
etc...).

I haven't seen any attempt on this list to improve the current
fragile situation, but better suggestions are certainly welcome.

Thanks,

Phil.


