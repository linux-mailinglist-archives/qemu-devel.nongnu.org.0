Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB60339C9E3
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 18:33:11 +0200 (CEST)
Received: from localhost ([::1]:36848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpZEV-0003wQ-1Z
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 12:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpZDP-00032N-Un
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:32:03 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpZDO-0007WC-CY
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:32:03 -0400
Received: by mail-pl1-x62e.google.com with SMTP id o12so2851038plk.8
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 09:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KwV/Cpcs2rkQMsstrqA0z+o8gRGA7Zs5z37jtMdv4E8=;
 b=BTrehXeyFbTqRnjh2fU8uTg2fdxtKOUXh/gWPrTBrPXLKybyXrJzgrGvAt9+oF41h6
 kvkHl8tJbC23jwVXxwdh6yGPRsrM8nkzQ6mUg3YC69ssKIwto7HpUE36boec0wVqTzoj
 5AUWzyKUKynh+G9WbA4bGIURKEjSjmHQg/LGqUZqeTNVhiGNM8a4kh+WiKbJYyU7hrnQ
 PxNrYRxA21Ih7n53RzpcS+jMyjhnyyYOAgSxbYGC0J0NAzL0pauRXxqUrLcoVn07K0VF
 8YXE55lPfdsq9vCYMxSqCwoXVFo0tKIqI75AjxEXEHlwe9gnw8G5mxwoGVxyUs5oz6wR
 KjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KwV/Cpcs2rkQMsstrqA0z+o8gRGA7Zs5z37jtMdv4E8=;
 b=FHCsRqDWAfClQI2VilVBqec/Hw2Hln0s1KuVFBYe2aQ114pTrZO4OfxWbt9ikjR9bV
 GfyAT8IwYKNj/8/A4CHkyjXqwnqRt94Cjs5jKh924DXHVOxiGNaAwQkvFYi3E9CxpmvP
 4bqdocKPwvlQB9w6MKwkWGSXgW48nnC/ArVdJ7rk6JVqqpvf8pPmZlrMo/RudKquM5v9
 AivSDZoFxq9jcXdAqp2iNUx/u31dPGsNdjr7N+AkUO82MmvUDGi5E1pcZHOB0I5p1oGB
 z5YjNBDBFjNi+zi4zjtMezxQPyBTnzSF3IfR8KFMgBkI5LsUxKjg/gOXLIUHfmyDbp4a
 wFRQ==
X-Gm-Message-State: AOAM530EODoGhlXxvDZ1pNpsaYDTgBY8hy2R9qdNYuQVcAUVaD/XZ9qf
 vCK3hQ1NxbNhealwS/RjPZrVbw==
X-Google-Smtp-Source: ABdhPJx1786grwM0/LH2BLPmWZV35vqWeVLjHopLD/3pvRrdHGvPMSdYOUdgA48spVf6/yFApVv1WA==
X-Received: by 2002:a17:90a:3801:: with SMTP id
 w1mr15779252pjb.138.1622910720745; 
 Sat, 05 Jun 2021 09:32:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ei10sm2575537pjb.8.2021.06.05.09.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 09:32:00 -0700 (PDT)
Subject: Re: [PATCH v16 65/99] tests: device-introspect-test: cope with ARM
 TCG-only devices
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-66-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d9bcfbd-5921-dd44-f959-9ab1ec484eb7@linaro.org>
Date: Sat, 5 Jun 2021 09:31:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-66-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Skip the test_device_intro_concrete for now for ARM KVM-only build,
> as on ARM we currently build devices for ARM that are not
> compatible with a KVM-only build.
> 
> We can remove this workaround when we fix this in KConfig etc,
> and we only list and build machines that are compatible with KVM
> for KVM-only builds.
> 
> Alternative implementation provided by Alex.
> 
> Suggested-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/qtest/device-introspect-test.c | 32 +++++++++++++++++++++++-----
>   1 file changed, 27 insertions(+), 5 deletions(-)

Similarly, qtest_has_accel.

r~

