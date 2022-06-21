Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F85535B3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:17:31 +0200 (CEST)
Received: from localhost ([::1]:45108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fdB-0004VN-UH
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3fah-000310-PA
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:14:56 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3fae-0003ze-RZ
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:14:54 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so13710956pjz.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=wY027FWt2HRYDGxchv8sBD2vfGf0zJ6W0wUYLVB+K+4=;
 b=kFdpCGiohSvnCyp2T9n4f/aXIvtcMF+ZB9R+Z6/HweY8i0neD3uuuUQcyBXlyK6P+D
 j+NhNBj0BCQMaO8OI6y5mF4IKo8dxah0nRqpkbLlwy/A+DBwh3dDAVsUt4ZLRJ+h/8bW
 P5H9DBSDdoWdYXycdoBkxb70aBP83GZvAaDrcTE1+ISJd9Uwg00jTYIO7ZYw6YVZ3Vn3
 FTT5A2waiTM3vp33DIcXQ06VFLqyqLVU5ITymS43hFF08NbIrkE/CC+mtAyVjQ08bcmM
 YLfPjFGsy9cDhrecHxGRr0JeW5DGN3uIoFKJRsaJ00eSdhVT6LJAdN1rWFzZGbYnt4kI
 D7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wY027FWt2HRYDGxchv8sBD2vfGf0zJ6W0wUYLVB+K+4=;
 b=cqzPE3uVGOQsyniP7Rr8SWQYLV/asyzAe2bQuNSuHUHWGKZgO+2N1OWNFNixDyVD0F
 zmElEY6jE/mbdkA16CwqPk+raQsHncczhfp+hDO9REO/ASIz5EyEm8aV3DaIBiLoRQpF
 V0GhMMn7TViULqc5yHUh+6mt2jYaK43Y0chxtlIdeU2EH39YzPKanEowhSX1cYbltGcH
 eJ8lB28BqHRu3vR2ZpdmubR62oK508N6LNvxDgKuurxLvh66TJSa2eOfiJOVdaG5oI6R
 GYYIeJ9aBmrPyqiv4o4TOaf7b9Dd4yQUr1KAqluJ+BKRpAqUNJp9zXqVRHACua2ZhfIB
 jOWQ==
X-Gm-Message-State: AJIora9UrkaHsyyePJ4wchlkcr2WQ+tlAC3g0RwjI5Ewq3y+EQJtGxrE
 hEx+6Qo94xWUONzOY5hDQTasiA==
X-Google-Smtp-Source: AGRyM1uufPUV5YM0Zq0C0UCj3+rZdM+WrMx562lH/r4Hwk6WR53nfNrhJP51dFMWj51e1DTGl1MdCw==
X-Received: by 2002:a17:902:cf4a:b0:169:a894:3465 with SMTP id
 e10-20020a170902cf4a00b00169a8943465mr2347301plg.56.1655824489455; 
 Tue, 21 Jun 2022 08:14:49 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a17090a9b1700b001eaec8cea55sm10231954pjp.57.2022.06.21.08.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 08:14:48 -0700 (PDT)
Message-ID: <a48a3698-377b-d7b0-008a-8d749bd1308c@linaro.org>
Date: Tue, 21 Jun 2022 08:14:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/6] configure, pc-bios/vof: pass cross CFLAGS correctly
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220621075147.36297-1-pbonzini@redhat.com>
 <20220621075147.36297-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220621075147.36297-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 6/21/22 00:51, Paolo Bonzini wrote:
> Use the flags passed to the configure script for the ppc cross compiler,
> which in fact default to those that are needed to get the 32-bit ISA.
> Add the endianness flag so that it remains possible to use a ppc64le
> compiler to compile VOF.
> 
> This also fixes compilation of TCG tests using a biarch compiler,
> for example ppc64 tests on ppc64le.
> 
> Reported-by: Matheus Ferst <matheus.ferst@eldorado.org.br
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Probably you missed this, but last night (gmt-7) I sent:

make[1]: Entering directory `/home/rth/qemu/bld/pc-bios/vof'

cc -m32 -mbig-endian -mcpu=power4 -c -o entry.o /home/rth/qemu/src/pc-bios/vof/entry.S

cc1: error: ‘-m32’ not supported in this configuration

make[1]: *** [entry.o] Error 1


This with a compiler I built myself,

$ cc -v

Using built-in specs.

COLLECT_GCC=gcc

COLLECT_LTO_WRAPPER=/home/rth/gcc/run/libexec/gcc/powerpc64le-unknown-linux-gnu/11.0.1/lto-wrapper

Target: powerpc64le-unknown-linux-gnu

Configured with: ../git-gcc/configure --prefix=/home/rth/gcc/run

Thread model: posix

Supported LTO compression algorithms: zlib

gcc version 11.0.1 20210321 (experimental) [master revision 
19ff0b0:fca73fc:6af7b307f659a4f1845a9efd36ca37899515e234] (GCC)


With default configure options, gcc is not biarch.
It would be good to probe whether EXTRA_CFLAGS is actually usable.


r~

