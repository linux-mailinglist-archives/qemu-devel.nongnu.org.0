Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3501F590559
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:04:24 +0200 (CEST)
Received: from localhost ([::1]:49320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBbb-0001cs-A0
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBWM-00041Q-Da
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 12:58:58 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBWK-0006cM-Ee
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 12:58:57 -0400
Received: by mail-pj1-x1030.google.com with SMTP id gj1so18249596pjb.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=nSWHpL5to8azTIVXgT3gO4EqNQG1z+h3ktK8N3RF98I=;
 b=f0/pjwp/m+NDYA0DrNpBLey5NIMfsYf9Nqio8UPxv6H3u994HhLPiKpofxTyeBUjRe
 dR/2l+r+KZztxh33yGkfUIw6VwWaHfkms70DhUTG2UejOuOOeZ7auPBn1dgZ4rKZZcJp
 HnTkqrMI8SLuKCNde8s5VIe9ZawP2lvieEOUoQmit38odX+DhN1HfQBHiAHO+dbF3SZA
 plZ9Vzs1+fvZYmiLK75JtwjDYiJVZ9DrD8YTn+7yx+9iGCeqxxIUFo40JRET2VFqqN3/
 KbsdDay0pYXPsAV1kF/QRJkfFTCK4DtDvYBopEZsaS4Hjr5H2iTqbm+K4y9cr1JV0kWc
 42hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=nSWHpL5to8azTIVXgT3gO4EqNQG1z+h3ktK8N3RF98I=;
 b=ueyV1vIrX6g1kjYR8L0mZ4qlIpM2krGtglUZUHY7t4ilE60EDX5yts6joZo5F7iDv+
 7tuiFF+dEDLw5V394R9g+pJldsn/iYV+GNMgLBATz39CiGlwam7ndBd1aWyae+h3IYZU
 hwNLVryVwzB1OXdWoUYr7UquiEYQHWBsO+Jxy5+VuK3meafJfOq+Fjg/rjhORbNbRESW
 rrpExki+9vb7WLAKFLK3lrIotnXpwS+YLQjdLLopiXPYEDLO1BOXf92Liq9G4G5SoEBG
 wlJ2Mj7COHVTIL0TTcYfnghSljPXVAQzPPV9+8UYN48Qz3sp06synZl6cYKm+FSACBdB
 iBfQ==
X-Gm-Message-State: ACgBeo2ys3pCfPFPks0h/305t4QTvDpSJDzo8HwClmRJevnKO1qDhv6S
 oH/sdrMvGtZajoT50eDGTPRgvQ==
X-Google-Smtp-Source: AA6agR7zm0vxPa1AWpkfnI8PcHdzvjxgjz9OSczFGuVn0tR8Sw8fhKQkhY2aQ8CF60DPys/ByiYaew==
X-Received: by 2002:a17:902:7e84:b0:16d:be50:f729 with SMTP id
 z4-20020a1709027e8400b0016dbe50f729mr212855pla.16.1660237134692; 
 Thu, 11 Aug 2022 09:58:54 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902c10c00b0016bb24f5d19sm14967789pli.209.2022.08.11.09.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 09:58:54 -0700 (PDT)
Message-ID: <9d15064f-3580-49a8-596b-019663b084fb@linaro.org>
Date: Thu, 11 Aug 2022 09:58:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 4/5] target/i386: Make translator stop before the end
 of a page
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220811095534.241224-1-iii@linux.ibm.com>
 <20220811095534.241224-5-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811095534.241224-5-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 8/11/22 02:55, Ilya Leoshkevich wrote:
> Right now translator stops right *after* the end of a page, which
> breaks reporting of fault locations when the last instruction of a
> multi-insn translation block crosses a page boundary.
> 
> An implementation, like the one arm and s390x have, would require an
> i386 length disassembler, which is burdensome to maintain. Another
> alternative would be to single-step at the end of a guest page, but
> this may come with a performance impact.
> 
> Fix by snapshotting disassembly state and restoring it after we figured
> out we crossed a page boundary. This includes rolling back cc_op
> updates and emitted ops.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   target/i386/tcg/translate.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

