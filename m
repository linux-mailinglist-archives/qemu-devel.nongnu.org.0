Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC236319B79
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 09:48:30 +0100 (CET)
Received: from localhost ([::1]:44182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAU7p-0008WS-AB
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 03:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lAU5R-0007aD-4b
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 03:46:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lAU5O-0005Vs-6l
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 03:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613119556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j1O500sO94C29actsfR8MfPaNFcw9N2w6VvbLiLVL/E=;
 b=X846uiz40+xQ2+bUhaDdldk4GHzxE4eTHyvryabmXeaasB5YmVHjbo9iJfui9OTp0OQGcG
 od8/eYsatWuYe0tKzpq5uEHMrhQijq/IY/m/vG5o7VZ6FVdVBD2ZO1av+mZVoKOxHQ1iJs
 jEOkHyeIz8zANMTBdXOlk98zBctgEYY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-1zz3ovYrOcejgfDBTpe7Ng-1; Fri, 12 Feb 2021 03:45:54 -0500
X-MC-Unique: 1zz3ovYrOcejgfDBTpe7Ng-1
Received: by mail-ej1-f69.google.com with SMTP id hx26so6354667ejc.3
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 00:45:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=j1O500sO94C29actsfR8MfPaNFcw9N2w6VvbLiLVL/E=;
 b=slgACziEiDo+ktced4zkBJvhb8JfBLITq47AqDRIBZgqFF55EGw2sK2S63nITJzETx
 nfS9VCQOc88u3ECcvMZiCg2JLGpUneIY6DjtbXtWygOQ2j1dbc+PEFjj2/KcNQptH9C/
 OKORBWmNM7eQFe0qMf3M0VXG6p0aOMELXMrcMvcN5mBXVe3FwWkHA15W38reuAZUhGjF
 3XqFFwG7hFmC8q9SEhtHuKI5di4LJn1YPRtPbLVpPHfKCIzMIED5FI0TYID6dkFjZcuf
 wXAENf13aC+6x41/xVczLzoChgJABRePCul9hIHgN1TUB7qQXkQV0SxAPPkBLVzZmlUA
 a23g==
X-Gm-Message-State: AOAM532K4REJaHJU8aYYF+6nllzbh08Q1vNq9X//CHixhNz26w/xJIhd
 3KOuwTb/IbSd7edHgtbQnSszu9C9J5aWcNX2WdvMqsXlcPCSya3h+DYpQyJRPGURs82BlQvs7Ap
 UYt5VDN3EuGprGtc=
X-Received: by 2002:a17:906:26ca:: with SMTP id
 u10mr1988845ejc.165.1613119553774; 
 Fri, 12 Feb 2021 00:45:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqWgDXFVfxGBcV9Q+AIk6InMV91Dw4MqN1B+meWksUqyj7pQ5faf9LphjPpB1L1gJSJEftKg==
X-Received: by 2002:a17:906:26ca:: with SMTP id
 u10mr1988833ejc.165.1613119553612; 
 Fri, 12 Feb 2021 00:45:53 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id o23sm553782ejx.69.2021.02.12.00.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 00:45:53 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
In-Reply-To: <20210211183555.2136b5c8@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com>
Date: Fri, 12 Feb 2021 09:45:52 +0100
Message-ID: <87tuqhllmn.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Wed, 10 Feb 2021 17:40:28 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Sometimes we'd like to know which features were explicitly enabled and which
>> were explicitly disabled on the command line. E.g. it seems logical to handle
>> 'hv_passthrough,hv_feature=off' as "enable everything supported by the host
>> except for hv_feature" but this doesn't seem to be possible with the current
>> 'hyperv_features' bit array. Introduce 'hv_features_on'/'hv_features_off'
>> add-ons and track explicit enablement/disablement there.
>> 
>> Note, it doesn't seem to be possible to fill 'hyperv_features' array during
>> CPU creation time when 'hv-passthrough' is specified and we're running on
>> an older kernel without KVM_CAP_SYS_HYPERV_CPUID support. To get the list
>> of the supported Hyper-V features we need to actually create KVM VCPU and
>> this happens much later.
>
> seems to me that we are returning back to +-feat parsing, this time only for
> hyperv.
> I'm not sure I like it back, especially considering we are going to
> drop "-feat" priority for x86.
>
> now about impossible, see arm/kvm/virt, they create a 'sample' VCPU at KVM
> init time to probe for some CPU features in advance. You can use similar
> approach to prepare value for hyperv_features.
>

KVM_CAP_SYS_HYPERV_CPUID is supported since 5.11 and eventually it'll
make it to all kernels we care about so I'd really like to avoid any
'sample' CPUs for the time being. On/off parsing looks like a much
lesser evil.

-- 
Vitaly


