Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6A1524CD1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 14:28:27 +0200 (CEST)
Received: from localhost ([::1]:56774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np7ve-0007zW-B8
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 08:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1np7s1-0007Ax-4g
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:24:41 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1np7rz-0003xD-Gr
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:24:40 -0400
Received: by mail-ej1-x636.google.com with SMTP id g6so9927634ejw.1
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 05:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IIsUQocPAOkKGPqepWqQUaDhaPmLE7IiCtNJGrRPuww=;
 b=du/eNWeII5RTyz3MZU0kmenXuQbx5h8/xN2YeydMbKfE9aXFdol/T44lD7dxsoxwE3
 KR/nlQe3RIl/t0nErD8YfLnEPmxhOTx70PNSSQikrtC/GTyITu4Fs2k8zB3wyCjj+H7O
 3JWsiYOGPPldJ/jMK32mXvvvytt1UvmVvcHKhk/jNqjJF5eKmQjZoIO6pLOSyfWaZm5A
 Fw8+8vurZlwjF5gYyv4lx6zF5D6tW671UBUyOcAK3kep7dh+tZEVPCm1GBK172de0LSQ
 Fm1Od4MGn/LBaYE5vcXN5OMusogiOBzDpya1geJwi2aXwTo6v45/fZ5u/cE/E3CH7qoy
 oQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IIsUQocPAOkKGPqepWqQUaDhaPmLE7IiCtNJGrRPuww=;
 b=EnN7FDdgKl0wxwT79upm8nzXDmhuMBgwg1XlzmJtR/ek6wEojHExI3Etpr76eWDq8L
 gdu40F0FFIeyBWDOniy8Kurqtd9rgP/N7CHkqOp+/5fOkXLbBopXnm8QzoUfFWkIZ10W
 IACuZKIRt7cYvws6n+lsoQ01/DukzBy40QFqOlFR2yO9ZKIzdMjJ+Ydjn491FV6xszbo
 vYjrmrDPEnuDg02n7Bx7SE/XZn9h+b9LNN/i88EIGHscuQFtmzOkLZwxo3o5Kg/BgSQc
 63PuUhtWT7ZpXZrim6T781tOInbuX4G/r7afO3+Pzfm0gSl4FmtUwyhF+vKt93A5i64h
 164g==
X-Gm-Message-State: AOAM530krfazlHpMIUEoMtpmMfPZd6eDVY8eFmjbeViai+oxrKKPsrlz
 CN8s9M5WPEbnFIlbxzm8G1A=
X-Google-Smtp-Source: ABdhPJy4OUB3NKzmzxtWhApdtvy3/z5YEIBznpReMMrvlZrZspZBwaIFNX7vWyh6Vw1cDWf5SGVIZA==
X-Received: by 2002:a17:907:d0c:b0:6f4:a5b9:3799 with SMTP id
 gn12-20020a1709070d0c00b006f4a5b93799mr29643630ejc.732.1652358276697; 
 Thu, 12 May 2022 05:24:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 m3-20020a1709066d0300b006f3ef214deasm2061884ejr.80.2022.05.12.05.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 05:24:36 -0700 (PDT)
Message-ID: <4970cd1d-6801-9a57-04a7-1e907c1b7fcf@redhat.com>
Date: Thu, 12 May 2022 14:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] qapi: make machine type deprecation a warning
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220511175043.27327-1-pbonzini@redhat.com>
 <87a6bn9gg3.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87a6bn9gg3.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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

On 5/12/22 12:46, Markus Armbruster wrote:
> Commit message nitpick: not sure this is "qapi:".  The commit that
> introduced "Machine type ... is deprecated" (08fe68244eb) used
> "hw/i386:".  We commonly use "vl:", "softmmu:", and "softmmu/vl:" for
> this file.

Will do.

I wonder if I should already propose renaming vl.c to climain.c, even if 
there's no qmpmain.c yet.  Emotional/historical attachment is probably 
not good enough of a reason to keep that name.

I suppose this is already a proposal.

Paolo

