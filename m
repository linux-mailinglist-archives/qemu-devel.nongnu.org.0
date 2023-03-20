Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0056C1B1E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:17:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peICe-0005RQ-73; Mon, 20 Mar 2023 12:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peICL-0005Kv-17
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:17:27 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peICJ-0005KU-J3
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:17:24 -0400
Received: by mail-pj1-x1030.google.com with SMTP id x11so10741944pja.5
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679329042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dZLSHyCcjEvWiiw3JBWVmrDtc12R0VvfFRzDPOGnYTw=;
 b=GUWmN5FG8a3/OXK42d9Wu4V5q+4MjmzHmDXpSGBFXV/RgYC530SHXB3+mZHyE6EosY
 zJX1R+tWdeH0rItYi9nZUqZdAxjVPz938C5euxesHO7CWDVnyYwh2fCjG1NN0OvTOnmg
 0OtZVyu3FA7GP4yzhD2/vh8df56OmXtkSQE1w5jNAjLQVl9Lb1XgNUAYDzYp16z6c67j
 ZAQSk0Gz4eeu8i+3aco81+QxVq8k1Oa3dA/X6AM8U50XBK+yclwM9P3KoNP0PuKQFuMm
 U39YK6QAR88wzgV2MNdUcANke7xEe3bwp4QtRIOUHCaT2SnLD0o1mQ3fUsoeYye90JSh
 BY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679329042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dZLSHyCcjEvWiiw3JBWVmrDtc12R0VvfFRzDPOGnYTw=;
 b=YF47A82tOxHH9qkQADok7PdBJ7plebSubevnDZ+hoc5ihtt7R+W+KFUt3ThhLkn38p
 sZi9fELmF3hltSIK1fJI7Q7c63RlBifplnX17OnB/A2D3ReQpJ0WK7tBCUbxtCePD9Zj
 jdv70jSr1XEH20mW44y4aXuLWW+xbt1tffy3TDtR/Ht4YuQqfwwt42m2r9E9dIEv9ogv
 rr87F+QTguCmSw/eEEfkiA/uL0ju7GQxLmiZ+jnU0+/WaWBKnaOLqCTiFSWUBCcRZEt7
 zsnWP4Ae9HcZjr1o55OtzZLJM9V3TaguzkK1g79fkkm0dv68f6CCbaIpyUJEHKJpQIxq
 LmAw==
X-Gm-Message-State: AO0yUKXbEMYEKBw+aXTcC3E8SX4r/EUnqCTExHs0A2USOq59ka7NieJ6
 YpSyBwf22/kTp1MTBc1aYjuVsg==
X-Google-Smtp-Source: AK7set+eTvTVw39XHnc5Z7jA/4jVywm2tWOjbJvEXG8D6K+hR4UZ0J3Qe5vWpBh8ZsKfmXpSIRsrdA==
X-Received: by 2002:a17:903:1c6:b0:19a:9055:6658 with SMTP id
 e6-20020a17090301c600b0019a90556658mr14951277plh.18.1679329042141; 
 Mon, 20 Mar 2023 09:17:22 -0700 (PDT)
Received: from [192.168.4.112] (096-041-163-098.res.spectrum.com.
 [96.41.163.98]) by smtp.gmail.com with ESMTPSA id
 x3-20020a17090aa38300b0023d386e4806sm6331295pjp.57.2023.03.20.09.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:17:21 -0700 (PDT)
Message-ID: <11b0801c-7e37-1735-a596-a4e1ce463420@linaro.org>
Date: Mon, 20 Mar 2023 09:17:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/10] accel/tcg: don't bother with ifdef for CPU_DUMP_CCOP
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230320101035.2214196-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/20/23 03:10, Alex Bennée wrote:
> +                int flags = CPU_DUMP_CCOP;;

Actually, since you can't turn it off, we should just remove it and the test in i386.


r~

