Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519A4D8D9F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:59:29 +0100 (CET)
Received: from localhost ([::1]:33150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqqm-0001Zs-5C
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:59:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTqjW-0004PF-Uo
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:51:58 -0400
Received: from [2607:f8b0:4864:20::102a] (port=38678
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTqjV-0003bs-87
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:51:58 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mm23-20020a17090b359700b001bfceefd8c6so256897pjb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CBIaEt4UaWTMOYSFXInqp5TnU94rpXm1qt4pbQ2jtEc=;
 b=dMGTwTUK3HP21LGyYMRsVlP/uVD0bUMyJR6GBNSAg+qC7XeKGuzucjutjhLqxbX4ks
 v/XzevXiVPK6ll9Ub+7LfA14vGoz7DZ3CU+rusVTo45ukvlAbZYlv+uUtfrZ5BaU5SEF
 xXVAxLy5oyQacIrCuGocbBQ3CbypF95YS/XIdwGfRTl1RHlAUGxjpnzn3ZX7XPA83gYf
 ZEtlLEHtQCMt6l/G4D1uwmiZZxfGtG2SKJje725GI8xEzo/Agkj0QuNIrnfsMC81wBpv
 x4xyh37cU+v90FAL1MVwWIoyT+TeFaP7pluqxrxK2as0qf+8zFbhCsr2wLLJUd1FwY1s
 +Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CBIaEt4UaWTMOYSFXInqp5TnU94rpXm1qt4pbQ2jtEc=;
 b=p5jHVQVfEewrYkCR2b1UivHK45ZjwfwFPeUFVkTwbaf4wYD7WZy0pDnbrWNF41ZYEt
 r2caIOuPZ4l7CbenzZesLnoGD0mq9sd/zs/8i47a4OzwWLF23bP0HRqdpXzLtfMqslpG
 jFjAPBoUUxBzYsURUebwftSggvNiuX67710cw/pLBXf9QBPpoZLV5CYUrBYm4fxgkOi5
 Edxm/SNUWbbJknHUcvGJcPhfmkKc1mS7S8hgM6J+UKf68XSFDondd+cKPZ98pticzD3v
 QsLX0p4GdLpiB2Tc9Bayut3nQieKVkZqjlr7R52Gg/qmvhfw0SYuM1SkPq+G43tUX37U
 elOg==
X-Gm-Message-State: AOAM530g8QkaVaOIjmGaS4zHowsvbRnw2xqG0Ht5ZFYQ8CRzV4hZWemh
 vu+cuTBGGyXLazRiVyHWU7tQcw==
X-Google-Smtp-Source: ABdhPJyTah+hRPvgg2h909EtxI3fP3I4NRtISZ8WmEduSeuhQ+Y/2AwENI4fcoKkqLfkcVyH/IaJLQ==
X-Received: by 2002:a17:90a:4f0b:b0:1be:e320:3e62 with SMTP id
 p11-20020a17090a4f0b00b001bee3203e62mr836960pjh.124.1647287515684; 
 Mon, 14 Mar 2022 12:51:55 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k21-20020aa788d5000000b004f71bff2893sm20641418pff.67.2022.03.14.12.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 12:51:55 -0700 (PDT)
Message-ID: <be1512bb-c4e4-9f7d-833c-bc71dd5365b1@linaro.org>
Date: Mon, 14 Mar 2022 12:51:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/22 09:21, Paolo Bonzini wrote:
> But perhaps someone will try to use templates to replace repeated inclusion (which is 
> common in hw/display) and others will follow suit.

The code in fpu/ desperately calls out for overloading and templates.  At present it is a 
tangle of _Generic and multiple inclusion.


r~

