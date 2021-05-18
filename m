Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526743875C9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:54:52 +0200 (CEST)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwR9-0000wK-B0
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwOY-0003dZ-7s
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwOR-0006If-Dj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbRB/YQ72XSrLHhT0Nv0nfSWwuN7wnyJdLQzy21J3jE=;
 b=GCeV6lVOni9DX4q7BNNwgwoTuxt3zat+mZduPMxYIYoO+MnRreLfBF/tD2u1rm/+kGwKFt
 zZMmleB7yBPVy5E6aoYYOd58uCJ2XATh0tLsPQEYcViQEZYXRQNd0e5bpOVIXeX7dJzrqJ
 g1gem2uQ61eEhzhZvvVoLSo52lxdj4o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-6Xxr0o7nNDeBjzQHdeUQVA-1; Tue, 18 May 2021 05:52:00 -0400
X-MC-Unique: 6Xxr0o7nNDeBjzQHdeUQVA-1
Received: by mail-ej1-f70.google.com with SMTP id
 e1-20020a170906c001b02903d958aadd4fso638617ejz.23
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IbRB/YQ72XSrLHhT0Nv0nfSWwuN7wnyJdLQzy21J3jE=;
 b=daSAqaynBWT93DoB9UsoNQRlqKEYe4CFKr2ol+9LFBc+ZA/feuoi70lH6ZDE/6mTre
 KoT2kC5UD2AOXSQZs9qVaWCS2Y7hdowwedaNdxbkCAYj/uqXIH0fmS12MDAyKL7I93uq
 BSyPzCJaMikCM7PuTgyfOz73Xky8LRVFZkZDXF1SP/riymzuVwy9LyMeOR6fRQh8PZit
 rpin9qTgdo7S6gMWJM7UM+J4mVIqKppHc8mXoMKgbjOUyAw8DlHVMFol+QdBCSCBNNQm
 eFuvfTM/c0FR6SImF+TjUlOQMP882ooDd9GoEbZ5/atVrowY7RuFzWt4JObiiv8vNxpb
 xMxg==
X-Gm-Message-State: AOAM532Bi7JBbJ0kqoOw99UXB30qtxLuM6r5s7NJBP3G0STNmaHkKo7+
 P3PC9+UJ6LF0M/eH8sz/4ogJfwVlfasL843TKJhnmLvrhX+YBC1iqQ71a5oXeTkPM/KRC/CO4y8
 1Nim+XKlT12B037g=
X-Received: by 2002:a17:907:3f8a:: with SMTP id
 hr10mr5069338ejc.137.1621331519220; 
 Tue, 18 May 2021 02:51:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsvb6Y/seNCj9XzeTKxxrbCge3FcMnHL17k23wdrznZoYCSwLIkzQd9P1up3Tcak8KanUB8g==
X-Received: by 2002:a17:907:3f8a:: with SMTP id
 hr10mr5069324ejc.137.1621331519029; 
 Tue, 18 May 2021 02:51:59 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b12sm12796056eds.23.2021.05.18.02.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:51:58 -0700 (PDT)
Subject: Re: [PATCH v2 32/50] target/i386: Implement skinit in translate.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-33-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c388f5c1-2ccf-2bb4-ec01-678b4572c407@redhat.com>
Date: Tue, 18 May 2021 11:51:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-33-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Our sysemu implementation is a stub.  We can already intercept
> instructions for vmexit, and raising #UD is trivial.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/helper.h                | 1 -
>   target/i386/tcg/sysemu/svm_helper.c | 7 -------
>   target/i386/tcg/translate.c         | 7 +++----
>   target/i386/tcg/user/svm_stubs.c    | 4 ----
>   4 files changed, 3 insertions(+), 16 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


