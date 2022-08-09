Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F07958DEFA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 20:29:04 +0200 (CEST)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLTyQ-0002KZ-M7
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 14:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLTuu-0007xm-Ra
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 14:25:25 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLTup-0006DL-IK
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 14:25:23 -0400
Received: by mail-pj1-x1036.google.com with SMTP id a8so12478408pjg.5
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 11:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5csjBBO2X+k/PRvIAQyFaBapStKkydZ2pTcv+bSVFbU=;
 b=mVg4JggEt+H0zniWHKc53TQ1xP3m+YtqqNhgkFmUhzFDMEfNyJMO8Co4ERevj1Q1/3
 h5O14UNIj1EyCkFiJQxDhlo2Yy2szdglxzYs+5WYiNQ2pAev0qEJoloVODCmecP1HEoT
 y+hixZxn+yb1i9PwBBr8cvwWIhSmR5nHLbvmdButNVliBQxiUOdjw8aycQvQgWlgj1BN
 02NN7HoXiZxY9IVhQyTmGDkYskoK3vszbS3Ub+HWmS+dD4NXU4wa8XzzgC+FFGe+K5JR
 Tm+TdDWsl2bl/BlzbCCDz78RWr0Z/Znmouq1eEJx0dsbmOB3LWExC6bcm9hAxK52goIk
 EDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5csjBBO2X+k/PRvIAQyFaBapStKkydZ2pTcv+bSVFbU=;
 b=vQUIpU8c6236azAMwujl6twpwDAJmozr2u5j/C6I8DT2rvRwlFbvw+4bj21BDl+IA5
 IaCHZwSNVAvuWXoARFKsGR7sqhvW5uKMwZFxkHQDbbXq3muAWUL2tpEfDMK6O48uEcUq
 +7b6jG3NLey7IvdPHyCv6XnmyD4gYLn/C0IyfhPtuixJipkSHV4rx4s7xB50Y/neQ3TJ
 cAxjFgJgLy0upxvYPDVYCAxufAZrr4D1klnJo95BciBg3PVjDGgCnSCH/XyWwN4MHh/P
 xbNUvgMbYmHmgTEvanDS49zzCDO3rw1gQiT8QzQclqHf/9+Hyz8tLQam+2TBFr0Xfb7M
 v8mQ==
X-Gm-Message-State: ACgBeo29Oc/E0i1R1hckFjQO4Ii2RqNOs6Ee2s5uqMqYEbjRnr3TUm4y
 PvSEi7AVq7w5u93PXh7YYA/10g==
X-Google-Smtp-Source: AA6agR57j4MoCxq4M5azu+YsrGMkVtR65Q4DAQXTOa8Ah57nMMOg57ar7cAeVrL5oIGHMZm/wOuWWw==
X-Received: by 2002:a17:90a:a401:b0:1f2:19a0:2874 with SMTP id
 y1-20020a17090aa40100b001f219a02874mr35712188pjp.146.1660069516505; 
 Tue, 09 Aug 2022 11:25:16 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:409:90e8:ee9:8fec?
 ([2602:ae:154e:e201:409:90e8:ee9:8fec])
 by smtp.gmail.com with ESMTPSA id
 br4-20020a17090b0f0400b001f325b97913sm10339965pjb.53.2022.08.09.11.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 11:25:15 -0700 (PDT)
Message-ID: <2e872d0e-c164-2898-e5ac-85a359e2de58@linaro.org>
Date: Tue, 9 Aug 2022 11:25:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/2] Update AVX512 support for xbzrle_encode_buffer
 function
Content-Language: en-US
To: "Xu, Ling1" <ling1.xu@intel.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Zhao, Zhou"
 <zhou.zhao@intel.com>, "Jin, Jun I" <jun.i.jin@intel.com>
References: <20220808074837.1484760-1-ling1.xu@intel.com>
 <20220808074837.1484760-2-ling1.xu@intel.com> <87r11qnakk.fsf@secure.mitica>
 <BN9PR11MB54652B6666F9C3DA62E02D53D1629@BN9PR11MB5465.namprd11.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <BN9PR11MB54652B6666F9C3DA62E02D53D1629@BN9PR11MB5465.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 8/9/22 00:51, Xu, Ling1 wrote:
> Hi, Juan,
>        Thanks for your advice. We have revised our code including: 1) change "IS_CPU_SUPPORT_AVX512BW" to "is_cpu_support_avx512bw" to indicate that variable isn't global variable;

You can remove this variable entirely...

> 2) use a function pointer to simplify code in ram.c;

... because it's redundant with the function pointer.


r~

