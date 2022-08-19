Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81FE59A07D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 18:33:34 +0200 (CEST)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4wA-0001jf-0P
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 12:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP4sp-00009s-BV
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:30:09 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP4sn-0005qg-20
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:30:06 -0400
Received: by mail-pl1-x632.google.com with SMTP id x19so4568451plc.5
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=t1nsh941F4udZtpL6Oq6AxGOxyBAKE5jZSgNiSSEhcc=;
 b=kwmA+jZSxB2+Jdh59G/Nyi8xBR0KF75qSrow6aomUpicsUH0jOk8M9p8F/V87iym7f
 wjtrYXWlQwPBgKmXgO53k3xVfDyQ43qaRf7dFUuoybs/n3b8jdKhJ+0HgRqQWuukei6c
 RhFnIrKrMVw1m6/PsKQGI/wDBbQG1jcVmYEwpv9GsryeYAb3Fo2AokHBe0I/TuUOcjRo
 fRMvcJWw3u+GumPemo8lMShcKgdNttC7g48E3ShdVrpEwr/RP/2ZqMRgbK6lhWCKkanN
 zIgA6Fr+rYqR93WybaaLHg31pM0uZiQmIKGqxR9rP2enTE0dL5KTzM1u8oVPawsP7nHJ
 0hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=t1nsh941F4udZtpL6Oq6AxGOxyBAKE5jZSgNiSSEhcc=;
 b=FA9jGNpY3eodF8qSezFm3Mtzkao+iwHH0BsjwZSNydWohDfOPFRXiJUfw4lDNg9X7v
 CS3j3SR6+3r/p9lC/JuAsWu9ppqfkSmyae+9nNRffGkkeoimQyXbIo6XS+fI58jL/V5x
 eZZXSQF7vxWiaw8TB87qMNHwU5pgQZ+9Bt1UBYPVoTbSiO3jWYzJGDUnoSGTOajr5MuH
 PWm0Tff0PwcuX5/cZUFavw2I5EFnBLg1OplMHZy9iu9mYlKPiOcwQFiyubFr37jwbZSA
 TGA3QXFFm5SlOQDv0kkQ29xVAyZnl3P5MUlBqf+yfYVk5dCfz1N3mVPb2R7/daIpAvXg
 I/ng==
X-Gm-Message-State: ACgBeo3qLmLqugpftlOetqRLRL/MCGwhqPu0DhEJLMPViNT6kaIiNb/4
 ZjRP2ezsrbkR1NsPXl2TkcrvFA==
X-Google-Smtp-Source: AA6agR4frDLD8cH1U5Y7Dy8E+Ssbsg7kYp7Sb56/seeHs4PZQMqYq/iWd1cS8SakNMhorTU0YLw37g==
X-Received: by 2002:a17:902:cf4c:b0:170:5b7a:8f89 with SMTP id
 e12-20020a170902cf4c00b001705b7a8f89mr7953683plg.121.1660926602324; 
 Fri, 19 Aug 2022 09:30:02 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb?
 ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a170903110400b001714e7608fdsm3400403plh.256.2022.08.19.09.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 09:30:01 -0700 (PDT)
Message-ID: <43f08218-179b-683d-f8fa-9cd72c891bdd@linaro.org>
Date: Fri, 19 Aug 2022 09:30:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/1] query-stats-schemas crash fix for QEMU 7.1
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220819091246.178546-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819091246.178546-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 8/19/22 02:12, Paolo Bonzini wrote:
> The following changes since commit c7208a6e0d049f9e8af15df908168a79b1f99685:
> 
>    Update version for v7.1.0-rc3 release (2022-08-16 20:45:19 -0500)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to a9197ad2101cfc885cc316af299f49ba89039e54:
> 
>    kvm: fix segfault with query-stats-schemas and -M none (2022-08-18 14:08:24 +0200)
> 
> ----------------------------------------------------------------
> Fix SIGSEGV with query-stats-schema.
> 
> This allows management tools to query the statistics schemas without
> worrying that some versions of QEMU will crash.


Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Paolo Bonzini (1):
>        kvm: fix segfault with query-stats-schemas and -M none
> 
>   accel/kvm/kvm-all.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)


