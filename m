Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0533945AF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 18:13:47 +0200 (CEST)
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmf7K-0001vu-4G
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 12:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmf6R-000129-38
 for qemu-devel@nongnu.org; Fri, 28 May 2021 12:12:51 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmf6P-0006Ms-35
 for qemu-devel@nongnu.org; Fri, 28 May 2021 12:12:50 -0400
Received: by mail-pl1-x632.google.com with SMTP id x10so938483plg.3
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 09:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nA2q2/H2qgrc1iP0jvKsTYhz78Y+Fpwrg9RNUf2MgGg=;
 b=b3EbyMDqZlDEqaK1VqoyNvefTmwNBjrCtf54zkOXJXDS9xOKJwIzQpq3zNTFRnfPxy
 8Hxf1zBeeVRgzwimH2drR5wqPB0U8/GLe270qa4/cDji2gKcWS9ST90qRORDt1i2sLN9
 ILEyHKKGsfQoD1kSjUUnoBhxSNVJAn+nHEI+eeHxbRLO0mbLtexII+8AMWwd1/3+Y6FW
 wwMeUsa3jUudViH2rKsYGaVd2+tRwFSFdNwPKS1RoFbXutMEsGCOVKUSucj/1jjG5Vny
 LP1tiSFQ95GWcO6TRu4H6jPA9PFh0g24+bXNvXcmtcx2I5yhRK64fBSzMLxUTBZl49co
 tLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nA2q2/H2qgrc1iP0jvKsTYhz78Y+Fpwrg9RNUf2MgGg=;
 b=WZPO5M8tJ6bcN57VtarSXTa7XJWay5aAhDAirPnVCkLPPxOLdm/e7FLbbLzqrQynvo
 IwXs7ziaWd/qgKDI5Ldy4SylUfCYfKaEv14y5OuqkoNdyJBqEJQw3vRSTSKOfFwimNLt
 AVh5Rc0EwAaFZ8exjCaXBwgiSrH2wgwv1K3J5giSh0zgdJY/8z8qHBMhn0Brcx73V7CL
 odhq9LSHPMpRN8c2N5aWzAuXN95Gqx/FFkbXtQGG+aFFnRuXCLkr4OehJqLIdYRYW4nZ
 M9FS4PX63pj/oivtKV2w9evukHK46X2RvShz8u3KGSRGvJFTMzFouibOC0zfAVRwaBSp
 vZYw==
X-Gm-Message-State: AOAM533F1j1sGWxxcYgMAQFWtUHNJygTrAOdLMFhTE+cQjL1PZd/3KGm
 7AjXLllCmXQtlqG2U46ZBMiaaw==
X-Google-Smtp-Source: ABdhPJy8rYYNrgVMfmWGKH5f7y9AoPYfBtvFT1E5+8BG0szrMaQeFtKS0uvQCn2z4heFgkOLOlT+Pg==
X-Received: by 2002:a17:90a:9f43:: with SMTP id
 q3mr5327546pjv.227.1622218367217; 
 Fri, 28 May 2021 09:12:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p36sm4738917pgm.74.2021.05.28.09.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 09:12:46 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] target/ppc: removed GEN_OPCODE decision tree
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210527180801.40513-1-bruno.larsen@eldorado.org.br>
 <20210527180801.40513-2-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6117760b-df66-3333-e610-87110d28f296@linaro.org>
Date: Fri, 28 May 2021 09:12:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527180801.40513-2-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: farosas@linux.ibm.com, groug@kaod.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 11:08 AM, Bruno Larsen (billionai) wrote:
> since both, PPC_DO_STATISTICS and PPC_DUMP_CPU, are obsoleted as
> target/ppc moves to decodetree, we can remove this ifdef based decision
> tree, and only have what is now the standard option for the macro.
> 
> Suggested-by: Luis Pires<luis.pires@eldorado.org.br>
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/translate.c | 79 ------------------------------------------
>   1 file changed, 79 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

