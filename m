Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0FE38F4C1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 23:10:22 +0200 (CEST)
Received: from localhost ([::1]:40074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llHq9-0005Xj-ES
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 17:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llHoX-0004Tm-HF
 for qemu-devel@nongnu.org; Mon, 24 May 2021 17:08:42 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llHoU-0004oa-GM
 for qemu-devel@nongnu.org; Mon, 24 May 2021 17:08:41 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 n6-20020a17090ac686b029015d2f7aeea8so11991405pjt.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 14:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VYbRJUn1eFhM2Sgpp338c0wC/kwuSosaVBkPWrT/8ac=;
 b=nbj9PKQ8dihCuXNEtRRsOhQ5NCGtRCl8Qlg7EZgYTfMDgQKLuoSFtGjA2mguDUqw5N
 c1VgM4uYJQXgA8coZBMnKRZXGO48Gzx/BF1+hayy7hrc+Ko7XxJeaclzxyTuX2yGiL23
 keVPuUybxVHMWA0fLzDWg3p+aAAPMWijWA8Xofa1ji0bNRU4K/kJ8IZurHusTbfU+SzR
 PLpz96l5PrND+W1+jWYNDrEl62C5StVu1rlb14nprfggmuVnjQLU8nSRuy5EiZShLMOC
 sjduRRr0G1QqCz92kzoezma1hMvXSEEqV3NhQtHnvfxqNsMGPVnLUTZzuyVDiVh/6PbX
 Vhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VYbRJUn1eFhM2Sgpp338c0wC/kwuSosaVBkPWrT/8ac=;
 b=dmTgmuVnyh9CnWHb2F85uzM/mbzAeQGGgnblwhvymKZeGjcK/LKatylIiHg+Yw3PkX
 lBxcT84PDc/1eaOjpBqxpSCkWVpwID8rWYcEtXSNidcR47aaRNpTqebMYjDOrMTwhN5C
 MqR/XxQaCZJzEPPPYLT90G0WfT0zTVCJBSCy46QYL2PwmBo2UMT0Obgg1vEi7wbWLK3N
 Vso8oFwmo14FOP832haioymQfDhXdcnZqiHdOIXLwylRBLVeAMzEcYFyqk1KAz2O7ZM2
 gb6CcsZCRsA2bBt8uXrQN9RByq4NKSxKVgITNMHejnt13Ikl2uBA4tuHb7P6NFpnFsGT
 7gOQ==
X-Gm-Message-State: AOAM532v2N7Q0YhcB2q5dN8vXVBF59FtcjtHuWkjWnzEhtyiszcAP+oE
 ZSHlSBNGocSWUzoPTVJlc667VQ==
X-Google-Smtp-Source: ABdhPJwuxtXrOCCGUHZZUDGBeCRp/P35wzJcZ/0dkcxqpRwqVF4Pbi1BsZPlHrmsmoXd2RFS2WtyOQ==
X-Received: by 2002:a17:902:b406:b029:ec:fbf2:4114 with SMTP id
 x6-20020a170902b406b02900ecfbf24114mr27446310plr.32.1621890516710; 
 Mon, 24 May 2021 14:08:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v15sm11503338pfm.187.2021.05.24.14.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 14:08:36 -0700 (PDT)
Subject: Re: [PATCH v1 7/8] gdbstub: tidy away reverse debugging check into
 function
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210520174303.12310-1-alex.bennee@linaro.org>
 <20210520174303.12310-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94671d5c-d757-3a10-e6e2-d1c01a09c984@linaro.org>
Date: Mon, 24 May 2021 14:08:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520174303.12310-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 10:43 AM, Alex Bennée wrote:
> In theory we don't need an actual record/replay to enact reverse
> debugging on a purely deterministic system (i.e one with no external
> inputs running under icount). Tidy away the logic into a little
> function.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

