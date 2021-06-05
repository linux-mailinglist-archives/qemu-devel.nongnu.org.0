Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF7939C507
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 04:24:58 +0200 (CEST)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpLzd-00046X-Rp
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 22:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpLyo-0003PP-Nv
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 22:24:06 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpLyn-0002ZJ-2h
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 22:24:06 -0400
Received: by mail-pj1-x102d.google.com with SMTP id i22so6555866pju.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 19:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uHzehet9FZ7hyFejEsNlTZUCqi5M3GUKFzafGj1bo+A=;
 b=PxXpwRlc5QSTpOgesSE9XBwwjftm6FOuWqq8sPmVrrdJyao2dOkL97WfmXwVtLUzYW
 19sT73j0wgeOaM+yMaF4XnUOdZCPxczUly50X1Ye3dOYLeDf9UpDPvsfyZwCidtoe1XR
 KVcaYuI/Sd3CRlYIsOqH+v2Dj3wWIEowVWhR78gsSeDy+u/Yztsr51jDs1HCkNhK1q5j
 bCavG+Ud21ux8JEt0f8SMtMgLOEkkBsa/Gr1KGl0/corHcM2RY1cse+M/hEhrAnXLi9F
 seNfJrhUEmMrrJuOzzJLJ+tIaQugB65Df/F9Wx4Uv7uM4ohMnwwMnNh5NauwSCd4SIHg
 ol1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uHzehet9FZ7hyFejEsNlTZUCqi5M3GUKFzafGj1bo+A=;
 b=cUX7iLbgNblKk5G7fTlpDO871Mm07IAlBfBeQ/wfWBS/306q3jHNYzpkj3suF8E8ZF
 arXSv1bdbL95vAyYwiOWBmXC6dBBvsx41pDnNUpG41IRlPLMtfAm3Ta5udEPP65s1+js
 QnJljmoGG86cvRPTcbwDO2fXnucuHoWumJetU2edZcs1V+VdRkhNvUyIyUmq4nOPU3Ad
 AbbX2zEI+g6PApg+kDeoxZdyRgDnx6ZLGwEDAWpiIx54olwk/X6dMNOPuu8EUVdeuSzI
 wPZ9Yig37FiQ6iIl7nve6hOBfZze4YUXiBzJVTn/NkCk3lXCNuCDAuKWLJzMV4jUPGSa
 FrnQ==
X-Gm-Message-State: AOAM533lDB0Q+VGN5A165p+H3X2VnyxZ1Kdm/GeAXPR0E+i5q+j2wSpf
 CCRNvfIlmwjhnXnS1oe6d2d6Ww==
X-Google-Smtp-Source: ABdhPJx31fIi2v8xSJHxjqWb45GayauFes473eDsam8kSsUbEAYzgm/QZyIQ7UEICDDwZqfbmpXXAg==
X-Received: by 2002:a17:90b:3142:: with SMTP id
 ip2mr2183153pjb.63.1622859843638; 
 Fri, 04 Jun 2021 19:24:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z6sm2896078pfr.99.2021.06.04.19.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 19:24:03 -0700 (PDT)
Subject: Re: [PATCH v16 53/99] target/arm: replace CONFIG_TCG with tcg_enabled
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-54-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e14759c-3d39-7f19-a14e-dbe44e2af67a@linaro.org>
Date: Fri, 4 Jun 2021 19:24:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-54-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> for "all" builds (tcg + kvm), we want to avoid doing
> the psci and semihosting checks if tcg is built-in, but not enabled.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-sysemu.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

