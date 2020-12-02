Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA62CBBA1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:40:02 +0100 (CET)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQUL-0001vV-7y
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kkPj9-0000eT-1a
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:51:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kkPj5-0006og-10
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606906269;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjD/kLWF9aWR8LIK8lyh8X2RKYqEns0Slp+u4Vcr9Hs=;
 b=Y4iExyZWWNEpbkBY2V7lqLnzQ+L3C9GJgfgWiye7ki5jxqlUBTOJdFeurhZ+fHp73zocea
 qEcF5/vPqYlFUfnVPpyvgTYqquhD45jm60ONdIte+REsVrAgkROEDKNHEHchIDM2iVwyD3
 cgiDcnGfS7o2Edv+7l1iUxiGlWLPE/Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-AZCDDZh2O-uvWJ9EdLTmkw-1; Wed, 02 Dec 2020 05:51:08 -0500
X-MC-Unique: AZCDDZh2O-uvWJ9EdLTmkw-1
Received: by mail-wm1-f69.google.com with SMTP id b184so3139901wmh.6
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 02:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e83TDwC6goZoNif5HW3gJlcG+zQe/htTCiVtL9pyzKY=;
 b=DnU4vAhdc9rZrsjKUQFoWa2+2/Vpe5Npv7VZ+vuDzOsFF2CeUuLfHeDwAgNFhGL5Cb
 v2jffRB/aqbwNNc8uN/XHHcJVfoVV8lzfbAlQ965jSUvaYz9NGGQnVf9baLzssnBhBEx
 bf/1Jp+ykJvkobD/+7CG9GweO4BZlhxLCoHugveXLbh2KcPZFM8FaZ+LnNFhcbAXRMyr
 RgGdtCk8QiRJ60TU3Gl12hW9HuseaLecSA2eQc6bqeHPsZsR5bUqwVoJ6UiJt3hWIN8W
 89kvJpp1BTd7V0Kyjd3cXsgBc1W4nWPzXjDT9wbWA3o3uBhheEzZHnsHAvCLxwoBQ1Il
 y+PA==
X-Gm-Message-State: AOAM5335ZT18MSKHkJfhWp39NWEu7XjTnH1iPUPGpF/yVu8hZmYSgrGY
 50cD1QmHW8VGXw3FrxzU3rnKxS8IGun0uW59xMiGCwgowpoOWkiXhi82htmERI/qXfd2QxGMbuq
 t4Ss1hqw4zzA4D+Y=
X-Received: by 2002:a5d:6310:: with SMTP id i16mr2712672wru.284.1606906266640; 
 Wed, 02 Dec 2020 02:51:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBDh/u/8nPFXAYF5K18slvfkjnrV+Zf3+i2Yi7Ii1vyCyF2bc3dHZaHIvKLwoOBhBkRW6VWw==
X-Received: by 2002:a5d:6310:: with SMTP id i16mr2712644wru.284.1606906266433; 
 Wed, 02 Dec 2020 02:51:06 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id r82sm1572467wma.18.2020.12.02.02.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 02:51:05 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
In-Reply-To: <20201202053219-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Wed, 2 Dec 2020 05:33:08 -0500")
References: <20201118083748.1328-1-quintela@redhat.com>
 <20201118083748.1328-2-quintela@redhat.com>
 <20201202050918-mutt-send-email-mst@kernel.org>
 <20201202102718.GA2360260@redhat.com>
 <20201202053111-mutt-send-email-mst@kernel.org>
 <20201202053219-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 02 Dec 2020 11:51:05 +0100
Message-ID: <87mtywlbvq.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Wed, Dec 02, 2020 at 05:31:53AM -0500, Michael S. Tsirkin wrote:
>> On Wed, Dec 02, 2020 at 10:27:18AM +0000, Daniel P. Berrang=C3=83=C6=92=
=C3=82=C2=A9 wrote:
>> > On Wed, Dec 02, 2020 at 05:13:18AM -0500, Michael S. Tsirkin wrote:
>> > > On Wed, Nov 18, 2020 at 09:37:22AM +0100, Juan Quintela wrote:
>> > > > If we have a paused guest, it can't unplug the network VF device, =
so
>> > > > we wait there forever.  Just change the code to give one error on =
that
>> > > > case.
>> > > >=20
>> > > > Signed-off-by: Juan Quintela <quintela@redhat.com>
>> > >=20
>> > > It's certainly possible but it's management that created
>> > > this situation after all - why do we bother to enforce
>> > > a policy? It is possible that management will unpause immediately
>> > > afterwards and everything will proceed smoothly.
>> > >=20
>> > > Yes migration will not happen until guest is
>> > > unpaused but the same it true of e.g. a guest that is stuck
>> > > because of a bug.
>> >=20
>> > That's pretty different behaviour from how migration normally handles
>> > a paused guest, which is that it is guaranteed to complete the migrati=
on
>> > in as short a time as network bandwidth allows.
>> >=20
>> > Just ignoring the situation I think will lead to surprise apps / admin=
s,
>> > because the person/entity invoking the migration is not likely to have
>> > checked wether this particular guest uses net failover or not before
>> > invoking - they'll just be expecting a paused migration to run fast an=
d
>> > be guaranteed to complete.
>> >=20
>> > Regards,
>> > Daniel
>>=20
>> Okay I guess. But then shouldn't we handle the reverse situation too:
>> pausing guest after migration started but before device was
>> unplugged?
>>=20
>
> Thinking of which, I have no idea how we'd handle it - fail
> pausing guest until migration is cancelled?
>
> All this seems heavy handed to me ...

This is the minimal fix that I can think of.

Further solution would be:
- Add a new migration parameter: migrate-paused
- change libvirt to use the new parameter if it exist
- in qemu, when we do start migration (but after we wait for the unplug
  device) paused the guest before starting migration and resume it after
  migration finish.

My understanding talking with Laine is that they use this functionality
by default for migration, saving, etc, i.e. it is not an isolated case.

Later, Juan.


