Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C033B36671D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:41:27 +0200 (CEST)
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ8QH-00012B-CK
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZ8NG-0008Qf-Im
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 04:38:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZ8NC-0005tI-7e
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 04:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618994291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DTqKrbW6S6yn3V/TENAENPDfF2RE3Fmlu2oEfEgaS0o=;
 b=IZB0tfry170+pSo9OLPN9qYvmr3IzEpzeijJsa0qdERrVnIAv+DfRqIPccAd1/s7g5z1ct
 ek9G/loDWScbXJvJXnZ9BwSuR67UsW2V0wZ3YCgNixZ9H0TbHxyg2C2hMKexsghIDLvwUi
 pvFZxRviLwFxjPOpUzXsjEpxClWCh00=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-KEGq5fECPhK2oNMG3fXO6w-1; Wed, 21 Apr 2021 04:38:09 -0400
X-MC-Unique: KEGq5fECPhK2oNMG3fXO6w-1
Received: by mail-wm1-f72.google.com with SMTP id
 g144-20020a1c20960000b029012983de0c8fso146011wmg.7
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 01:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DTqKrbW6S6yn3V/TENAENPDfF2RE3Fmlu2oEfEgaS0o=;
 b=FyvqZ4TePzBpX8bcsV816m3FaCwB9E5+ui4Zz6LIC+8Jevij2YhtHYyRP6JT51ARch
 5nl16Fg/I3bGbNOtBHoW9KmfbTitT4YG5s3SI+L3PZ7uZXwqGyidr19GPLhjmGIIJ6tz
 QtIVByq4mPcDt5hRdk71Hwp4Ox5LOJ+27qMEl0Q5FHlEn/N1ytNzlWgHrbCdwbogVSiH
 69gNcdXYEX+NEhA+W57ZrjWmfOkAqBPx9JuhqiQ9Vdo4q+qn46nZ5bU/mHYBFYmuiPjd
 sj5+Rik0tZksJecyr5JXxRH1uQgmwgbFaUm5ASAwNYE9pkSYWjc7dUUoFNkSrCYPd8sW
 pZVQ==
X-Gm-Message-State: AOAM530Cp5FK/5hCujeRATHDQHS7RwqD/6VuqrO7ZLKI6w2mJQedphOL
 XSWN0Lsh+EPt2lxSAtBRfST2MYdyjg7e8bQdvf6ANba6eGY9NcS0fJ8c6aJThSqWUiJ5UsUKSSi
 MSVtwwttBXqJ78X8=
X-Received: by 2002:a1c:8091:: with SMTP id b139mr8587174wmd.132.1618994288402; 
 Wed, 21 Apr 2021 01:38:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOXmE2/FgMNov15C41tQdXFIWx1g02sGGWSYpHFpv9AjSbuKOgR9ZJgx07qdOO5y8fGy6bhQ==
X-Received: by 2002:a1c:8091:: with SMTP id b139mr8587153wmd.132.1618994288166; 
 Wed, 21 Apr 2021 01:38:08 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id i20sm1472513wmq.29.2021.04.21.01.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 01:38:07 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH 0/2] i386: Fix interrupt based Async PF enablement
In-Reply-To: <20210420173541.24kxarhw75h2rqxa@habkost.net>
References: <20210401151957.408028-1-vkuznets@redhat.com>
 <ea3fc380-332f-b9e5-aa31-3540916cfc33@redhat.com>
 <87sg43d4gk.fsf@vitty.brq.redhat.com>
 <091dec53-cc0c-04ca-154a-3cfab6475705@redhat.com>
 <YHiQlkIOHDClFfXS@work-vm> <20210420173541.24kxarhw75h2rqxa@habkost.net>
Date: Wed, 21 Apr 2021 10:38:06 +0200
Message-ID: <8735vkhw29.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Apr 15, 2021 at 08:14:30PM +0100, Dr. David Alan Gilbert wrote:
>> * Paolo Bonzini (pbonzini@redhat.com) wrote:
>> > On 06/04/21 13:42, Vitaly Kuznetsov wrote:
>> > > older machine types are still available (I disable it for <= 5.1 but we
>> > > can consider disabling it for 5.2 too). The feature is upstream since
>> > > Linux 5.8, I know that QEMU supports much older kernels but this doesn't
>> > > probably mean that we can't enable new KVM PV features unless all
>> > > supported kernels have it, we'd have to wait many years otherwise.
>> > 
>> > Yes, this is a known problem in fact. :(  In 6.0 we even support RHEL 7,
>> > though that will go away in 6.1.
>> > 
>> > We should take the occasion of dropping RHEL7 to be clearer about which
>> > kernels are supported.
>> 
>> It would be nice to be able to define sets of KVM functonality that we
>> can either start given machine types with, or provide a separate switch
>> to limit kvm functionality back to some defined point.  We do trip over
>> the same things pretty regularly when accidentally turning on new
>> features.
>
> The same idea can apply to the hyperv=on stuff Vitaly is working
> on.  Maybe we should consider making a generic version of the
> s390x FeatGroup code, use it to define convenient sets of KVM and
> hyperv features.

True, the more I look at PV features enablement, the more I think that
we're missing something important in the logic. All machine types we
have are generally suposed to work with the oldest supported kernel so
we should wait many years before enabling some of the new PV features
(KVM or Hyper-V) by default.

This also links to our parallel discussion regarding migration
policies. Currently, we can't enable PV features by default based on
their availability on the host because of migration, the set may differ
on the destination host. What if we introduce (and maybe even switch to
it by default) something like

 -migratable opportunistic (stupid name, I know)

which would allow to enable all features supported by the source host
and then somehow checking that the destination host has them all. This
would effectively mean that it is possible to migrate a VM to a
same-or-newer software (both kernel an QEMU) but not the other way
around. This may be a reasonable choice.

-- 
Vitaly


