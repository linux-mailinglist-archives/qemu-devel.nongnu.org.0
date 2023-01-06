Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9BF660A2A
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:17:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDvxU-0000JD-Ih; Fri, 06 Jan 2023 18:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvxF-0000G7-Gr
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:17:03 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvxD-0003GX-5f
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:16:52 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so6812871pjb.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ao03ELuqPG9lcbC0iBSqGZY9Z9dLEgECT1d+sKYn89E=;
 b=ONKK9uOqj4bF7IoGyU7JxqkkhLfdU3TCv1UEQVHdNfPPHnLiKm34fEKwXI+5cYnbwO
 TTfkHiDfDf9k5R3WAZWplfzYgmLvos2L/k9LOz2u1/hR9nx7sga0VVr1ITB/QUWbN3Q+
 9P9pBuB4K9R3B+k2jyJpeGYijAfke/EkQ8wj/mLQfeQyloD3s025Rpi5mO/RIObcT3Rs
 Cnx90YrkYo/AtNXI9SFKnBe9FM3WUrNRfhJ8WQO2DYx+H8RIRT3gpn+aq6OOdK2164Z/
 AHalsB5vWSEO7gTfCsMC1hJQlZX/IobtQaGei5ttlESTEtHd97y8Q8bTojnh+S8MGfva
 2jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ao03ELuqPG9lcbC0iBSqGZY9Z9dLEgECT1d+sKYn89E=;
 b=Ij3bOMXDDVfJ9BgWsgTXpZePmUxBGlTcV8rLDy0O7VdLPH4btMEKGNTSfIpNx++TcP
 DOGJnklxt0RmNg/blbNGYoZ+Zs8+iMHBMc6lFjFbTfRjb8UXX/s7r0gWzllHiAXOYNJ5
 g6KkVtelEK2EQ8jefhCPhASGpiq96w8m0XVDGzfRK8yF4D4ZgsHmJjF7Tcek+nOLl6en
 Ja/NsWy2EPmT4sWgf8SrcRKorNaHUIyRXvANRsh4oy6yXc5cCsvkQ39QDx31iBKPpGUc
 KgANrVJS0mFEH4MXzycaSbNEb9aPYI94F9O2Zp9M/15gFTjz6B04UEDXIb0XNTEJJF61
 EUtg==
X-Gm-Message-State: AFqh2kok4oSk2wuiq8zc0v+4NnCaCW/DKYig7BWKhBcc5KUU2H75mzu6
 /94XhKeCy/pQIbPeF96Ou842zQ==
X-Google-Smtp-Source: AMrXdXvcUhxuGZOpOcNkIF8URGZToGS1tJciM9jvulpOLwZ8Fh2d1msUsT8q2YlNQUmQ7Ygo+DjVBA==
X-Received: by 2002:a17:902:d48f:b0:192:a664:1b2d with SMTP id
 c15-20020a170902d48f00b00192a6641b2dmr37333604plg.30.1673047009120; 
 Fri, 06 Jan 2023 15:16:49 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a170902f14d00b001873aa85e1fsm1352898plb.305.2023.01.06.15.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 15:16:48 -0800 (PST)
Message-ID: <71790c62-a52e-bac9-71c9-ec893f06b906@linaro.org>
Date: Fri, 6 Jan 2023 15:16:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 15/21] gdbstub: introduce gdb_get_max_cpus
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 08:43, Alex Bennée wrote:
> +unsigned int gdb_get_max_cpus(void)
> +{
> +    CPUState *cpu;
> +    unsigned int max_cpus = 1; /* global variable max_cpus exists only in system mode */

You can delete the out-of-date comment, since there's no global variable anywhere.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

