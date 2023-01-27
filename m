Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F295667EDEA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 19:58:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLTu5-00038b-03; Fri, 27 Jan 2023 13:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTtx-00033f-MQ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:56:41 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTtw-0006o5-66
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:56:41 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so9555597pjq.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 10:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E9tFwH1m+tCL7n9BD0ZcO6e8s3hW24ax2yDkW62q4Oc=;
 b=jZw09QQwcWqHZkbc3jGUILBuv4b2DG1JQjrQJjHr28u9M+WUtvCbOfJPZ6F/B+YJhU
 qrvEhjZ2y5+uGhV53f8myLU4HCcnQ4RAv/l/k0mrrz3A8j9eziv1giJ2jPsKG6L3yhU1
 Z4qIsCsRLGOIbbxr/8FGGleftd+1WahtxOtHX97Yo/lgNG/0elJV/qL5ylkBniRW1R5Y
 n/EKmx3dM0KtPsCjZz9FcOuN4tmbNkCQX1mZSINKFeKZkKJlNhUskGInEBnOOuTfAGC/
 IaJzTaeGXAc+1XOwfmptjBwlvMFLK577VEVwvVxnJEn99fPQc4CYvCTvchUOABnBQ/Du
 7bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E9tFwH1m+tCL7n9BD0ZcO6e8s3hW24ax2yDkW62q4Oc=;
 b=tEpY2Ss+8pOp2BNQGR+Vua9u2/EAnk/oFZJsy/yfCjY7+qQuK7p8xeOyeHvDdxM2Qr
 f5E2L0LcUEku27imzpwm3yVrrZ3jSkAL45GE0zremrjcj73w9muZ6l3ny9x754jF5/MR
 tu/GiB/kg95IxC4AcxmQwQYPbCeQsL4eBMjxlKDSpGIO1MSudL8VpKyrLorsikVjwYmW
 Uger6oIiqSe6Wmt/0JIcLu92zw98lqPgQ2JAtR0we9OvwDSO1epJWYCwuN0WmGaf27lQ
 Uy+UeiEg0XcVLfDohFg4HLOurQtXqWHUxe9yEazzSiERPHRgetqVbHp7pvDpMF4OR8Sb
 wdRg==
X-Gm-Message-State: AO0yUKVHfqnWgD+Avz92DXkqJufJIN7mqx3j1w989YKDr46Xd5wSwCca
 hh/2ygmMtDT6o/l7Xm97NmT7jA==
X-Google-Smtp-Source: AK7set+V+Eqeg5LtBN2M8C0L5Ec2XCW6NKlQEawk8fBbgbRx9rlv4tkS/AyptL9QhnyDOMEk5M1bcQ==
X-Received: by 2002:a17:902:e88d:b0:196:f00:752b with SMTP id
 w13-20020a170902e88d00b001960f00752bmr18271854plg.66.1674845798520; 
 Fri, 27 Jan 2023 10:56:38 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 b19-20020a170902ed1300b001944b1285easm3190625pld.198.2023.01.27.10.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 10:56:38 -0800 (PST)
Message-ID: <55c23e75-da85-ad37-7208-82fc021a7115@linaro.org>
Date: Fri, 27 Jan 2023 08:56:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 13/36] tcg: Add temp allocation for TCGv_i128
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-14-richard.henderson@linaro.org>
 <87a623oqeb.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87a623oqeb.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:08, Alex Bennée wrote:
> Why do we have all these different allocate functions if TCGTemp's are a
> shared abstract type anyway?

Type checking.


r~

