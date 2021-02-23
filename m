Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094B53227CD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:29:48 +0100 (CET)
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEU0p-0007EN-2p
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lETyX-0005qz-Un; Tue, 23 Feb 2021 04:27:25 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lETyS-0001Si-Fl; Tue, 23 Feb 2021 04:27:25 -0500
Received: by mail-wm1-x336.google.com with SMTP id i9so1701096wml.5;
 Tue, 23 Feb 2021 01:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZkwnlqDL1w0pCie8ro1G2CMmsgF69A2Zy9BKTXcp7hk=;
 b=uLcSc8oE8oyfdtpbsrB2wcmMbSkACrfdWA0KsDNxt6pYvtL1UIzEkKM62wqJctxKYD
 LdjvECzlfr27iCqM0TfQVJRoIr0qIDwKEcdbywfvXVURA9rk2igjxgTlVuF2cwM3RFUi
 WI7sfFBJqdVdLg9uOBtT70ST2a66B+Dt9lVHz+S62wKuWc407t+FdKxhFJMkyLofHUlo
 l0kJDCQL2IH/1//t710e7BJWHb8aq7uR8074MbszDnjy1m7ix8em4p9k7heDXgyVfK82
 yFdXWRXqLj0QJstf3ixYHJXxmdd3QfW1LyUyEkSsQFheH4aWuNn1RvSDhQa4/7hKPC9y
 noFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZkwnlqDL1w0pCie8ro1G2CMmsgF69A2Zy9BKTXcp7hk=;
 b=PrTuibyzH9Pj9wYQ5Kqjj8dDuwUqNERkk1ApOo7EEqINOMlU8tgypc44uzoXeKNE96
 mYQFPTU46MjOmWFO8uBd/rtr0ZyxpWFI5YwGLiiMBIqYHnaeAM/WifJxtYj4DltA/grn
 chZZz7yGUfWpSQSVqe1xOyxk3w7CWOFvuI8BNmX8/Ioqah8XeQ21Lqm7/IM+zpdD8QHU
 8/TI7bbpx4CyKmSiLhSqvqQoCnuY0oLYRynnVDVpYU0J+ozFQfVuIJnYwcEU0Z2u6tuj
 zdP+OKaZ+DyaKnGsQAPHleL74lz0y1e7QGsIROxKc9ebkOXCkiGlJYa+7v+RNJ9n5YP8
 8+Jg==
X-Gm-Message-State: AOAM532QnKa7kBgKG7NNObMnoEOeb/MznDXzAHJjOvgMoWddm9LPXj6p
 hEq+DiZnxN64eIRn7ZwHQo8=
X-Google-Smtp-Source: ABdhPJzkDjpRPVsZtZhK5LlD1CDfQaLiyo4UhUOohgTLT+X8WvMbgKvOc4x4KkEsE3OpcE2NnAYezw==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr19935526wmi.34.1614072438467; 
 Tue, 23 Feb 2021 01:27:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u10sm1934870wmj.40.2021.02.23.01.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 01:27:18 -0800 (PST)
Subject: Re: [PATCH v3 1/6] vt82c686: Implement control of serial port io
 ranges via config regs
To: BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>
References: <cover.1614007326.git.balaton@eik.bme.hu>
 <6371141da056b8b0890ca3f43221da138410374b.1614007326.git.balaton@eik.bme.hu>
 <YDSFy971Ltt9+FyL@yekko.fritz.box>
 <845e85da-aa5e-4ac4-7449-7026eaf3b350@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f9f7e196-45b3-32f8-2455-0f4f52645e6e@amsat.org>
Date: Tue, 23 Feb 2021 10:27:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <845e85da-aa5e-4ac4-7449-7026eaf3b350@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 10:18 AM, BALATON Zoltan wrote:
> On Tue, 23 Feb 2021, David Gibson wrote:
>> On Mon, Feb 22, 2021 at 04:22:06PM +0100, BALATON Zoltan wrote:
>>> In VIA super south bridge the io ranges of superio components
>>> (parallel and serial ports and FDC) can be controlled by superio
>>> config registers to set their base address and enable/disable them.
>>> This is not easy to implement in QEMU because ISA emulation is only
>>> designed to set io base address once on creating the device and io
>>> ranges are registered at creation and cannot easily be disabled or
>>> moved later.
>>>
>>> In this patch we hack around that but only for serial ports because
>>> those have a single io range at port base that's relatively easy to
>>> handle and it's what guests actually use and set address different
>>> than the default.
>>>
>>> We do not attempt to handle controlling the parallel and FDC regions
>>> because those have multiple io ranges so handling them would be messy
>>> and guests either don't change their deafult or don't care. We could
>>> even get away with disabling and not emulating them, but since they
>>> are already there, this patch leaves them mapped at their default
>>> address just in case this could be useful for a guest in the future.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>
>> The maintainers of the hw/isa/vt82c686.c should probably be CCed on this.
> 
> He is (but may not be obvious because the accent in Phil's name is not
> handled well by my mail host so to avoid misspelling his name I've just
> omitted it).

We are 3 (other now Cc'ed):

$ ./scripts/get_maintainer.pl -f hw/isa/vt82c686.c
Huacai Chen <chenhuacai@kernel.org> (odd fixer:Fuloong 2E)
"Philippe Mathieu-Daudé" <f4bug@amsat.org> (odd fixer:Fuloong 2E)
Jiaxun Yang <jiaxun.yang@flygoat.com> (reviewer:Fuloong 2E)

> And he also said these should go in via some other tree:
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2021-02/msg06551.html
> 
> He may still review or ack these but I guess he'd need some time.

I took a bunch of Zoltan's patches:

$ git log --oneline e551455f1e7..00d8ba9e0d6 hw/isa/vt82c686.c
cc2b4550115 vt82c686: Fix superio_cfg_{read,write}() functions
2c4c556e061 vt82c686: Log superio_cfg unimplemented accesses
b7741b77425 vt82c686: Simplify by returning earlier
2b98dca9571 vt82c686: Reduce indentation by returning early
c953bf71182 vt82c686: Remove index field of SuperIOConfig
3dc31cb8490 vt82c686: Move creation of ISA devices to the ISA bridge
9859ad1c4b6 vt82c686: Simplify vt82c686b_realize()
e1a69736e59 vt82c686: Make vt82c686b-pm an abstract base class and add
vt8231-pm based on it
084bf4b41d4 vt82c686: Set user_creatable=false for VT82C686B_PM
3ab1eea6bce vt82c686: Fix up power management io base and config
9af8e529b91 vt82c686: Correctly reset all registers to default values on
reset
40a0bba1e3f vt82c686: Correct vt82c686-pm I/O size
35e360ed674 vt82c686: Make vt82c686-pm an I/O tracing region
911629e6d37 vt82c686: Fix SMBus IO base and configuration registers
94349bffda0 vt82c686: Reorganise code
6be6e4bc769 vt82c686: Move superio memory region to SuperIOConfig struct
7886a674f13 vt82c686: Rename superio config related parts
007b3103a39 vt82c686: Use shorter name for local variable holding object
state
9b0fbae2cbf vt82c686: Remove unneeded includes and defines
ff413a1f7f6 vt82c686: Convert debug printf to trace points
dc66439542c vt82c686: Remove legacy vt82c686b_pm_init() function
0bfda9a225b vt82c686: Remove legacy vt82c686b_isa_init() function
657fae258f9 vt82c686: Split off via-[am]c97 into separate file in hw/audio
07c6832cb2c vt82c686: Remove vt82c686b_[am]c97_init() functions
0f79846147f vt82c686: Rename VT82C686B to VT82C686B_ISA
e6340505441 vt82c686: Remove unnecessary _DEVICE suffix from type macros
5a4856ed78e vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA

But with this one I raised a question for find_subregion() ISA use,
and deferred to Paolo for this particular question, and to PPC for
the new VT8231 device model.

Regards,

Phil.

