Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D034BBC48
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 16:38:02 +0100 (CET)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL5Ka-0002Zh-Ls
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 10:38:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL5JQ-0001qT-VF
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:36:48 -0500
Received: from [2a00:1450:4864:20::634] (port=40885
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL5JP-0005oW-8D
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:36:48 -0500
Received: by mail-ej1-x634.google.com with SMTP id p15so15901726ejc.7
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 07:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=df9kzM0CgHHCl/qmoPm6VNpYM4zVH8UkX61j4gf9se8=;
 b=p1TOSun4LYFiBgwl5JFxilYCEf4nmghwgiN84m6wNI7XX4X3hgYEtwyLv9hO/Hf/4l
 vo5J1e3pOCb5suHceRZqBjtlFWpuH+ScqR8JIiIFjNTEkT6vRflyGTJZt61ggNu61EVY
 jK90C9Db97kCDggZTGU1grVeTTmXRroNxbmrTeiIoBWmtqBkllCH71PaZ8jvQI4o3Ic6
 SO2MM7a392CaBCqSipgolyvXCggkULSpaaUrIGkN0NLsYJa9zkUYIAXZ6K/1X2WXDgy2
 KeG+OUTKDwLnl2OUqRT+57Q8xD4jjV4Q13Y+F6XIym558D4YP2GW3vaoCZX4UWa7+w4s
 D70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=df9kzM0CgHHCl/qmoPm6VNpYM4zVH8UkX61j4gf9se8=;
 b=uHyQHauT0dlWmUTtEDcz9UvsLd850Chq2hF4o787AkDBMxr9pifW3plKN+u/3x4D+6
 UwJOxRqcl44jDa3bNST/VSVmdotLAl+1r1AKZ7/d2uwvG8T/wC1poLCfDK8n4EzLrHpQ
 mVosNMMTnUWDYlVTpbecMuEx/xoZ7IgsgxKR4QaViq2+jBvTJs91VdGbaZtG2pARuL0Q
 +1RjEuAHvW4/QfDhwHT1wrLIPyKFMQFwfoRJAhGFH5uA9kVXm8JaKk5nUPpSqfgUWqNV
 c53LQAlzCiW/jfABYdBAVx60XdTbzYoYVdF+FaWFtMEQgBznxaB3Li2QYhD4QfHSs5hY
 5SOQ==
X-Gm-Message-State: AOAM532U9LTW2sncukwi0BeafiAVgl4wg4AI3heYxuNPkZCa5NLFa1eO
 UYRY7J63ayRPq6QXczRYhIU=
X-Google-Smtp-Source: ABdhPJyYXSaWHtVlW+Rz4zCjzw6C77NmUACQklgwA5D/k18M0SbrfL19SiHNc4eslziMauVefcAmBQ==
X-Received: by 2002:a17:906:d0c5:b0:6cd:f8fe:2f2e with SMTP id
 bq5-20020a170906d0c500b006cdf8fe2f2emr7049742ejb.395.1645198605677; 
 Fri, 18 Feb 2022 07:36:45 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id g16sm2301298ejf.218.2022.02.18.07.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 07:36:45 -0800 (PST)
Message-ID: <a85017ff-7363-7f95-6268-e386c8fdd88e@redhat.com>
Date: Fri, 18 Feb 2022 16:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/8] configure: Disable out-of-line atomic operations
 on Aarch64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-5-f4bug@amsat.org>
 <1872c662-9363-6d49-d057-9be7ab7c6e0b@linaro.org>
 <5356ac8a-cfbf-cfcb-13c5-872ecaf7bed2@amsat.org>
 <996032dd-4f00-6480-a485-80d49fb70c67@gmail.com>
 <02c7d441-815b-2fd8-21dc-8357b5cd6ebb@amsat.org>
 <94417e74-a2e8-f23d-b4fd-e53c9d3c8323@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <94417e74-a2e8-f23d-b4fd-e53c9d3c8323@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Andrew Jones <drjones@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/22 02:46, Richard Henderson wrote:
>>>>
>>>> I don't have gobjc/g++ installed, so ./configure defaulted to Clang to
>>>> compile these languages, but compiled C files using GCC. At the end the
>>>> Clang linker is used (the default c++ symlink).
> 
> This is another form of compiler mis-configuration.
> If you don't have g++ to go with gcc, use --cxx=false to avoid picking 
> up a different compiler.

This would be the kind of problem that this test is trying to cover:

     if do_cxx $CXXFLAGS $EXTRA_CXXFLAGS $CONFIGURE_CXXFLAGS $QEMU_CXXFLAGS -o $TMPE $TMPCXX $TMPO $QEMU_LDFLAGS; then
         # C++ compiler $cxx works ok with C compiler $cc
         :
     else
         echo "C++ compiler $cxx does not work with C compiler $cc"
         echo "Disabling C++ specific optional code"
         cxx=
     fi

In the past it detected issues with libasan/libtsan incompatibilities.
We should either add a test for atomic operations, or just drop the
test.

Paolo

