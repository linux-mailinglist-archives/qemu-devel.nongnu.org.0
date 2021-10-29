Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF64403F9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:20:21 +0200 (CEST)
Received: from localhost ([::1]:42910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYMO-0007X1-8o
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXkx-0000pU-Kl
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:41:39 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXkv-0005k2-3D
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:41:39 -0400
Received: by mail-pf1-x434.google.com with SMTP id m14so10126854pfc.9
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=loLc0INsHlhmfYHFbxQRkXYiMFrtUOEvSzDwf/BnAyg=;
 b=iw9N7S+4xyM+cMdA+D6yKcC835K6m1ly7NVhJ6r9EambAnmlD0L/6cjJg0zZazMB7c
 hbMwIqB4WwAVSQU3pjf0GdNhIlEuGWNHUTaQU0UrZBSabyrzjPW87Y2OBb5aewouBh1/
 2mOg2gHrVeaC3Qhq1cNM8QA5yhi58E5hTS/MkvT+sKHs66eWofM8LATHPsQXF/dTfcrv
 qxWxmZmLJWEuuk/e5mBo1pSEsDvYAWJEHhnoAGsr6k0btJ81/6h+QToLAFNu9eCSm9MG
 blcXaZkZ+rDhecp8VJv7A1b8PuE+yg7Su2GOaCTTnd8Xbof3F4iWCEcWhz4k0DWkgW2W
 t+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=loLc0INsHlhmfYHFbxQRkXYiMFrtUOEvSzDwf/BnAyg=;
 b=zqolBgSa9sp94uNdiLwlFkm3xny596cSvmiwIzLOcHeAWD7t5mwOOKa0z0h9JxHO8B
 wnfYNbjTVESEwQJSvOvQYvjFbicsKP78XJJUz5e/dN4M+EjbH5sUXUiGdGCQou/eY2/g
 wkAZAJG2sn/ni6MEwfeByXdTXvE1/1ADWcFxUKb9i+1w2omvmov8phj33ju/1OS9oYbP
 jkjgEU5J15o/cDswH08+yt0F5srzTlat8j9fLaYX1VUgN+l+7+1TN8LFt5k67POhR0Qa
 YE/DgEZKZ1f+DHY+drqXi7DX8gsJsLhSVARVvMvaXDx3qdaflSxueAZul/xxER6jeoWz
 qQzQ==
X-Gm-Message-State: AOAM531BuVlPwvaSvuHMXtaPiUnZy3/CfBG1QaIx0bW7vxW+SIUn/5mH
 wYGeDQTmilINgiCMVm/YkiAWkw==
X-Google-Smtp-Source: ABdhPJyno6nlhif8TFRPrf+cBgE7Wy+nERCX146ABhPXlh3/3Q4rRtGfKjpcGN0r4jOfWIh1YL40SA==
X-Received: by 2002:a63:6e03:: with SMTP id j3mr9671947pgc.465.1635536495189; 
 Fri, 29 Oct 2021 12:41:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pc18sm12797657pjb.0.2021.10.29.12.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:41:34 -0700 (PDT)
Subject: Re: [PATCH 1/5] target/riscv: Add initial support for native debug
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211029152535.2055096-1-bin.meng@windriver.com>
 <20211029152535.2055096-2-bin.meng@windriver.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75aca9b0-50fb-8b58-68ca-fab28a4b632e@linaro.org>
Date: Fri, 29 Oct 2021 12:41:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029152535.2055096-2-bin.meng@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 8:25 AM, Bin Meng wrote:
> @@ -231,6 +232,10 @@ struct CPURISCVState {
>       pmp_table_t pmp_state;
>       target_ulong mseccfg;
>   
> +    /* trigger module */
> +    target_ulong trigger_cur;
> +    trigger_type2_t trigger_type2[TRIGGER_TYPE2_NUM];

You need to add a subsection to machine.c to migrate this state.


r~

