Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD69559A5AA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 20:50:49 +0200 (CEST)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP74y-0004f8-9w
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 14:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP6zc-00029Q-Qj
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 14:45:22 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP6zO-0000Qc-Iv
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 14:45:14 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so5683315pjl.0
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 11:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=nwZ6tuYkkdSkVJmojQK0SGIl3dQmWr17BhjQIaIFsIg=;
 b=KVfl1c+yGtukoZutIki338VXvOPjlvAVTUbCQuPSKEXcNNdr7rcPEsV6ZAq+Paf5WM
 3iC/Utl4qbGQjsCfKeDkp6XgxhDzkcE/M1+yu3rruTIUz73LYSvRXFzD/czGiPvBuCEt
 byuFkEs9YEVeIfXqAFKs2lGOK8Wx/s4SjJ+P4Zf5zqhh7JbdP0b05qQfo68QEJFBH0Ic
 g9eGkXu9skATzRw0r6g2sPlOz/DWSLudM8O3Bqh4kywZ1U5X5U47l74wXM6DLzzwAgsZ
 Qkc3X3z5Zg4PGzIp1ZGP55ysRP8XMdE9aj3QK8AFMv8E7EFHLplIWxSeFE0CUIctWxI8
 gnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=nwZ6tuYkkdSkVJmojQK0SGIl3dQmWr17BhjQIaIFsIg=;
 b=YyL968vmwug8Cu24Vc+ItZWeE5iG2FLvcydcUDFnq476NPNLWB7S6RaTefTO+gWwxM
 ONhFcfBqXIRuAvJHF9v5wSwyIFiVMTMawIHseFdGfAaq4d1NRw8qhlI+XLJybM7R9vld
 5xdBrmdNSz7HyXDfNtvQv6AgOvgQNkBlWbvgDzamhzwGZN6IjrYX4TM3iC0R8BvKr2o7
 mqKIKp8tyrs3wAs1BQET1uCwJD48fMZNEIvU5ZoDNgeA9jHhYHk5xpQlp3nIj/sp77x7
 3SlOBDZo1BsW5F0jhGe6cWQXWTYJbWLUqi2b2L0b2ARRW0U6Qwjl2yWj36rvXh3PuNvn
 oxzw==
X-Gm-Message-State: ACgBeo0UTJ26yToZ8BxAJCfDeCsQES510pOhR+menzqv+M4Iu7uUGrDH
 mkm9OC9/Tcw/loGJzTDm643lmA==
X-Google-Smtp-Source: AA6agR6cLZio66eE2mShMMTJxtDtWLILFZvr+OiCMv/fkDDJfj2ITPZaOR759bRpoeR1F8tNjOvgCg==
X-Received: by 2002:a17:90b:35c9:b0:1fa:bc9f:3c1d with SMTP id
 nb9-20020a17090b35c900b001fabc9f3c1dmr13411396pjb.93.1660934700502; 
 Fri, 19 Aug 2022 11:45:00 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb?
 ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a17090a12c700b001fa9f86f20csm5529581pjg.49.2022.08.19.11.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 11:44:59 -0700 (PDT)
Message-ID: <aac3de07-bd6f-4e7e-7d23-ac93b4df5279@linaro.org>
Date: Fri, 19 Aug 2022 11:44:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL for 7.1] Fix proberi instruction for qemu-hppa-user
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, peter.maydell@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <Yv+b8ArTlrskWIMN@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Yv+b8ArTlrskWIMN@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/19/22 07:19, Helge Deller wrote:
> Peter & Richard,
> 
> would you please pull this one-line fix for target-hppa ?
> It fixes a mistranslation of the "proberi" hppa assembler instruction
> when run as linux-user. Without the fix many debian packages won't
> build in a hppa-chroot.
> 
> There is no need to extend the release cycle of qemu-7.1 due to this
> fix.
> 
> Thanks,
> Helge
> 
> -------
> 
> The following changes since commit c7208a6e0d049f9e8af15df908168a79b1f99685:
> 
>    Update version for v7.1.0-rc3 release (2022-08-16 20:45:19 -0500)
> 
> are available in the Git repository at:
> 
>    https://github.com/hdeller/qemu-hppa.git tags/for-7.1-hppa
> 
> for you to fetch changes up to 6fab0c182dabaca5b3d56e60a8de3122ce9afbea:
> 
>    target/hppa: Fix proberi instruction emulation for linux-user (2022-08-19 15:59:14 +0200)
> 
> ----------------------------------------------------------------
> target/hppa: Fix proberi instruction emulation for linux-user

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Helge Deller (1):
>        target/hppa: Fix proberi instruction emulation for linux-user
> 
>   target/hppa/op_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


