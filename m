Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CDA51A601
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:48:51 +0200 (CEST)
Received: from localhost ([::1]:42886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIBD-0001OG-6t
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI6M-0002S0-ON
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:46 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:46702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI6L-00085V-3d
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:46 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-d39f741ba0so1717166fac.13
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=/UMcd+Z77XI3xX4+0EwM2IC/uMv0bba4QixX1CJIBus=;
 b=xj68BQBQBbkGHy/X1nZ5hZTIvTZFEdHkHq/5E02awEP456CGu9X9xBdFd4wfHFgBdO
 i5nJalCybMLKq6nXgqfcth7F1vQ3GkGnPiJMcrejODC63tGqrLfa/HCb/A2BX6LeS5MF
 gn/6Tk9hWZsM9NI5tV6VjV+MbQtvXs4mjaGZAOpjiMaZweKhwylsKCARccsxVddBKse7
 /wQW4f/YqLKH+asuXu5Z2wGcG2Rgc8XlhButb21y8rMASaYq84BOjwFzPy0FKRXUX6if
 nLHTuF3t9YRoWt0ZI3CnBFbmoHf+YB6qEyYwPIfqUaUs6qzFLj6+EoqIxYpbwZXEQ8UU
 qdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/UMcd+Z77XI3xX4+0EwM2IC/uMv0bba4QixX1CJIBus=;
 b=gHloQUEoffcpyetr7LMGuF6adSkNLe3SubVkUQsHuT+87xTPuqzrYBfSV8hFtDkwRT
 YJIq30EcjdEtdLPBxxbqJGb0pWgwes+tmhy6Q2KzKbX2RqQLjwom3fJDL/vDVV56qvxq
 S4+Wvc2dm1O00Y8TJX95vIZv13r3m2laoEvSc18sY+cNchhOV35vqS6mJ3Ynb8A71XMn
 uzsfz4Vlg2qg7kJIjIAZg47X6QyN6+rJ/wI5kFV0JNjumXKQni/NFMWyW6hiFuF2gxwM
 hYkkehXk0ZSnuBALNOq8eLDLMKScVwVHmxRQc2rSMJPnrMY3W9zMbBwqmEL4GRe59mOc
 cWJg==
X-Gm-Message-State: AOAM533Ewnce2WLsIyYoqzPUdr83YeE4/FnNIjQEuRGoae1QbIDF2i4S
 bNClB6dfy2OXowVLV+6beRBEZhK6430/IQ==
X-Google-Smtp-Source: ABdhPJwvIFqB9EMfXlxhML3fUTikxdMjra/nV2Cknm/v6xfMugIAVuh3KoSjYUJ5+Xvt1lzfY6VE/Q==
X-Received: by 2002:a05:6870:f292:b0:de:d5d2:573e with SMTP id
 u18-20020a056870f29200b000ded5d2573emr165686oap.73.1651682623967; 
 Wed, 04 May 2022 09:43:43 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a056870514400b000edae17a8cesm3127608oak.3.2022.05.04.09.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:43:43 -0700 (PDT)
Message-ID: <4af954c5-0e0d-b73e-a0d6-ba12c7be5e2c@linaro.org>
Date: Wed, 4 May 2022 10:44:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 23/50] lasi: checkpatch fixes
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-24-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-24-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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

On 5/4/22 02:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/lasi.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

