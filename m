Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA184DAFD2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:36:45 +0100 (CET)
Received: from localhost ([::1]:33158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUStQ-0001jQ-Lx
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:36:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUSnI-0007Mg-MZ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:30:27 -0400
Received: from [2a00:1450:4864:20::532] (port=33455
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUSnD-00029r-HJ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:30:22 -0400
Received: by mail-ed1-x532.google.com with SMTP id r23so2566209edb.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 05:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=no+7Tli8y0E2pX5Lop2OSHgorDB6J269gW/r6e1EI4w=;
 b=nBom3p3AhLR7jOf9WcFmFeHsg8kbuWnBNFqUZ0pKiiITnSdfIU/rzZFK3aelXeoesK
 sONGQirwPvkxB1KLxUvnFlIxlCddmL7OFjFVvCM9derm0kSqY3j2PWBnHIPdaoJaaPCG
 8KFn/GhOYkojduvjmuxO/xplR1M5xL7IXOWou6hVXGtnRIjmRs/gr71AY1VbE/nK69FE
 ZPOCzB2GdrEmqLR1McczJ7JmTjCUhwrHDZ15tw24OY+cT/MFpkuvCQ/VUBRJhQAVa7rj
 DXh0CiQbt87Z7d0ke/GXrU/Z157yXcGTEDLet2w3RvesZCw7OtEJquA3zdnCbHgQuDli
 HyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=no+7Tli8y0E2pX5Lop2OSHgorDB6J269gW/r6e1EI4w=;
 b=r3Rf/TysX5EG4Rz5JIxmDv5/nH3LbFb1Ms/fiwkk3VA8CG+/7LR3GMY6NYCWrPCzaH
 /JDYeHO2lFv7RwTz7oafbaW8WWTikw7UMHV8vjyVQDgaA2uyqE2ExMX0eSmGBYPeFtN6
 bQN1xaGRqmOSEbXZ9RZlT1g9Y2vIi3Tbw/KAVXIgKImKv+ITATZuMSQmgHDQG6sqIBgR
 9mfX8D+rZ6aKIRRvG2qLR7KBhuG5FV06wBRfRqHoq5AC2VJ+V4vTWcZVB+6+Lex6aYpy
 7h6TPVspcokr4kBggugfInYgn8GZXFsC6YHthvMGixkoz6/LmvxsZfG8+O9JSvevXx1/
 6zPw==
X-Gm-Message-State: AOAM530ur/3THBy+tzNsDPoSyJrHr4CqCNG+Vxz1P7Ec5v8Og1pLV7e/
 nLraPHoRbSYezoyTPam87B8=
X-Google-Smtp-Source: ABdhPJy/R6HvOln+8wPxH4uLbrytPJrA+2PRoErUrZ0hMt7w2P5j54npCyfb73Lc+3YyPsDWhmCGRw==
X-Received: by 2002:a05:6402:221b:b0:418:eb30:47ff with SMTP id
 cq27-20020a056402221b00b00418eb3047ffmr1894245edb.68.1647433817345; 
 Wed, 16 Mar 2022 05:30:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 b19-20020aa7dc13000000b00418eef0a019sm235128edu.34.2022.03.16.05.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 05:30:16 -0700 (PDT)
Message-ID: <3614873d-0446-3a6a-08d0-da4b279d2b01@redhat.com>
Date: Wed, 16 Mar 2022 13:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 0/8] s390x and misc fixes
Content-Language: en-US
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20220315112052.515467-1-thuth@redhat.com>
 <CAFEAcA8u8G3=V=OVM6v_BaOwfeDu1RJmnwrW+4PXqbnPrAAr_w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA8u8G3=V=OVM6v_BaOwfeDu1RJmnwrW+4PXqbnPrAAr_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 19:58, Peter Maydell wrote:
> This results in every "Linking" step on my macos box producing the
> warning:
> 
> ld: warning: directory not found for option
> '-Lns/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0'

This was reported already back in January with Meson 0.59:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg861435.html

> 1. Linker has corrupted paths to clang directory (happens on all macOS 
> versions).
> 
> Monterey:
> 
> [732/737] Linking target qemu-system-mips-unsigned
> ld: warning: directory not found for option 
> '-Lns/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0'
> [733/737] Linking target qemu-system-mips64-unsigned
> ld: warning: directory not found for option 
> '-Lns/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0'
> [737/737] Generating qemu-system-mips64 with a custom command
> 
> Catalina:
> 
> ld: warning: directory not found for option 
> '-Lveloper/CommandLineTools/usr/lib/clang/11.0.0'
> [102/105] Linking target qemu-system-or1k-unsigned
> ld: warning: directory not found for option 
> '-Lveloper/CommandLineTools/usr/lib/clang/11.0.0'
> [104/105] Linking target qemu-system-ppc-unsigned
> ld: warning: directory not found for option 
> '-Lveloper/CommandLineTools/usr/lib/clang/11.0.0'
> [105/105] Generating qemu-system-ppc with a custom command

Roman, was this ever debugged?  Is the broken path to the clang 
directory included in build.ninja or is this a clang bug that somehow 
has been latent so far?

Paolo

