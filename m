Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031133F6AF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:24:24 +0100 (CET)
Received: from localhost ([::1]:44286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZuC-0001lB-1l
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMZln-0002Zm-Bg
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:15:43 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMZlj-0006OM-D3
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:15:43 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso3838516wmq.1
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 10:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3Q7129JGUX5wO0jva+5MnmygyAxyuatdTiCg+Yq0aFY=;
 b=Q48yDsejQujWerZgKksGc53MxIy+pdj8OJM6Gq/PbK+ftBichPGP+n48X8mSMTaUKV
 j45NV/IbYr6aIgJabkoWOfcP5zQaBEUwkHOo+CNjL5jrEPGKIv26FJxdNClGyCdn+Tr9
 iWg4mbjEPnNnR96semBw6RrZmhJBNjPyD2OKs6F+PJIDvFVqgfd3Z3ZDkM6hKYCJYVAD
 9GVVCwA21egSNd0QRij/PxHHf98opjyYnjmZU37Qu242ECN9biV/NorhpLVVWYW20arK
 dsrRIagnzblm0EOmsheaI1CzyHHENzN/iPrsRm4lyxDdSiZ2RF/vceB4A9VFl1V4L+Ma
 tmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Q7129JGUX5wO0jva+5MnmygyAxyuatdTiCg+Yq0aFY=;
 b=nOCTCj3hVMvvwX0NTdrGD4Fx35YOFas/zZjTtaJ5b0qv4Wazarj1eqwygCiprFytiO
 OTu2wPorrM3HUcORdBjMQzuVJ3d5SCsvjkzX+4Mau0vBIZ7jK98ekoScPBt5rTowqPIQ
 i7Gd2B2qKcH7ePJqylWvm8kyjxKxNVEgSIC/sm6FSAw55riAs/nrBLsh+pfUWVLSiuPN
 SDVC2lIPms/EbNXjI+mWHXITdL5sMBlOVvG44H2DNMFkEmptnFC1B744p+oOM/yVZcdM
 XmkULCy/8GhIWFWxF0b/1N1hP0AQccc0/5+Mg3XBMKDFRaIe3oj/CNJBGry0rtUU0grp
 xsZg==
X-Gm-Message-State: AOAM5317OCxqhwfWSsZAuNOFeew0KeNj4yx1BpyjfwOvXmCcicXcDxlv
 a0rOWArX4aE+6nNRG2BLCbQ=
X-Google-Smtp-Source: ABdhPJyYpS/PAHeZmAwqNqhZTO+HW7xJVE0laDD+dJ0PmVEM0ugPEHOLzRANOdSM2RIMEZ+EV0AvGw==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr4581790wmj.176.1616001337011; 
 Wed, 17 Mar 2021 10:15:37 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u23sm3124743wmn.26.2021.03.17.10.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 10:15:34 -0700 (PDT)
Subject: Re: [PATCH v5 42/57] tcg/tci: Split out tcg_out_op_r[iI]
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-43-richard.henderson@linaro.org>
 <867ed16e-2457-c237-d349-fc56541e90ad@amsat.org>
 <8a99b724-75f1-bc9c-d155-30b892f190c1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ebe154b4-ebd9-63e5-2bc2-d103b61c8b75@amsat.org>
Date: Wed, 17 Mar 2021 18:15:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <8a99b724-75f1-bc9c-d155-30b892f190c1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 4:59 AM, Richard Henderson wrote:
> On 3/16/21 5:39 PM, Philippe Mathieu-Daudé wrote:
>> "And support mov_i64 on 32-bit host"?
> 
> Um, no...
> 
>>> +    case TCG_TYPE_I32:
>>> +        tcg_out_op_ri(s, INDEX_op_tci_movi_i32, ret, arg);
>>> +        break;
>>>   #if TCG_TARGET_REG_BITS == 64
>>> +    case TCG_TYPE_I64:
>>> +        tcg_out_op_rI(s, INDEX_op_tci_movi_i64, ret, arg);
>>> +        break;
>>>   #endif
>>> +    default:
>>> +        g_assert_not_reached();
> 
> ... aborting if it happens.

Oh indeed. All good then.

