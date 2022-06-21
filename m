Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE68552914
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 03:41:58 +0200 (CEST)
Received: from localhost ([::1]:55450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Stx-0001sb-IA
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 21:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3SqL-00016n-18
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 21:38:15 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3SqJ-0000N0-Ci
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 21:38:12 -0400
Received: by mail-pf1-x429.google.com with SMTP id n12so4775001pfq.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 18:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WaYjh8xGFkWw4BQ/Jv5pHMn5mngrYXOQLOUU1aF7yN8=;
 b=SvzziwkbAYjv1kBdgbc35mohFrbHa40W1mBVgSPVlcaDeanVTWhsXXJPFCT57BYdmT
 r+jo8MIh97gtakaGB+y3KEVAflYMs0qwE6EMN+nLAgAMhZ2+l8Z3K0rcn8D9y6mDetAa
 GukBBrm2phRtTX6R5BOwNP23/IwN8/me/QXyKmztOD9wEWaGAbPn//NEkzmxZ0uPV9Hy
 eMdI9N1vTgzMsW5d5oW7aswCt/l9gSrmVGMFGuzOqDzA0S1PbB1xRXE//lWoy6hbNFrL
 xu0oBEP1T2/f0rjQjsLypD2RWc5aXBOfz87tNZCK0+I7gfJP2ZGgjd5sftBFTn822NYR
 zohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WaYjh8xGFkWw4BQ/Jv5pHMn5mngrYXOQLOUU1aF7yN8=;
 b=RiPCI2jbOt+rC2kPe0kswKd3RLiN3YTWeXDeUf2nuHJkrB1V9QkqhKvbMTSiqeV13P
 9KgLlkDZ4aBiZycPims9J8X84EKWp0l17Qg2JgqBgtq8G06y0LycZ9BhJeUs2/SUPKGz
 y3VvbBVEhtxjkDuWSehgtRqbJudi/KqPRL7MNN6zlgYjr1M6SmGoPRk9LypdxfugqPpm
 cZHvt0DGBgFFTfOP9uoD6C303uovgJDhU4GXzkvd1ncAEt5FZ4/0HwmnOayvYnSWnSmz
 pzLGTyyDuHAJuZO6GgRVUM2ENTJA6rSmjlXx1ACvESQK+8HHbha21nGS+7ZpWFOlMauU
 9wjw==
X-Gm-Message-State: AJIora/+zrPnq4l6RMLfTCiLJiC0lUs4eoyHOT5RWZ6UxOtRWwzVRTag
 sH32O6frYMZkW5NFjxzStttqhw==
X-Google-Smtp-Source: AGRyM1smx5N69YIQSbt/DLwxADogn4WXOlt4D0t3yq9EX/x02qBj4fhPsqDtWKB+qN27R9n1D6x+AQ==
X-Received: by 2002:a63:6b02:0:b0:3fb:da3f:4926 with SMTP id
 g2-20020a636b02000000b003fbda3f4926mr24605411pgc.346.1655775488681; 
 Mon, 20 Jun 2022 18:38:08 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a62d110000000b005253732ffd9sm135339pfg.24.2022.06.20.18.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 18:38:08 -0700 (PDT)
Message-ID: <4316bd3f-a3e4-fc0c-2a63-a19e7f8787cb@linaro.org>
Date: Mon, 20 Jun 2022 18:38:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 20/33] configure: handle host compiler in
 probe_target_compiler
Content-Language: en-US
To: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
 <20220601180537.2329566-21-alex.bennee@linaro.org>
 <c655723a-95df-82e4-2105-678cdea9e702@eldorado.org.br>
 <CABgObfYEiV_TK4BDxG6+zZ1Qq06y6GtmnP1uF__eV31XDKggDA@mail.gmail.com>
 <9273ee87-28f6-b6bb-81be-72795f0a645b@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9273ee87-28f6-b6bb-81be-72795f0a645b@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 6/20/22 09:41, Matheus Kowalczuk Ferst wrote:
> On 17/06/2022 07:12, Paolo Bonzini wrote:
>> Hi Matheus,
>>
>> could you please test the tests-tcg-next branch at
>> https://gitlab.com/bonzini/qemu?
> 
> At be6090bcac10, it works if no BE toolchain is present. Otherwise, the
> script probes powerpc64-linux-gnu-gcc instead of the native tools for
> ppc64le-linux-user, and then do_compiler fails because the
> $target_cflags contains -mlittle-endian.

Also testing this branch, -m32 may not be supported:

make[1]: Entering directory `/home/rth/qemu/bld/pc-bios/vof'

cc -m32 -mbig-endian -mcpu=power4 -c -o entry.o /home/rth/qemu/src/pc-bios/vof/entry.S

cc1: error: ‘-m32’ not supported in this configuration

make[1]: *** [entry.o] Error 1



This is with a self-built compiler, rather than distro packaged, but with default 
configure options to gcc.


r~

