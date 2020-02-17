Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B31161250
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 13:45:59 +0100 (CET)
Received: from localhost ([::1]:44676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3fmg-0003tn-NS
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 07:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j3flS-0003Hy-5D
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 07:44:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j3flQ-0008HY-RH
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 07:44:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52130
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j3flQ-0008HL-O5
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 07:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581943480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zW5MTpB5dp8Mci9VizQAHZ9Sueh9e6yOIHeksQiYMNQ=;
 b=aZ9s+YF+xD8mJz7T8X1/qtRyG1AqW1UmWiZ6xO9qQ4WcLBOaEot6JokUMV4CqcUU6K+qAA
 Ln6SdLjdysw27bVHAoFiVTjGrk03wk2f+3CmPKL3TCI/GpBNYHNcuussC6kfqNyLaszbWa
 UYTCuvgSei7jGm75pMdqQTCTxkQFqZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-G3_hCHriP-iSv4XKkcbtPA-1; Mon, 17 Feb 2020 07:44:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B31E8801A01;
 Mon, 17 Feb 2020 12:44:35 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CC2019757;
 Mon, 17 Feb 2020 12:44:34 +0000 (UTC)
Subject: Re: QAPI schema for desired state of LUKS keyslots
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20200114193350.10830-1-mlevitsk@redhat.com>
 <20200114193350.10830-3-mlevitsk@redhat.com>
 <87lfp36gzh.fsf_-_@dusky.pond.sub.org>
 <20200217103700.GC6309@linux.fritz.box> <87ftf9s8ho.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c4a5e96b-c894-e49b-235e-2a4fe7f44f53@redhat.com>
Date: Mon, 17 Feb 2020 06:44:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87ftf9s8ho.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: G3_hCHriP-iSv4XKkcbtPA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/20 6:28 AM, Markus Armbruster wrote:

>>> Proposal:
>>>
>>>      { 'enum': 'LUKSKeyslotState',
>>>        'data': [ 'active', 'inactive' ] }
>>>
>>>      { 'struct': 'LUKSKeyslotActive',
>>>        'data': { 'secret': 'str',
>>>                  '*iter-time': 'int } }
>>>
>>>      { 'struct': 'LUKSKeyslotInactive',
>>>        'data': { '*old-secret': 'str' } }
>>>
>>>      { 'union': 'LUKSKeyslotAmend',
>>>        'base': { '*keyslot': 'int',
>>>                  'state': 'LUKSKeyslotState' }
>>>        'discriminator': 'state',
>>>        'data': { 'active': 'LUKSKeyslotActive',
>>>                  'inactive': 'LUKSKeyslotInactive' } }
>>>
>>> LUKSKeyslotAmend specifies desired state for a set of keyslots.
>>
>> Though not arbitrary sets of keyslots, it's only a single keyslot or
>> multiple keyslots containing the same secret. Might be good enough in
>> practice, though it means that you may have to issue multiple amend
>> commands to get to the final state that you really want (even if doing
>> everything at once would be safe).
> 
> True.  I traded expressiveness for simplicity.
> 
> Here's the only practical case I can think of where the lack of
> expressiveness may hurt: replace secrets.
> 
> With this interface, you need two operations: activate a free slot with
> the new secret, deactivate the slot(s) with the old secret.  There is an
> intermediate state with both secrets active.
> 
> A more expressive interface could let you do both in one step.  Relevant
> only if the implementation actually provides atomicity.  Can it?

Or put another way, can atomicity be added via 'transaction' later?  If 
so, reusing one common interface to provide atomicity is nicer than 
making every interface reimplement atomicity on an ad hoc basis.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


