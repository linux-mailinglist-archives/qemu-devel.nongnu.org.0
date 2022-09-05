Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3FA5AD1BF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:46:01 +0200 (CEST)
Received: from localhost ([::1]:34574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAYC-0001CI-76
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9vF-0007nz-Rg
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:05:45 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9vE-0004Po-4C
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:05:45 -0400
Received: by mail-wm1-x32f.google.com with SMTP id d5so5055371wms.5
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=CykEQMBV9bsbemN+z3bfKrNdaOj/I6om3BydJgHIh0E=;
 b=m/DHbl8oDn0Vszeh+FYOPXmmWCRi9LK7f3qxLDjODyDPNTr71tobaDiG6ZFnP9/Tq2
 7PIMezDC8bc9rhzjIoRt7E9yUaiuxmSm4Nf1bfJxNamK6VNZWLW4ZCjwHrPPuxmSEJFL
 rix/ge3uiPLk52sXt0eSeTG8vDarZL3GIvV+oArrAmyNoi807InF8N5Ry2Nlw2OYyPPh
 6AEUZf4ka2dkDR9zfw50dcGtxamJDYJ+zX2N6g5GQGBoGhJp56YYt/xM52k2fwWWcc/X
 T6NRu5R1zJlbqyHgTnioXeDf17qDu2+5C3xucIhLpxuHnYqef8MJ73dl/6zOxE8V3BtY
 pmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CykEQMBV9bsbemN+z3bfKrNdaOj/I6om3BydJgHIh0E=;
 b=tPYQymeTvUeDHgF0Ayx0zI8bxCcL4seW4xTvqT+IjFBHD+5zwkwbvSFNkPYu30Ozl+
 HO95BKpveS/fDC2gd99sBX/fQG8lwJ5VCdPipr8MnXgmgxhpiRLoQ9T7y9NLcScN4AAu
 r8V80SNAT9FuLcuqAfV/Qyw5Uyh8xHAs1050WG47SQqnfPq9x1T2UmE7dx1QuoxVF0rU
 7K2xIuHBQn5ou7Y14JFB+B8CzNjHDzowyQ4tIIBOdbTTjrE5yVFKGgwiV07qTu1nDB8r
 5LUTFVvoUyUL0U5SrU2qFtKowTASds14OVCNDjh8NlcynClYUxEJObrjM+YsBKsV04qr
 BMDA==
X-Gm-Message-State: ACgBeo3F+UKS0qRxoopnlpuj411BpzICWvzTbOC27FXxCuGhugwYy/ub
 idnIM4uwU3I7307iISOn8DpEfw==
X-Google-Smtp-Source: AA6agR4EtMkN8r6TyeiCbVOkNafIgIBdd591CfL30zOSXSXJG8D6nvP0QSkgoiZxHeBT79qh4Ry8ng==
X-Received: by 2002:a05:600c:19d3:b0:3a8:3b06:655a with SMTP id
 u19-20020a05600c19d300b003a83b06655amr10276247wmq.182.1662375942791; 
 Mon, 05 Sep 2022 04:05:42 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 az3-20020a05600c600300b003a6a3595edasm10691607wmb.27.2022.09.05.04.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:05:41 -0700 (PDT)
Message-ID: <97ef3c95-0d40-a658-832a-0339fd1480cf@linaro.org>
Date: Mon, 5 Sep 2022 12:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 04/20] disas/nanomips: Remove helper methods from class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-5-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-5-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/22 10:55, Milica Lazarevic wrote:
> Helper methods from NMD class like NMD::renumber_registers,
> NMD::decode_gpr_gpr4... etc. are removed from the class. They're now
> declared global static functions.
> 
> Following helper methods have been deleted because they're not used by
> the nanomips disassembler:
> - NMD::encode_msbd_from_pos_and_size,
> - NMD::encode_s_from_s_hi,
> - NMD::neg_copy
> 
> Global functions used by those methods:
> - nanomips_dis
> - sign_extend
> - extract_bits
> have also been defined as static global functions.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 328 +++++++++++++++++++++------------------------
>   disas/nanomips.h   | 144 --------------------
>   2 files changed, 154 insertions(+), 318 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

