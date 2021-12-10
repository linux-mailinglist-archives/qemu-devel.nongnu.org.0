Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EBE4707F0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 18:58:30 +0100 (CET)
Received: from localhost ([::1]:59200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvkAA-0006yk-4O
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 12:58:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvk96-0005tU-UJ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:57:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvk94-0003o1-NK
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639159041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HJT2gKgG1BOx7HdQ7zgy/asuRg94YSck7iLBaM+LzVk=;
 b=KBvs9XWNRyWxvn5bORuety1EvJ0fNLnQX5gbjibl3aG6r5vuiV61+CVAkoS0FfqTxBhTEI
 bjB7M/75ezfCt7ZChe72sts3SxnXXMOtYWai1USM7oJXvxoPEU951TC3+uPeAbAW/jInvL
 IQFrodSviD95TMNt0lcNM5TUHbhvmmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-YJOo-F-cO0yj7fObRctwYA-1; Fri, 10 Dec 2021 12:57:20 -0500
X-MC-Unique: YJOo-F-cO0yj7fObRctwYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DB9C801AAB
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 17:57:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 102C5ADDD;
 Fri, 10 Dec 2021 17:57:07 +0000 (UTC)
Date: Fri, 10 Dec 2021 18:57:06 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 09/12] qapi/qom: Convert rng-backend/random to class
Message-ID: <YbOU8mwjXnk6VLhM@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <20211103173002.209906-10-kwolf@redhat.com>
 <87bl2b6miy.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87bl2b6miy.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.11.2021 um 14:15 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  qapi/qom.json | 22 ++++++++++++++++------
> >  1 file changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index ccd1167808..a167e91f67 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -721,6 +721,16 @@
> >  { 'struct': 'RngProperties',
> >    'data': { '*opened': { 'type': 'bool', 'features': ['deprecated'] } } }
> >  
> > +##
> > +# @rng-backend:
> > +#
> > +# Base class for random number generator backends
> > +#
> > +# Since: 1.3
> > +##
> > +{ 'class': 'rng-backend',
> > +  'config': 'RngProperties' }
> > +
> >  ##
> >  # @RngEgdProperties:
> >  #
> > @@ -736,18 +746,18 @@
> >    'data': { 'chardev': 'str' } }
> >  
> >  ##
> > -# @RngRandomProperties:
> > +# @rng-random:
> >  #
> > -# Properties for rng-random objects.
> > +# Random number generator backend using a host random number device
> >  #
> >  # @filename: the filename of the device on the host to obtain entropy from
> >  #            (default: "/dev/urandom")
> >  #
> >  # Since: 1.3
> >  ##
> > -{ 'struct': 'RngRandomProperties',
> > -  'base': 'RngProperties',
> > -  'data': { '*filename': 'str' } }
> > +{ 'class': 'rng-random',
> > +  'parent': 'rng-backend',
> > +  'config': { '*filename': 'str' } }
> >  
> >  ##
> >  # @SevGuestProperties:
> > @@ -889,7 +899,7 @@
> >        'qtest':                      'QtestProperties',
> >        'rng-builtin':                'RngProperties',
> >        'rng-egd':                    'RngEgdProperties',
> > -      'rng-random':                 { 'type': 'RngRandomProperties',
> > +      'rng-random':                 { 'type': 'qom-config:rng-random',
> >                                        'if': 'CONFIG_POSIX' },
> >        'secret':                     'SecretProperties',
> >        'secret_keyring':             { 'type': 'SecretKeyringProperties',
> 
> This generates struct q_obj_rng_random_config and struct
> qom_config_rng_random.  Their names violate coding style.
> 
> The former struct appears to be unused.  Hmm, the next patch will use
> it.  Okay.

They are just for internal use of QAPI generated code. QMP command
marshallers are precedence for this.

Kevin


