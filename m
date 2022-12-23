Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C7B654F59
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 11:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8fgh-0002Gn-Tb; Fri, 23 Dec 2022 05:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8fge-0002GZ-JB
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:54:00 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8fgd-00044m-3a
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:54:00 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so265436wmb.2
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 02:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SAHOH9SY4f+Nix4YgQTLG1uaVGdtf4nj2lc/GwCcR8U=;
 b=phcA9fE9gE7pHaYUuvTfzfdzkOznlpUOuSQNVyUpxKtuLITjmFLA0oZLVY5I/tAY+Q
 W894JOmWwywKQce56aWJQ3evYJwVRejImjEkJbkuVR9sSQjhIXHwfzFdnnqZI+11CMCu
 oh+G4ie22qsFoi8FHPHr8+H/g+mtrzEn9xRNkQrm3GA8qk6+DZgwUCWeDQoi7pRqOda8
 xsqgcGBP1S6OgPPuK+eb+BT2ThUREMHrJvYW7u7XuFHbMypY1tRLJ2vcJaRzJEsuygFa
 vFtyJJnWDEV9laIdzBaJF5UHxXGohsuyl1KdKTaR69xFrxrByTDov3MoVQapUyLFqe2N
 IW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SAHOH9SY4f+Nix4YgQTLG1uaVGdtf4nj2lc/GwCcR8U=;
 b=0VAgzXN4QWOl/U1ngdzaF4BYKpndz8HRnzY8lQruCNuJXb2PAw/c6Xk8zdjZemBazV
 TGRuFzcglorLrdv6kYCqD1xRoTr/flic//7iRhZHTIG9F01Vf9dcoU+iMnZUqU6OfmBM
 COAhtg2WxgxG226jWdCy83LkU3ryPCylz+hNyEARkvjTkz1EClySdQA5WEaNjQHTDj9V
 9edh/mfnahuBFhF6+E1aV0fBN+sAvjiuYxRmBPlFoC7jb45xUKjQGbEgRDCGxKGJvlCW
 3VLu0QyxsjztXo3It81gs7ipAWlU4OP/vM7v6+YkO1QtNKS2xDjODZ2ZNacHBlOezzH0
 1iug==
X-Gm-Message-State: AFqh2koaOMZ93iv2vfYLG8gfmgPxafkTbUCAAKXFWjdhod1jexN9fuQy
 66lsKJnu1b1ayvlW+5r8gLCZ8A==
X-Google-Smtp-Source: AMrXdXuI3ibl0eHEX2eSP+9IPmcCQNOoyrFtLw71lLoipxtJRhTQxBnJr++7bUQl325q5v3nZCrBlQ==
X-Received: by 2002:a7b:c408:0:b0:3d5:64bf:ccc2 with SMTP id
 k8-20020a7bc408000000b003d564bfccc2mr6536990wmi.32.1671792837414; 
 Fri, 23 Dec 2022 02:53:57 -0800 (PST)
Received: from [192.168.27.175] (160.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.160]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c501000b003b47ff307e1sm4324233wmr.31.2022.12.23.02.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 02:53:56 -0800 (PST)
Message-ID: <9ebc527e-f09d-e758-374f-83fbd607b1aa@linaro.org>
Date: Fri, 23 Dec 2022 11:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] nubus-device: fix memory leak in nubus_device_realize
Content-Language: en-US
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20221222172915.671597-1-mcascell@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221222172915.671597-1-mcascell@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 22/12/22 18:29, Mauro Matteo Cascella wrote:
> Local variable "name" is allocated through strdup_printf and should be
> freed with g_free() to avoid memory leak.
> 
> Fixes: 3616f424 ("nubus-device: add romfile property for loading declaration ROMs")
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>   hw/nubus/nubus-device.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


