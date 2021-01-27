Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4BF30674F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 23:57:58 +0100 (CET)
Received: from localhost ([::1]:41510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4tl7-0004is-GI
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 17:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4tjM-0003Ts-04
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:56:08 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4tjG-00030H-Uq
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:56:07 -0500
Received: by mail-pl1-x634.google.com with SMTP id r4so1969123pls.11
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iO4eJzDErEEcVSVS5SXYZgwyL/CqDb1NqCJviKl3HSE=;
 b=Ye6gMlVcw3xMf3RTQb+ZZn8hGkhCh94ddeUhIiNLNzU6ESRWUKV5oL8BxGd0i/s7nJ
 RmtrQMOaFUU/FqBkaAKB1/MfOFARYImmreHwPfmFE9lC7oDD8avRLbJ4k9smFm2nSkNg
 JXbLCyYHk+g+DjX/ia6PME1MiYmX4nPGMycTkyrPM2AodpumyTTJF806TYtNxRttstES
 CCf7R51EMd6cSaYtSL+Av8SqnpIW23HqkFwFGJMM6IhPFXzBt745DFij5KEvH4wt5RXg
 eQjLCedgzZjApRLI/+ppVG+FWlI/BUjCUwCE4Y45HLaCI7P6zJpVxFNtOHVaBZ8udswj
 1y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iO4eJzDErEEcVSVS5SXYZgwyL/CqDb1NqCJviKl3HSE=;
 b=dsepkrR40Xme/t8AXZxh/oJHfK8Tz37IXRfXVaorDcLSpbx3lIwAe/19dk1GkT/7Ta
 rloDTUooH96WzsmK5i8RLKV9ONW2RvEkycPOOoEuW+vXSoSNXI7/4hlkETFh08sTMJbK
 85RTCa+6UO24DGIi7DFWMBeTZFb3S5HGkBiFa/4aKWt/GjORw/rB0ba5F92b2fcmmBSg
 qx0XTgfHsjk0/oORTIgxuHpaPkX8iJ/vXPOtD+zs3ZEaYI+jFJthD1VcG3fLCkkKluoq
 xb2cElTBsncu4+8dk0cxr/M1naIq6JMFWSHVC1ZE6PeQlk/yOt9p9z1a7kkGAaDHk+Fe
 +4zA==
X-Gm-Message-State: AOAM531H9svx9pA+vn68tuHD+IV/uA208fpQqw7xndXdVY0tjU6d7IF/
 ktnQLI+yCUGD7jImzCG/SSIhUQ==
X-Google-Smtp-Source: ABdhPJx8aLjT4qKpLneyTvEmLYLZVLZu0UYYT3g6SCJ5CKofUcegSGBiUAwYVGRANyRxV8XPPnPlJA==
X-Received: by 2002:a17:903:22c2:b029:de:45c0:69f2 with SMTP id
 y2-20020a17090322c2b02900de45c069f2mr13276518plg.26.1611788160824; 
 Wed, 27 Jan 2021 14:56:00 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id h5sm3238424pgl.86.2021.01.27.14.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 14:56:00 -0800 (PST)
Subject: Re: [PATCH] tcg/tci: Implement INDEX_op_ld8s_i64
To: Stefan Weil <sw@weilnetz.de>
References: <20210127210737.2050633-1-sw@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <19125e5e-c67f-2abd-ef70-72e96296a47d@linaro.org>
Date: Wed, 27 Jan 2021 12:55:56 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127210737.2050633-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 11:07 AM, Stefan Weil wrote:
>          case INDEX_op_ld8s_i64:
> -            TODO();
> +            t0 = *tb_ptr++;
> +            t1 = tci_read_r(regs, &tb_ptr);
> +            t2 = tci_read_s32(&tb_ptr);
> +            tci_write_reg8(regs, t0, *(int8_t *)(t1 + t2));
>              break;

This doesn't work, because tci_write_reg8 truncates to uint8_t again.  You need
to use tci_write_reg().


r~

