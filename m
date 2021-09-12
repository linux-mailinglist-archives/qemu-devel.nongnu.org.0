Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D54081C5
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 23:21:38 +0200 (CEST)
Received: from localhost ([::1]:50362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPWuv-0001Zk-3A
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 17:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPWtj-0000c8-SF
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:20:23 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:43594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPWtg-0007M1-O2
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:20:23 -0400
Received: by mail-pf1-x42b.google.com with SMTP id f65so6968840pfb.10
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 14:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A1F6q3PY+I6g6jYniRTZHRQefubfUz8wzHqRavTvzuk=;
 b=P68v3foSNQyPbuvTfsM0lwVv2zLXf0Kn3CGJ6Pwd4wd6KMTJMNHdiS589JeGpKYj1F
 HnmHSvpVnYSxXYtawjIom+chOo8t0eJYIMPAoBQ8uFls90kswUj9Q3MqWRJq6jbpW9ZF
 oWHFcXORISyGv6cMrOOSkUrRnyzgphFHlvS4ZuaTckPJr/YNooZOmGg4YTiIUX2dmJ3K
 Xc9vw5GNtnEDF/IqUX01ZO8FFRt5/l/hFlKFbsCgezdu7HPxJtMvNsnFP9ZS8qWdHIG/
 BBmNJWTHl0GWq3TzwHg5GpMd9MznMvN44eRxaOic2nihew/3KO0RBGywu6qqTpZl9mhf
 M3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A1F6q3PY+I6g6jYniRTZHRQefubfUz8wzHqRavTvzuk=;
 b=n8dd34F2xVKrcGisYXS+tbIekQ7td3NjjEfMjhK9N2whinSqNzsyt9Imv/JyucISOU
 oc1tvWm7F2yZ37TTjA7b0+m3NbgOu4LD/H43niAx/bbiU15cIQKdvv1Zq22XqVVZn5Ag
 iHu53T43AOdr4qZEx0LdDVpTrFLGz8df3OdbDiDEZGJ1DANLde+sZCgchzwFWl6BqTV4
 V5RL7WMobGntDPDEa6A8AcF0QbmIcaykbUqjde3Q24j+BYcet4rpyFdlrqxgDv167GkD
 52NFHgpDB7OUYPvA1HawapF6CQmbsKj37XxXSk/k6C2+lSiL3Y8Ef2YP6N6eKmYB+8IM
 wc3g==
X-Gm-Message-State: AOAM533r/jHaUvpDayUDWIVfWM9Gw6Ic2bvhWkF7zm4gVMoNfca5fxZg
 so8jGYGj02LraqfJeGyle5lAww==
X-Google-Smtp-Source: ABdhPJwcPMVqZVH/8moFQGfuIDyAx6MP+bwGZiGJy8hRL0lNuuyoMzWHEvZet4AZrvBgqXyVm/4wVQ==
X-Received: by 2002:a05:6a00:8c3:b0:3fd:4333:897 with SMTP id
 s3-20020a056a0008c300b003fd43330897mr8014705pfu.67.1631481618826; 
 Sun, 12 Sep 2021 14:20:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z124sm5433920pgz.94.2021.09.12.14.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 14:20:18 -0700 (PDT)
Subject: Re: [PATCH v8 16/19] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-17-agraf@csgraf.de>
 <CAFEAcA_VJa_vJtJx6PtQS=WTy2y9ZJg8pcgu4Pkzp=CbuH85qw@mail.gmail.com>
 <a9ac1625-1cb0-bd44-da27-67f9a003ec54@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11281306-a11a-5b8c-6b2b-202be8e2655a@linaro.org>
Date: Sun, 12 Sep 2021 14:20:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a9ac1625-1cb0-bd44-da27-67f9a003ec54@csgraf.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 1:36 PM, Alexander Graf wrote:
>> I think the callsites would be clearer if you made the function
>> return true for "PSCI call handled", false for "not recognised,
>> give the guest an UNDEF". Code like
>>           if (hvf_handle_psci_call(cpu)) {
>>               stuff;
>>           }
>>
>> looks like the 'stuff' is for the "psci call handled" case,
>> which at the moment it isn't.
> 
> 
> This function merely follows standard C semantics along the lines of "0
> means success, !0 is error". Isn't that what you would usually expect?

No, not really.  I expect stuff that returns error codes to return negative integers on 
failure.  I expect stuff that returns a boolean success/failure to return true on success.


r~

