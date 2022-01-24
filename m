Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81248497782
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 03:47:23 +0100 (CET)
Received: from localhost ([::1]:49684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBpO6-0000N7-0k
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 21:47:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBpLx-000832-Nh
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 21:45:09 -0500
Received: from [2607:f8b0:4864:20::1031] (port=55952
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBpLv-00059K-Vy
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 21:45:09 -0500
Received: by mail-pj1-x1031.google.com with SMTP id d5so12533219pjk.5
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 18:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CoA4nqb4W04/lKV+O82gXPiS6GOH7UDaid3HCr8C0vI=;
 b=y4ve/qeaUG3n6fpLxMSkLp46ceR3rtwTJGebIRn/muxg6GRsji1UCKRHwuE6wBj5gc
 wQGbGpW/CqO2vq6oDTZw9+LPiRZ0ckikn1uVfKEZk5egAKKqC1qPM/XZrlvo+vg5zDHK
 qr91zAs/LfBWuAn8hAoYE8cDR1lwtaW9pElE6fRniEGofj3kUGveF+CUa8a5ogDXv2BX
 WRqI0B/n/qHBgmO35V9PzCxFIYhS3guxiYChEdFnsA33F0wr4fiQ09EWhXeVUyEWegta
 U5JhgZ7SRTA5pdylbJ3TXbtPSi66DSAlmU7cvMYA7MqZn/KXj3e9xd56EHarcsS+C/q5
 8v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CoA4nqb4W04/lKV+O82gXPiS6GOH7UDaid3HCr8C0vI=;
 b=CxzJh37d+SEkzYHeTN5rNAirjDVLd0KaNG9PGwVFN3SVKKNyt9fsuUWDQNJa4+xSuv
 l7S9GvD7Pw/nb8w1QNeDluSRUj/fqYGP4kIGs0p3l0DApI+csb8YOrK9iaCf7ODeacVi
 J/RKmvjmNSKC/pWjr2FaEqax3ArYAHsHmY9WirGHqy8mVEuaAoaVg0BhMGaSIE2wGPLd
 ms8LIVxIs2a201334nErW7S15phRGJrmj60/8/IRQTpH3sMoePpYPSb07t+H3R7TcD+q
 0iZR12RkHHBp4wuGmcEgA1WQZKSL84cxNu1JxVaEJfyIfcQ6EqzJ9otsTFOMKqcx/YHT
 9mYA==
X-Gm-Message-State: AOAM531okKUalcxKl1aJnNzyODdgWn7rqo/8Q2BQQ4wS/R1Loa+kmOlN
 N7w9KdT7R+K9bq3KVHlF0jJeIA==
X-Google-Smtp-Source: ABdhPJxMTvgJpDBKBA2B1mPRHNdNDJN/8ATEYrLWXMuOtW04vOElKTbpVyzwsfNOENGH8IbcYBDlDw==
X-Received: by 2002:a17:902:b113:b0:14a:cbf9:bcc6 with SMTP id
 q19-20020a170902b11300b0014acbf9bcc6mr12599120plr.150.1642992306345; 
 Sun, 23 Jan 2022 18:45:06 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id s1sm5484692pjn.42.2022.01.23.18.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 18:45:05 -0800 (PST)
Subject: Re: [PATCH 19/30] bsd-user/strace.c: print_taken_signal
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-20-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <500c45d6-4a7f-32a9-ac15-1382c9b08bb7@linaro.org>
Date: Mon, 24 Jan 2022 13:45:00 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-20-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:19 AM, Warner Losh wrote:
> print_taken_signal() prints signals when we're tracing signals.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h   | 10 +++++
>   bsd-user/strace.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 107 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

