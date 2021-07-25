Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18B63D4DB2
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 15:23:27 +0200 (CEST)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7e6I-0004KZ-P7
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 09:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7e52-00038W-1e
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:22:08 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7e4z-0008FL-Jr
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:22:07 -0400
Received: by mail-pl1-x62d.google.com with SMTP id e5so6528676pld.6
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JsImMpyMmBu80V8PqdR1HDO9C3PdZ7UOGREQSck/9QE=;
 b=CkE1wbFxopKqnapqUjvQ7CL3kPAnWclc9Y6gAumR1K9Fj+6celSs63OWGqi/k9c/hk
 wtCK4J9RyfiD/c00X+2GUjbykgzF9ZMxfW9pnLNFpoTcTZgK5NgGEP4Hn9v6pphmIJ6L
 5Tf7XsoKD4cNFnzVBn0SvWwSE0nGPDYWaqeyT4yJNXql4Yz8TwarI0jxi4WJj7W601gH
 nEapQFGvXMMteCp+5wIe+YRQlHzbWPkR1Qg94yQ1cFC3/tXtdVExM5zBWXa8AYJ5iuIA
 +fhyow4QWGbGfuIS/PX0y4iCZUWUYTyXR3z2SkrD2AkwCATlGWCnX7ysU2RynirIiGJY
 FR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JsImMpyMmBu80V8PqdR1HDO9C3PdZ7UOGREQSck/9QE=;
 b=Pa2C4AZ12DjsBt+4yKIpIeE/m9x8CewbW2twJ9GA46Y393atXUpCSQJwxUDiLJjnYG
 4vpYQQqOhxlxb9ApeLWsJrSzH2DHWHDiYbhxKtr4tBb9Jcd+gjMePqpYbKd/942HDxQg
 jHIdrEzjKMOXwcsWmhpoYXTZy+BxXO5nhR9LJphlNi2jnkxvkdyhF4T3Sq9cW8Z/nYqt
 jaQhZBgJ+O3mazYSY8kv533ImO1y9oZ37VzNIuVNM29GeEyG5WV5IIDDbeREi77qDbkU
 8VJl+gfSmNuybsamUDhFaPKrUbFAYqXe/4pKfqsV7eU9fyxSrhvbKUbyUy8IjlFGH3bw
 px0g==
X-Gm-Message-State: AOAM531ELl9cBFv4EQmM5fj1q62ZE0PDR4HqDyZ+IlabvN5lrUkve9w8
 4aklK1ao21ukm2MugFEgB1cJWA==
X-Google-Smtp-Source: ABdhPJwp/ph2qR9WS1m9eNPP8B7mfOh9w2hBQAJG1Si5NhsFplkhK+2gd9bbmhW4njm1NhLkE5bpCw==
X-Received: by 2002:a63:a42:: with SMTP id z2mr13441109pgk.245.1627219324165; 
 Sun, 25 Jul 2021 06:22:04 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id bf18sm33357298pjb.46.2021.07.25.06.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 06:22:03 -0700 (PDT)
Subject: Re: [PATCH 12/20] Hexagon HVX (target/hexagon) helper functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-13-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2da38c4d-e655-824b-09b5-adc5d630541a@linaro.org>
Date: Sun, 25 Jul 2021 03:22:01 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625528074-19440-13-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 1:34 PM, Taylor Simpson wrote:
> +                    put_user_u8(env->vstore[i].data.ub[j], va + j);

No put_user.


r~

