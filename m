Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE64334819
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:37:46 +0100 (CET)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4eP-00086Z-0J
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK4Zh-0004oh-Ar
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:32:54 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:34699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK4ZV-0006WT-Po
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:32:50 -0500
Received: by mail-ot1-x32c.google.com with SMTP id n23so11916820otq.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S8NY5oBQiQzqoiaISiFHKDVjQ0WX1O11WXlob/SoFf8=;
 b=bPJzWLdig02PuUhWjCjkhi/Q+9yMv3uirQPfTH2/QZ5QxWdcIh/n2LFeDqpS1bpRH/
 +r5tTOZ8iEvYPNuQ60mXsxYrXv3HLzx0KoMyXZdPbiQx4rF0CXFxS5MOaQaYZx+vQDC4
 CvM/pih6cXsa+bTevCmXxEA80LPI9nuyZkAwFudVOI26jqnIV9zVuBce3n3ZesTFkmD6
 Ifdw/+nEc1vb9rzXUeq86/P0CUfoaqMGCAaFvvgovC5UGNE9ksqm1uPuG6UgCsGDxIcK
 iZN4MvLfzptzU9m488SzOPdCvdpNfRnaubr+LkmZryScFVtV44rmrOlb9gU0JVoXMuHu
 GLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S8NY5oBQiQzqoiaISiFHKDVjQ0WX1O11WXlob/SoFf8=;
 b=GB917m93klnSfL4GddQb2WgjhwuQEogo36ro5Nl1qQ28g23hEICml7zAKypNFCbKmS
 4Yiu/9l6WYrVAYC6SrPgoBdlOD9R/dnHT22xsnMrQ141v7HUl0ujw+ttOJWSYS9ojKkI
 uHGYETu5BU33ndLuh70M0a4iLjE2YOpymTXXtjrXRR0HI8z3V4+//FMbol0GQ+ENxmT/
 quNZyWcEIuSnUqxhfJP4wZ8dGTPr3euQ1dAQ/+t0CHT3ndRYYa8fl/8EZ2Fio+Ev7CT+
 8RJzFUjzqhsDgo0buTUBFL6BP5JIWYirWdhg1wby8rRKGPQCQa3I4/oM+dqBWo6VjfLO
 kT+A==
X-Gm-Message-State: AOAM533dchVA2NQucGmeWvVAoJ9w0MPhh05OxNlhiMETqOHZmF2u4Vjd
 5Jd2BSHeBWasR/a2RtDBVBkitZJU77hlkeEZ
X-Google-Smtp-Source: ABdhPJwJYgJhgT0RrgrBtRta3eXqKwJVh2ZKTKNGMtupxKThcmk9+kRkfSO64rGLuIJOWEliuZTlzw==
X-Received: by 2002:a9d:1ca1:: with SMTP id l33mr3560946ota.368.1615404760318; 
 Wed, 10 Mar 2021 11:32:40 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m8sm120345otl.50.2021.03.10.11.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 11:32:39 -0800 (PST)
Subject: Re: [PATCH v3 2/3] target/arm: Add support for FEAT_TLBIOS
To: Rebecca Cran <rebecca@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c536c6c-792b-9dc5-8bee-57672a42f7ae@linaro.org>
Date: Wed, 10 Mar 2021 13:32:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310002917.8876-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 6:29 PM, Rebecca Cran wrote:
> +static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 1 ||
> +           FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
> +}

The correct test here is != 0.  See D13.1.3
Principles of the ID scheme for fields in ID registers.


r~

