Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AFC559FC4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 19:53:41 +0200 (CEST)
Received: from localhost ([::1]:54966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4nUy-0002QA-Dv
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 13:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4nRg-0000rV-Kh
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:50:16 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4nRe-0004dl-Qk
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:50:16 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 a11-20020a17090acb8b00b001eca0041455so5845464pju.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 10:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ZPtcRup4AjQet61UO9ea6q/T1k6/RVvd8+/zjAcghHQ=;
 b=d0BYXlMiP7KG3Ji1Q2USJw+vurdRp8M6h9K3WsSAoZvqfYsdfgf4PSPNY2n2H5zFbk
 qL87YDnERx8d2+Pix+e86il7muaBw8q+T3IOtpGYohXjvNbpsnDEsj5FUfSR9te6CEep
 31aMaWjakDRuDUQgN1jjX8qfOjwM48F0msdtrwBtaBeW462DahZ29ZKivmIDchKZg0wZ
 5Z/f8sGN6Dr8yYr+hml84ldSOBVZVEjFi/OMbn9/FussUj5Mh7yzfPOBTfeIV0EjQEgX
 WXKmIT+fUmIWDV0LPC2RXuIsJHtB1xeDOm8skdUOnItdfJI9bbOS6OZ06HL4mKnvhp+u
 JUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZPtcRup4AjQet61UO9ea6q/T1k6/RVvd8+/zjAcghHQ=;
 b=NAWmOzM3g7wipmxVHQtF+whuGl2M4MF9z8NqiQgC7MpuN3bPcBQM3aNdCqnVsGwsLE
 Z+ir+Mgk+Ui4kB7TptVsIW757u5fueXuFXeLEerR7JVB90TexAjYuTHPSBCaxEAsxj6B
 Eu+LAbUrSdpGxeHhiHw4BORmLXvQtD7jrpS0kCrP5sMELQuFXdXY6bp5LCnZOockiFzx
 8VDAARInVnHt+Y8ZjT3+uITtvBiIRsE9Aenpm9bcxm3Izkw91jaHIQsXVpgFaWFPD1Fu
 oGQbcwrb1GfY184JGlOzYN6ttPHspfIPHoBiYTi6LMXc6CMHgq6uixfzJ/c+Sm2p96ax
 xaAg==
X-Gm-Message-State: AJIora/xfaMCdvswsQzA3q+7evtmTbeaPTD+7gDEl6ZTszSkU5uGP8xP
 lmcOvgo/O7SiqYH86TRyuBMo9w==
X-Google-Smtp-Source: AGRyM1urBfSHYTs1G60ccJkR3jBAKmQpIIxOCyWS5SDO2M2eihWzdJi+vFOcwuYq/tEiCyRFo839Kg==
X-Received: by 2002:a17:90b:3e8a:b0:1ec:c09d:7963 with SMTP id
 rj10-20020a17090b3e8a00b001ecc09d7963mr36777pjb.199.1656093012871; 
 Fri, 24 Jun 2022 10:50:12 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:b25a:9949:8352:ec5d?
 ([2602:ae:1543:f001:b25a:9949:8352:ec5d])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090322c300b001618b70dcc9sm2161373plg.101.2022.06.24.10.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 10:50:12 -0700 (PDT)
Message-ID: <073a37fc-7423-846f-8b28-e272a8ab79ef@linaro.org>
Date: Fri, 24 Jun 2022 10:50:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/3] Linux user for 7.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220624094943.729568-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220624094943.729568-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 6/24/22 02:49, Laurent Vivier wrote:
> The following changes since commit c8b2d413761af732a0798d8df45ce968732083fe:
> 
>    Merge tag 'bsd-user-syscall-2022q2-pull-request' of ssh://github.com/qemu-bsd-user/qemu-bsd-user into staging (2022-06-19 13:56:13 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request
> 
> for you to fetch changes up to 9a7f682c26acae5bc8bfd1f7c774070da54f1625:
> 
>    linux-user: Adjust child_tidptr on set_tid_address() syscall (2022-06-24 10:00:01 +0200)
> 
> ----------------------------------------------------------------
> linux-user pull request 20220624

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Helge Deller (1):
>    linux-user: Adjust child_tidptr on set_tid_address() syscall
> 
> Ilya Leoshkevich (1):
>    linux-user: Add partial support for MADV_DONTNEED
> 
> Richard Henderson (1):
>    linux-user/x86_64: Fix ELF_PLATFORM
> 
>   linux-user/elfload.c        | 30 +++++++++--------
>   linux-user/mmap.c           | 64 +++++++++++++++++++++++++++++++++++++
>   linux-user/syscall.c        | 20 ++++++------
>   linux-user/user-internals.h |  1 +
>   linux-user/user-mmap.h      |  1 +
>   5 files changed, 92 insertions(+), 24 deletions(-)
> 


