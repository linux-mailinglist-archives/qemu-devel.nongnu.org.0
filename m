Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D8C5A15ED
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:39:58 +0200 (CEST)
Received: from localhost ([::1]:37220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRExZ-0002om-CM
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oREub-0008Nz-Ax
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:36:53 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oREuY-0007Vj-Lt
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:36:52 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso5357714pjk.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=NCteGgGXcIppP2zwWwearvSeOQFPuoYs00f4ncPYvRk=;
 b=jt8w9VBQKKoO/CxmNxerElNrZAlH+l13vlXkUkKpnDN74+9/eK8TS8Fr2SUoqy3kQE
 BucxkNs1CQ2DpWTDgpl4BvQeJFmOX9Kw9NJmdb8TFcebHHONX7VNJupM+baUzbU4lGXa
 /b/mIVsvY3JkiNYMGyKDMrH7F7cPGKMil98zL30PlxtOO12X7YGXv1zAXUDU3AMcMdn4
 U92gGqu4csHXUupdPbJ9fx+ok/5bvqPE5ht3fZjF/2/0dxLYP3xSa5qTyj9b1DjNmzmI
 QqE74TX/RKf+Y4TQTGIKXRCKmy+f5oeMW+vRyswjGW/J1M/0p8rWNi8NOycMFxv3kk2f
 beeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NCteGgGXcIppP2zwWwearvSeOQFPuoYs00f4ncPYvRk=;
 b=hmchVzzlz/WOewgEVL2n6IIb6/g2HsAJei2uQ5mFh5vaf+tj4FBIp5k9eaKBP6I1br
 j/cpgNtq6x4QYpnG2CdcAPQdOSrbTrXf7E2TGzDSAm5Hb2jHPx8yiyQaXZsiis6sZch1
 yVdSZkc4D+lAxKnwvIh6QkOoi/crjpcu+SrRN0syQzrLnX+pT6shjp5oDWwvhi+rYfhU
 RS0zXSaaIyroGHeWcdyaT1alKj/C/OiHsBGFjEVipvxVKAhhAosLPAHqbGDfoS4s05q5
 Xq4gW+de6sKUlTchQtviN3SuOjmGDq4fWhhHMvKnGvNLvFhWcqKFqu3QaguiDHcaaX5x
 ql9g==
X-Gm-Message-State: ACgBeo14Wp7CO9kMvfqax1ejOmvUaAu5dwX73drgNenEwl/TBOcG0/eV
 KkpkXvEPMwPcBcdKnyVTTezbpw==
X-Google-Smtp-Source: AA6agR4HEkYU5ESLyaqYeMik5TUTbozefRUC3GVzpCMUfo//xwoaqvxso62zahDBVfCWH6p1SvSSjw==
X-Received: by 2002:a17:90b:264e:b0:1fb:c093:36a2 with SMTP id
 pa14-20020a17090b264e00b001fbc09336a2mr1396899pjb.117.1661441806046; 
 Thu, 25 Aug 2022 08:36:46 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:64be:e7c:2851:ce4b?
 ([2602:47:d49d:ec01:64be:e7c:2851:ce4b])
 by smtp.gmail.com with ESMTPSA id
 e5-20020aa79805000000b005366e592cf9sm10445771pfl.96.2022.08.25.08.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 08:36:45 -0700 (PDT)
Message-ID: <cfc4d1b0-1663-d831-2312-5e9dbbd7b25b@linaro.org>
Date: Thu, 25 Aug 2022 08:36:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/17] target/i386: add ALU load/writeback core
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173123.232018-5-pbonzini@redhat.com>
 <7b4759db-6592-2bc2-25f6-a762e8a83c26@linaro.org>
 <577bfd2b-090f-d324-6a76-5b851a87e905@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <577bfd2b-090f-d324-6a76-5b851a87e905@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 8/24/22 23:48, Paolo Bonzini wrote:
> On 8/25/22 02:23, Richard Henderson wrote:
>>> +    op->v = v;
>>> +}
>>
>> Surely this assignment...
>>
>>> +static void gen_writeback(DisasContext *s, X86DecodedOp *op)
>>> +{
>> ...
>>> +    case X86_ALU_GPR:
>>> +        gen_op_mov_reg_v(s, op->ot, op->n, s->T0);
>>
>> ... can be used here instead of hard-coding T0.  It should be easy enough to create *_v 
>> editions of all *_T0, such as gen_movl_seg_T0.
> 
> No, decode.op[0].v is never initialized.
> 
> In fact, even decode.op[1].v and decode.op[2].v are never used, the gen_* functions just 
> hardcode T0 = f(T0, T1).

Ah, that's a shame.  Perhaps better, then to avoid confusion and remove it?  We can put it 
back when we do attempt to clean up the temps...


r~

