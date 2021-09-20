Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E762C411D95
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:20:22 +0200 (CEST)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMxp-0005pK-Vu
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMuK-0003Th-1O
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:16:44 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMuI-0005kg-LX
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:16:43 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mv7-20020a17090b198700b0019c843e7233so460017pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=eaP/vql8zQ21bYLQpfAqcTvCMojiT8uCH1+SwZ/e3aM=;
 b=UskqixisHgdUcDVyzVhZ72gxYTV9E7XixjBSN8dHu+9So6e7sYbq/4jQqDaYfDSHng
 EsRNHlJws6Jo4dfVkTODiYyFSGkFWYAAF8+l9bMh8HD6BnnMFW8FaqUER00F+uSgaBCw
 dDP4W/W8GiqEwPGUtfJM/IZ10hEP5v/C3WkvhGh9po6SxG+lZ7sTAh+ZbK5cN63NPJQ5
 u+W7OtdBb7qdvp+h0UAiwIDeXrUMXYajeeF9P7rOLovuEg5yUCycl3AumEPKKntutPZ+
 6JX2YeEqk4cdfPEmVS3kh6621oAqAR9uJZbWS5o2Bs0JVTjt5T+6n+5FTgO6RFLKJmKH
 0H6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eaP/vql8zQ21bYLQpfAqcTvCMojiT8uCH1+SwZ/e3aM=;
 b=YF+xFV2bxprKZ97D+lN5P1AIf+PlaF6l23AKxQyb20hjdqzhn5SioSQkbl/Bg52V9T
 GK/jZJn5ZmzSJV3Rgg7LOsKfIQVVKjyhkVSLv77weEMR7157v2o4Vp6mFUnb9YgRwlFL
 u6qPIvSKPiJrQKnEwOGlMhLpUbOkEZ8O/xdqDMTu4Z5/5KbKBTldWiTuTXhJ1et+UeZ9
 5otJQYOIQTAkbxYJCM/h37jyiG87sDFLy1q4YOKdmqcZaWOM3jN0A7MdaNG4Yg1QqvA0
 bxseNm33fqw2FRNkHhwiFPJexpX1WsMfLHdvdfoFRjhEk+ubvsWq1qjWyEuATwCKBaSU
 mvzw==
X-Gm-Message-State: AOAM532b1pAEDhooIzuQreixQAzCs1VVd8xghiIwi4P/eyG3tqZMb/wr
 3UveNGrltYW9TORjvjHBmowZGGdmIISygQ==
X-Google-Smtp-Source: ABdhPJwIo6zmQ9bUwyWjwot3TgKuAmR0s6eD+L7rNyEam7sqYDjWIejYoGJmv8KoVypItZo7hGNfAQ==
X-Received: by 2002:a17:902:e2d4:b0:13b:9402:fefc with SMTP id
 l20-20020a170902e2d400b0013b9402fefcmr23801719plc.40.1632158201126; 
 Mon, 20 Sep 2021 10:16:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s4sm2743613pfw.182.2021.09.20.10.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 10:16:40 -0700 (PDT)
Subject: Re: [PATCH 25/30] tcg/loongarch: Implement exit_tb/goto_tb
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-26-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7cae865-bede-d97c-8b16-0322148d15d5@linaro.org>
Date: Mon, 20 Sep 2021 10:16:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-26-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>   tcg/loongarch/tcg-target.c.inc | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

