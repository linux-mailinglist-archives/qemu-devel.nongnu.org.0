Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343866667E8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:39:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlb9-000833-5e; Wed, 11 Jan 2023 19:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlb7-00082f-3n
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:37 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlb5-0001vc-KB
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:36 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso21836521pjp.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w3dSyXN1RKi7nVnTNy7sl17nMxRk5FXSE/DSuWGove4=;
 b=bragzYjhsFgpfEbGjBOrr+EHL785poIt7eomUK+mq4dPGV8qt5qbSRn1usWK74SfKL
 fR+PSFGzOFC/MvRey3VHa1ksoIVJEa2ZFkGcrSS3P+w+IECS/Othes3yZi87j3SnPWqC
 Wlm0NnYQFq5L8fpRiIi/LZNCKBEHL9nB1qybgZQNXt0r3qv2QhYZPLOtLG2yCbnOIk7X
 lkhw0fGpM9ZZPbZ7o5RuxRNBkJRY1B+9ooh2bzBKnYP7EAPMbucvgFo4d7aejthobtSa
 nO67zW4DbmyHlIgruGchwfzQIPWFTeus0OJ5kSaUXfG1IgU8HUHBNQ3dtU3A6mEttnsX
 Jobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w3dSyXN1RKi7nVnTNy7sl17nMxRk5FXSE/DSuWGove4=;
 b=2Eak4ggYFeV64/SeEhJhQPKQ9FWGwU786+0iSC9J41+XsQMikrTq0ED49T2M8wmdsB
 LLd2cO2nyTFlCs4jqzxQFTmJrfQIdlmAkC8SwLWCvE2Me5SDVlumWvVA0lREpXZOHdj7
 F+oWxcwcZMUIZHq9H6HXpiUlBP1sQEGV14R0/dMuU7JJOS7D3J2DF3QrdANs4FaqWapY
 CSeGj2QR1+v33LHBZpFxwUvnNzbixWOW6VKbU4c6RmavVn0uttUPZlP6MXYiBbJdKs12
 oe5y3O7ZJz/P4SPAOoiPvdJ92bE9GWFK9y8QiSRmkFyIMVZ25qWhB4RV3Sc92+pD+umB
 nEOg==
X-Gm-Message-State: AFqh2kpIqSUlQTpNVs7mknMIir92A9NkSw5iCDNu9AEIJmNX3uiKVmP7
 5YPehPF2HdzD7xahhwbfWK99FCQroQQM6FLG
X-Google-Smtp-Source: AMrXdXvakTMQKGLw079z5qtRMw0NLOdBkx/f2cu0irF0GNDudSJMp/LauzAYhToQR7LitobGDeO5bg==
X-Received: by 2002:a05:6a20:9592:b0:b6:3708:7be9 with SMTP id
 iu18-20020a056a20959200b000b637087be9mr6440246pzb.36.1673483854146; 
 Wed, 11 Jan 2023 16:37:34 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d63-20020a623642000000b0057691fb0d37sm10486699pfa.193.2023.01.11.16.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:37:33 -0800 (PST)
Message-ID: <214f89fc-6e90-7d0b-8555-4bae1d1d0b70@linaro.org>
Date: Wed, 11 Jan 2023 10:30:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
 <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
 <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de> <87fschcko4.fsf@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87fschcko4.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/11/23 04:36, Fabiano Rosas wrote:
> Nowadays for KVM is the 'virt' machine the only one we use?

Also sbsa-ref.


r~

