Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597124677CF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:05:55 +0100 (CET)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8GA-0006rk-01
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:05:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mt8CS-00022V-EB
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 08:02:04 -0500
Received: from [2607:f8b0:4864:20::533] (port=38893
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mt8CQ-0005uB-P7
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 08:02:04 -0500
Received: by mail-pg1-x533.google.com with SMTP id s137so2958039pgs.5
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 05:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4x3PPn3pdr61gJRH81kyuSvK3baripFIqpZL+AJXGec=;
 b=XX2IXzsLa1l/PSMwoTaBt9701DU1zyN61+CQMvw+RC1XsISf/pAPxbA/UiztXweZgC
 i9C0M8Icrp6P1SVXbsC+0kTN4hU6sBdzMt7XtuZDlh5DAOGKL06pqtP8DJVg2Ctg/HwO
 7MC0sUu3MrmeLXNsEm9fcgZojTeEDtMZwaQ5GWKbVGzMMCU4dbbCdlnc0dM4Mn2vwfGA
 uEWKUWjhTIwwKbHVsDD65UeX8RVxUMXjAS3uoqPaW76r/wrJAi+9iaDH2YWX8TNr6jVw
 Fsz1adYkoxa8KWSDrLXSEteN+1MtchD7NFKt+1jzIMOOjrXqNke4N2GNe9rY1tJhnX9n
 7/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4x3PPn3pdr61gJRH81kyuSvK3baripFIqpZL+AJXGec=;
 b=3agPcqjln6Zw4ZemZfevAmAA+opzXVANs7cu+TmSkV4Ym1eMJKgPn6Holop1o9w4ET
 rr/4am9YmqzrK7yoBeSRt26/4KjyByjrlrTCJ+kxrdBSoYBEs6wde2JPan3txP7+0aQG
 IibuXPZN2KrbfiLra7SdOccX7Yr5JjmloFn/msVJLBlzeKkqqSo4cYRV+Vswe05T9mGW
 pCQHXgsf32upnpZLf3g9mAvClJM6YxrYVIttVod/YQECMYDxeOPMisgIZScqh6/0exau
 2i1xK4oP9xBhCyUxIercroMdCjr2HNhJiVvlA0aDlV6TuoBohUeEYrtWIub+3X9YACwk
 zGDA==
X-Gm-Message-State: AOAM5314t4wGWsg5jmeLOomvhLrh1WZe8V0bhBhHXFEnrDoGZNtYZBSH
 EmfC9aHFUukIgPqXV+wFKzTIiw==
X-Google-Smtp-Source: ABdhPJzCx0Y1Q0O0b7/9r+cU6bNDkVgkmTN2VdLgfeX9hqiF2I4RZzaxUZSQLByjQBt8yiiEjW81xA==
X-Received: by 2002:aa7:9d1e:0:b0:494:6dec:6425 with SMTP id
 k30-20020aa79d1e000000b004946dec6425mr18924728pfp.83.1638536521338; 
 Fri, 03 Dec 2021 05:02:01 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id il13sm5990333pjb.52.2021.12.03.05.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 05:02:00 -0800 (PST)
Subject: Re: [PATCH v2 3/3] target/ppc: Implement Vector Mask Move insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211112141430.631732-1-matheus.ferst@eldorado.org.br>
 <20211112141430.631732-4-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6806c672-f9d0-8706-10be-9038b3f518b7@linaro.org>
Date: Fri, 3 Dec 2021 05:01:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211112141430.631732-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 6:14 AM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> mtvsrbm: Move to VSR Byte Mask
> mtvsrhm: Move to VSR Halfword Mask
> mtvsrwm: Move to VSR Word Mask
> mtvsrdm: Move to VSR Doubleword Mask
> mtvsrqm: Move to VSR Quadword Mask
> mtvsrbmi: Move to VSR Byte Mask Immediate
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> v2:
> - Applied rth suggestions to do_mtvsrm and trans_MTVSRBMI

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

