Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A7C54DEC9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:19:55 +0200 (CEST)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mbS-0004x6-CP
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1mVq-0003eo-5l
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:14:06 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1mVo-0007oj-JL
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:14:05 -0400
Received: by mail-ej1-x62e.google.com with SMTP id s12so1879585ejx.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S02FGyCZQ+rNdBGPr9hT2hkeKsfyVaL8xmGlBsoAxZI=;
 b=FlUD4QSeGdhVpOVzgrDew5JXmlEMFxqco0hQr1ztKDceEJJlafVWMbTWudZ0DFgHGp
 CcVoqJmefatYl5nDKzzBeRLSFb2AoG9m9G7ioGGq3L8jwcAzN1BNk1bDkFMDJJkcTAD/
 5NC0+Q585HOzkN9Dm93kUm2w0FWHZVJ7Lne9kB4wJbjSF5YSFhHADgeMRA5Pr+LEmxhX
 rnfidZxx5n9yq0aMZ92BT+tAJbmsmmGvBCY7LmVlXCOuHLx4XMQLAyo/ZU8ux9HWn8Rr
 QVDR14HX1hoOXDp5fxT8o4JDKdWj3xDP5+5ofYpsoMJ65lDkzvXF3jF8A8dlrcIBSJ+Y
 C7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S02FGyCZQ+rNdBGPr9hT2hkeKsfyVaL8xmGlBsoAxZI=;
 b=nltngmyBLCLlqSPzwgykbXYjwCDPl9F4dvvXP7bEg6Y3m0/A6nuBGTlvOa8GrQ7Wtu
 DGixqonWMIbh0ZGm/XN6tOHPgQzLfde5+9I6UQwudd9H/B7H4vyzBDlENlrX93bGFlfA
 53MWw8ypRCnir8XDe9zZ+QHv0W4MgXcuWlkpCGZSm5h/R+YEbc/717bKbMI+2PccRq6O
 VXwwSg+VjytTnec6ZqXErbxwnbI/+YEnke9fme3xnCnwvgzomLKnslDtpKbrA5C+z5xG
 M4SAP6pKoNheW4/61nGU14tuMUG/QbvYp1vgf98xgsGuON8nr/uFyeez5bbOwQBWs274
 v+vA==
X-Gm-Message-State: AJIora84odu2Jmpg+TFsgkH0+VFoDASdSkm+wvRfao4lbPpolEJxxEoX
 qN/7qE5gfGNeAPJFdahTExM=
X-Google-Smtp-Source: AGRyM1ttT0yrh+Wv20MaxfdWqHgDTPVhcGlySE76WlAlEDpKIwLKqzmCL2YJkSHNxfb1xqCum4JPEg==
X-Received: by 2002:a17:907:a0c8:b0:711:d8a5:caff with SMTP id
 hw8-20020a170907a0c800b00711d8a5caffmr3731897ejc.43.1655374442632; 
 Thu, 16 Jun 2022 03:14:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 17-20020a170906219100b007105a157706sm596941eju.82.2022.06.16.03.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 03:14:02 -0700 (PDT)
Message-ID: <9bfd73ef-749b-e9d7-9202-5ba4221c0f72@redhat.com>
Date: Thu, 16 Jun 2022 12:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tests/vm: do not specify -bios option
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, akihiko.odaki@gmail.com
References: <20220616083025.116902-1-pbonzini@redhat.com>
 <YqrtiL18Z2jWCHM3@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YqrtiL18Z2jWCHM3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/16/22 10:44, Daniel P. Berrangé wrote:
> On Thu, Jun 16, 2022 at 10:30:25AM +0200, Paolo Bonzini wrote:
>> When running from the build tree, the executable is able to find
>> the BIOS on its own; when running from the source tree, a firmware
>> blob should already be installed and there is no guarantee that
>> the one in the source tree works with the QEMU that is being used for
>> the installation.
> I think there is interaction with
> 
>    --firmwarepath=/usr/share/qemu-firmware:/usr/share/ipxe/qemu:/usr/share/seavgabios:/usr/share/seabios:/usr/share/sgabios
> 
> as the firmware path listed there will be searched before the local
> build tree.
> 
> I agree with your desire to remove the -bios option, but I'm not
> sure it is entirely safe unless logic in qemu_find_file is fixed
> to ignore the global search path when running from the build
> tree.

Isn't this the same for any other invocation of QEMU, for example in qtest?

I admit I didn't think of the interaction with --firmwarepath, but "if 
it hurts, don't do it" might apply here.  That is, install compatible 
firmware to the path _before_ trying to use a QEMU that specifies that path.

Thanks,

Paolo

