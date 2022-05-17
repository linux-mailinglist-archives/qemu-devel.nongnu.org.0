Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB191529918
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 07:37:06 +0200 (CEST)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqptJ-0004Kr-Ec
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 01:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqprV-00033Z-R4
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:35:13 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqprT-0005X8-TA
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:35:13 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 nr2-20020a17090b240200b001df2b1bfc40so1391893pjb.5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s4m8r2SbKXoG+SsMVrt2/sHNUAuS7g9r9gcFM1RwHig=;
 b=MiLcZchpG1YgxmMd8qpKAvmV1yfk2h05TnZm78K1LUoUWAiBNSZFrMeytk0V4HjuCN
 afBUewfTBwSInnBFoH1A38OczbBrzw8xjSqeaZYRN0ufVHA8q0OsLcBQpyx3Q2GAGJLJ
 Mb3mTLAD+gFGHBZwJWNAVJ4P52dREcxmas71gT69hdz5iNidlWII0kwaSY8SJYiGhD+U
 zcxd749kFNAjfIG1ddAMc3DUkw+i3LhEAYliqzEj59l0wmbaw52+smk8/altblRh4D2v
 tuv+iAhi0sH6m0I/qQDuxfLw/QrPSJD1BpKrnNr0/4ipQK6ILODqEbla3R+kSO91YZaJ
 gAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s4m8r2SbKXoG+SsMVrt2/sHNUAuS7g9r9gcFM1RwHig=;
 b=7qxxfdbmmyn22lRaEI6Dqk7iBf8yBreo4EW7LzOK2HqN3J0c5Dvzq8m6MNBjTnNGhM
 ZnLfhFMY3g3TPfOA9IHk5dtqCjGiBxVHpIbfWgyf6NbeVIt9lczf+Pl3nyPXc/+2yxQ+
 ffjyD2DiEH2kn3b3dwISD+bASwhCbEeCVg55KQ9nH+YjPBQevW8HHBOYxyRxEI60Ii9Z
 /2DeSJmA619ekbDYDdXiBbemwfijAo/sD87Ci/qwg8p0Ftu+6h/CZwGrmuqX/cYVu7JN
 pxgT1FILfcSvUylA0RlhjK5rYZnkYNlm/1nKrK2UJIdWcT3ICcph1n4ah0V+j9BUc1Mp
 k3sQ==
X-Gm-Message-State: AOAM531jRtSHz7v7+13MV9J4Ed2dj//c/ApYXsGzVc7M1pgL1C+oRfcI
 xTW6AL6lKV6RzoEWi5vmlRYmlA==
X-Google-Smtp-Source: ABdhPJy1ldFqoU6G0g67hKl2TiTM9RmENhnA9vd/4mEbpwk9mER4jPrezGr3wBBVRnFXxAfqscXGyQ==
X-Received: by 2002:a17:90a:ba11:b0:1df:2d09:1308 with SMTP id
 s17-20020a17090aba1100b001df2d091308mr13310445pjr.184.1652765710238; 
 Mon, 16 May 2022 22:35:10 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 gg3-20020a17090b0a0300b001d96bc27a57sm648883pjb.54.2022.05.16.22.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 22:35:09 -0700 (PDT)
Message-ID: <f045022f-89fb-2f9d-6fa7-aba35fec0529@linaro.org>
Date: Mon, 16 May 2022 22:35:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] capstone: Allow version 3.0.5 again
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-3-thuth@redhat.com>
 <CAFEAcA-RBUX5iXV__1AMrex21DJK7hx8mygksJa6xynJRCEW4g@mail.gmail.com>
 <02b0c561-c93c-2ac8-7579-6c456c37771c@linaro.org>
 <CAFEAcA_Fqm7VL-ZoEuzmoQUDHqbOxKCG9s53GVy8hzDuET82yA@mail.gmail.com>
 <be93a9aa-4edf-3152-c225-19abc291afd2@linaro.org>
 <f8cd57a9-d560-b483-c9ff-8ffde755e80e@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f8cd57a9-d560-b483-c9ff-8ffde755e80e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 5/16/22 12:22, Thomas Huth wrote:
> So it seems like really only the capstone 3.0.4 from Ubuntu 18.04 is broken,
> while this compiles fine with the capstone 3.0.5 from Ubuntu 20.04.
> 
> I think my patches should be ok to apply now that we dropped support
> for Ubuntu 18.04.

Yes, I think so. Especially with the >=3.0.5 test.


r~

