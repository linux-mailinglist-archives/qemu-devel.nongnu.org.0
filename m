Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601A244F7F2
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 13:51:33 +0100 (CET)
Received: from localhost ([::1]:47028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmEyp-0006kg-L3
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 07:51:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmEwu-0005Pf-Jb
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 07:49:32 -0500
Received: from [2a00:1450:4864:20::336] (port=42737
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmEws-0008Tn-LO
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 07:49:32 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so10279033wmd.1
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 04:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=64gnf7OEU6vtYppEekQ9uumBMuERG1RHir8D4b/tj1k=;
 b=WQsoiNqRBLDVDIiy5ccYlFGxa6sq76AHNi7QOKpk31zjt8/w6ASKu3S5inqvVG5yLZ
 ta0f+YNmExpy4DKP5AUhphOOH3bHWFElEYt1OaVrWnWmTvg+aBX/N5EVnsOyPYptFDTy
 YWu7knk9EWOpzoRss7XYCCw2P0RjHp+Me4t3DbH7rp+6zbFwthDVJZtV8OkoiXd3DI2j
 mhol/+kqnvxYPzIieCdWnDid+burovVZB+BwawME7/iT6/Bqv/y7/9husTqdYe84BqN/
 Ar9WHQh5VGfNAoUMSjVldfox5SFb6Yr+GyZuyTBQV/6sm6uWwTKQbuiaNnciLHlvJw/y
 rBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=64gnf7OEU6vtYppEekQ9uumBMuERG1RHir8D4b/tj1k=;
 b=SwSbF7cpcuP94Qf0M4OYaG85vTb7DhPMf3DYCMGTG1BOezwppS9HrXLpYXVHyaT79g
 iSS30xVKcB6olGoeUSy7Op6++pQCPwY8JNNm/PV2mqGMcUrrXFfJnP3hn1wUXhvut/im
 8l3Sg8mgW8VxYJhEfWenUqe5f/iIKav+S39xjsRsz5pE9tmBIcpoxcfuaOz4Ix6+9Dny
 f+Ui8g0YEgO1VsD+CW+Sun2IeQLCdfHlO8E/HrOQUE/Gj9ZJ0/S81LwrhCNGu3aU3V/a
 w4CYC/z7SxCuHrG1CM4GRkexSdsIMjzsAGT+IowVRvZibyMmviBT1dO3PS/mXt9qx3oV
 d5aQ==
X-Gm-Message-State: AOAM530sbHBefdMDOr8nGCXJtHZopBHtuCn9t5zc9yIWNyU072A6pUWw
 qGB2LwhO916TFU+VdDzMcVzhBA==
X-Google-Smtp-Source: ABdhPJxQTZspoMDsbA4TaVNgx99ZUSk9SbySADR4NOnmJ230TQq+aAEWvN3lNMRwvlZwnjNJ9FyIqg==
X-Received: by 2002:a05:600c:1c8d:: with SMTP id
 k13mr50641719wms.177.1636894169192; 
 Sun, 14 Nov 2021 04:49:29 -0800 (PST)
Received: from [192.168.8.105] (60.red-95-126-179.staticip.rima-tde.net.
 [95.126.179.60])
 by smtp.gmail.com with ESMTPSA id g5sm16690867wri.45.2021.11.14.04.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 04:49:28 -0800 (PST)
Subject: Re: [PATCH v5 01/18] exec/memop: Adding signedness to quad definitions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-2-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd4da247-4849-48f8-f9b4-aa312a370cd6@linaro.org>
Date: Sun, 14 Nov 2021 13:49:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211112145902.205131-2-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.402,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: bin.meng@windriver.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org, palmer@dabbelt.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 3:58 PM, Frédéric Pétrot wrote:
> Renaming defines for quad in their various forms so that their signedness is
> now explicit.
> Done using git grep as suggested by Philippe, with a bit of hand edition to
> keep assignments aligned.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

