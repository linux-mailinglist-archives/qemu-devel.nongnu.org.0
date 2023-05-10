Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384D36FE2AE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:43:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmt1-00076n-Sl; Wed, 10 May 2023 12:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwmsx-00076f-N9
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwmsv-0006Xz-Dn
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683736908;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WqXE3W5uTEsU6oxr4JWZFp34YDNT0wFTjc5dGUl38Ec=;
 b=PQXhm51YVp+Mdl5mhSiVuKwzbG+kK4QbwjlTT9Tj37+5l71EowoLm+y6rloAgmc7mY7950
 fobgjqfeMjG0w+D2ahEr5nMGjNGOxqQNoSv1i/bZ7GOPRIE/rri3Ti5VrR0MPRCyjz7Yig
 1Vpn8XN1m9KqpOb6lHVA9a+9HdA+pc0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-OH7SXAw2Pj--R7G7Uh3_bg-1; Wed, 10 May 2023 12:41:47 -0400
X-MC-Unique: OH7SXAw2Pj--R7G7Uh3_bg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-307bac4c949so562906f8f.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683736906; x=1686328906;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WqXE3W5uTEsU6oxr4JWZFp34YDNT0wFTjc5dGUl38Ec=;
 b=UVEPQB8c20PyGJR0C8efa9FuFbTTiPm5YRSzwvahTWIxlogcjoKgv6IbKtGl/egkFn
 Ie1ULqEm6/SHAc/yNAtk60Ke7EqcJYsQNLFS+0xO4UZv8hr82GlHtxtUDbG3SNvbgEaT
 yPf6RwXQJqN7a9bW9wFJK96RZBUae04+RtBgWL3XA9NXo7rTlq2lmjMeBr5H+83l8wNv
 cWCy4pYylAVE9mZD90DgcVle8sVHr3ENrUGIGk1nRh1u4Hpv+EcZo4tY4fkPzH8fAPW2
 l/k4myQ919k0RLYWhoPviNzXrakxTN1PHgdO1P1ZzAmNMGQkDBhR+Pf1onjwJEtTrgyp
 Kv5Q==
X-Gm-Message-State: AC+VfDz9NOI6g0A50fFmM5CKnb/siGMshwFtB3/6yO/vkHjB9nYa0iyg
 f27efWaHvRSvSfSaYE9SoMsg1yJt6CvmqhiTcVM+/GT0iHI0tm1TRrd26QvbS/O1WpOJGtyHsQa
 m2ZvjsJRvWwI15OU=
X-Received: by 2002:adf:edc6:0:b0:306:337e:4b28 with SMTP id
 v6-20020adfedc6000000b00306337e4b28mr14200522wro.3.1683736906060; 
 Wed, 10 May 2023 09:41:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6uZZ8MC1INUZunNDxeeRcXYZL/5X4Sq0fhf6fZd52LarzH2nSpRZ6E+gkud+bUkzhgOQbRPw==
X-Received: by 2002:adf:edc6:0:b0:306:337e:4b28 with SMTP id
 v6-20020adfedc6000000b00306337e4b28mr14200487wro.3.1683736905645; 
 Wed, 10 May 2023 09:41:45 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 e7-20020a5d65c7000000b00307925ff35bsm11100009wrw.49.2023.05.10.09.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:41:45 -0700 (PDT)
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
In-Reply-To: <3bb652f6-4948-d6c2-fac5-e0a6c3edb62a@nvidia.com> (Avihai Horon's
 message of "Wed, 10 May 2023 19:01:03 +0300")
References: <20230501140141.11743-1-avihaih@nvidia.com> <ZFGTerErJWnWHD6/@x1n>
 <72e14c81-a953-c288-c570-4987492b3569@nvidia.com>
 <87v8h08s9o.fsf@secure.mitica>
 <3bb652f6-4948-d6c2-fac5-e0a6c3edb62a@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 18:41:44 +0200
Message-ID: <87jzxg6svr.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avihai Horon <avihaih@nvidia.com> wrote:

>> You have a point here.
>> But I will approach this case in a different way:
>>
>> Destination QEMU needs to be older, because it don't have the feature.
>> So we need to NOT being able to do the switchover for older machine
>> types.
>> And have something like this is qemu/hw/machine.c
>>
>> GlobalProperty hw_compat_7_2[] = {
>>      { "our_device", "explicit-switchover", "off" },
>> };
>>
>> Or whatever we want to call the device and the property, and not use it
>> for older machine types to allow migration for that.
>
> Let me see if I get this straight (I'm not that familiar with
> hw_compat_x_y):
>
> You mean that device Y which adds support for explicit-switchover in
> QEMU version Z should add a property
> like you wrote above, and use it to disable explicit-switchover usage
> for Y devices when Y device
> from QEMU older than Z is migrated?

More that "from" "to"

Let me elaborate.  We have two QEMUs:

QEMU version X, has device dev. Let's call it qemu-X.
QEMU version Y (X+1) add feature foo to device dev.  Let's call it qemu-Y.

We have two machine types (for this exercise we don't care about
architectures)

PC-X.0
PC-Y.0

So, the possible combinations are:

First the easy cases, same qemu on both sides.  Different machine types.

$ qemu-X -M PC-X.0   -> to -> qemu-X -M PC-X.0

  good. neither guest use feature foo.

$ qemu-X -M PC-Y.0   -> to -> qemu-X -M PC-Y.0

  impossible. qemu-X don't have machine PC-Y.0.  So nothing to see here.

$ qemu-Y -M PC-X.0   -> to -> qemu-Y -M PC-X.0

  good.  We have feature foo in both sides. Notice that I recomend here
  to not use feature foo.  We will see on the difficult cases.

$ qemu-Y -M PC-Y.0   -> to -> qemu-Y -M PC-Y.0

  good.  Both sides use feature foo.

Difficult cases, when we mix qemu versions.

$ qemu-X -M PC-X.0  -> to -> qemu-Y -M PC-X.0

  source don't have feature foo.  Destination have feature foo.
  But if we disable it for machine PC-X.0, it will work.

$ qemu-Y -M PC-X.0  -> to -> qemu-X -M PC-X.0

  same than previous example.  But here we have feature foo on source
  and not on destination.  Disabling it for machine PC-X.0 fixes the
  problem.

We can't migrate a PC-Y.0 when one of the qemu's is qemu-X, so that case
is impossible.

Does this makes more sense?

And now, how hw_compat_X_Y works.

It is an array of registers with the format:

- name of device  (we give some rope here, for instance migration is a
  device in this context)

- name of property: self explanatory.  The important bit is that
  we can get the value of the property in the device driver.

- value of the property: self explanatory.

With this mechanism what we do when we add a feature to a device that
matters for migration is:
- for the machine type of the version that we are "developing" feature
  is enabled by default.  For whatever that enable means.

- for old machine types we disable the feature, so it can be migrate
  freely with old qemu. But using the old machine type.

- there is way to enable the feature on the command line even for old
  machine types on new qemu, but only developers use that for testing.
  Normal users/admins never do that.

what does hw_compat_7_2 means?

Ok, we need to know the versions.  New version is 8.0.

hw_compat_7_2 has all the properties represensing "features", defaults,
whatever that has changed since 7.2.  In other words, what features we
need to disable to get to the features that existed when 7.2 was
released.

To go to a real example.

In the development tree.  We have:

GlobalProperty hw_compat_8_0[] = {
    { "migration", "multifd-flush-after-each-section", "on"},
};
const size_t hw_compat_8_0_len = G_N_ELEMENTS(hw_compat_8_0);

Feature is implemented in the following commits:

77c259a4cb1c9799754b48f570301ebf1de5ded8
b05292c237030343516d073b1a1e5f49ffc017a8
294e5a4034e81b3d8db03b4e0f691386f20d6ed3

When we are doing migration with multifd and we pass the end of memory
(i.e. we end one iteration through all the RAM) we need to make sure
that we don't send the same page through two channels, i.e. contents of
the page at iteration 1 through channel 1 and contents of the page at
iteration 2 through channel 2.  The problem is that they could arrive
out of order and the of page of iteration 1 arrive later than iteration
2 and overwrite new data with old data.  Which is undesirable.
We could use complex algorithms to fix that, but one easy way of doing
it is:

- When we finish a run through all memory (i.e.) one iteration, we flush
  all channels and make sure that everything arrives to destination
  before starting sending data o the next iteration.  I call that
  synchronize all channels.

And that is what we *should* have done.  But when I implemented the
feature, I did this synchronization everytime that we finish a cycle
(around 100miliseconds).  i.e. 10 times per second. This is called a
section for historical reasons. And when you are migrating
multiterabytes RAM machines with very fast networking, we end waiting
too much on the synchronizations.

Once detected the problem and found the cause, we change that.  The
problem is that if we are running an old qemu against a new qemu (or
viceversa) we would not be able to migrate, because one send/expects
synchronizations at different points.

So we have to maintain the old algorithm and the new algoritm.  That is
what we did here.  For machines older than <current in development>,
i.e. 8.0 we use the old algorithm (multifd-flush-after-earch section is
"on").

But the default for new machine types is the new algorithm, much faster.

I know that the explanation has been quite long, but inventing an
example was going to be even more complex.

Does this makes sense?

Later, Juan.


