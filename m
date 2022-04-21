Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED2509F98
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:26:46 +0200 (CEST)
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVtV-0000IO-Oh
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhVRP-0003S7-5S
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:57:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhVRB-0001PL-Kz
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:57:42 -0400
Received: by mail-wr1-x435.google.com with SMTP id c10so6376858wrb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ctt+dAmV59F/MyYhvm5FkrbS4fsWBAfgChSFx1I3g3E=;
 b=gxmBO44SjF5LM8d+NhLUsMphezm2ECXZrw7EOt9rVK7VNRUQFBaSy9k5sdrhybmHvc
 frAJ7g62wRFxbJ/Thv0BChHFb7bJzLLD7UmZR8EW6In0mrjGYZuR4CZ7cXrZJKS0mBWn
 //JpEU/QszRTq+qO1usWnmHstD6EOaPyk8wqdeG7C9f9L5ylGyAfHel2Co+YtvaGfuET
 BEhLEeJi8rGvuiDqwn/HAvIZiU4VyBxluOcpx2YL60UwCtuSl7bnyNVWVzGP2hImEsk0
 k8U3e2NHFzI+zAAAd9GncFa7NodrJ3RWKxLkL95xgczwHNJNbAMK9zsqpt0lL0+B/tAx
 uqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ctt+dAmV59F/MyYhvm5FkrbS4fsWBAfgChSFx1I3g3E=;
 b=vzBBepEKfi0IsAM3rn2WtzTzZGYyvauxoQvJFysonsnfD/x+iykR6JQ5PRfeGCR9LH
 TXku7iFexXVpv8ozDxt4LaYJu9QPPHvmPpj+xZcohy9tWhhjXOaCJF7KmctC+np+SKLu
 //+PVCS2AhkQUSirhawjo8c7g7pJJazO/ngZ9BPjlYzIS91i3Nn1RZgtgdHLhQrz5vI1
 i7DcwqWI24MH248YwPMIrjVFubTP9CGqkZ+RCsuEQ+JF6cfqHL4g8a+kwMd02CzRUqrS
 9/RD0Q7uNOhNfuGnmsGu7jwvBaEXJL7CZnbLHY3n7cWtmkzO7UVij1rqXcERNYTVZIPo
 UczA==
X-Gm-Message-State: AOAM532jNRjnu/7TZsJm8uRJfPRLv+4oeHQydIRBcqefmDWl0tfX5fmZ
 zwoGw7aBkg44DoF/U37/ICw=
X-Google-Smtp-Source: ABdhPJzokxA09pPi8LGn4nsJEhU6NHo9ry2G0Y/2aCz5HzNszEvhEw/UnsIVMI8UzJx3Cc5sz4hReA==
X-Received: by 2002:adf:a1c4:0:b0:20a:92c3:abfd with SMTP id
 v4-20020adfa1c4000000b0020a92c3abfdmr16077701wrv.551.1650542247822; 
 Thu, 21 Apr 2022 04:57:27 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 az30-20020a05600c601e00b0038ebd950caesm1912123wmb.30.2022.04.21.04.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 04:57:27 -0700 (PDT)
Message-ID: <9237970a-3852-bcc6-0243-04c76fbe57d0@redhat.com>
Date: Thu, 21 Apr 2022 13:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Future of libslirp in QEMU
Content-Language: en-US
To: Anders Pitman <anders@apitman.com>, qemu-devel@nongnu.org
References: <8f5cc095-e5e9-486d-8e52-d22cac6d2379@www.fastmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <8f5cc095-e5e9-486d-8e52-d22cac6d2379@www.fastmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/22 21:08, Anders Pitman wrote:
> I noticed in the 7.0 changelog that libslirp might be removed as a 
> submodule in the future. Since user networking is very important for my 
> project, I'm wondering if this is simply an implementation detail, or if 
> there are plans to eventually remove slirp support entirely from QEMU 
> (which would be bad for me)?

No, libslirp is now a standalone project and we'll rely on distros to 
provide the package for the library (and a -devel package that 
meson/pkg-config can use to find whether the library exist).

Paolo

> Is there somewhere I can read the discussion about this? I searched the 
> mailing list archives but didn't see anything obvious.


