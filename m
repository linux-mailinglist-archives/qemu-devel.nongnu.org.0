Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FEA5F5B21
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 22:40:49 +0200 (CEST)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogBCC-0007PX-AQ
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 16:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogB8q-0004aF-9y
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 16:37:20 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogB8o-0003Oy-Dv
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 16:37:19 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so3008354pjo.4
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 13:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=BcoldwmVp4YVD2tNA3ZIb3Fc/bHg4MGKzJJDrgADICA=;
 b=te6Jiij+LDpDQSkh1qpasSaoz+ChAqcGZ8pkiqlUH8FPjPwODCRpak8k46H97JIASy
 35vfKjflS3Fh8CAqeCZl6NYAw8F8qKvpGmC6kwpSksbO2bGr/3I6CZJkD3WpCyZOlq9I
 dtkshTmvD/DMt9/D4hq2ZjRmcUYXMEQtrvYovo56yb71RZ18R1/q3a58+rWtbk3PFWtk
 Qxvdf5bitHwo7J7GEPK+qlF2tRA6hbyvvU2HaPscqR6awPVn80vVgfqs7SMlUNPwymMU
 81KPatWQhPOTRfTUJI6f8pFmQU1e5EFZiwjliFGS8NS1zpL4dfAz8IRwLNnuV9YEX4L6
 rvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BcoldwmVp4YVD2tNA3ZIb3Fc/bHg4MGKzJJDrgADICA=;
 b=NsN+aWcgur7paQTkuLxdO1BmZR/foDsDmWqjKKmN+s4Rke96icZ2fen2sNqRa/n9CE
 kDcZ59PF0LsLiVrI1i1cVLh3ETLx/l61uBZO/+XbGJBsef4YhE3B/B0Btp53c2ZX7lub
 5R0FBifA+dSYF9Bj4NvjHM8NXATe0XbBFZ+dRaWcj4cWyu5l/K7YjLc7xmxbeez1vcYt
 uI9DteZFbbzZz4kARyVuIZlNzCipRzS3ymjryH0L6oNs6GNNWLufpdrrZ0EC4rbD/HHE
 VjLFpPYCZvZbqxpeKjr6FFWTFfcZYICucFivob/6zLlgkcQ27LgMivaBVkNOvU72eNxC
 fsYw==
X-Gm-Message-State: ACrzQf2m3DjVv8SGdiOTqMhtkzSBPTWDdNbz6KWibWuHFk+C5tGLvK7X
 hVkb2S74/grsaSAOQjZioG3WIg==
X-Google-Smtp-Source: AMsMyM5hlD0xQlysQpZ2uilJ/2INn/FTV2y5VDQDzFLX8ZGlcKEkLOrM+JQggypxHpyyN28a1PEs2w==
X-Received: by 2002:a17:90b:4f8f:b0:20a:b147:de1f with SMTP id
 qe15-20020a17090b4f8f00b0020ab147de1fmr6941405pjb.245.1665002236651; 
 Wed, 05 Oct 2022 13:37:16 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:9ad0:4307:7d39:bb61?
 ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a17090ac90e00b0020af2bab83fsm1259154pjt.23.2022.10.05.13.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 13:37:15 -0700 (PDT)
Message-ID: <f78ab23d-6cab-9b60-37c4-7486546c6a0e@linaro.org>
Date: Wed, 5 Oct 2022 13:37:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 0/4] Idea for using hardfloat in PPC
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, aurelien@aurel32.net, peter.maydell@linaro.org,
 alex.bennee@linaro.org, balaton@eik.bme.hu, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20221005143719.65241-1-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221005143719.65241-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/22 07:37, Víctor Colombo wrote:
> However, the impact in performance was not the expected. In x86_64 I
> had a small 3% improvement, while in a Power9 machine there was a small
> performance loss, as can be seem below (100 executions).
> 
> |        | min [s] | max [s] | avg [s] |
> | before | 122.309 | 123.459 | 122.747 |
> | after  | 123.906 | 125.016 | 124.373 |

I hope this is because you didn't handle the most common cases: add, sub, mul, div.

The logic seems plausible, as far as it goes, and would work for the FR bit as well which 
afair isn't handled at all at the moment.  I'll review properly in a little while.


r~

