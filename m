Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C808F43FD95
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 15:52:16 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgSIp-0007d5-NC
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 09:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgSGV-0006dc-7i
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:49:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgSGP-0007Mt-FQ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635515382;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qAXflhlLvyEgHhbaR1fM2MA6v/Dj9GfGGxrhECP2m8Q=;
 b=fpXkbx236HEURXvKmZPdfvL/lsMV6b2BnZ+OLVo+4SmLUlORW/bjgQjvbtrqCGZDRuTL2H
 msZiVlIzJVt42UJPeNu6+glSzCEjaDQl78XqTWQdXxhuRl6Sxr4gvcJMXO6iBLWGZgiWfm
 4nxC6o7UzPyokk2h/2oyJIRSc3C2XJ8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-B0jKZyYUOHKXqUvZgpW_zQ-1; Fri, 29 Oct 2021 09:49:41 -0400
X-MC-Unique: B0jKZyYUOHKXqUvZgpW_zQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so563190wmc.7
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 06:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=qAXflhlLvyEgHhbaR1fM2MA6v/Dj9GfGGxrhECP2m8Q=;
 b=ww7btQNfWp89XSd8nUSTcnFlpj+ezR/dSa4hQ4YjNKbfv4c8SpYwavqBl8sT4ISXav
 dL/QeHgxDkESfqcbfjD/gbupj4EtHMNGEsjLaPDcl9huTAwNwo6nVFOqwiKOWH3qxkYR
 8aoqr/dIfqwP+XskbiqjvURZ/PvMQlaPv7HltWbAGKF7ItykQQQ0kRiLHqR6Gwxu+7Ny
 StPiCP/VMXa7t1uyiODQ3QwOpl0papBiGA95Ogpy/1NATLe13V04iCK5qj4RL3C0xaoj
 h8GntfG0scFyV4MVh5lspkomAtmQT9+iQGDKpw2EAKqj/7yckck015E4F+UqqS9ExcWd
 xE6A==
X-Gm-Message-State: AOAM530xN53BKW8lIZc3t/W83UcNKkeI+bA0ypd4gPBBeQeljySW4iEN
 32V+3RaOs6QtLNm6X6+OqO4P7NuIKJGSDOT/cnfnJOCmkcPOoMHl6aUbKK6iVpMpWl5uVktqN5N
 Q0d0eY3clmjXcZbQ=
X-Received: by 2002:a1c:1941:: with SMTP id 62mr11257491wmz.131.1635515380211; 
 Fri, 29 Oct 2021 06:49:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIj+chZP3ZfhnbTgojtY/JAFnjNSowe6HYZ9sklwPsUh0bIRNfABdIOKQ3+lTGOjHNgubxAQ==
X-Received: by 2002:a1c:1941:: with SMTP id 62mr11257458wmz.131.1635515379901; 
 Fri, 29 Oct 2021 06:49:39 -0700 (PDT)
Received: from localhost ([31.4.238.119])
 by smtp.gmail.com with ESMTPSA id y6sm5070313wrh.18.2021.10.29.06.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 06:49:39 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] failover: allow to pause the VM during the migration
In-Reply-To: <YWguh5+m84rldUzg@work-vm> (David Alan Gilbert's message of "Thu, 
 14 Oct 2021 14:20:07 +0100")
References: <20210930170926.1298118-1-lvivier@redhat.com>
 <YWguh5+m84rldUzg@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 29 Oct 2021 15:49:38 +0200
Message-ID: <87mtmsrle5.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Laurent Vivier (lvivier@redhat.com) wrote:
>> If we want to save a snapshot of a VM to a file, we used to follow the
>> following steps:
>> 
>> 1- stop the VM:
>>    (qemu) stop
>> 
>> 2- migrate the VM to a file:
>>    (qemu) migrate "exec:cat > snapshot"
>> 
>> 3- resume the VM:
>>    (qemu) cont
>> 
>> After that we can restore the snapshot with:
>>   qemu-system-x86_64 ... -incoming "exec:cat snapshot"
>>   (qemu) cont
>> 
>> But when failover is configured, it doesn't work anymore.
>> 
>> As the failover needs to ask the guest OS to unplug the card
>> the machine cannot be paused.
>> 
>> This patch introduces a new migration parameter, "pause-vm", that
>> asks the migration to pause the VM during the migration startup
>> phase after the the card is unplugged.
>> 
>> Once the migration is done, we only need to resume the VM with
>> "cont" and the card is plugged back:
>> 
>> 1- set the parameter:
>>    (qemu) migrate_set_parameter pause-vm on
>> 
>> 2- migrate the VM to a file:
>>    (qemu) migrate "exec:cat > snapshot"
>> 
>>    The primary failover card (VFIO) is unplugged and the VM is paused.
>> 
>> 3- resume the VM:
>>    (qemu) cont
>> 
>>    The VM restarts and the primary failover card is plugged back
>> 
>> The VM state sent in the migration stream is "paused", it means
>> when the snapshot is loaded or if the stream is sent to a destination
>> QEMU, the VM needs to be resumed manually.
>> 
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>
> A mix of comments:
>   a) As a boolean, this should be a MigrationCapability rather than a
> parameter
>   b) We already have a pause-before-switchover capability for a pause
> that happens later in the flow; so this would be something like
> pause-after-unplug
>   c) Is this really the right answer?  Could this be done a different
> way by doing the unplugs using (a possibly new) qmp command - so
> that you can explicitly trigger the unplug prior to the migration?

Not if you want the wait to be minimal.
What managedsave wants to do is doing the migration with the guest
stopped.  And wait for it until the last moment.

Doing this is qemu is "relatively" simple.  Doing that on libvirt is
extremely complex, because you basically have to :
- unplug the device
- wait for unplug to finish
- stop the guest
- migrate paused
- (restart the guest)

If you do it in libvirt, you are increasing the time betwee wait for
unplug to finish and stop the guest.  But the biggest problem is what
happens if the migration (or anything else fails).
qemu failover code already knows how to handle the stop/continuation of
the vfio device.  It is what happens on a normal run.  If you do this on
libvirt, it needs to be able to recover for all scenarios, what is much
more complex in my hunble opinion.

Later, Juan.


