Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C08546571
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 13:22:36 +0200 (CEST)
Received: from localhost ([::1]:35362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzcip-0008Ga-5s
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 07:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nzbvj-00008Q-TI
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 06:31:52 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nzbvi-0005Yi-Cy
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 06:31:51 -0400
Received: by mail-ej1-x635.google.com with SMTP id m20so52552349ejj.10
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 03:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sf32YFigeOlNji8yDDipkmtiG2rnDrEWWzcqiIT5JUk=;
 b=pluIZIyzXvD5tJW6KxE4J0CBfY4lFRYKJqTMk5EoC0P35gDwOYsg7ObDKRAnmuexvJ
 R1Gr2DxKpu5Gun8ZPqzYhHfsd7bvEBwXWuCCOFnl6W6UhMy385cKM8826XojbcLqr7jB
 1RQLSpFtBb0bSHvWNFJinbk7N3bLIuO6QKJ42HSq0Dp+4pRfb415wHu6OJ1FcZUJG9UN
 1fDKc8lp/rRTs2+mOhOsU0Rc/qKdmr6rNaqXzklduHqYv+6OYpxuWH/G5AnBhVpcfcQ7
 qh/SMlfs0s5Ur4QNTY2KSPgJQ5lRaLZ8NPGV1lyDvkcA+Z/WFAEmgaHloR0GfOUfH2EN
 nG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sf32YFigeOlNji8yDDipkmtiG2rnDrEWWzcqiIT5JUk=;
 b=IUKclLpPWPK5kmlDRu/y/S/BLj6raMBgouoq7Alevnno8Stm8EDuSNzCTGTEGJqSyL
 1X/At+Z+3V8nau2CHiUczTdHqL4d4TwtffFgvI0EtEtVQ/w14X7SmYUDob7mw7YGgUPz
 OjMqnf1KAvNFhe2Eamy2jn4bclCH32wPZ/hjATe8dclFfUaJd6+sZwaUX3wI67KYMrk8
 j1AjUWUiiXN50HiV5ggWySCSq10O/CmKqgPcVAY8VpAgGjqyb+LrETpjLzcWbF8inu4e
 aoBw3M3xGE9XWH2zl4iAc9A6CXHS8frxfhnoFG2z90+7GTmqC8qNyyW5riTaWObtv9ch
 gUmw==
X-Gm-Message-State: AOAM531S9VIzj/jbKfPxfnjTphabSA4nPOwusX+gGxkEtiBS/bDWCeNF
 z/5jxed7tnatIl+LrDVUMlY=
X-Google-Smtp-Source: ABdhPJyTgF/skThcb/IWrzdMHQH/i/gMjqbNsubPtgwUswfZ3D2RsgNc1Wrkuspc9/AkVIHmcg0M0g==
X-Received: by 2002:a17:906:11d:b0:712:abf:3210 with SMTP id
 29-20020a170906011d00b007120abf3210mr6519589eje.292.1654857108761; 
 Fri, 10 Jun 2022 03:31:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 j26-20020a170906475a00b006f3ef214e3bsm11890726ejs.161.2022.06.10.03.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 03:31:47 -0700 (PDT)
Message-ID: <3e8331e3-c1e8-5f11-81c5-c9b3481d1aaa@redhat.com>
Date: Fri, 10 Jun 2022 12:31:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: about QOP
Content-Language: en-US
To: Liu Jaloo <liu.jaloo@gmail.com>, qemu-devel@nongnu.org
References: <CAOYM0N0sA-H5G0GjED_YHHrHyLJ6vy7+y+jB5-s8J=kAH+eogQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAOYM0N0sA-H5G0GjED_YHHrHyLJ6vy7+y+jB5-s8J=kAH+eogQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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

On 6/10/22 04:01, Liu Jaloo wrote:
> Dear Paul Brook:
> in qemu/tcg/README:
> "
> ...
> QOP code generator written by Paul Brook.
> ...
> "
> 
> Is there some text about QOP? or basically what QOP stands for?
> 
> I can't find out anything about QOP from Google. thanks.

https://qemu-devel.nongnu.narkive.com/bCtjCaPs/hand-written-code-generator-2 
is what I could find, but the server is not active anymore.

Paolo

