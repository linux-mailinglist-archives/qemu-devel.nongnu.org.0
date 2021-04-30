Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1CD37006C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:24:40 +0200 (CEST)
Received: from localhost ([::1]:49032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXod-0003ol-J4
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcXA3-000543-EV
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:42:43 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcXA1-0001Re-3t
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:42:42 -0400
Received: by mail-pf1-x42b.google.com with SMTP id d124so6210008pfa.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T52IiCFUJ3Xija3lpXompRhuwi48bzpEE7A4A+mUMyg=;
 b=AQIXl89TwYO65l8yJdAfhDD3dGm/5W8ultSRJd2mWL3/kHPjWZLnA8ysJcezb3Zmik
 kKWIW8RJaBkZoYvkH6mPzlOcgmL8851S6DdZkF8UZP9Gfu5EXFXj397/d+EOoa6mOUg2
 OraXINNdhE4GQsEWndGOK4HPrvzer6bMLaR8TkrMBKZgaYlQrBvOna2HRB+Kq7S45jh7
 tov0Rqnfpq5knphb00d7DqQVtUZZn8g6coQTSbuhSxIT1f+i3dCUl1ai8sWzCKdLDgQM
 oid6qMfmHbWMe3O/8vaUGjXOiHUlvechpFGK0ajHeor4Tx2ZfzH79UPJxBWhf4XZeynH
 1lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T52IiCFUJ3Xija3lpXompRhuwi48bzpEE7A4A+mUMyg=;
 b=hcyfDaSOXCXhHNCtEnMcN8hAOAIjzRGop9ecIr2mTIjweyr+HL2PQyG+BHFyS73TCT
 bGNeymiCYPGw3WKGOX4H+EsgoDligciQwkkHVvh+csWBCGT+8oCPb/DH5MctRrvdzpDR
 UxPBPO8Pj1cdCXD4UP8PwkHDenGCT+uael+vY7fSEV+KJ0gCXw/0gFDrCJ+REU56BQgw
 iQ63uZvnYg//TUD+eFUYZZtqyqcYw9bhWz0QMu6v4FLVAes3QaO4VqPGNw5fXjv3r3u3
 G2zUeljADKhPunghGB71EubJAl2Vnytxp/TeQcbzKGjjioGvh4Ey3zk+T6dj+Ft5KhrI
 j69Q==
X-Gm-Message-State: AOAM533PAgKzk98hoCgEkjFpV/22thfjTqAcEXLV0cdKw1JhAdCqAyqG
 k4o3fA7sS+4pT9+asxuIq2fNzg==
X-Google-Smtp-Source: ABdhPJy1Wt5cZ0szSeDzrljSTHUeltdC39rXgKmezs8HqGUYLuy5ROS8iHCsYEYKKziNCD5CjQz1rA==
X-Received: by 2002:a63:e90c:: with SMTP id i12mr5509796pgh.116.1619804558964; 
 Fri, 30 Apr 2021 10:42:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w1sm3759893pgh.26.2021.04.30.10.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 10:42:38 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] target/ppc: isolated cpu init from translation
 logic
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-8-bruno.larsen@eldorado.org.br>
 <874kfo3hvh.fsf@linux.ibm.com>
 <dd389368-8778-57e3-5aed-bf56cde1df94@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f5193e43-728b-b775-681d-586feb594dd7@linaro.org>
Date: Fri, 30 Apr 2021 10:42:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <dd389368-8778-57e3-5aed-bf56cde1df94@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 10:12 AM, Bruno Piazera Larsen wrote:
>>> +#include "helper_regs.h"
>>> +#include "internal.h"
>>> +#include "spr_tcg.h"
>> These two includes look like they belong in patch 3 and 4 respectively.
>>
>> And we probably want an #ifdef CONFIG_TCG around them.
> 
> Just to make sure, you mean spr_tcg.h and internal.h, right?
> 
> Internal.h needs to be included regardless, since it holds some functions 
> always required for init_proc, like ppc_gdb_init. These bits will be removed on 
> the patch series that specifically disable them if we can.
> 
> spr_tcg.h only has function prototypes, so I don't think it's a problem to 
> include it in case of !TCG. Some .h were removed in the other RFC because they 
> needed files that weren't in the include path. If we should remove it anyway, I 
> can add that :)

I wouldn't add an ifdef for CONFIG_TCG.  That would just force you to add more 
conditional compilation elsewhere.  So long as the symbols are either unused or 
optimized away, we'll be fine.


r~

