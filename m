Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF6B55022E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 04:54:37 +0200 (CEST)
Received: from localhost ([::1]:54118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Obc-0004ty-Qe
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 22:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2OYK-0002Gw-3v
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:51:12 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2OYI-0002cp-JJ
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:51:11 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so5634124pjz.1
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 19:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i2C/UoqLu/0iOFIIBTeAKhpOTUgDxZkluwyGz0yL3l0=;
 b=rDcezKOCu7/vv8pxPy3zmjoDDnaD9scVLAqyTUHXHJNqk39JHZow5/H7bXlkPAfG3E
 LTBn940yq+6mnW9Be3s6VKJYZylAvMCcdzVOmOkHAXdCS53MgU951zvx/XBafvkcKx91
 qPpfylPEMP0gbhubTN6pp1Io8zuCDEZOdeCDexK5quCVinwZOMxTPSeTEaiM0JvuvnL1
 KWZnHMpuGMnrkws2tL89td6Vg5UWF7Ycq9SnQFpWWCDX6UC4bEpEnyb54L0R6BC7vkT9
 2rMq1c8q/e1keMZVyhgt2UH01Sa28wl5Qpx5Ep5nh24WSta1bzL0BvgZV46kwU+j4g+V
 ikzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i2C/UoqLu/0iOFIIBTeAKhpOTUgDxZkluwyGz0yL3l0=;
 b=XV5vuqp5irr5KaSo+Jcyfoa1HkG23qSOcAYnDOTOkyYk+O1d1u6JFsVYk7vXzSDMbo
 2zyptrdM4nTFSmTxRq+WOIN9fvk9/1r/14sIuqgqnixsGAlJJS4Ahgq5cDnIqAsaNNKZ
 nBBNIjebMEnLCx+s373hVL0KGWp1gZUhH+wa9RB26oGvradkaI4hZHAPhVke1lg754bw
 3/YcISID047xd3TK8cwpuR+4G36OFCHfA6NaN6OPNHwA+uCL9Z0HQCltusPWZBRMLs4O
 YjMVRJZ2R8MZ7rD0mcmgHjQjD9e7+/4skQL5KJlaGYtjbJUezhCMcN2neM/ChAS3WPwc
 eS3g==
X-Gm-Message-State: AJIora+uGr2CKBnsv9bKuHXN/0Vofg00xGqKhWTqLo1f0CQw4C1Fq3Pl
 rIJtoNjuYrxfuavnpqSBXBLkZg==
X-Google-Smtp-Source: AGRyM1tRp0vwmBuWfJwqpuP+K+YKqubPMa1DB5kz0mI78xgJiBjJ7BW6mVYwyBS/hIlQXL5sRrLIjA==
X-Received: by 2002:a17:90a:e582:b0:1ec:8bd2:981e with SMTP id
 g2-20020a17090ae58200b001ec8bd2981emr264184pjz.22.1655520669206; 
 Fri, 17 Jun 2022 19:51:09 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:da58:e2:88d1:d15b?
 ([2602:47:d49e:3c01:da58:e2:88d1:d15b])
 by smtp.gmail.com with ESMTPSA id
 bd44-20020a056a0027ac00b00525113281dasm37892pfb.201.2022.06.17.19.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 19:51:08 -0700 (PDT)
Message-ID: <dd96f1cf-8016-1adb-cd56-af62e0c1f0ce@linaro.org>
Date: Fri, 17 Jun 2022 19:51:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v17 10/13] target/loongarch: remove unused include
 hw/loader.h
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220616121611.3316074-1-gaosong@loongson.cn>
 <20220616121611.3316074-11-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220616121611.3316074-11-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/16/22 05:16, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/cpu.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

