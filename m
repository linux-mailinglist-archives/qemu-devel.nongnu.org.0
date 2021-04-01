Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E7B35167A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 17:59:00 +0200 (CEST)
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzik-00017W-Kr
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 11:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRzhq-0000X2-DN
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:58:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRzhm-00034S-Rw
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617292677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQY1BbWq8EX3AptLm5rLrvnldxlwGhEJXjTtzYrq/sc=;
 b=VBCrasUU7CSUNH/6ZkXX8MZyPRw/AL8rziusKq8A4YalHP6bpGUebKIZMUI5Ol27gbjBGF
 ueaYuRWCXQMZnLx69f2qSdAVGXnoPk3hoQtvriKZhnCWSzQG5PTOPV7jcrWVYn9oM7y56J
 2wS3ZQKTUHhixAmj7aOEB1zMk57OYRg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-oXJ9Ep6tP3WrQh1J8C8jOw-1; Thu, 01 Apr 2021 11:57:55 -0400
X-MC-Unique: oXJ9Ep6tP3WrQh1J8C8jOw-1
Received: by mail-ej1-f71.google.com with SMTP id jo6so2406226ejb.13
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 08:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BQY1BbWq8EX3AptLm5rLrvnldxlwGhEJXjTtzYrq/sc=;
 b=YQN4nznDAk+zeV9NR0Qo0/0Vr2kyttz5xpXlpbM8C7I9R5sUETTcxXcC9VL7esOQb6
 t73tJYJFCklsktkS9dnZnoKnoYWFWQRxnvBH5xpGr8vAgi33Uv2lJtz6Ch6TyWpNuxvZ
 eUPLoZKycB2Bok93Y77hMJ6Zckd1S8YrNAhjcvDFV4IhYBvyzosVgolTktERIE9SAev2
 Gv3tC39bTTCQH1RW6AUIL8SCiCLkVWtLK/751DkB1ivPN5ltx/uLWn8vgyH7aYoiLyol
 Oj/FGRvywxlnBqEmAVu7zW+fdwaSH31wVnYmXBcodfuKtVE7IC8h8N/sOAqZC2+0UBcK
 qXZA==
X-Gm-Message-State: AOAM530CpqCBxggJxx5khwdsImiaKnmh0apRZWCUWwW5E3ffrbwsRpJ3
 hwPMOeeIg7xYnVT4ldyNpHqHCproPbe8Oa4l68RBg+VzRQavkaXIfaIJZ5PF399Z4TRG652sSR7
 m/OirmD5ngjUzQXo=
X-Received: by 2002:a17:906:684b:: with SMTP id
 a11mr9521623ejs.329.1617292674394; 
 Thu, 01 Apr 2021 08:57:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvk9mBmqJ9jTVclHELuT/q3R9eAU8yjHfQaDrq7kMZ9eL5VQR61A1iJK22w7Ys6Awawx/Xlw==
X-Received: by 2002:a17:906:684b:: with SMTP id
 a11mr9521602ejs.329.1617292674234; 
 Thu, 01 Apr 2021 08:57:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r10sm2965165eju.66.2021.04.01.08.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 08:57:53 -0700 (PDT)
Subject: Re: [PATCH 0/2] i386: Fix interrupt based Async PF enablement
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20210401151957.408028-1-vkuznets@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ea3fc380-332f-b9e5-aa31-3540916cfc33@redhat.com>
Date: Thu, 1 Apr 2021 17:57:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401151957.408028-1-vkuznets@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/21 17:19, Vitaly Kuznetsov wrote:
> I noticed two issues with 'kvm-asyncpf-int' enablement:
> 1) We forgot to add to to kvm_default_props[] so it doesn't get enabled
>   automatically (unless '-cpu host' is used or the feature is enabled
>   manually on the command line)
> 2) We forgot to disable it for older machine types to preserve migration.
>   This went unnoticed because of 1) I believe.
> 
> Vitaly Kuznetsov (2):
>    i386: Add 'kvm-asyncpf-int' to kvm_default_props array
>    i386: Disable 'kvm-asyncpf-int' feature for machine types <= 5.1
> 
>   hw/i386/pc.c      | 1 +
>   target/i386/cpu.c | 1 +
>   2 files changed, 2 insertions(+)
> 

Wasn't this intentional to avoid requiring a new kernel version?

Paolo


