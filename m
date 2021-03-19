Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23423416F7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 08:58:02 +0100 (CET)
Received: from localhost ([::1]:35156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNA1B-00020E-7c
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 03:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lN9zI-0001SN-0y
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 03:56:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lN9z8-0008VI-NN
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 03:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616140553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NNLtxTM3t/hx684V9A98qBIzTbqP9LT7jESGyMgIl64=;
 b=iDziUGzCDjL1FDw6JWjR7mkpDrC4jMcF4vkc+k3Dhn85qNufI7i7aEmjoFmkN/wjX4SvJ3
 v6ps86NtUQFF0487eL7+uyk3O9Ab5ldp1fVmKKregaHtI9T/IoA60S+yu9/mKtcqeNJZsF
 4WSKzeLb3YKZVukNEyeZdjElnPqTlrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-T-Ns0lzMOZKKpMBw4j2-ow-1; Fri, 19 Mar 2021 03:55:51 -0400
X-MC-Unique: T-Ns0lzMOZKKpMBw4j2-ow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2435018C89EA;
 Fri, 19 Mar 2021 07:55:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD3FC10023AC;
 Fri, 19 Mar 2021 07:55:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4B14711386A7; Fri, 19 Mar 2021 08:55:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
 <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
 <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box> <87mtvczvzw.fsf@dusky.pond.sub.org>
 <98d44670-5a63-1feb-aad8-9dbc62cf2e7a@gmail.com>
 <YErBpf7w25xho1so@yekko.fritz.box> <875z1w7ptm.fsf@dusky.pond.sub.org>
Date: Fri, 19 Mar 2021 08:55:38 +0100
In-Reply-To: <875z1w7ptm.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Fri, 12 Mar 2021 09:12:53 +0100")
Message-ID: <875z1nr30l.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laine Stump <laine@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> David Gibson <david@gibson.dropbear.id.au> writes:
>
>> On Thu, Mar 11, 2021 at 05:50:42PM -0300, Daniel Henrique Barboza wrote:
>>> 
>>> 
>>> On 3/9/21 3:22 AM, Markus Armbruster wrote:
>>> > Cc: Paolo and Julia in addition to Igor, because the thread is wandering
>>> > towards DeviceState member pending_deleted_event.
>>> > 
>>> > Cc: Laine for libvirt expertise.  Laine, if you're not the right person,
>>> > please loop in the right person.
>>> > 
>>> > David Gibson <david@gibson.dropbear.id.au> writes:
>>> > 
>>> > > On Mon, Mar 08, 2021 at 03:01:53PM -0300, Daniel Henrique Barboza wrote:
>>> > > > 
>>> > > > 
>>> > > > On 3/8/21 2:04 PM, Markus Armbruster wrote:
>>> > > > > Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>> > > > > 
>>> > > > > > On 3/6/21 3:57 AM, Markus Armbruster wrote:
>>> > [...]
>>> > > > > > > We should document the event's reliability.  Are there unplug operations
>>> > > > > > > where we can't detect failure?  Are there unplug operations where we
>>> > > > > > > could, but haven't implemented the event?
>>> > > > > > 
>>> > > > > > The current version of the PowerPC spec that the pseries machine implements
>>> > > > > > (LOPAR) does not predict a way for the virtual machine to report a hotunplug
>>> > > > > > error back to the hypervisor. If something fails, the hypervisor is left
>>> > > > > > in the dark.
>>> > > > > > 
>>> > > > > > What happened in the 6.0.0 dev cycle is that we faced a reliable way of
>>> > > > > 
>>> > > > > Do you mean "unreliable way"?
>>> > > > 
>>> > > > I guess a better word would be 'reproducible', as in we discovered a reproducible
>>> > > > way of getting the guest kernel to refuse the CPU hotunplug.
>>> > > 
>>> > > Right.  It's worth noting here that in the PAPR model, there are no
>>> > > "forced" unplugs.  Unplugs always consist of a request to the guest,
>>> > > which is then resposible for offlining the device and signalling back
>>> > > to the hypervisor that it's done with it.
>>> > > 
>>> > > > > > making CPU hotunplug fail in the guest (trying to hotunplug the last online
>>> > > > > > CPU) and the pseries machine was unprepared for dealing with it. We ended up
>>> > > > > > implementing a hotunplug timeout and, if the timeout kicks in, we're assuming
>>> > > > > > that the CPU hotunplug failed in the guest. This is the first scenario we have
>>> > > > > > today where we want to send a QAPI event informing the CPU hotunplug error,
>>> > > > > > but this event does not exist in QEMU ATM.
>>> > > > > 
>>> > > > > When the timeout kicks in, how can you know the operation failed?  You
>>> > > > > better be sure when you send an error event.  In other words: what
>>> > > > > prevents the scenario where the operation is much slower than you
>>> > > > > expect, the timeout expires, the error event is sent, and then the
>>> > > > > operation completes successfully?
>>> > > > 
>>> > > > A CPU hotunplug in a pseries guest takes no more than a couple of seconds, even
>>> > > > if the guest is under heavy load. The timeout is set to 15 seconds.
>>> > > 
>>> > > Right.  We're well aware that a timeout is an ugly hack, since it's
>>> > > not really possible to distinguish it from a guest that's just being
>>> > > really slow.
>>> > 
>>> > As long as unplug failure cannot be detected reliably, we need a timeout
>>> > *somewhere*.  I vaguely recall libvirt has one.  Laine?
>>> 
>>> Yeah, Libvirt has a timeout for hotunplug operations. I agree that QEMU doing
>>> the timeout makes more sense since it has more information about the
>>> conditions/mechanics involved.
>>
>> Right.  In particular, I can't really see how libvirt can fully
>> implement that timeout.  AFAIK qemu has no way of listing or
>> cancelling "in flight" unplug requests, so it's entirely possible that
>> the unplug could still complete after libvirt's has "timed out".
>
> QEMU doesn't really keep track of "in flight" unplug requests, and as
> long as that's the case, its timeout even will have the same issue.

If we change QEMU to keep track of "in flight" unplug requests, then we
likely want QMP commands to query and cancel them.

Instead of inventing ad hoc commands, we should look into using the job
framework: query-jobs, job-cancel, ...  See qapi/job.json.

Bonus: we don't need new events, existing JOB_STATUS_CHANGE can do the
job (pardon the pun).

[...]


