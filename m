Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B36D83C2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:33:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk636-0007EG-Qc; Wed, 05 Apr 2023 12:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk631-0007Bx-R6
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:31:47 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk630-00075N-5I
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:31:47 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 j1-20020a05600c1c0100b003f04da00d07so2341423wms.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680712304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/gPqPq+LN02KfQRHJHlX4w3FLTZ8XrtDcfdpH3kdF3Q=;
 b=yuyrjlvJw3VVARcTesMbDZ4rgODL6EZ1tTQ94mi3fW+x2HMmc+IGJbEphHePCA97Kk
 trxityIDzGhUWEshEEyV3wGdJocJtxpxMtFtk48LTuoTdA7YtJ1Wo5A5xyX+zI0RFfjM
 mjPoFwlLEz7Yb/MVBwx/qiNn10HVGsuunoAfaklAWmFX+4kdXL8ZCH1zRkB0TtC3GiVM
 RNVcQhaH9a0bjkQhap3WpS5jRWHrUYGZq3M1SpFyNHDz/XE4fA5hwpLWSh44H9C+j6aB
 t/nIQtZKQBeTROoCvmVfeaPpMaE7HsAc6f5daZfW1+EHN25DPC/8kfR9jff61XEcQVHx
 psbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680712304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/gPqPq+LN02KfQRHJHlX4w3FLTZ8XrtDcfdpH3kdF3Q=;
 b=b/pAKL4L24CKJSqSMAhxtm0hCt7/U7Of5e5SXsSHrW30KN7ToDfL0wUPwOZC14uBLt
 dE7DnEY28Q1AZL/G6EuK3P85ExzLR073UyfCBD28lKvyfwag5naBieKhbbnWxpnfoybV
 0+XL6TW1OXgBouO9sfEIfKkPlJEwllvHDkjlFzIrn2OQGMZ2sKLbyTMVck+jHbslp0/B
 ikb0UY4X0lBFxVCFO47i7nB1BRa6m72KHUOXe2uP64A4ZgI9wVCvvOLkCQh/l2wq+0vH
 ltSXTIzxtdmHHkJlblO0YwOxRdJM4Rh4uOu+re91Fva1J6AZoJwPLIPuLHX8U8p6m7oU
 3UXw==
X-Gm-Message-State: AAQBX9f6LaP1O+G3D6UUsIiuNK5MPKEPwUIlVTPY1W3jvnRVxtYtzPXV
 /VQIMZKw86Ei9fekC/sUbzJp4g==
X-Google-Smtp-Source: AKy350aYphakbYMO7xoigILbVI7SrEMB95nLpH6sxwnnmLlQ0QueAVHP2lYPs9HnbqlU8AaqkKRL1Q==
X-Received: by 2002:a7b:c7d4:0:b0:3ed:809b:79ac with SMTP id
 z20-20020a7bc7d4000000b003ed809b79acmr5121698wmk.19.1680712304443; 
 Wed, 05 Apr 2023 09:31:44 -0700 (PDT)
Received: from [192.168.69.115] (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr.
 [176.184.52.81]) by smtp.gmail.com with ESMTPSA id
 h9-20020a1ccc09000000b003ed1ff06faasm2667915wmb.19.2023.04.05.09.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 09:31:44 -0700 (PDT)
Message-ID: <82fb447f-f9b2-cc08-5be2-e5673f59fe14@linaro.org>
Date: Wed, 5 Apr 2023 18:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] hw/display/sm501: Remove unneeded increment from loop
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20230405161234.6EF0A74633D@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230405161234.6EF0A74633D@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/4/23 17:57, BALATON Zoltan wrote:
> As Coverity points out (CID 1508621) the calculation to increment i in
> the fill fallback loop is ineffective as it is overwritten in next
> statement. This was left there by mistake from a previous version but
> is not needed in the current approach so remove the superfluous
> increment statement.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/display/sm501.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


