Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1DB6FF22C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:09:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px638-0000Rm-Hh; Thu, 11 May 2023 09:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px636-0000Qv-5D
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:09:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px634-0007o4-CZ
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683810573;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nAlnKlfHrwJVDq5u/0xJ/NGF/CBfRWEJPHryGm5RxII=;
 b=FKniq4oZVfHv2y813ewW26HvcWnQ2/c5B7s+fX9uwke80mlydL5mxqIMspU8yUhxp2K8Nq
 8sZJw3RCKf2+SDdri8qjcmLQKiuSkNpLx53XNH8QRiAOIyqUnRiFiBsai6+Ky4zjkEvlDB
 uNLUptA2MRHgPnfPgMibl1VEmRt0R6w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-HDl0zR_gMCWg0Wh-0bO1tw-1; Thu, 11 May 2023 09:09:32 -0400
X-MC-Unique: HDl0zR_gMCWg0Wh-0bO1tw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30641258c9eso3004659f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 06:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683810570; x=1686402570;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nAlnKlfHrwJVDq5u/0xJ/NGF/CBfRWEJPHryGm5RxII=;
 b=V9XWy7jyETXdGlzQVQvF8APCgJyb7XoC/UcjHm2Zed/jpeIIP/1qI9cBxq13ioN4/y
 RVvtUYX1u6CyObZ4ENGO9CZWXLw2XwEqgaYF2KmUmyi5JyXNKlgmsNyvA9b6V9ep/pP5
 sjOIY1j0TM5BFTC5yFHkfUVOJ1wizMMvZGnAPNUAjQMRNG4dpkYFkja0DaXA5q8iMIVQ
 RkkWOVY5Inhd68XE6r/jCP9PP2UizCBa+5LZXceyY2PhwxqelhUawKk8kMGlGcoQdRsk
 iN7mu+1IaMCMfjWC1Haek392iHVJ/hFNXNnZ8Rd2mr/E91E7bjd6umvoybPFrMl6RNwP
 fxAA==
X-Gm-Message-State: AC+VfDzKHu5To08SaGbjuYnzguE+6OgHSM2H/w0IX73SjxpkCXUe/887
 Uszn8Csdd9681l1rQPy0q3Ivi31XR4fgD4o918ogEcRKNE6La2JZtL5CdWtscL9K/SrC5khGhRn
 OE9arnpI+5RVxb7k=
X-Received: by 2002:a5d:56c1:0:b0:307:a7a4:442 with SMTP id
 m1-20020a5d56c1000000b00307a7a40442mr6656122wrw.43.1683810569901; 
 Thu, 11 May 2023 06:09:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ70sE0Mwqz3w+fJlcAuhAOt/dr7zM3+HFfGr77ZIJdXFUkbIk/rBCNsobLBfND0iVnIn68cRA==
X-Received: by 2002:a5d:56c1:0:b0:307:a7a4:442 with SMTP id
 m1-20020a5d56c1000000b00307a7a40442mr6656063wrw.43.1683810568904; 
 Thu, 11 May 2023 06:09:28 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 a22-20020a1cf016000000b003f42d8dd7ffsm6297860wmb.19.2023.05.11.06.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 06:09:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>,  qemu-devel@nongnu.org,  Alex Williamson
 <alex.williamson@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Yishai Hadas <yishaih@nvidia.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Maor Gottlieb <maorg@nvidia.com>,  Kirti
 Wankhede <kwankhede@nvidia.com>,  Tarun Gupta <targupta@nvidia.com>,  Joao
 Martins <joao.m.martins@oracle.com>,  Daniel Berrange <berrange@redhat.com>
Subject: Re: [PATCH 0/8] migration: Add precopy initial data capability and
 VFIO precopy support
In-Reply-To: <acc6ec07-cd9d-bb0f-bdb9-56a2ced50e25@nvidia.com> (Avihai Horon's
 message of "Thu, 11 May 2023 14:31:31 +0300")
References: <20230501140141.11743-1-avihaih@nvidia.com> <ZFGTerErJWnWHD6/@x1n>
 <72e14c81-a953-c288-c570-4987492b3569@nvidia.com>
 <87v8h08s9o.fsf@secure.mitica>
 <3bb652f6-4948-d6c2-fac5-e0a6c3edb62a@nvidia.com>
 <87jzxg6svr.fsf@secure.mitica>
 <acc6ec07-cd9d-bb0f-bdb9-56a2ced50e25@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 15:09:27 +0200
Message-ID: <87jzxf3th4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avihai Horon <avihaih@nvidia.com> wrote:
> On 10/05/2023 19:41, Juan Quintela wrote:

>> Does this makes sense?
>
> Yes, thanks a lot for the full and detailed explanation!

Thank you.

> This indeed solves the problem in the scenario I mentioned above.
>
> However, this relies on the fact that a device support for this
> feature depends only on the QEMU version.
> This is not the case for VFIO devices.

What a surprise :-)

Yes, I couldn't resist.

> To support explicit-switchover, a VFIO device also needs host kernel
> support for VFIO precopy, i.e., it needs to have the
> VFIO_MIGRATION_PRE_COPY flag set.
> So, theoretically we could have the following:
> - Source and destination QEMU are the same version.
> - We migrate two different VFIO devices (i.e., they don't share the
>   same kernel driver), device X and device Y.
> - Host kernel in source supports VIFO precopy for device X but not for
>   device Y.
> - Host kernel in destination supports VFIO precopy for both device X
>   and device Y.
> Without explicit-switchover, migration should work.
> But if we enable explicit-switchover and do migration, we would end up
> in the same situation where switchover_pending=2 in destination and it
> never reaches zero so migration is stuck.

I think this is too much for qemu.  You need to work at the
libvirt/management level.

> This could be solved by moving the switchover_pending counter to the
> source and sending multiple MIG_RP explicit-switchover ACK messages.
> However, I also raised a concern about this in my last mail to Peter
> [1], where this is not guaranteed to work, depending on the device
> implementation for explicit-switchover feature.

I will not try to be extra clever here.  We have removed qemu support of
the question, as it is the same qemu in both sides.

So what we have is this configuration:

Host A
------
device X explicit_switchoever=on
device Y explicit_switchoever=off

Host B
------
device X explicit_switchoever=on
device Y explicit_switchoever=on

The configuration is different.  That is something that qemu protocol
don't know how to handle, and it is up to stack.

You need to configure explicitely in qemu command line on host B:
device=Y,explicit_switchover=off

Or whatever is that configured off.

It is exactly the same problem than:

Host A
------

Intel CPU genX

Host B
------

intel CPU genX-1

i.e. there are features that Host A has but host B don't have.  The only
way to make this work is that you need to configure qemu when launched
in Host A with a cpu type that host B is able to run (i.e. one that
don't have any features that Host B is missing).

What is the difference between this and yours?


> Not sure though if I'm digging too deep in some improbable future
> corner cases.

Oh, you are just starting.  The compat layers that CPU have had to do
over the years.  At some point even migration between AMD and Intel
CPU's worked.

> Let's go back to the basic question, which is whether we need to send
> an "advise" message for each device that supports explicit-switchover.
> I think it gives us more flexibility and although not needed at the
> moment, might be useful in the future.

I think that is not a good idea, see my previous comment.  We have two
cases:
- both devices have the same features in both places
- they have different features in any of the places

First case, we don't care.  It always work.
Second case, we need to configure it correctly, and that means disable
features that are not on the other side.

> If you want I can send a v2 that addresses the comments and simplifies
> the code in other areas and we'll continue discussing the necessity of
> the "advise" message then.

Yeap.  I think is the best course of action.

Thanks, Juan.

> Thanks!
>
> [1]
> https://lore.kernel.org/qemu-devel/688acb4e-a4e6-428d-9124-7596e3666133@nvidia.com/


