Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B3750A3A8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:07:39 +0200 (CEST)
Received: from localhost ([::1]:34854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYPC-0008HF-GC
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhYMh-0007Db-RR; Thu, 21 Apr 2022 11:05:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhYMf-0003cL-S3; Thu, 21 Apr 2022 11:05:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id b19so7072275wrh.11;
 Thu, 21 Apr 2022 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bGeWXTAhndF9ViEYZ3BkkctRVicwQwW5L/idOXOyYAc=;
 b=YybGAXWUM26sLU7OEqV2/jEe1G3qjpa41dvKaGzJ2hi9s5GUpJm2yHuW1Fic4i/7Q3
 eElQDTotZNDn73IDWFx8lWXnjmKSH6OPVaSnyYbTj/dI4y96x6whKw+gTX91SFdo4BAJ
 XNcOjpt2Cc5h9TkxGB+hwLV/HpU9Fdi6PiauddKg/1jQjCrskVVK2kvO81fUbFQ4EPgh
 bZM+vAebUaGfSVpDRX+2v+jqReE2x/hVfiE0XwJ5V+4HyI1IBM7AKt+lJcyBCdD9GEXu
 NsaSHksHRazjRGC5Ofukl/eL3T6134qzf3bfCRybhO2oAqrqEVa/QzeVPwPMP376FHxZ
 d7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bGeWXTAhndF9ViEYZ3BkkctRVicwQwW5L/idOXOyYAc=;
 b=kKSVTChbR+Rd+DzzFF/C6in7CmDhh35+Lb3Ix8oBDxyMdchCTABkABLDnFwZt2Ke4L
 dDfRQmLh+f/Gidhue4DtB+XSUGTajqqiZXBKFN1Y1YKBuhnSG1e2HSY/a1jkdFXhTOgZ
 7H68rvzk63Yuo90IQY6hqWzgKB22JgcOm4Tga5cO6swLb5xswuBmrBKtfIOfXTjVR1vz
 44+UVRNEpRhG/BreDwon5HLcstEW9M8sxU+radYeD+GazJvKgwMqAsb+IiB+7Y5WJSCi
 SZWDM8pLphrP8w1rMpquJEugdlnsxNemIMWvQZmxaAkgb5+uwKeSdCCExIObi0dYKwXs
 2cpQ==
X-Gm-Message-State: AOAM531AL/hES7kBfeWHb4pkkW9o+eS4G89FN1HNG6Ep1V/TZidiHU0u
 7cRPQe8ngvRJ++dBEGk9dmY=
X-Google-Smtp-Source: ABdhPJzPT9edBsUFNtgg4biAgwetjS6h6qp3yyZAV8KyFi3sRaJUHECpuP0/eE4qsywSHb/RikHbGw==
X-Received: by 2002:adf:e2cb:0:b0:203:7564:1076 with SMTP id
 d11-20020adfe2cb000000b0020375641076mr120160wrj.199.1650553499247; 
 Thu, 21 Apr 2022 08:04:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 u4-20020a5d6da4000000b0020a8c8d3e00sm2514160wrs.73.2022.04.21.08.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 08:04:58 -0700 (PDT)
Message-ID: <aa3038c8-cda8-4707-ee78-63c389ed0cf5@redhat.com>
Date: Thu, 21 Apr 2022 17:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: introducing vrc :)
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
References: <dd5a574f-a475-a704-a827-03a014f5a586@redhat.com>
 <YmBNDddW4ODveOkZ@xz-m1.local>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YmBNDddW4ODveOkZ@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/22 20:12, Peter Xu wrote:
>> a while ago I looked at tools that could be used too build a call graph.
>> The simplest but most effective that I found was a small Perl program
>> (called "egypt", which is rot13 for "rtlcg" aka RTL call graph) that used
>> the GCC dumps to build the graph.
> 
> Do you have any plan to put it into some git repository?

Good idea, it's now at https://github.com/bonzini/vrc.

It can be installed using "pip install --user ." after checking out the 
repository.

Paolo

