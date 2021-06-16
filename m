Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A33AA396
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:52:58 +0200 (CEST)
Received: from localhost ([::1]:52324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltaeo-0003Zb-0q
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaU0-0003KT-Ci
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:41:48 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaTx-0003eQ-P2
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:41:48 -0400
Received: by mail-pg1-x531.google.com with SMTP id q15so2700081pgg.12
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EykM4BVmd9aMzqfNPxJYF4aaY4kjslMU+NAnrQ6usHo=;
 b=vrVFaeWPbxBGmmqUE199JXZ6Y7wBpam2i31kNeKmQcuVHrWewoOYBlvK4XQ//0eEiM
 4VdxJM/4Q+wYDWewWrnke1dEzfT9Lk4S4xRU8YuRtF/5LeHzOSp7engTmxKd4G+Q6Vzm
 b9L+0G4LRazZQYXN6Nn6pSjL7e2vSKTbViDGvHllkVffw1a2siRsqyIyv3Cga5x1yAGv
 RewDgeqavzZRvbvKbL0zNwVEgfU38XOmS2m5Soxe4wII72Tc/g/qExheZ09BLIXnxn8p
 y5H5u7rb2Ca9EH2e+oJ998T4vAInKo3vGsoZnD2b5oZb7BULAnOEgqK2eGb1XoVkZAC6
 vpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EykM4BVmd9aMzqfNPxJYF4aaY4kjslMU+NAnrQ6usHo=;
 b=BTSZeiyNzm+ZS0liIs4rsTWV5xP2LIefCdMI3vU4oXPc/Yq800zhAkoeldrQuMfQxr
 z1oQvWiC4M4E3hjHn7hXSI9qFH2GN1vvBdZq4CCo4ykgj5ObW+ypjj2Jt3c1dvLYbxbn
 bVal2RIVssvBSOwhdmM6/dManUolTtPXPijy9vnUj8aZ284ppcin4kFXS/oPNrgsTJPk
 7UnA9qt1kP2hHlJSGv+i/0wpAcxl2ZlnLR0wSHj7mth2r2V8FXCEq/mq+FcAGPsdEoh4
 FT5x+J+ewfNsI6VKL+QO+sWc8rpgJzyUDGQXPNGO/GDuiqBK4+ZaqNGA3SKhUOZgsQNZ
 bwdw==
X-Gm-Message-State: AOAM530UX5RCLqZIDvF/NtbvEU1yXFZKK/PNMDQnQG39V76Zd3EW9xAf
 IAdcG23swuBu7oJ8qUOXUtJlTg==
X-Google-Smtp-Source: ABdhPJxFHSc7nV0B6m0KyeDp02buRxVfp3VJJPxCS98gChwOgQIb0o+nOUUpX/FQQuW1GxvCjv3Svg==
X-Received: by 2002:a65:6243:: with SMTP id q3mr984724pgv.297.1623868904174;
 Wed, 16 Jun 2021 11:41:44 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u21sm2800010pfh.163.2021.06.16.11.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:41:43 -0700 (PDT)
Subject: Re: [PATCH v3 08/13] hw/misc/auxbus: Explode READ_I2C / WRITE_I2C_MOT
 cases
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <873776e3-b2b9-b8ad-4d3b-594450c8f970@linaro.org>
Date: Wed, 16 Jun 2021 11:41:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> To allow further simplifications in the following commits,
> start copying WRITE_I2C code to the READ_I2C, and READ_I2C_MOT
> to WRITE_I2C_MOT. No logical change.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/misc/auxbus.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

