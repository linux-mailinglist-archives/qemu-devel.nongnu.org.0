Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B22EADF5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 16:13:22 +0100 (CET)
Received: from localhost ([::1]:37290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwo1R-00033v-4T
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 10:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kwnz4-0001Nq-7b
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:10:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kwnyu-0000tD-7D
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609859440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LFoqtC5dXpuh4qtzEzrMEBeapfNabwZt2YlKtG1MoLM=;
 b=BRTYC/oPHtO4cJpi/lIh+GG7Fwx26kA4NbFtHwqX/+BnK6xPvVwTGNEg945ki/B7HS21Yv
 qMSdao/zktpsZ2Xn0pkDqDr6UB7cMB8P7j7gow3mZ74YyNM0/JD/jO7TzQRHE5yXnJOc7S
 B5UW43+3kuiQNfphQP1iRt7yT8DnBmk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-kFUKQbPdN5-gashLA811NA-1; Tue, 05 Jan 2021 10:10:39 -0500
X-MC-Unique: kFUKQbPdN5-gashLA811NA-1
Received: by mail-wr1-f70.google.com with SMTP id i4so14976613wrm.21
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 07:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=LFoqtC5dXpuh4qtzEzrMEBeapfNabwZt2YlKtG1MoLM=;
 b=WFxqMLoueRA/1mn71ISqTYUJJ6k6jGrCM0EdlT13If0x+qxfQErDdAyQd0xmsD2SVr
 nHVAEANSpXc7wc5xzWyANgzAfGAfAGV1K15qWVw98nqqBTp48tg9x8XrVCwV31scqTjR
 rGsKZ+N/ytjuyzvD9eQdx09ZX61tD+G7L743CBrnv/G+S5rX5CcF5vX50sW/f8GKka2d
 h4nTlPskmSBZuCWw3wNafLgIsg9hofGT+j1EICWWCbrzVKev9LNZIgMhJqe00DsJqAz5
 nl6YYFJVJwCJ2aAOfXH/rmXLCdn5HlHkIScC1mrsF+Hx7TiFsXvSje3EgrKOwCHmvHcg
 pdqQ==
X-Gm-Message-State: AOAM533YaBvkgK4Kg8Ykfd4LayAQy4INsWe7Ys1IvkwCN7YIlHdKtFo/
 sIyWK4/ziHoy1wkoQE9+DRP4GZtmRIBLgU2Jr3XnEHhomxVyiXSxBCHNGxMXUIV2KJ0L+bixKj/
 PL3USAUdqaT0XczhU51kJMNL/AkJbu3ApOvDzZLWEHUXquVG22TCWEx+a+80mTWrVuEI=
X-Received: by 2002:adf:ba0c:: with SMTP id o12mr73869wrg.322.1609859438353;
 Tue, 05 Jan 2021 07:10:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyASsYpIfjTqAJfKDnDGeIbk/zbwdVug4GNxW8bh3w7C0UFdctlnsAc+Z6gQdZYCJZLmsF6Mw==
X-Received: by 2002:adf:ba0c:: with SMTP id o12mr73838wrg.322.1609859438025;
 Tue, 05 Jan 2021 07:10:38 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id w17sm4723454wmk.12.2021.01.05.07.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 07:10:37 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
In-Reply-To: <20210105143431.GL18467@habkost.net>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com> <87r1n0j20n.fsf@vitty.brq.redhat.com>
 <20210104182906.GD18467@habkost.net> <20210105003650.71f39045@redhat.com>
 <20210105143431.GL18467@habkost.net>
Date: Tue, 05 Jan 2021 16:10:36 +0100
Message-ID: <87czyjifmb.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Tue, Jan 05, 2021 at 12:36:50AM +0100, Igor Mammedov wrote:
>> 
>> documenting is good, but if it adds new semantics to how CPU features are handled
>> users up the stack will need code it up as well and juggle with
>>  -machine + -cpu + -device cpu-foo
>> not to mention poor developers who will have to figure out why we do
>> set CPU properties in multiple different ways.
>> 
>> however if we add it as CPU properties that behave the same way as other
>> properties, all mgmt has to do is expose new property to user for usage.
>
> I think we need to be careful here.  Sometimes just exposing the
> QOM properties used to implemented a feature is not the best user
> interface.  e.g.: even if using compat_props for implementing the
> hyperv features preset, that doesn't automatically mean we want
> hyperv=on to be a -cpu option.
>
> I would even argue we shouldn't be focusing on implementation
> details (like we are doing right now) until the desired external
> interface is described clearly.

I agree, the interface is definitely more important than the
implementation here. AFAIU we have two options suggested:

1) 'hyperv=on' option for x86 machine types.

Pros: we can use it later to create non-CPU Hyper-V devices
(e.g. Vmbus).
Cons: two different places for the currently existing Hyper-V features
enablement (-cpu and -machine), non-standard way of doing things
(code-wise).

2) 'hv_default=on' -cpu option

Pros: Single place to enable all Hyper-V enlightenments, we can make it
mutually exclusive with other hv_* options including hv_passthrough
(clear semantics).

Cons: This can't be reused to create non-CPU objects in the future and
so upper layers will (again) need to be modified.

There's probably more, please feel free to add.

>> however in this case we are talking about a set of cpu features,
>> if there is no way to implement it as cpu properties + compat properties
>> and requires opencodding it within machine code it might be fine
>> but I fail to see a very good reason for doing that at this momment.
>
> The reason would be just simplicity of implementation.
>
> I understand there are reasons to suggest using compat_props if
> it makes things simpler, but I don't see why we would reject a
> patch because the implementation is not based purely on
> compat_props.
>
> I will let Vitaly to decide how to proceed, based on our
> feedback.  I encourage him to use compat_props like you suggest,
> but I don't plan to make this a requirement.
>

Like I replied to Igor in a parallel thread, I hardly see how using
compat_props can simplify things in case we decide to keep 'hyperv=on' a
machine type option. It doesn't seem to fit our use-case when we need a
mechanism to alter CPU properties for the current machine type as well
as subtract some features for the old ones. If we, however, decide that
'-cpu' option is better, then we can try to make it work (but the
implementation won't be straitforward either). 

-- 
Vitaly


