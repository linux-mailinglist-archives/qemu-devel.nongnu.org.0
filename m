Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C37066520C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 03:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFRJH-0006jM-EA; Tue, 10 Jan 2023 21:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFRJG-0006j6-Ak
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 21:57:50 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFRJD-00046F-OL
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 21:57:50 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so18573539pjq.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 18:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JQ2CB58YKxPVDH8ptf5VYn34nkrclyuEszfQZpKf+Lo=;
 b=fYMUKpZjtNEpGTdFZKnoLH+0+WyztHfXy97FP2b/lSny2shAJmjvuV9dnNxf6gHeLo
 NXQAUDEULCI3uHiIGkLWEE/a1V7QF15sJ0ieMmplD7hnLwoNyEtU3qfehI5j53CRYgQ0
 k2w+zftk05pEIkwG1n47JfW8E2EeDGb9uhaarXiZW8g3OI0mH15WY1mDn9I9Q/l7l88N
 AvCWPDG3NVyLyntKiP+Qusr0BFFxCGG/ESiIVjIg2IpaFUdVdpmibJT3cvrnoV0+1OSb
 SRQ4b6GacXjD+cLVk4h74oQOO2Pwekr/Cmw9N4tSQnSrXxH42idUoOIb3IgN4uvocXU/
 bAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JQ2CB58YKxPVDH8ptf5VYn34nkrclyuEszfQZpKf+Lo=;
 b=tj/98HrjQV9bOY+RGLx+wfanhstGuqnHjHJO0/dAdULx1QyFBdTYqDALaHIgcdneAB
 Vmn0IzgMnTBa1WSFNUBKZvCjL2JBb8jAsYZRQGNYo6YcIM51qgirr2hmKPgNGclt0hA5
 acld3BFuAxAgl+YEAx2N+ebyc83VQXrTAeJQVIMgwBajNLSiW07H3HAagFZYwsGP9ZuW
 ZCkiNArjE2rDXmHwoIJP4ZPuiDjseclcQFk5nyU+45bgfU7on8f8VcdlIPhFe7dJB80s
 n5f/h5CJqqlOjSJCzbs48/hTDvTDiXpTpKle8xriQE7xN2gu3sHBXrdxBdHHOuj/M89O
 rcmQ==
X-Gm-Message-State: AFqh2koa0yEVSuhOOyBvt8NluznpPlc49o9i4bDSyJOIlx6cYo8iFu/I
 O5f9G0xi8ZHkpj5iWsEMtkPZag==
X-Google-Smtp-Source: AMrXdXuI4GCpR6DV9ahHc2mcZoDoHFAoJbQPAWpJlphA3GHbVCXNq/KpzaOgkyffWxmNM23ETTsePA==
X-Received: by 2002:a17:902:850c:b0:192:bbe9:4cab with SMTP id
 bj12-20020a170902850c00b00192bbe94cabmr34295733plb.24.1673405866167; 
 Tue, 10 Jan 2023 18:57:46 -0800 (PST)
Received: from [192.168.0.115] (63-157-97-90.dia.static.qwest.net.
 [63.157.97.90]) by smtp.gmail.com with ESMTPSA id
 c6-20020a170903234600b00189b2b8dbedsm8799877plh.228.2023.01.10.18.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 18:57:45 -0800 (PST)
Message-ID: <dd853782-cdee-3e5c-c6c9-802653537e70@linaro.org>
Date: Tue, 10 Jan 2023 18:57:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/5] hw/i2c/bitbang_i2c: Trace state changes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230110082932.24386-1-philmd@linaro.org>
 <20230110082932.24386-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110082932.24386-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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

On 1/10/23 00:29, Philippe Mathieu-Daudé wrote:
> +static const char *sname[] = {

Oh,

   const char * const sname[]

should have caught that the first time.


r~

