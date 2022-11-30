Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6478F63E335
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 23:13:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0VJg-0003YP-Jr; Wed, 30 Nov 2022 17:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VJe-0003X9-85
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:12:30 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VJa-0002s6-R3
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:12:28 -0500
Received: by mail-pl1-x62e.google.com with SMTP id 4so18110434pli.0
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 14:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S61QVYP4REnCDheK1q1VVtowoIMaPbz6+wu6CUhIAQU=;
 b=uiFVSL35+exnpe4aaSkQ+MIYMczzNjI4rNBCqt0REa1GUDkRVBkP+y9ANcEwSvdDPa
 ukuqDMn2asIMtxMTA22hrMzI6ph6BNDt6QF5uOBp7hHDgj2WI332Ho5269HFbojXUp8b
 LXsoYklN7dxYegoYuDu69ag1jpwbuiwQOCKv6lwCJTzGyv6hXQZquEChbTDAo2paWfXs
 Dvkdq4H4MuQJZSXPuvlwJer5FFMnF1Wpp7nOkrb6bIztfMB1Qj+KzJevSHHmKCU3Xxw2
 VEz/T3tfWljVAV+rjy3TO/lGkpxaWDFD7CAfJMQTwpcqqPx+YwUFZSjD1AoWhbKbDKUw
 X8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S61QVYP4REnCDheK1q1VVtowoIMaPbz6+wu6CUhIAQU=;
 b=RchZzV7yIHkX+hOA6GI7TBxSUQfEr05UglXBJ+iV0Gpcom48Mr8z/j3K/09mKK895l
 B0+et1QCJPNKcktp2V4OX3od7DAODS20cO9ZUyW10lH/s2du7W3MGW2NQE9LoyEXbios
 mxP1sfkwd4ujUUehewk66NLsWYvrR3tp/h/dMtRaoB4OJz26vvGWdtWsYWTEVUbQ5PPn
 9dnLnH5wJbaavZua3i77+VYwUcFp7o1C/x/P3Vum3aILGkYjSoGrA6VYdDW6NnCLiFH6
 ixwBr0443sRPyy9CpGOs7PFjHrNgo9GNfO3sqhrwsPIjLtX3YoIxaDcpatqrlCWKK6Lu
 jrCQ==
X-Gm-Message-State: ANoB5pl3qddIEyi9b+2eTtJXmIMkArG2iMUS/PeUVysCV4Mp6aktUs29
 19g9v0PNbk8yFjsX0woj7H3olQ==
X-Google-Smtp-Source: AA0mqf7gpVH/FrIlMW88hAeLzRVdbkPbMu6WRlQOvTrtFhBUklNHgtXqvcB5sCpbzcwC2nAkq3UcuA==
X-Received: by 2002:a17:902:b712:b0:189:98b0:8845 with SMTP id
 d18-20020a170902b71200b0018998b08845mr12062454pls.101.1669846344187; 
 Wed, 30 Nov 2022 14:12:24 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 d65-20020a623644000000b005750d6b4761sm1830870pfa.168.2022.11.30.14.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 14:12:23 -0800 (PST)
Message-ID: <452cfbbd-d1a3-270b-b9d2-ae23fd8d35ec@linaro.org>
Date: Wed, 30 Nov 2022 14:12:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/1] tcg: convert tcg/README to rst
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 peter.maydell@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
References: <20221130100434.64207-1-mark.cave-ayland@ilande.co.uk>
 <20221130100434.64207-2-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130100434.64207-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 11/30/22 02:04, Mark Cave-Ayland wrote:
> +   * - eqv_i32/i64 *t0*, *t1*, *t2*
> +
> +     - | *t0* = ~(*t1* ^ *t2*), or equivalently, *t0* = *t1* & ~\ *t2*

  t1 ^ ~t2

The only typo I saw, fixed while queuing.


r~

