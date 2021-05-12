Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AC237CBA9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:59:32 +0200 (CEST)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsCp-0004Bj-FG
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgsBY-0002nx-8J
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:58:12 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:43664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgsBW-0004NR-Kp
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:58:11 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id v18so2261632qvx.10
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w2M29/VXIvvqmYNNiWRqJw+9pOm2NgbmSo+qRargsXQ=;
 b=mTremwXp+lFHtHMr0iEq9YpmOJ/sfDWwEFLAShaLn+khzj9DXuR1xTeHdqQvumOwS4
 TOREx7Ztj9GIFnzfUDWGIn9BIA6d2TXrYiBiqudEOtdxJ8PZzaobnsUFOOQs23vmwssD
 DcnmKf6vKll+4O6+8R+2X1urhef9x3MWtNzVoPAuBTGJCcP61BrnhN4e6lFApXzKfOwu
 vATbqbdZi2K2n6hrYQASjQqxuez5C2yjRjncNUrqoRuK8aF97WuriHV9H9X17bpxodfE
 sxDqXGAPuaFogDfQ08QdUC2T9vbBIUlaBdaab7T/tpExL0je7cR46ENBAoQ+C1GNSuxk
 NJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w2M29/VXIvvqmYNNiWRqJw+9pOm2NgbmSo+qRargsXQ=;
 b=M+rnkSG/fI3eXxBXYEQz0HfTF1fKLizHioLukzdRSBQykWb1jnMCiuBLAF9sOPUA3i
 gA/1yUlLdheakh0DC2wFmVsHy/AcWzrJtAhBR2VVIRSv1FJYbWprPfxQbMbjLhbO7fxS
 Bb0d3rR9865V1DHS5ObImUec3QadjbGU5NGLqOHyCQdXnazh7DmFo9lw9Jx5Xgl8YvQz
 6ZTrWS3wW/93p8Mu036pJPEZHS/4CMILcQn2LMivkhryYH+sxC5kueJT5JhYXsTLgwwk
 aGJntIQxUgkIcs8jucBDfB14XipERQPYzSllmgDxReCIe1VdbITxYFd1uoRDyz2xPn+b
 w72g==
X-Gm-Message-State: AOAM533jLXLeojtdTu4uaEniXh9CwY5C0/Ii02dXW9jmD0sYE4RqOFeI
 Tlg9ckApEajSHLIeZAo23PTNmw==
X-Google-Smtp-Source: ABdhPJyG5K6FVseWPQELcEYQBiLWHHD23D0GCsCHxFveUdEfiFpShKpMN51sKgU/9hZhmOmnLjbCoQ==
X-Received: by 2002:a05:6214:94a:: with SMTP id
 dn10mr9159799qvb.26.1620838689522; 
 Wed, 12 May 2021 09:58:09 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id l6sm417316qkk.130.2021.05.12.09.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:58:09 -0700 (PDT)
Subject: Re: [PATCH 03/11] target/ppc: moved ppc_cpu_dump_state to cpu_init.c
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-4-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44ea8f63-4b6d-a06c-1c0b-4ab119a07115@linaro.org>
Date: Wed, 12 May 2021 11:58:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512140813.112884-4-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> This function was forgotten in the cpu_init code motion series, but it
> seems to be used regardless of TCG, and so needs to be moved to support
> disabling TCG.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/cpu_init.c  | 182 +++++++++++++++++++++++++++++++++++++++
>   target/ppc/translate.c | 187 -----------------------------------------
>   2 files changed, 182 insertions(+), 187 deletions(-)

Not just "seems to be" -- "is".

Indeed, cpu_dump_state is called from accel/kvm/kvm-all.c, and the monitor.


r~

