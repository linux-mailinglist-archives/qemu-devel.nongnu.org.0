Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7755A6A4AE4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:32:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWjDW-00061U-7H; Mon, 27 Feb 2023 14:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjDU-000604-90
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:31:20 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjDS-0003Uc-QB
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:31:19 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso413991pjr.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EeeTE37fmsQPI1eXBbAqesr7oiLHd0791rkVC7NDMnA=;
 b=UK4+ItHfosCwThnJqHaUPEAXYCRTrN3V8uViRwJHsDl9pCsN05tPsaxF8+hxa5HyZO
 Im63sAlIIOvFOa109nCGNdnMk9TKE/PndU0PDcKMmLn0qZmtEbMkgqY5Qjk73w3d3De/
 ptpOVwXm8HUim6bKDHuVRXJZcld0VPVxiwnLFZTzeuQFkAUerF5UzzbZqGOr5v5ReIHf
 hB7AEiRxaJEFhNbx/DH8T3Ej2+2kTUjriqkH8kMZ7m+ibcTh/n1IgoHTkOVtknlQ7OxH
 66PvCd13Hgu+DmL5R0UFk9lM7oaw/J+0Teb6gjIiJbhKAK8OT0I3knD87nPaXkegzRrZ
 exoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EeeTE37fmsQPI1eXBbAqesr7oiLHd0791rkVC7NDMnA=;
 b=Iss0foKm+eE+HChVwy7qqp14MGH7kc/G9HbEPL/rBREC7EIIkxK4IzZq0i+MLaQMwH
 57L1xOUk2sU00x3cfXzDmLlaumsw+l7F8+kBpS5OLgYpntDIpAqoPcLUSs/7RWa2laMx
 ce3IzlbblZZeKIV1l5Qe3Ku0lPkkzQs55Zdn3+G+I5zjHRhZ9XKar4n8i/c4HwpTo66j
 muiidxP331kQy+vI0iOc7Glf6+x83Li7eMQ9yXzqN1GHYXDY8lMQbahG/2pahsnJUkBs
 Qx/B7I7gwAAJUSLAezUF83tqgSf6Id3oJQTYWvCuQffjaETo86P3lvgkxtJHhJXfn/B8
 Zh8w==
X-Gm-Message-State: AO0yUKUHepCufhlz/YPSzw81Y+KNimWqy77Lb+g7Hq2dBU+mkwS1CBCc
 iO21FhOcDDgFclxOHW7Lj7omRI/sxxfy4/vfrmk=
X-Google-Smtp-Source: AK7set+QH/pFdNp91iXjGqToOnJdtVjNPX2LdE5zeATwGZT0oeUi4yGiKXuuQFijiI0kMAxnf934Iw==
X-Received: by 2002:a05:6a20:431b:b0:cc:9b29:f617 with SMTP id
 h27-20020a056a20431b00b000cc9b29f617mr846575pzk.0.1677526276514; 
 Mon, 27 Feb 2023 11:31:16 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 k10-20020aa7820a000000b005cdbd9c8825sm4571884pfi.195.2023.02.27.11.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 11:31:16 -0800 (PST)
Message-ID: <c45b9a95-7951-6dab-3ef3-5d7189ca7b09@linaro.org>
Date: Mon, 27 Feb 2023 09:31:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/4] target/i386: add FZRM, FSRS, FSRC
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: lei4.wang@intel.com, robert.hu@linux.intel.com, xiaoyao.li@intel.com,
 chenyi.qiang@intel.com
References: <20230227101332.636203-1-pbonzini@redhat.com>
 <20230227101332.636203-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227101332.636203-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/27/23 00:13, Paolo Bonzini wrote:
> These are three more markers for string operation optimizations.
> They can all be added to TCG, whose string operations are more or
> less as fast as they can be for short lengths.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/cpu.c | 7 ++++---
>   target/i386/cpu.h | 7 +++++++
>   2 files changed, 11 insertions(+), 3 deletions(-)

They could in fact be faster, but good enough.  :-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

