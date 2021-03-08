Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49F4331681
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:49:17 +0100 (CET)
Received: from localhost ([::1]:35290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKwO-0004f8-QH
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJKtw-0003FC-3H
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:46:44 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJKtu-0004tL-BK
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:46:43 -0500
Received: by mail-ej1-x62a.google.com with SMTP id r17so22400348ejy.13
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eFEtm6/vfemJQGFHW+B0HR0CWfXRbEsEF8AHXCNZvVo=;
 b=LYFoag5sV0Zq+qHWnDWqyYVtho8O+ij5a6sBYFHMeKprw1Ohj3+b41PsIh+ufu3VKf
 mv6azq5gZGFaXEhi3L7CbbvwtgxiBvpk5+Wpcq++DemC9Th8cUzxOrfUdKXpx9IBNmp2
 ABLZMxgD2qliboQUD+RwKzq+yN9r4nte/3n3X3EUqVgWF3ZMOymVMdhwUPgdm3YLGtKi
 OJHa/4/D3vYuzz5SgMMfGZITQlbcAck5UUSH94DYAuSwfRnSTI06BmWgHfB9MvbwuiG4
 +ppl9a6+OrmMyC2vC8nNmr93Q0pcu4fSPNh3G4i8rWQcXoFLqyyBcCOhwIfLIViNw9nC
 9s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eFEtm6/vfemJQGFHW+B0HR0CWfXRbEsEF8AHXCNZvVo=;
 b=LoGIx+l1eNCa7Gg/3xVLI7cBRDsEjKZOte30vsoiPURJsuGw54XsfQKsSNU/OAf+qZ
 Um31cd+D6SeIJP9QEN8Q1br5xMhDcenetAJ3pDHqE/vPZbS8EVWtVZZZLcFmmjtc+CBB
 jGJR8iHHJByt7Q/xGtwvPB5SB1BjAHiTX6Ds9bq/rg4cdjkhKyDaQaIEFlErsOTyZ+CE
 /sFsjT56dqiG50OcxC2dTWicoDPTIiZ32uBmK6liNMDCaF6jutsL1fvqWjhUteCAo1/T
 /le0DW7M4dbfZDBBIJU0+3qgjVOa9llxXtyp3eAMATPCLMUloIwFMkOXSX+v95bdTZXM
 kKGQ==
X-Gm-Message-State: AOAM531OMH2csagHKgFXvSN1hj/cxc/04mCD4AIUrq8tXbMDsTNl955k
 2vMZDa1RvXqeRIsRPA2ycKY=
X-Google-Smtp-Source: ABdhPJy34mnhyCxn1HNeEX2yQnlFu6Ih8Ur5QA6UaEJrzbRsz8mcqwodtgunymjQfhhQcF135ASAQA==
X-Received: by 2002:a17:906:ecf3:: with SMTP id
 qt19mr16141915ejb.467.1615229200782; 
 Mon, 08 Mar 2021 10:46:40 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bi26sm7021261ejb.120.2021.03.08.10.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 10:46:40 -0800 (PST)
Subject: Re: [RFC PATCH 16/42] target/mips/tx79: Introduce PSUB* opcodes
 (Parallel Subtract)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-17-f4bug@amsat.org>
 <fd568d8d-a60f-5644-f8d3-5163ec21173d@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1df01b24-8d19-19b5-32f1-b5784466c335@amsat.org>
Date: Mon, 8 Mar 2021 19:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fd568d8d-a60f-5644-f8d3-5163ec21173d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 5:38 PM, Richard Henderson wrote:
> On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
>> +/* Parallel Subtract Byte */
>> +static bool trans_PSUBB(DisasContext *ctx, arg_rtype *a)
>> +{
>> +    return trans_parallel_substract(ctx, a, 8);
>> +}
>> +
>> +/* Parallel Subtract Halfword */
>> +static bool trans_PSUBH(DisasContext *ctx, arg_rtype *a)
>> +{
>> +    return trans_parallel_substract(ctx, a, 16);
>> +}
>> +
>> +/* Parallel Subtract Word */
>> +static bool trans_PSUBW(DisasContext *ctx, arg_rtype *a)
>> +{
>> +    return trans_parallel_substract(ctx, a, 32);
>> +}
> 
> We already have helpers for these operations.  Use your trans_parallel_logic
> with tcg_gen_vec_sub{8,16,32}_i64.

Very nice :>

