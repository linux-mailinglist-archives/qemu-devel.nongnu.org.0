Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC238763C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:14:10 +0200 (CEST)
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwjp-0000e7-Vk
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwOi-0003sa-Re
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwOh-0006Pl-7w
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VB6Glxgak9GweIKpaSD6Q1AxMQ3NZ/2LgI7//SgwllI=;
 b=KwyItDqT4hXkrAvXCrFvgo4gSbm07LUqsZQYvGN/gReHcemIIrTjYxq+cjJKs656iC14e0
 vpO96SVL3BtTEbs7y9E2xaK+scQlK3zmdHA80MeY9F+rQHfSiFb/x2rGdq01zZ1HG93361
 90VHY2MLvdG3iqCXYVYKS9pypSfLYY8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-6hPoZ_D9MHWADPIrObwHjg-1; Tue, 18 May 2021 05:52:17 -0400
X-MC-Unique: 6hPoZ_D9MHWADPIrObwHjg-1
Received: by mail-ed1-f72.google.com with SMTP id
 h18-20020a05640250d2b029038cc3938914so5459067edb.17
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VB6Glxgak9GweIKpaSD6Q1AxMQ3NZ/2LgI7//SgwllI=;
 b=DyTd8x/XjX0Q5nnsjxd6BkoQqdvqcE7SjmIM+pQnOjdFsJBorG25RQ5wmnZklIe8s1
 DEnPFttAfpp6+sbM7uGubetoyMRfb7T6H+v3VN/LizputXkbjiMPOkE3RVlp8RAhbDUM
 PgavDJJQBnlZPc9DQ+vBNsFzHhfhVpyr6hdxyVnffi27NFKHXpWy+dLuJ4D0aiLlB3R0
 isT0phIKIxehPfNCaCs786g/nx+Pj3VV8u04BO1MXiDv0x9PbteAY1r7zL+DMMSjXpI2
 gl9rfZaydD+ctFqcxToXV3zFPjJpALz5JERF85H6VErBZ4Tnzc2SFknfa3LfB+ZtTx+i
 lC5g==
X-Gm-Message-State: AOAM533qeAQhmMLjBvC/03qKbNbVR8cv57+qtnqbTEm981nXSsFgwIBv
 2XiGMhIwrauQs33qOC3wGqfkjIn99xMLEToZETphPsmpF1V4tqnSEmUVwnt0eIzS8ccEOR+9HSa
 GQWuSlhnPUBUgXxc=
X-Received: by 2002:a17:906:ccdd:: with SMTP id
 ot29mr5197446ejb.72.1621331535967; 
 Tue, 18 May 2021 02:52:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFXUCGg3dM37GUAhK2zcv9ZKqD1iyBcgyh0mytD/B7uz0ojLB59aPN7KAzRPxFolYNL9TznQ==
X-Received: by 2002:a17:906:ccdd:: with SMTP id
 ot29mr5197435ejb.72.1621331535784; 
 Tue, 18 May 2021 02:52:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k14sm9219156eds.0.2021.05.18.02.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:52:15 -0700 (PDT)
Subject: Re: [PATCH v2 33/50] target/i386: Eliminate SVM helpers for user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-34-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c422a9ff-0105-4b2f-167d-829276cbb89b@redhat.com>
Date: Tue, 18 May 2021 11:52:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-34-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
> Use STUB_HELPER to ensure that such calls are always eliminated.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/helper.h             |  3 +--
>   target/i386/tcg/translate.c      |  9 ++++++++
>   target/i386/tcg/user/svm_stubs.c | 38 --------------------------------
>   3 files changed, 10 insertions(+), 40 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


