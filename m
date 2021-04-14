Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ED635F577
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:56:30 +0200 (CEST)
Received: from localhost ([::1]:32872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWg0L-0007Xi-Uy
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lWfvp-00043D-HU
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:51:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lWfvj-0000LV-E8
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618408301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2J1kAlIpw0rX2XN0434HaiDXGM9OM5OfU0Y3zkKfUp8=;
 b=G69YLeTK4wL0oEvpMUZVzIoKhudcRXoR+wVvOsZaUn7Lc+m6zG2OGhc2kQNUep6hb8ecQd
 MULM0D+KoXL/9endhVYv/1mECmesvS00hxpaxZoE1n+FFBCM6zfU7/8iKGc0+tQn8G5z3N
 AZ+T/FXkLeNSpTLm/eBf+iSio7GMtiw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-t4Ld9m6aMo6aXuwbb-PKLg-1; Wed, 14 Apr 2021 09:51:39 -0400
X-MC-Unique: t4Ld9m6aMo6aXuwbb-PKLg-1
Received: by mail-ed1-f70.google.com with SMTP id
 f9-20020a50fe090000b02903839889635cso1422634edt.14
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 06:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2J1kAlIpw0rX2XN0434HaiDXGM9OM5OfU0Y3zkKfUp8=;
 b=TQ7TVzDFhLeoZ+/XTgOqhhWhKIcPOu4wuyH+fzz6q6mRQlgG9YyZifTL5Sss7AyMnL
 mUImRNeVrpPG8MItLiQfks7bqDiPP+fc2A6i0nri9fUr2HlHgIp1suJigLjLb1wD0XRM
 k+8PsvMQZIPBPGCbOjocfDp95BW34tiCIYEb6WUSkYhtGWwWV+QFXt85kLhORUUtbcUq
 t16HCVce/I1D2LNnO1hsjCYs/CupTSHRECS9Dsfa1ehfZluDHS1DN04yqyLYGslMB5GF
 ZDd/9QO9XuYMudHbybsbLdyy4rgBHc2/trwasFu4pe1fLjd/NrNW0KuVWznSf7Hzjd9a
 Ng/g==
X-Gm-Message-State: AOAM533pDCl8/TyoJ4Mx1zloOODXGt7/pPkHe6DnzGgXoN85tSZWizaF
 S/0vk4uprQKQkxU1HO3y64We10L51NMRLjMdduyvRDaYn0+wz4zIr37Ls0V8Gc8BYWNem+tDf/7
 j7Me67Vhe4bEvT68=
X-Received: by 2002:a17:906:8a79:: with SMTP id
 hy25mr4261234ejc.461.1618408298728; 
 Wed, 14 Apr 2021 06:51:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF76EfPcMwkMeaKG6QWZ0XN6kF+6zi0OJkgvBCfSddGT1QWOG8ieGbiSxBzHw9MH3/adno0g==
X-Received: by 2002:a17:906:8a79:: with SMTP id
 hy25mr4261213ejc.461.1618408298478; 
 Wed, 14 Apr 2021 06:51:38 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id s5sm6874039ejq.52.2021.04.14.06.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 06:51:38 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2] i386: Make 'hv-reenlightenment' require explicit
 'tsc-frequency' setting
In-Reply-To: <20210414132631.ilnasigkxcjoi2px@habkost.net>
References: <20210331113948.333461-1-vkuznets@redhat.com>
 <20210414132631.ilnasigkxcjoi2px@habkost.net>
Date: Wed, 14 Apr 2021 15:51:37 +0200
Message-ID: <87eefd55zq.fsf@vitty.brq.redhat.com>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Edmondson <dme@dme.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> My apologies, this was lost under the noise in my mail inbox.
> (I promise I'm trying to improve)
>
> On Wed, Mar 31, 2021 at 01:39:48PM +0200, Vitaly Kuznetsov wrote:
>> Commit 561dbb41b1d7 "i386: Make migration fail when Hyper-V reenlightenment
>> was enabled but 'user_tsc_khz' is unset" forbade migrations with when guest
>> has opted for reenlightenment notifications but 'tsc-frequency' wasn't set
>> explicitly on the command line. This works but the migration fails late and
>> this may come as an unpleasant surprise. To make things more explicit,
>> require 'tsc-frequency=' on the command line when 'hv-reenlightenment' was
>> enabled. Make the change affect 6.0+ machine types only to preserve
>> previously-valid configurations.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> Even if the 6.0 release gets delayed, I wouldn't be comfortable
> including this in a -rc4.
>
> What if the user does not plan to live migrate the machine at
> all?  Why is this case different from the ~25
> migrate_add_blocker() calls in QEMU, where we block migration but
> still let the VM run?

The question is when do we want to let the user know about the
problem. By refusing to start with 'hv-reenlightenment' and without
'tsc-frequency' we make it sure he knows early. 

We can, indeed, replace this with migrate_add_blocker() call but the
fact that the VM is not migratable may come as a (late) surprise (we
can certainly print a warning but these may be hidden by upper layers). 

Also, v1 of this patch was implementing a slightly different approach
failing the migration late if we can't set tsc frequency on the
destination host. Explicit 'tsc-frequency=' was not required.

Personally, I'm comfortable with any approach, please advise.

-- 
Vitaly


