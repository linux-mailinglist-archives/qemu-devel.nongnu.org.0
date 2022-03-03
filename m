Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EB14CC022
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:39:16 +0100 (CET)
Received: from localhost ([::1]:52464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmbr-0005Fj-Du
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:39:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmZB-0002ol-9E
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:36:29 -0500
Received: from [2607:f8b0:4864:20::1032] (port=46851
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmZ9-00034D-S8
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:36:28 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso4999372pjo.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 06:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ICs+1uQFtH/X0OScSdi2Rs/kw4u/voxp91HreJsqBJ4=;
 b=EqyU3SseIFQbHo9OoKw6X6Ogkgm7Ykta42vSLUFJ5THEZmyKOdxVLEYHP4XDR443Md
 djJjVdQt0iXmHEb+8xIcvCW0X/PFzTn2WEekKy1JL4K2m16juDzUd/BMmtwWToM4k0/R
 xHVA213ac6a/wAMfmq92lp7koGqcLu6U4c+CUf/0efmh2ptMoEXSpHGZ7hOMVm7gXAvU
 wt6vBJzMOZkuLNFVa7ZKS5bNf1v54g3LNuvdqFNAWUW49l8CMEVo2cbWp6qbWLX+O0kC
 LOjsiGA3DGTLfK6S1pYXJnoo3YtX0ZYSy7+oHFxExgXMFz2B1W96E9hR+vK8AM2cz02N
 U2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ICs+1uQFtH/X0OScSdi2Rs/kw4u/voxp91HreJsqBJ4=;
 b=yJQHgO7VmzfUy+4PcMFnOuIkKUfj87w0Tdp3WWFgZ0IsCgjrq7n/AIC2klgyOHTLRW
 T56udfFEKa/yGZbwEpA1J1y9OtFYWGUSJUMPZhomqfkoODOadC9lDld9rHlNmSASezxg
 v1hSrNYhOMCRKftC1Y9JdVckPS8x/zPf0By8Z6Rp9o625Oyaa34zxNxzRI2BgEt9qTXL
 o+SLSHAhqJFIopnHXpA/KiIo+3KNqdVXLJmozcG24fy6WqgeeZS1KTv36JHhl0VtTH0f
 nQKVACn9+1n6cLPjsfOfQZy76aaa9laSgLw60wT8mTfSxItnk70J4+5sD/4VdcpWz4Uo
 ObMg==
X-Gm-Message-State: AOAM533wTGe2RFcg7hCo/9Yub2B2LnyoTctAhovDzqKsuhJPBuGiI1v2
 1UJ4EAR3KZnSQIaTeWR+UFc=
X-Google-Smtp-Source: ABdhPJwDF9NkTCglPcThqsS7ADF7suk212aNOeFcreR/1Otem/6E0+CtQTOct20069AkQ5elWuIhlg==
X-Received: by 2002:a17:902:6b0a:b0:14d:8ee9:3298 with SMTP id
 o10-20020a1709026b0a00b0014d8ee93298mr36460551plk.125.1646318186368; 
 Thu, 03 Mar 2022 06:36:26 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 k7-20020a63ff07000000b00372dc67e854sm2313879pgi.14.2022.03.03.06.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 06:36:25 -0800 (PST)
Message-ID: <75174510-47ec-3d73-f301-352e2e3421f7@gmail.com>
Date: Thu, 3 Mar 2022 15:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 07/14] none-machine: add the NoneMachineState structure
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
 mark.burton@greensocs.com, edgari@xilinx.com
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-8-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220223090706.4888-8-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 10:06, Damien Hedde wrote:
> The none machine was using the parent state structure.
> We'll need a custom state to add a field in the following commit.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   hw/core/null-machine.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

