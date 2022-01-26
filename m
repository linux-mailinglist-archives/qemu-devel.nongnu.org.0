Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC4049D4FB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 23:08:23 +0100 (CET)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCqSl-0006tE-0n
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 17:08:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCqNf-0007pH-P8
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 17:03:07 -0500
Received: from [2607:f8b0:4864:20::634] (port=44704
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCqNe-0004d9-DL
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 17:03:07 -0500
Received: by mail-pl1-x634.google.com with SMTP id c9so779981plg.11
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 14:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VPgfcDXpKMw8WZWATXVRwne4jmv+n69DS9baWQWI+tE=;
 b=UwmqvIvWsu0padI2Oe3q/uN9PTRzkNT1Jntt91tRI0EwfoBziYSyd18eCVQdz3+rxl
 Ge+TL35WiPSPOvzPtFcl7h+XaWLG55laP52K5LC2/MrccHm+y+36Z0R+Lvc9IQ7CXphH
 rJQFHeSQeqFh4TcL7XID7ybCZ6VHy8vF+JAvYoa/VE+JNOjupdPJbAT3K4ZY71ocOkgL
 RgRf3i/aNdDJVxPtRpzA9n79QykuVkQkLYlsiHQQnQQjiR7rzJquif4jvfbqgEMC0ZOS
 Z7M+PUKm8K1XEBNhmW0DfHw/Tw1pIXmjJeiNhdQKEABpAZ6Nd+0EsbVcJ79Zk9F7HFT5
 ASig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VPgfcDXpKMw8WZWATXVRwne4jmv+n69DS9baWQWI+tE=;
 b=5oCoV2JzxvvLK1zRzQYVhS7nQhXTTI2morpUkXlOVV8eoUFVTlxMclxnpkgcq4Lojo
 PT7eHJbQAKVRSpQ/thKxsiaEp+Em/3L4TqnCNlm3PlbxaOb9JEnBMuQTZMrZkCQYq0rv
 oYw8NsPlwR7fKsqvTUz75ZphHhZ17D6IrU6LPXUtGrUep++QbcJL9tHcCCrR6ifUCRBE
 73tuuH0Nuzw/FJIEHLXUWYRygG0Gv7p5ku3cbDWXBi/ozYMU9ixIHFEezWWoyUiqRbVM
 DymygOGd5gQJ7C1phbuLAe9oDFsrDVl0NzJMIfIDalV92wWkwg29choJHiMeNsC1iM1F
 bqBA==
X-Gm-Message-State: AOAM530DKTzSbiezCtoEqVZys6bJ48laDbA8jxNz7XHzabROur+pZN+8
 yrr5DjjMZWP+DdTT7f95dh/TpA==
X-Google-Smtp-Source: ABdhPJyA3F48ugoWj5GEQ+lzMIl6RFWVLE0llR5tweRXhdS9H5JBBZa2p/8TGC52AhADOLIz1B0y/g==
X-Received: by 2002:a17:903:2305:: with SMTP id
 d5mr507155plh.122.1643234585178; 
 Wed, 26 Jan 2022 14:03:05 -0800 (PST)
Received: from ?IPv6:2001:8003:1d71:4f01:4dac:f487:9ea0:53e8?
 ([2001:8003:1d71:4f01:4dac:f487:9ea0:53e8])
 by smtp.gmail.com with ESMTPSA id oj5sm3967580pjb.53.2022.01.26.14.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 14:03:04 -0800 (PST)
Subject: Re: [PATCH v2 08/14] target/ppc: 405: System call exception cleanup
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-9-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c31edf1-ed74-9cf7-312d-26ae1ede72fb@linaro.org>
Date: Thu, 27 Jan 2022 09:02:58 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118184448.852996-9-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 5:44 AM, Fabiano Rosas wrote:
> There's no sc 1.
> 
> Signed-off-by: Fabiano Rosas<farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 21 ++-------------------
>   1 file changed, 2 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

