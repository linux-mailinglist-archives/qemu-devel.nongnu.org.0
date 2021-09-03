Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BFA400739
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:01:52 +0200 (CEST)
Received: from localhost ([::1]:52282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGJp-0003l7-Ip
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFxc-0008T9-Nv
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:38:52 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFxY-0007Rt-W2
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:38:52 -0400
Received: by mail-wm1-x32b.google.com with SMTP id e26so108870wmk.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GL9M66YPePviEeJIanaWkTBsfl1Vxvfhn+ruVwm7BCY=;
 b=M/vaAbEmKAIlbeJ47KCqDEuoW1fU8OLbdaCXy0Pvl+0fPEdToeVM22GDpxEzsjWt9v
 WbAqalwQ/WT+6kAtmN1B0nIOitKaIhJ157SyDHY79vxDGA3ucdaq3AJgPv1Ovs1Fv/aB
 1lSLTga+m6SS4hdqpDGzD3Th0/yrB0aZiBPiOV1Y9NoKc6DtcGD50FEYbqTQdUvsRoIH
 T4tRlzq2k7HSirKjelg2CrSPUYVuJ22AUaoX7n0jXoOTIEfbt+eiTX7puG0QvsvjemoW
 Tfwd8Zr/L/8FyDF1XuV7Wb/Ws8ZaMEPMWJ3/JlWVrBtMcJoHyoGb+mo3WTtGcH+kKg2w
 oQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GL9M66YPePviEeJIanaWkTBsfl1Vxvfhn+ruVwm7BCY=;
 b=FjnLU/Xwrvhyd5xcFsNp1UpAqkNEl6z57YYyWAPvXd98t9SI1kyCDI7HUYMVYW1ycX
 yxBBIm6hzL80m7hY4fPo3SdmKqvPMOAW+t/G8vdm4SmzXrYWdwG/CbT89+broKSXgYW1
 Nsd4XG74kmt4YRcMJHJIZEVzV0sJ0wuHpuAW1MhwPri7SoYJpwUrnJpUKSHrMTVt5p/O
 PN8UceYPtAde2QP9o2ooJVkMJgnxQXxepXK2UDRfoRlJVhnZXLdOSMeElYeJIj0yqjFP
 EnoZUW7HkzMNJr1Rb5VBoroW6jDrEeQY2dTC09P3cVrS38DHSVGMotRGeStghO5ppgAn
 wziQ==
X-Gm-Message-State: AOAM533rqi8zK87ULWRk48/MNz/EM51jwOaOB+IbXis6TPW3FtGR2ff+
 PChr+9ovRxDmkzTVypFQAtDwDw==
X-Google-Smtp-Source: ABdhPJyQ/VEZImP2sey8PyCscUHWehgMFHJDN9IuQ3kxtIigmhduRyDKYPM4Bvm1IEM1SgOYGjMY+A==
X-Received: by 2002:a1c:2547:: with SMTP id l68mr468593wml.23.1630701527658;
 Fri, 03 Sep 2021 13:38:47 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id w9sm286608wrs.7.2021.09.03.13.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:38:47 -0700 (PDT)
Subject: Re: [PATCH v3 08/30] target/alpha: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-9-f4bug@amsat.org>
 <3cd48aba-a1a1-cde3-3175-e9c462fcb220@linaro.org>
 <740a2e5c-3dad-fc7d-b54a-0c405faa605e@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c70c273-cb11-c6da-a456-c906df86326b@linaro.org>
Date: Fri, 3 Sep 2021 22:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <740a2e5c-3dad-fc7d-b54a-0c405faa605e@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 10:34 PM, Philippe Mathieu-Daudé wrote:
>> Drop CONFIG_TCG for alpha; it's always true.
> 
> What is the rational? "Old" architectures (with no active /
> official hw development) are unlikely to add hardware
> acceleration, so TCG is the single one possible? Thus no
> need to clutter the code with obvious #ifdef'ry?

Correct.  Broadly, if git grep CONFIG_TCG is empty in a subdirectory, don't add the first 
instance.


r~

