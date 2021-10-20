Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67FA4345E3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 09:28:47 +0200 (CEST)
Received: from localhost ([::1]:57542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md61m-0000Qk-S8
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 03:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1md5zv-0007D9-JS
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1md5zs-0001b8-U6
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634714807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fG+WsyqAvJ3ccP/NPMXqnClHKK0geZLrnWA3C12g9Uk=;
 b=Qy563+ljQlRKWKa25C6FASGZtpJZfKfsFSA/jZrnfJriXRVwYwW4h0CG8pnIKHf/sHI4qh
 lwhkjjCYk6biPkds75iPn7/B3mghhPLDgbE1Zt4rwbRA3wMseBSIhDukjmclMjjPK4ybpZ
 Eg+UBOGZ8kqQYQUJjG5Bk9iY0DKVHws=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-LEWt0yTdNS-dn78D1SHrJg-1; Wed, 20 Oct 2021 03:26:46 -0400
X-MC-Unique: LEWt0yTdNS-dn78D1SHrJg-1
Received: by mail-ed1-f71.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so20081403edi.12
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 00:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fG+WsyqAvJ3ccP/NPMXqnClHKK0geZLrnWA3C12g9Uk=;
 b=wUFzG2Z7CkGq/+FOUKCf2ud2YdGd0LQzLizCxyq1MaDgUdTdT+fTTFmBqdf8Eoe1ec
 44JhTjbmEZQp0PD4NFoLj1+8Ii3oNZoAGRs68rUAfvxh+zExW3OxgOZlK2RX01iIj0Cg
 Q4kHgR67d0ut5bwZwpuuVhRSm2zBehbYiahVM7THIF5vriR9ETSzrWG7HddEXtQjF81c
 nM0tpduIZWzqMzAA5ZCCweo8XM2zwguUJQCkr2hAQG9HbJPAiqAHVQ3JldM5A9GNqe7R
 pUosmeKq0I+ZJanZKCWTFPM3MWyOvtcCOAloGE8kPzp8Adqa6fK/jBK9CwDyNGkvhgS4
 IEtw==
X-Gm-Message-State: AOAM532dXZfG6dNDawWQHechbvM+X5QjMDITGqKzMwkec8zmv2bDaW5X
 XCRWhAtgS9SHMLpdfVe82UuGWetI4pJ2qTWTU9aj/2oG5ij6Zj9Wp1JL0qy4UZ4XmJB2DeOMppU
 vMESfVlfyQL6zcXY=
X-Received: by 2002:a17:906:38ce:: with SMTP id
 r14mr42703771ejd.268.1634714805038; 
 Wed, 20 Oct 2021 00:26:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9g+ijnafEyhIrdBhpCE3WtkbcS/J6QWFZ2rAs4sOsklRSovUXbp3aOOJIn9eKimrPbCR59Q==
X-Received: by 2002:a17:906:38ce:: with SMTP id
 r14mr42703748ejd.268.1634714804758; 
 Wed, 20 Oct 2021 00:26:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id e11sm678489edl.70.2021.10.20.00.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 00:26:44 -0700 (PDT)
Message-ID: <45a7173a-19e9-b5b8-7df2-0d494e4af3b6@redhat.com>
Date: Wed, 20 Oct 2021 09:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/2] Support fd-based KVM stats
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20211019202904.4857-1-mark.kanda@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211019202904.4857-1-mark.kanda@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/21 22:29, Mark Kanda wrote:
> This patchset adds QEMU support for querying fd-based KVM stats. The kernel
> support is provided by:
> 
> cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")
> 
> Patch 1 adds QMP support; patch 2 adds HMP support.

Hi Mark,

that's awesome, thanks!

Just a couple remarks on the implementation:

1) for QMP, it would be nice to have separate commands for the schema 
and the value.  This is because in the future we could consider passing 
the file descriptor directly to the QMP client; in which case, it would 
still be nicer to have QEMU turn the schema information into something 
more easily consumable.

2) for HMP, it would be nice to have the exponent converted to e.g. 
"nanoseconds" if the KvmStatUnit is seconds.  It's not super important, 
but it would be nice.  Something as simple as

if (kvm_stat->unit == KVM_STAT_UNIT_SECONDS &&
     kvm_stat->exponent >= -9 && kvm_stat->exponent <= 0 &&
     kvm_stat->exponent % 3 == 0 && kvm_stat->base == 10) {
     const char *si_prefix[] = { "", "milli", "micro", "nano" };
     monitor_printf(" %lu %sseconds", val->value,
                    si_prefix[kvm_stat->exponent / -3]);
} else ...

(Yes, this is nitpicking; but in practice nanoseconds are the only case 
where currently the exponent is not 0, so...).

3) more recent versions of Linux also support histograms, for which you 
have to include the bucket size and the kind (logarithmic/linear) in 
QMP.  For HMP it would be nice to have it printed as

     halt_wait_hist: [1 nanosecond]=200 [2]=30 [4]=50 [8]=120

but, for the first version, it's also okay if the QMP commands just 
skips unknown KVM_STATS_TYPE values altogether.

Paolo

> Mark Kanda (2):
>    qmp: Support fd-based KVM stats query
>    hmp: Support fd-based KVM stats query
> 
>   accel/kvm/kvm-all.c   | 246 ++++++++++++++++++++++++++++++++++++++++++
>   hmp-commands-info.hx  |  13 +++
>   include/monitor/hmp.h |   1 +
>   monitor/hmp-cmds.c    |  52 +++++++++
>   qapi/misc.json        |  73 +++++++++++++
>   5 files changed, 385 insertions(+)
> 


