Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF615488BCC
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 19:55:47 +0100 (CET)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6dM2-0002Gq-Rk
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 13:55:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6dHj-0006na-2y
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 13:51:19 -0500
Received: from [2607:f8b0:4864:20::102b] (port=39688
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6dHd-0003BZ-Cy
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 13:51:14 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso18299042pjm.4
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 10:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AEnd1XiigbNBVzrHhOOzLf/wUB/c53j7ejMpyttw0z0=;
 b=M6Pzgn8UE4cFn4ahjFx9wiEU6QaLmj3oE+7mlHfIAF/5Nyi6b3qSBr86M0f2lLnPBS
 UezZBMdREJ48CUDd4CK1Xj1IzgMGwOQGyjxwHK8ERfinoZyqrl+LThmb1kLYEdzRsVC2
 HD/bwPUFiF3v1k43hhxyAiHBDs/rTP51FAcUQI4wfYYWzIotwfJM8/0ZF0WQKzs88Kut
 MacmEOTd+e0tPVv3awbSS4Y27uBNEAFRmfJ0KJn7DnCNvXbqZ4g93r7Vx2sSYHMaoVed
 91V9kCXOcfFbW44ICPS46EqyZNkFodmUlw3wuopTBhF2yUJOdBoas80XT5y2FT3GbRCe
 vl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AEnd1XiigbNBVzrHhOOzLf/wUB/c53j7ejMpyttw0z0=;
 b=Foc2H8+MEmxDVr1FnRmQUPc8dR2hbdX2XBFg9iI2kNxtLG82gv3ynlYFhhCIq5JGuR
 GThubmi5Ee5GRDLD3+r835cs/d+7XJUIe2sA3WskoR5XBQLUJJ95XfLKznijvagPu/to
 YBRwIVFi1O5O8qY0SjtyGeyYO98mmTodoOHdp5ttburG6VDw/0ArYLkRlWkd633d+VDo
 fI+YYf6Z1gGLkJBFyZruoqMiZ3X5Ex/EoRLprO+kTgUB8INZatLTznK2S8Q0lHDHvURd
 0n3TB+K8ceSg2Sl/eOVG/rCtxkp13ClqeaQBOGe83H1idFum9woj/s8Sl8QRZic37CkW
 dbrQ==
X-Gm-Message-State: AOAM533fgDg3R2OuXN1wJ3SpyLusj1UMGYHTUb2FPSJUs0o879Sf49xb
 h8cnVQjuc/R2drrQfJHhfo/ACA==
X-Google-Smtp-Source: ABdhPJzNFLN2eeJ7RWjCe8sA3aE4OJgp/ggqDmjPxDLyJLIWwb4567pFcFk0XoHZZkAXNp0UOWN2Mw==
X-Received: by 2002:a17:90a:1d0a:: with SMTP id
 c10mr17970477pjd.243.1641754271599; 
 Sun, 09 Jan 2022 10:51:11 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id v12sm3457917pgc.13.2022.01.09.10.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 10:51:11 -0800 (PST)
Subject: Re: [PATCH v14 16/26] target/loongarch: Add disassembler
To: WANG Xuerui <i.qemu@xen0n.name>, Song Gao <gaosong@loongson.cn>,
 qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-17-gaosong@loongson.cn>
 <fc8de873-f66d-880e-1c67-e4dd9ad4fcb4@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30a5da6f-7f45-e997-a405-8142d22e4d11@linaro.org>
Date: Sun, 9 Jan 2022 10:51:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fc8de873-f66d-880e-1c67-e4dd9ad4fcb4@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/22 1:25 AM, WANG Xuerui wrote:
>> +static inline int shl_2(DisasContext *ctx, int x)
>> +{
>> +    return x * 4;
> Although "<< 2" has the same effect as "* 4" here, isn't "<< 2" better in matching the 
> function name?

Yes, good point.


r~

