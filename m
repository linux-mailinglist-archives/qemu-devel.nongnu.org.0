Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F5C52A4E7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:32:00 +0200 (CEST)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyEw-0006fR-46
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyAw-0002re-Mr; Tue, 17 May 2022 10:27:50 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyAu-0007sp-Vq; Tue, 17 May 2022 10:27:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id tk15so11555070ejc.6;
 Tue, 17 May 2022 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YxpzyzQtxqjDkHvykuYQ6Q0CEEmUvCegOaLLUfKV9CA=;
 b=XQqBO5EBTSIMDDVoBgDR4QqgAcPwS4ts5DhxjyNll7jqEb0HuaagKluaCZz6bst4nK
 cGMsQoMarN+X9GhK9he0DxYqz1we8EGWoT0oYMiobiheMgq8+qmBvaVJqXmX+erEJShe
 HnHyvvDAOrQV9XtJfPzyHgD0bnFf3NeeFg7N8UgxxaeRQQeiUZm/GooJHmGAe5S+qJ7L
 ODUEDtT2jHpBwASeEi8eSHpsJcyd3uE2HQn4q4pZhA5YzixsFbpTtVccIcpagtrhWWOk
 jXFnDArNbJvAfkH4yeDJelsIPK7mC86m9YODsiJYJMRNxwGRZLKG+oT3hXZ9xFztXmip
 iUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YxpzyzQtxqjDkHvykuYQ6Q0CEEmUvCegOaLLUfKV9CA=;
 b=PpiiDQCkJCZUGwPrVtzyt1Lng6tYOVINzhFiJ0Djwjc50QO02JtCdXUVoyE7iMr1KS
 18LCle/wlrf2uycmiP1dKr/IwA22V99qzp/nNUzK7q8JHa867BQouHbPBMK1TbazHwXW
 NJ8mmBNWaC2PkGJzLx+zQ1alLRyA4TH5i+Bi9I5DyLU06Urx9BdXJoM3EXJFIekXKtYc
 0Cj6z6B2AgZWVig2PfbnAToQSBylw+n5KbJ/Hw77zbBAJpNphV1UpjvLOZK3mfgj91vd
 y/st7FReLapJ1yKZvrVf2I4I/oPtB7FkiO5P/w0Om+W0+RwZZr4hhwnDWe4gSSFuorWS
 xiCA==
X-Gm-Message-State: AOAM533WnU6QAgy0ExzdyIDXeLamoFdcsoM67LbDZRDLYab6/2Kre8/X
 vyP4CgxeEmPHaViTJ0mNALn4natVidSxfw==
X-Google-Smtp-Source: ABdhPJzkWQAlo2LNhSpVHZJlDC3TwSRtwgdTmf3OMDMk+wVwwgEZLCScsTMAopxRCJI4h8uns+DgFg==
X-Received: by 2002:a17:906:2652:b0:6f3:a042:6b51 with SMTP id
 i18-20020a170906265200b006f3a0426b51mr20299400ejc.565.1652797667245; 
 Tue, 17 May 2022 07:27:47 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 i14-20020a1709067a4e00b006f3ef214e10sm1144468ejo.118.2022.05.17.07.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:27:46 -0700 (PDT)
Message-ID: <6fe915b3-d6f3-fe1b-03b8-3ee67b770bec@redhat.com>
Date: Tue, 17 May 2022 16:27:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 14/18] block: Implement blk_flush() using
 generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-3-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113907.200001-3-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 13:39, Alberto Faria wrote:
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 11 -----------
>   block/coroutines.h                |  2 --
>   include/sysemu/block-backend-io.h |  2 +-
>   3 files changed, 1 insertion(+), 14 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


