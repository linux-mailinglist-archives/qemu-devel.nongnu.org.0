Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015B433F3F3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:23:47 +0100 (CET)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMY1R-0004r8-Bg
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMXi1-0000tX-NA
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:03:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMXhy-0005YR-M9
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:03:41 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j18so2165714wra.2
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cc03Djw+vrpkKhIfzySy4fjTbB1/6qB1mFaiGTS1EmQ=;
 b=f+zx16EaYCD+SWG85irwqfo2AfcMghGVGuQIEVicwwucuu/kzs/i2tws1iU9+Ru5VT
 KQNyJH69ftSTALitxx1PjlAFn5qV2jhheftAMoNGCXJT5kQzNPnFi0vKy9/B8n5PbKbQ
 OeLptnkq7vJp6m+U6PKpaiEhu72s/sGNMCtq8UOUr+3fq1Sy/mFVTrN3y38vWAz6HlXV
 9TW2urIxaEPMX4qfJMD8b9FtcyOwt0VPEa1Ce+jzcNWWa/Wd4AyQcuqrmmFVfhY0IMuN
 8oGzgz99VIKVlB/50wtpgiMTJ7rXniWWULpyyyz9tR3xRf9KvmcZA7YErtmZFyc9row3
 /54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cc03Djw+vrpkKhIfzySy4fjTbB1/6qB1mFaiGTS1EmQ=;
 b=dDAPeyrH/Fl9wKCJGlXmeV3S3Qv2EbAbV6dpNjz+8/ATAvxkJZWOCF33yzH2kmHpPk
 DQ9AyyqsE9PkbJq+bhWAVjPdzUhdkxITjI2rjCG4uBrY2I7aBJdiFlQZgyGjSUMc5HOi
 0ZNx6hC12/1wvBdBQ3H2S0HFmco8jjjCtkThaoV/VF7RXBSeF36tjruNvnjNuHQS5/gi
 rp6otilbE4X4jOsD3O31CgMT4hu6j7EDsKlQmZhF/4lc5CqTFZ88a1leYbnA4och/fwl
 fWG0DwzH8JuRHo+Ak/iU0ZNefwk4oO8YvefJMKtpPYNjOEEsKPwMwNpykHXpiPqTA/Nc
 xxHA==
X-Gm-Message-State: AOAM5328NAznvg4QeIp+ble5a1wP1YhkAsQP+IzKuBdhtaomTRGKiElf
 1A9oXTnmwr6c/w/mJ+qtfgM=
X-Google-Smtp-Source: ABdhPJy/TQYdFU1SyZyT8xwqRLwC7YJox2WP9vRXiuww+4pkzA8JMJTcRqbG2cAGEDI5MaOrsLuSzA==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr5022341wrm.260.1615993417221; 
 Wed, 17 Mar 2021 08:03:37 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 13sm2744710wmw.5.2021.03.17.08.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 08:03:36 -0700 (PDT)
Subject: Re: [PATCH v5 27/57] tcg/tci: Split out tcg_out_op_rrs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d0876de8-6775-d2ff-bb76-faf118ec97ab@amsat.org>
Date: Wed, 17 Mar 2021 16:03:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 84 +++++++++++++++++++---------------------
>  1 file changed, 39 insertions(+), 45 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

