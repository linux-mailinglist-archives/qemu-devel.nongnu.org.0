Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FDA5A054C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 02:47:01 +0200 (CEST)
Received: from localhost ([::1]:45356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR11Q-00079V-A3
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 20:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0yd-0005Pq-AB
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:44:07 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0yb-0001ah-M0
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:44:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso3336758pjk.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 17:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=hxnj6ZXGhcTM7KNTFzrESQFirD9yPorl/xLt7L0dLqQ=;
 b=wQQ4PlkKJ9g07i99FAL+xfe+hYlUElo+xgS4Klf5bUrQjKQXKZpYgi2bYJXdXeogBs
 te+oOSVeLJIFe0YsbhqO8fmUyxmgnimLqYzxDyrDRe0tCT4aS9fFmCktJUI7X4EyjCmW
 S7IkABE2SfExZ89TMMSD4FgffJohAWUDRKMoMEjgLejfkjDbVZReIB0tyKhAiRAK0lYw
 M7dV0Y97AKLPev1nIRS4tbsBItNuqwckobcnjhlaFsfPlaYx0pF21fmTJ5yFbpMwVCEO
 df3zvnakAQ2ibPMrhL7JCv0SsolFK5vtzNKMHlLDvcO702GswtJxQnbtUqppPl6roiZC
 ZTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=hxnj6ZXGhcTM7KNTFzrESQFirD9yPorl/xLt7L0dLqQ=;
 b=TU3x+HiJIzBEsBC0gA9q67MWB81hTqiw8UKNUoYI+T/MF2bDNAdnerplJR5zpdNZDn
 8n0ee2/zC7l5y8qZfveyWh13ppdpv7hX9Djz2h5rXvF2DJiSOUEMxCGjtY98ggZqcACQ
 YuhLZr1DkGAvQhTy1ym582ypWLbXurUbNwAbYupZDw1mDhiupOir3JQPlCrz8pEBRc4S
 YnPoKM7oi0jIEzLeSOetjncx2a38F4IhKRICseESg6K2Obi3mQ2emrjdKjuB9fZ+zN7e
 gfSJ+ESndeNM+A5wI8AvY1ix1daaEXh2hNfW4HizpirLdxDzKWwITXJeZRocN1iZoO4z
 8w0w==
X-Gm-Message-State: ACgBeo1asQmbmx7/Cmlrq3/JlUsolpg3i5rfhdVQC8lDKLOi8U+OTLw9
 5NYfq4MamXH/xE2s3iP4c+IsbA==
X-Google-Smtp-Source: AA6agR6ETI5PhWjK2bVFSRcbti/BsbYghrsr3bu/FZx1sA4ZhA4aCcTl/hs11Ebm5Y6x6QzXGAQQ0g==
X-Received: by 2002:a17:90a:7bce:b0:1fa:bd3c:71df with SMTP id
 d14-20020a17090a7bce00b001fabd3c71dfmr10989433pjl.40.1661388243818; 
 Wed, 24 Aug 2022 17:44:03 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:944b:63b7:13bc:4d26?
 ([2602:47:d49d:ec01:944b:63b7:13bc:4d26])
 by smtp.gmail.com with ESMTPSA id
 rm10-20020a17090b3eca00b001fb398e5e6esm2171226pjb.55.2022.08.24.17.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 17:44:03 -0700 (PDT)
Message-ID: <a24b1535-a31a-9ffc-4f54-84c9a4258dce@linaro.org>
Date: Wed, 24 Aug 2022 17:44:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 17/17] target/i386: add a8-af, b8-bf opcodes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173250.232491-11-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220824173250.232491-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 8/24/22 10:32, Paolo Bonzini wrote:
> +static void gen_LODS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    MemOp ot = decode->op[0].ot;
> +    if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
> +        gen_repz_lods(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base);

Note that I've got a rather large patch set that cleans up this pc frobbery.


r~

