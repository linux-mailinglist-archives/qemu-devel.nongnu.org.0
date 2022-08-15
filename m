Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55F593104
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 16:50:20 +0200 (CEST)
Received: from localhost ([::1]:55938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNbQ3-00067W-1B
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 10:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNbLK-0001Fx-Oq
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 10:45:26 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:33315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNbKs-0007E6-Uu
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 10:45:03 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id d1so5505221qvs.0
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=wMW10sjYQZN0D37/Yk9ecGrC6/3f8Xys+FzlrSp9c2Q=;
 b=RNLfbXVMpbjBcTAkOlC70BnGn1WKbnaIT3EQlQRkgFwMVLZ4eM+LwA+fT0xsZdkg2R
 mQBclYwr0gLmgYAYk3Hqkftq+4v2TF2O9StNatmY9M8YLiURao+Huvt1KCqdYcQkkS1o
 kR6+FAl0221bkQ+Ve98yYtblORDDfganGSuuVMcr9HEhXezJwCkdYkjDsK6eaCVnpNES
 Hw0rKJ6ued07rhuwYlUHBmYPzdYKZnq2JanYSg4bqH81e4cTPxUcxf4rwYCudYE0LaMM
 3nyiagmQb35mWpXs9v6A80NHLBIxC/wcCcQ63xsgIJgdd4O6ilBei3RF5bUSX6ob8FL2
 gtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=wMW10sjYQZN0D37/Yk9ecGrC6/3f8Xys+FzlrSp9c2Q=;
 b=SyIte33gJQqvwF5XVuCUxr9ynzQgJ/Mv4QU+mwnmixu9tBVtOxnPLYt/MbQDoiT37J
 Xm/fhymkaSagPK4agMpedn8N8PffSgqfO+SWvWaGxUBR+0WwWRvgN7BOIzSL4lczg3gh
 YPqW9yRMDkOyN5o2puy7auHIGyQ5C5cE4As6grT8gtTo4bXh16Nf2pJoKeHM/DlWokoN
 MfdTKJpjdm+Vn7/dUfURparGeXdgYu/YU06e8kHrLbLzFvPB63lwfPeyqIMI8mSWmsZL
 XQ+BR2jAn4XTmRRRnj02C8uhbM2Y6ZLw08OSULFrOt2FgDnCeWu5ShvvuHKDtdFYNaHs
 iD8g==
X-Gm-Message-State: ACgBeo2apPEQId7v2J6n5SOgCRIriCCMqzJXqSKZ6JPhjPhfBdpATGeS
 dCWqDgkgw4hOp32BndLJ2gvQXA==
X-Google-Smtp-Source: AA6agR6WkDrFzw59L3zhEISsfSxc5kuoAoCXkoOfewREX40IxHUE/D/JST2e+8zzbja6g6596aEZCQ==
X-Received: by 2002:a05:6214:d6c:b0:476:94f5:aa7b with SMTP id
 12-20020a0562140d6c00b0047694f5aa7bmr14077203qvs.92.1660574697011; 
 Mon, 15 Aug 2022 07:44:57 -0700 (PDT)
Received: from [192.168.138.233] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a37ea18000000b006b9a8fc0c93sm8993814qkj.53.2022.08.15.07.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 07:44:56 -0700 (PDT)
Message-ID: <474085b0-eef1-1c27-e3f7-8c6b5314a51f@linaro.org>
Date: Mon, 15 Aug 2022 09:44:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC] Unable to use qemu-ppc to run 32-bit powerpc executables
 generated on gcc110 machine
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Pierre Muller <pierre@freepascal.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <66112e17-e4ac-59fd-ceaf-56047015918a@freepascal.org>
 <9d24dd87-782f-ab15-9d48-51653801cee0@redhat.com>
 <1f4c81d1-7127-6441-2435-cfd2aa557550@freepascal.org>
 <7fa38fda-0f33-8e43-93f4-956c2917eb74@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7fa38fda-0f33-8e43-93f4-956c2917eb74@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/15/22 02:47, Thomas Huth wrote:
> Ok, I see, so the question is wether it is somehow possible to enable the vector 
> extensions on a 32-bit CPU by default somehow...
> CC:-ing Laurent, maybe he knows...

You'd do this for ppc32-user-only by defining e.g. a power9 cpu, and setting all the bits 
so that it's in narrow mode, and the correct endianness.


r~

