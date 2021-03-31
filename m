Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08134F8D2
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 08:34:34 +0200 (CEST)
Received: from localhost ([::1]:53244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRUQz-0002iz-Et
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 02:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRUO6-0000zf-1m
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 02:31:34 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRUO2-0004J7-0z
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 02:31:32 -0400
Received: by mail-pf1-x435.google.com with SMTP id c17so13827807pfn.6
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 23:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KjdM1FLKWY3d3mxgMM/nWuZRgoYhghWzCIanWIFtJ/Y=;
 b=uSON+IKY70uEO982UOLkEG/LoanDBIk0Ch8Fq+DRTFIYd/LdEaIct+2a3mt64H8JQ8
 o3rA7I4+GXlwWqoysb5EcR3fXLG9mXQLViiQf46UPF9btltvSbUNLCITMF1cQ5n56uRE
 a8rWeSwgmRHkpa84zRTWKWyW7fkO4xw0UVJesTRIR4mdRES0f8rQDZwdpWDgGx2NqQec
 ee4BaO4SulKiwzaNdlCOw+LC/zq2qgasiOFJz1n3E/DwSonIrz1K4uv0rIfhH8aLZcvq
 6kUACdNFAXz+hRvh/BeAStXdUIE6cBc9FDPZvte/mfacTvN0N75VXWsOhktemV7aQ8+O
 rApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KjdM1FLKWY3d3mxgMM/nWuZRgoYhghWzCIanWIFtJ/Y=;
 b=sMcdZm41u6GjACvc9ko8MU7L9AeR9KIr2N3CiWKlNhpFCpccKyNaMWLkdI3X5nZNku
 CwP0HJ/zAbBwGSfcm3ZB8JHmMsW3VzokMvDe0YmqY6hOBkKdkscp5GvJkHeFCNqK1/UH
 uC3FwdJkadHtFp/jb76lgwYc47aLzpIJWnFe4snbhrZCysqtzFT71WzpRC6qI52zSym6
 II7lGGcNfAJNQKZ5wgQEnEah6X6Nz0r2JdIqxjtHorvJ4m++n3WmuL9eZmZxDmqo7KZg
 833d6aaJnDwZaqK3bNQEE7t+zcV/pr2qYPvTxrPujy4cG/3qq5MMMh313pw4AYYP/vUX
 C2iQ==
X-Gm-Message-State: AOAM530Oe0snNQ4rj9cRw+CxTOrR+5Qu/7O26aP+utMsjFe0JeeejQOZ
 8kBEFPKSSr5FBHnWXYV0CTt29cdqm6iRrw==
X-Google-Smtp-Source: ABdhPJzKCceH7z0mDi/VYuIl4GgkkWuTzx+0AG9HVJ/aZ5ekLUcZibI8Wu211Z9NjejZrtAmOSTUGw==
X-Received: by 2002:a63:5805:: with SMTP id m5mr1780708pgb.370.1617172288164; 
 Tue, 30 Mar 2021 23:31:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id a15sm975968pju.34.2021.03.30.23.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 23:31:27 -0700 (PDT)
Subject: Re: [PATCH v5 02/10] target/ppc: Disconnect hflags from MSR
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-3-richard.henderson@linaro.org>
 <YFqBtsijRRcEBB/k@yekko.fritz.box> <20210329150522.1b00607d@bahia.lan>
 <d0221e19-6c8b-6cc3-c4aa-2d5fff4ecb8b@linaro.org>
 <YGKvDOCtfbj0avYF@yekko.fritz.box>
 <c368bcc2-3aa0-608e-c596-b7c9df1923e3@linaro.org>
 <YGO9oklIrjN7O0f2@yekko.fritz.box> <20210331060427.16984110@bahia.lan>
 <YGP+3m96lwZrMxwU@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <962e1ff8-50f8-bea6-7aab-850a16ede116@linaro.org>
Date: Tue, 30 Mar 2021 23:31:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGP+3m96lwZrMxwU@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/21 10:47 PM, David Gibson wrote:
> Richard - the remaining possible problem with the hflags stuff seems
> to manifest with the assert failing in the last patch.  However, I'm
> guess that's just exposing some more subtle problem introduced by an
> earlier patch.  Any chance you could re-order the series to insert the
> assert near the beginning, which might give us a better way of
> bisecting if this shows up again.

No, we begin in a very sorry state.  Every one of the patches reduces the 
number of bugs with hflags.  If we put the assert anywhere but the end, it 
*will* fail.

If you can get the assert to trigger again, we can work out where the next 
problem is hiding.


r~

