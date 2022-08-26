Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9369F5A2778
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 14:15:12 +0200 (CEST)
Received: from localhost ([::1]:51700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYEs-0006rM-Mv
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 08:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oRXYi-0001kh-Jc
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:31:33 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oRXYg-0000TS-2P
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:31:31 -0400
Received: by mail-ej1-x62f.google.com with SMTP id y3so2621934ejc.1
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 04:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=sVH5CEI9i6nsWMzFgXRuqTvb2XL2NIr1BFkHGlSDHig=;
 b=XYvRsk4luxQhzWiTfhEtzMH1F6RvLeSKTyuO7aVuQSG1OAxiLKQu8xf6eJ0I7YnYaq
 P07+C6EWmAR88mmyiLd+AKOGx1wOQMwxdIY4Je7CwtuB81JtFgHTXaIM7mmwh4aGj37r
 hF7g2QmgICuXJDFHE189ZrzlNZ2fgOHOFS6B6ieWyokqYwPzwtGpvHcBD0cR04sPwwzd
 Tk7d/XcRpJjIHIZlA1urj5vqSr7BGKpqiJjj7xOqByLAPumaheHoN9I7KBC//lqESVuS
 zszvqcclzYKSjEbi5a+g3wo5FMSWlusmKOVjz2RyzGWD4Cwk2drchcyyuF1Z7fJGjYtq
 j7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=sVH5CEI9i6nsWMzFgXRuqTvb2XL2NIr1BFkHGlSDHig=;
 b=do/g55Go/LTUVqOfJT+27/FBP5kehdik2HNgUdvGZ4WOx2hydMUwatOb8lZsxqINVR
 CRXUYw25hJOocFg2qpe4LbfwxIl/8dCIxBzI0mIooqC0H/GJvrle4mvXmA/DXzq41Iji
 u+SZr5f9DetOLKceSem4KNTauPC2j7HVHEeWPvv8k4Zk6Ol/Od9Lihk/jvrjiuw6TX6A
 B+ghBo2edoMIGKyy/HlTe8/hIvVSOnQSx7FFEr3mEwq7qb6rLK1I0YUhPQ7E75nTklzI
 mJSV/G9H8Jey/uWuMQIfnJePnKxpy64eNE1kJbjWVieobBPeC1GQSLDeILCP2Ja71jxr
 K5uw==
X-Gm-Message-State: ACgBeo3MeKkRpGOo8h3JhECL9QcMBYAeO2mW3v4hUhgnUfiddEoJvTJz
 o85vgSQveNvMJRVCxxk4Q8a8tegDP70=
X-Google-Smtp-Source: AA6agR6REFJNC3a805+uZBJsCvLLl2YXSVk/XMTq1OdToYkb6ceZ6DGKnEflQifc6s/jXiv+kOr4oQ==
X-Received: by 2002:a17:907:2cd1:b0:730:a980:d593 with SMTP id
 hg17-20020a1709072cd100b00730a980d593mr5224889ejc.48.1661513487262; 
 Fri, 26 Aug 2022 04:31:27 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 vs23-20020a170907139700b0072ed9efc9dfsm794004ejb.48.2022.08.26.04.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 04:31:26 -0700 (PDT)
Message-ID: <b5f8af4d-afa8-957a-a2f9-b6583b735d99@redhat.com>
Date: Fri, 26 Aug 2022 13:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 07/18] i386: Rewrite simple integer vector helpers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-8-pbonzini@redhat.com>
 <520eb01b-fcf0-a5f4-a2cb-50881bcfd281@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <520eb01b-fcf0-a5f4-a2cb-50881bcfd281@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 8/26/22 02:01, Richard Henderson wrote:
>>
>> -#if SHIFT == 0
>> -SSE_HELPER_W(helper_pmulhrw, FMULHRW)
>> -#endif
>>   SSE_HELPER_W(helper_pmulhuw, FMULHUW)
>>   SSE_HELPER_W(helper_pmulhw, FMULHW)
>> +#if SHIFT == 0
>> +void glue(helper_pmulhrw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
>> +{
>> +    d->W(0) = FMULHRW(d->W(0), s->W(0));
>> +    d->W(1) = FMULHRW(d->W(1), s->W(1));
>> +    d->W(2) = FMULHRW(d->W(2), s->W(2));
>> +    d->W(3) = FMULHRW(d->W(3), s->W(3));
>> +}
>> +#endif
> 
> Why?

Because this is actually a 3DNow instruction so it doesn't get the 
3-operand treatment later.  But I can defer the change to the next part 
of the series.

Paolo

