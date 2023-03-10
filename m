Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CC16B4F28
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:41:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagjt-0005gR-Fd; Fri, 10 Mar 2023 12:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pagjr-0005fx-Fz
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:41:07 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pagjo-0007ji-L3
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:41:06 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so8296012pjn.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678470063;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FGXwzIkMd0KiLZl2peeEUWNcnKyZnt2KyS9WbqqunNs=;
 b=l4FCwXUjLafnpsaEy4c2vAZCOh9CUpLEJUIXxb6tRsGINwCRfkM59nBW6kAvn8f2QM
 Lon6IxgPuGPdEGz75q27FHn0aYrqCKm/HPzgiZgWjEjIBxFImfRx+nDNj/q4JgrBT5cn
 TBPhbP219KROj9FpmsxabAAhe6MKxKEJjxQjWJxQVzN0wPWSATzVRbXCqoeXxUV/TNm0
 H7QG+tPnE0n+MPZROQwYoBFqj0mxUWq38qe1BDa62wkQek6/li6gfXU6z/Ui35uvchJG
 Qk7n2Ga+7n1AsrbxBQrlUCI2gsRLir0uMrpIMh2YNPvNdFar3qWV6UdIn7PC3pdsV/Bo
 jRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678470063;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FGXwzIkMd0KiLZl2peeEUWNcnKyZnt2KyS9WbqqunNs=;
 b=nYSMuhYCJ8sAuodkh4nLpf9PsMGMDOQXR+nUOQJvlVhZCW7QMwQ9Ob+rTvG/kXNILc
 /aqy3eX/VlMNJG3CLDsn+1b65XDF1HS2a20cAXm9Jrc3kQyu0geMIPXluPvb03+86wvI
 W2kl0lyEAgaG0A+Cv4RiDj33GBKnHVyQAnuLY+Is8GQAVEMvuE88AQp5j4dIU+4eemZY
 gz3/F/G7CCB3qIBxnWdUmCT1q+i5MXA8p1vBjtVfCZNi/Y1RU1Se3CuFA31GF1raC/Xt
 O3xGp2yYu/xqgydqCzV9PBLl4l04O9Nqt4ulkJgDhin8DyiaS7d4vtOGnoQh5aBR6r+S
 mlHg==
X-Gm-Message-State: AO0yUKXtWX4suNNSSaaiR5hsQFeqpbRSYh+HNdyMEFqWRQpzXucfqtGu
 uJB3+0QmTGK57FtvobD9z1Yxiw==
X-Google-Smtp-Source: AK7set+0InHqiBBJs4iiLJUeAcynnYhjqYjTPRAW+l85Yt1sD2Whveqis6WiHIWciSxUnFc4O/7vMQ==
X-Received: by 2002:a17:902:f685:b0:19c:e440:9256 with SMTP id
 l5-20020a170902f68500b0019ce4409256mr31149312plg.35.1678470063023; 
 Fri, 10 Mar 2023 09:41:03 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a170902d64300b00196025a34b9sm274715plh.159.2023.03.10.09.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 09:41:02 -0800 (PST)
Message-ID: <766cc218-dcbc-b6bf-d172-bb4d4ad0b7e2@linaro.org>
Date: Fri, 10 Mar 2023 09:41:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/11] tcg: Clear plugin_mem_cbs on TB exit
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-8-alex.bennee@linaro.org>
 <97cbb69d-eae9-e7e9-cabd-afdba875aed8@linaro.org>
In-Reply-To: <97cbb69d-eae9-e7e9-cabd-afdba875aed8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/10/23 09:39, Richard Henderson wrote:
> +    /* Undo any setting in generated code. */
> +    plugin_gen_disable_mem_helpers();

Oh!  And this is the wrong function.  Should be qemu_plugin_disable_mem_helpers.


r~

