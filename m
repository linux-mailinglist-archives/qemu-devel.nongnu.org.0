Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FD637B00A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:21:26 +0200 (CEST)
Received: from localhost ([::1]:48842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgYsd-0005wd-AJ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgYqu-0004DV-KG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:19:36 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgYqr-0007eY-VB
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:19:36 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 h9-20020a4a94090000b02901f9d4f64172so4466371ooi.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JqjKTHZqypm4X4wjTccX8ifbLmSB0rHGaFhfkwzX464=;
 b=fROo8nRfRKw2cwCPQ9hFdr586F0Kdx+1kVkYxTY8s4Q3xuSEDRvALLnrgNNv7FQMmf
 g8aHfL1/dzK1b1e+vTKSabaHYMu+PoWPb8mT6bpVPtB/NjErSR9zsR5WflOLGeATbIIN
 142fke1D4eE0F4/bfA/daHnSyc5bpBigiUd8eudEpDMAZP2CUzQIV9fGtLWtrqDwMePo
 R6ZXA5/RvpLdqceB8hmyyTG0RUcIvrr1V7Ab53hm52vXUvu9icwCfN//xO1oBhJsXhaC
 0QcDbJUrPoM0+cOckJdKAkFm9hUd02dDUe7JdM+hHR7+QBno4h3ongRw8ihdeuQHq9Ax
 m56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JqjKTHZqypm4X4wjTccX8ifbLmSB0rHGaFhfkwzX464=;
 b=TZbG1ePz4kShdbhsyw0UZzNsXD575g6h70CM0UWAwqjgy6vXzC4NXgACdYzVWmmRmr
 begx5gdwSYWiZ01vViFw2EaEADugxDjL0AvQuusBnvUjshCyxUsFuqg3PT+7h7hFRr+v
 IbvFgWBzTLWV2eP7vU3zid6W8EkGh82NLaJX/OioAxD6Ms5/Lcj/73MMNyJ3DkKzA8m3
 SpJcA7H/gEL8OoLe6CVpXd9+phfelBSTbFVwVQwjTa2n7boBKPznFepaiQoOOPy2vyzX
 0uM8ny3CpV6ODrB5tmFbXE3zbmlAbgLzMN2jq1MmQLHjEle1mI6ZlzW5ctDTe0/9tiqL
 60Eg==
X-Gm-Message-State: AOAM533rkWSdf4/2aOMeHVehzklwHfvcaKvJFuZfzisHJ4ptIrU+UdMS
 ctPtbSPWlFNTCuWkKmbyjGmrRQ==
X-Google-Smtp-Source: ABdhPJwM9BpsLpYq4qMhF+hkvCqI2NA6qpTbN6vsY5Zdt9XUJhOk0/kvmq4pizGJAx4eDsXMDZbRug==
X-Received: by 2002:a4a:2743:: with SMTP id w3mr24645985oow.29.1620764371361; 
 Tue, 11 May 2021 13:19:31 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id z25sm2800140oic.30.2021.05.11.13.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 13:19:31 -0700 (PDT)
Subject: Re: [PATCH 17/72] softfloat: Use pointers with parts_default_nan
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-18-richard.henderson@linaro.org>
 <bb440bc3-b75e-cc5c-7a2c-d44dabc98118@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <307d7801-3e2a-7df3-d82d-5bb3b68fc4d0@linaro.org>
Date: Tue, 11 May 2021 15:19:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bb440bc3-b75e-cc5c-7a2c-d44dabc98118@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 5:22 AM, David Hildenbrand wrote:
> On 08.05.21 03:47, Richard Henderson wrote:
>> At the same time, rename to parts64_default_nan and define
>> a macro for parts_default_nan using QEMU_GENERIC.
> 
> All I can spot is "#define parts_default_nan  parts64_default_nan" -- what am I 
> missing?
> 
> apart from that
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>

Commit message not updated as the code changed.
Fixed, thanks.


r~

