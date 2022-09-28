Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579475EE282
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:04:27 +0200 (CEST)
Received: from localhost ([::1]:58196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odaTy-00064F-6Z
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oda8Z-0007QV-Be
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:42:22 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oda8W-0000Aw-Fx
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:42:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 h8-20020a17090a054800b00205ccbae31eso3036497pjf.5
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=cxA/M8MpQOXnt1A+UOhleSOKD9SXff2wRWBRadO1iPc=;
 b=KGuowKAWES7OXef7SnGXL1qYeTYidQi6lXNApUf07Y3s6zD/cAUxpPoZHj7sM/I3/U
 11vZ6HP0ikpiyMbYGwowVIgaNPbnpqqsxXtALT0xKlktNM6ePVBSWjKKo+h5HOl54ok8
 OpL12/alGkOvfNB1yYo7XD+hGX/CM8VXkrzCn2JUu1BenR1Ip5SRw3SNczFD4BrbsztY
 cKP2XDRnvPJW01Dbr+7aGiqtScSP/CFce6un4ZsPxVfCVXb0oIbU7N+h7/9LjJz1IWW9
 HCIelUMBBmxXHsBt8gZeJBrP51mW6jUs4KJUNyqRswkPzUoscKarbOvUxISzIxEFSodI
 C35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cxA/M8MpQOXnt1A+UOhleSOKD9SXff2wRWBRadO1iPc=;
 b=G2mTaVb8WLUoJaazSCSpwCw9D/sJgi4416o8qm4/tgHT/OL9HlUtIiCn6rw75s01k3
 OCFtfIh1Lr0rOAeF5YYxHLh6KGmZmpjB8vjhvvJ2Sz13/Vfxy6Qar+k+obvPDPvynHb7
 E4KHlu72qvTQAQzETFNFgSE5U62keJOYOW+phgfhDJr/Ykvh21a+FH+NY4PmI+ZvqKv3
 iIOHeNnnXtU/rE9uBQk8i1fJxUfZ8oI4tcCfUmPmVSBvu3GVEbI2YjkMBkuu7OdoL61r
 +gzxeVGzUwNcDXobfcQXoXNumZViRC1R5J22sC2rPqCxGcvLQAFNlKlbyWRFDiWbd8tS
 ES5A==
X-Gm-Message-State: ACrzQf1c8iFOY4+TlJI4bTls7Ok3CcZgv9Z81IcbBmLsPZDWdG3eSsAz
 J5VoqdNXyedPEWt1LTbWgR2n3g==
X-Google-Smtp-Source: AMsMyM5KTEr+kMPFQYGdC0VWP8O4iT3bXRb5qs9o79sBwM34a9a4929JlRL+WKyEp6MilQtWzMG5pA==
X-Received: by 2002:a17:902:e945:b0:179:ce23:dd4d with SMTP id
 b5-20020a170902e94500b00179ce23dd4dmr693429pll.68.1664383334779; 
 Wed, 28 Sep 2022 09:42:14 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a170902ce8400b00178b06fea7asm4054541plg.148.2022.09.28.09.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:42:14 -0700 (PDT)
Message-ID: <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
Date: Wed, 28 Sep 2022 09:42:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/22 07:14, Alex Bennée wrote:
> +/*
> + * Every memory transaction comes from a specific place which defines
> + * how requester_id should be handled. For CPU's the requester_id is
> + * the global cpu_index which needs further processing if you need to
> + * work out which socket or complex it comes from. UNSPECIFIED is the
> + * default for otherwise undefined MemTxAttrs. PCI indicates the
> + * requester_id is a PCI id. MACHINE indicates a machine specific
> + * encoding which needs further processing to decode into its
> + * constituent parts.
> + */
> +typedef enum MemTxRequesterType {
> +    MTRT_CPU = 0,
> +    MTRT_UNSPECIFIED,
> +    MTRT_PCI,
> +    MTRT_MACHINE
> +} MemTxRequesterType;


I wonder if UNSPECIFIED should be zero, or even ILLEGAL, attempting to catch MemTxAttrs 
foo = { }, which is now ill-formed as it doesn't initialize .requester_id to match CPU.

Perhaps a preceeding patch, should introduce

#define MEMTXATTRS_CPU(cpu)  ((MemTxAttrs){ })

and modify all uses of "= { }", at least under target/.

> --- a/hw/misc/tz-msc.c
> +++ b/hw/misc/tz-msc.c
> @@ -137,11 +137,11 @@ static MemTxResult tz_msc_read(void *opaque, hwaddr addr, uint64_t *pdata,
>           return MEMTX_OK;
>       case MSCAllowSecure:
>           attrs.secure = 1;
> -        attrs.unspecified = 0;
> +        attrs.requester_type = MTRT_CPU;
>           break;
>       case MSCAllowNonSecure:
>           attrs.secure = 0;
> -        attrs.unspecified = 0;
> +        attrs.requester_type = MTRT_CPU;
>           break;

This is surely incomplete.  You can't just set "cpu" without saying where it's from.

Since this device is only used by the ARMSSE machine, I would hope that attrs.unspecified 
should never be set before the patch, and thus MTRT_CPU should be set afterward.


r~

