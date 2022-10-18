Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1106024CD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 08:57:23 +0200 (CEST)
Received: from localhost ([::1]:47292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgXK-0004uw-O1
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 02:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jirislaby@gmail.com>)
 id 1okg7K-0006CQ-PM
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:30:24 -0400
Received: from mail-ed1-f51.google.com ([209.85.208.51]:39644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jirislaby@gmail.com>)
 id 1okg7H-0001ZZ-Tm
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:30:21 -0400
Received: by mail-ed1-f51.google.com with SMTP id b12so19043171edd.6
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 23:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jB6SnPZVSCFd7Yx4Iih7QSYQ6Bm78H8fjbo7Xdb7+LA=;
 b=rJ6HOiuq8/hy2orrPy60EhzQCt5TKPdyDkCTGE2vVPvtFlaQqxPkCGwT1Yr8GEyhCm
 be1oS9pEWF04ZKR3x3+QJ6i51UDLBPSH7E4bwfUdfcvWIHvvxORIrIsu0zrDxUT3QuA5
 dTRq2yrPU43s3tDAtKyMnhoCgmY04oTuCxhuvhRqToA596Luhe75E9S342pMukEugjhx
 7XaD212X5Nnfx8617YXNdWN42avjDsipQ8BBLvHx6Ul/rAoY72PeLfSm/DA477I3Nsvj
 va2/PD7e4j0I4yoqlKF0oNBwTjSWxzg8VaAbky2pw4x/v1ufWxidOs+1j0qRXkfzHtAT
 Gj2g==
X-Gm-Message-State: ACrzQf1fmYvtoDHX5D9AO3GRTikmMyVNeZ8k0BcQJ6icJcF8a75Efmpr
 zg+uiU5oNAZYS3PosnmTZ/8=
X-Google-Smtp-Source: AMsMyM62/3/olg9naMcL5lKgnZuK0JusvCK7KsChTU3moRNIFvfVzXA0JM+FA0U6jKorJ1pxUODxeA==
X-Received: by 2002:a05:6402:d5f:b0:458:dc7e:f728 with SMTP id
 ec31-20020a0564020d5f00b00458dc7ef728mr1280587edb.220.1666074615020; 
 Mon, 17 Oct 2022 23:30:15 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a1709060cca00b0078d21574986sm7073706ejh.203.2022.10.17.23.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 23:30:14 -0700 (PDT)
Message-ID: <380c1527-e664-f7c5-6d18-bf53d99aed33@kernel.org>
Date: Tue, 18 Oct 2022 08:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Alexander Bulekov <alxndr@bu.edu>
Cc: Chris Friedt <chrisfriedt@gmail.com>, qemu-devel@nongnu.org,
 cfriedt@meta.com
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
 <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
 <CAFEAcA8Cc+XtwcQz3bJom2=MgYZgLHw8SO6uqQQdVN4aqpq4Hg@mail.gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <CAFEAcA8Cc+XtwcQz3bJom2=MgYZgLHw8SO6uqQQdVN4aqpq4Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.208.51; envelope-from=jirislaby@gmail.com;
 helo=mail-ed1-f51.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 17. 10. 22, 16:13, Peter Maydell wrote:
>   * for situations where the guest has misprogrammed the device,
>     log that with qemu_log_mask(LOG_GUEST_ERROR, ...)
>     and continue with whatever the real hardware would do, or
>     some reasonable choice if the h/w spec is vague

As I wrote in the previous mail, can we stop the machine after the print 
somehow, for example? So that the students have to "cont" in the qemu 
console as an acknowledgment when this happens.

thanks,
-- 
js
suse labs


