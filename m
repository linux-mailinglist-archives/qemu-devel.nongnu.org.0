Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D006FCC79
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 19:14:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQuL-00022x-OM; Tue, 09 May 2023 13:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwQuJ-0001vh-CW
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwQuH-0007oF-K3
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683652425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8hbia0VkeIzQTothLMq0GehpICzFKu1zaY0U0swbQw=;
 b=E2+pN4rn9R4lHKUQDkL/bbKcdofbW+ulYnifFVwFPSyWOYzuTt9vmg9mzpsq+ag4VbdYzz
 PpHwl/pxkzvmQSp5B2OI14jwbDeme7hBcEpiMsFzlbjvwtGPPXGVzzAxN7FBswYIRnLYXU
 NnmuL8JZYkOfM99iz4OB2zQ40IkGQdA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-OlhGgZOJPfiIEcAlflwxKg-1; Tue, 09 May 2023 13:13:43 -0400
X-MC-Unique: OlhGgZOJPfiIEcAlflwxKg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-965e5cfca7cso571421866b.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 10:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683652422; x=1686244422;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N8hbia0VkeIzQTothLMq0GehpICzFKu1zaY0U0swbQw=;
 b=TX+Ow8TRTacHdaSalAtgJIF6WRBRpREnsaxQ4HemN3PC8ngKFM9lMyK47OtJN43EbF
 tBl5ExrAwViLByXGxMV4GB8JZ9j3+iVoev7+ES0hZLChinZ339NSoThMQ/k4gpDgw8Wm
 p1qJ2ztZAAzxsLUkvoETCdN12DL0/tErQT8+ZpWH0dT0kL1dIdF7qaFEoViFmLOzJUnH
 HyVYV8Rw1hXMqqJ01Wdu75FEmlXvJgH4IFZ3giP0GfHhw/UNK3o8PEV3LgaxeFgXCxG2
 3N66DVoW2myKpTuyOtDB93yFEHewg3l+R1CSUnBDVO0YvgSYHHx48j73iz7k6sIHDvUQ
 e1rQ==
X-Gm-Message-State: AC+VfDyI2m4bVpwq7hsS10nFW0Fu1CiXJeLEGWDUDMGWEqaopxv3+8hX
 cRJM4UPiIFpIMbeJtv0tdqt8omRz3Gf1tbV0k8QHNd8vHW4WPMl2SSSiDWIOzDi0egq16+Ej784
 jNw8FuKZMEWrkGug=
X-Received: by 2002:a17:907:9718:b0:966:c09:1c57 with SMTP id
 jg24-20020a170907971800b009660c091c57mr11917094ejc.65.1683652422281; 
 Tue, 09 May 2023 10:13:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7STuT2pGk9UkuFLLFEg54X0+ucQElLp26yeDLKfTZbGBQq/PoOtfP48qB1syKKMLuqYGXqng==
X-Received: by 2002:a17:907:9718:b0:966:c09:1c57 with SMTP id
 jg24-20020a170907971800b009660c091c57mr11917062ejc.65.1683652421919; 
 Tue, 09 May 2023 10:13:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 ib10-20020a1709072c6a00b009531d9efcc4sm1548120ejc.133.2023.05.09.10.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 10:13:41 -0700 (PDT)
Message-ID: <2ce91428-b2be-97f7-3fcf-aa325a91f654@redhat.com>
Date: Tue, 9 May 2023 19:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/17] QAPI patches patches for 2023-05-09
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20230509080011.3231661-1-armbru@redhat.com>
 <874d3ef2-0b6f-526d-fc81-e2d1f5cce104@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <874d3ef2-0b6f-526d-fc81-e2d1f5cce104@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/9/23 18:20, Richard Henderson wrote:
> 
> This has a number of CI failures, including
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/4252925621#L4673
> ../docs/meson.build:27:6: ERROR: Problem encountered: Install a Python 3 
> version of python-sphinx and the readthedoc theme
> 

No Python 3.8 yet (needed for assignment expressions aka the walrus 
operator).  The plan was to require that either as soon as Debian 11 
comes out, which would be in a couple months right before 8.1 freeze, or 
for 8.2.

Paolo


