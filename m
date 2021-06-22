Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC253B016E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:34:17 +0200 (CEST)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdjU-0003fV-9Q
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvdbq-00025u-PC
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:26:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvdbo-0002tz-MT
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624357579;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=blNtDBNflu+/H/oq/+6cg/R8kjPPpM1okxqEcrb3ZWo=;
 b=aPsQGMrs/aZ5NXrW1lDse53rIPadqmy5BUh2ehGGsFKelnpVdQEDzOEBZNwVCW473FNrAI
 5mRiCTnxRwuEoP7Wddd3Z+aopKWVAnLxxzyjj5zS2izBIIhJenSYq28cP4arJg8iw45tCV
 grnkavrnDX33Ro2HHB3NKrPRW+L7ZBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-FD9Vg42DNkurH4iseQQEdg-1; Tue, 22 Jun 2021 06:26:18 -0400
X-MC-Unique: FD9Vg42DNkurH4iseQQEdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D1A5804140;
 Tue, 22 Jun 2021 10:26:17 +0000 (UTC)
Received: from redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97DA619C66;
 Tue, 22 Jun 2021 10:26:04 +0000 (UTC)
Date: Tue, 22 Jun 2021 11:26:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: RFC: Implementation of QMP documentation retrieval command
Message-ID: <YNG6uec4cS+hD+Y4@redhat.com>
References: <CAN6ztm8D4VMf7p-trHNHoOA+1kAXXufTTaHpbyNXZ5qO2_uuPg@mail.gmail.com>
 <6fb6d9d7-3af2-c487-a1d4-aa1140c5a54d@redhat.com>
 <CAN6ztm8bjVnFf_X-vEzYOmTdw09bcoQSkVH9h6BdPFr-PEsP_A@mail.gmail.com>
 <YNGu80s+NHMGw6jf@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YNGu80s+NHMGw6jf@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, ehabkost@redhat.com,
 John Snow <jsnow@redhat.com>, armbru@redhat.com, wainersm@redhat.com,
 qemu-devel@nongnu.org, "Niteesh G. S." <niteesh.gs@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22, 2021 at 10:35:47AM +0100, Stefan Hajnoczi wrote:
> On Mon, Jun 21, 2021 at 11:56:30PM +0530, Niteesh G. S. wrote:
> > TLDR: The goal of this mail wasn't to review the dummy command I had posted
> > but
> > rather start a discussion regarding the implementation of the QMP
> > documentation
> > retrieval command for the TUI.
> 
> It's not clear to me what exactly you wanted to discuss. Here is the QMP
> schema from the commit you linked. It's something concrete that we can
> discuss:
> 
>   ##
>   # @CommandDocumentation:
>   #
>   # A object representing documentation for a command.
>   #
>   # @name: Command name
>   #
>   # @doc: A string containing the documentation.
> 
> Is @doc in some kind of markup or plain text?

There's a more fundamental question about structure here too.
The documentation is not a arbitrary block of text. It contains
specific data items for individual parameters, and return
type, along with version number annotation too.

If we're returning a single string, then the caller needs to
know how to parser the current docs structure we're using
for commands. Right now that's an internal only format, and
I'm not sure we want to expose that as an ABI to consumers
of QEMU. So quite possibly we need to return structured
data instead

eg potentially we need

   { 'struct': 'CommandDocumentation',
     'data': {'name': 'str',
              'summary': 'str'
              'description: 'str'
	      'parameters': ['str'],
	      'return': str,
	      'since': str,
	      'notes': str,
	      'example':str,
	     } }

> 
>   #
>   ##
>   { 'struct': 'CommandDocumentation',
>     'data': {'name': 'str', 'doc': 'str'} }
> 
>   ##
>   # @query-cmd-doc:
>   #
>   # (A simple *prototype* implementation)
>   # Command query-cmd-doc will return the documentation for the command
>   # specified. This will help QMP clients currently the AQMP TUI to show
>   # documentation related to a specific command.
>   #
>   # @command-name: The command name to query documentation for
>   #
>   # Returns: A @CommandDocumentation object containing the documentation.
>   #
>   # Since: TODO: Add a number
>   ##
>   { 'command': 'query-cmd-doc',
>     'data': { 'command-name': 'str' },
>     'returns': 'CommandDocumentation' }
> 
> Is there a way to retrieve struct/enum/etc documentation?
> 
> Do you see a need to query multiple items of documentation in a single
> command? A single item query command can become a performance bottleneck
> if the clients wants to query the documentation for all commands, for
> example. This can be solved by making the the return value an array and
> allowing multiple commands to be queried at once.

If you want batch querying, then it needs to recursively return all
the struct/enum docs related to the commands parameters/return values
too.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


