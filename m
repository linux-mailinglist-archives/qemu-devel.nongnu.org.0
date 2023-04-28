Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8311E6F20A6
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 00:03:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psW9g-0000Wk-Hv; Fri, 28 Apr 2023 18:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psW9e-0000Uy-Hk
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:01:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psW9Z-0000LO-Ch
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:01:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso1753075e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 15:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682719276; x=1685311276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zbs9f5ZaSvzsyhFHwXQpk7Lu0hiaNaZGyjPxdZWqSDU=;
 b=wnokqZmAN0SVi6reNsfGTmEHL4iwDtcDT/xnbFZD6YqXpWp3GvWFHb7l4j6dfcd4wP
 YSZlS4BKGjaqHjB9gRBmCCeD18Wt6Kui/c69xN1D7JqbucpawHV5eDZzppy8E2rgssg5
 UzVJkxTgSASIq+/DJX0W/gp7C5J/IFRLwY1WM7vXMD8LORW5ykkcO530xfUGxwFxi2cy
 Yw1C+DO14likh2i6V1NhAB5510c+vP6SDr3dapOoUnCb+Ho1K9aS9NCY6tLIBuEQC8nu
 ihMhTaWWLhSKY2REhCnr26dwt8e/+i1AaiYRgIUzz0fiA6g/NOjNl5TVpkw2nB6naA5J
 mN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682719276; x=1685311276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zbs9f5ZaSvzsyhFHwXQpk7Lu0hiaNaZGyjPxdZWqSDU=;
 b=WsYT/jk9yoSsja4hMw0NGHajPlGCxrt8ZNmyBCVH48ATsEqggyPdz0rjue722DOJJF
 PipR0M2QfMzDNTTB/KopCaSkhAle+/OkFzDfJurBX8fA1Ql/Pr/kiRmgEI50ED+ev+5f
 OWW9eBGyQdiM0D8W5m6lAsP5blNcCYlRDxGKCWSm7gcCIejxTqSbCkZzxFA9NYfD/ak/
 MDJj0L6DStp9b6ElUBGn5eFPAelVsXgbgJi+U32HrdzUFm7DXF3If97y3tkNIMRz0zDi
 BnkMblstvGKGavqga87PgZqRnzK4vBrSuUAN1kqkQhrB/ttPP+Y11EK6/hcsh3TkKE7E
 doRQ==
X-Gm-Message-State: AC+VfDyFWnn+ipxH6xw4cjos1ZCmUIMcUbgNxmmRq/+2xUf+QJuuPk7N
 w/isqycEkNauSnHN6ZBeHb9vfLIW5fNPAS/09dgNjA==
X-Google-Smtp-Source: ACHHUZ7PSyJIJInklnFSDwRyWBv6VdlCosBThBl99h4w0ImiQfWGSckdrF0hhB31I1PuKPBFAkzDWw==
X-Received: by 2002:a1c:6a05:0:b0:3f1:95af:172c with SMTP id
 f5-20020a1c6a05000000b003f195af172cmr4698821wmc.41.1682719275917; 
 Fri, 28 Apr 2023 15:01:15 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a5d5950000000b0030490c8ccafsm10022879wri.52.2023.04.28.15.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:01:15 -0700 (PDT)
Message-ID: <2ef30855-8f71-3793-f232-b243387183e5@linaro.org>
Date: Fri, 28 Apr 2023 23:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] softmmu: Tidy dirtylimit_dirty_ring_full_time
Content-Language: en-US
To: quintela@redhat.com, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>,
 Hyman Huang <huangy81@chinatelecom.cn>, Peter Xu <peterx@redhat.com>
References: <20230428103448.3811208-1-richard.henderson@linaro.org>
 <be8ccc72-0dfb-ca33-e309-27d51d96a623@redhat.com>
 <87jzxv6eej.fsf@secure.mitica>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87jzxv6eej.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 4/28/23 19:38, Juan Quintela wrote:
> Thomas Huth <thuth@redhat.com> wrote:
>> On 28/04/2023 12.34, Richard Henderson wrote:
>>> Drop inline marker: let compiler decide.
>>> Change return type to uint64_t: this matches the computation in the
>>> return statement and the local variable assignment in the caller.
>>> Rename local to dirty_ring_size_MB to fix typo.
>>> Simplify conversion to MiB via qemu_target_page_bits and right shift.
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Thanks,

Queueing to tcg-next.


r~

