Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F731342FE6
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 23:35:09 +0100 (CET)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNkBX-0004yJ-KV
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 18:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNkAW-0004Ll-E6
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 18:34:04 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:41534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNkAT-00060V-I7
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 18:34:04 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 l23-20020a05683004b7b02901b529d1a2fdso12104858otd.8
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 15:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1UxKis0LVyGsYkzLfjdp1IYD4jd9L2RM7ZQeouyzT4o=;
 b=Egxb+jV6YhtlwnCBbVGxYuMsm0N/zOL/jQRHIwVXS4ap6+ZR1SM+yGRMehB8QTJZMZ
 8vuUl39MIvS/HZy3tzRLLqREVloqDsSFdgP0z3qhyQzj/rouk/90fSxkQwvNjDr66XSf
 ul0k27+pmFbEAOt7CY1oG6H5iwfrulDyIwIMyaDhCPKwVOUmAmE3kXRyNf3O0VQ+1OfG
 0Ij1H9i4iKcwkledkRKTPh5DJtSEbkCIef+Rwv7ab3UYb/F9j69t37q0fSxs6NvwAFJE
 rRQ/SSbRKM8TBmWldGKJ2baU56vO2MEvDFGW7PXbT19se4fLKN3e65nsu0rrjiKO00Vp
 Nl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1UxKis0LVyGsYkzLfjdp1IYD4jd9L2RM7ZQeouyzT4o=;
 b=aqL0qkxL/B9QTJa7zra+W+ymFqneaszFgR0iL2y1zb3RgefEG1YeL0X/xNFHyUbKQ7
 VwErzg3s8DsmthcSMaS/cPXLNnM2CpOwIcfegHaleLCbfMT+2kNeejhtULkqxlfKk0/1
 kuBGGcsXx1OOanO7ha5NeTNK5DWX65p3JJkdbkB6VF67VUsuL9RHCCYVAQI+yxN/u0G7
 ZDVDzyC6TD9Ykq384kjRd1bGeTE2rJ9gGZfeNFTdghWQw6dJDZhF/j4FYDwZOqMtj+WC
 JL3pUKtgReayU3m6vPIZnAAzsLH/JlQZ6BoxfPX4Flsopm6sidoG4eMR6/biH/DZMzre
 H6/g==
X-Gm-Message-State: AOAM530t5s53IF0g3ScONp8II8MPa6J5lGpV4ZiTSfG7N7iVmn6a8r+r
 mGGer2lMdZK/bfo+N5VmNFVnrw==
X-Google-Smtp-Source: ABdhPJzfE6GGbkXxQl6Ok9ApCHkyOkyodnIp6grMKSOvd8tSVDujTRqXyvdLSU731wDXnMMGr1Ejbw==
X-Received: by 2002:a05:6830:908:: with SMTP id
 v8mr6399637ott.217.1616279639793; 
 Sat, 20 Mar 2021 15:33:59 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b14sm2113698ooj.26.2021.03.20.15.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 15:33:59 -0700 (PDT)
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Paolo Bonzini <pbonzini@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-devel@nongnu.org
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
Date: Sat, 20 Mar 2021 16:33:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: thuth@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com, laurent@vivier.eu,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/21 11:52 AM, Paolo Bonzini wrote:
>> +int main(void)
>> +{
>> +    return read_y();
>> +}
> 
> I think this should be "read_y() == 1 ? 0 : 1".

As a testcase returning 0 on success, yes.

> I can reproduce it with -flto -O2 but not without -flto, do you agree?

Agreed.  Replicated with a random recent gcc 11 snapshot.
This is really annoying of lto.  It's clear something needs to change though.

> Perhaps we can obtain the same optimization by wrapping reads of the page size 
> in an inline __attribute__((const)) function.  Richard, what do you think?

I'll give it a shot and see what happens.


r~

