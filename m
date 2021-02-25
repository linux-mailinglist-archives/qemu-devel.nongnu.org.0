Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06B324E4A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:41:42 +0100 (CET)
Received: from localhost ([::1]:37164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFE5V-0006vv-8D
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFE4P-0006PR-RA
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:40:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFE4N-0006vy-Tk
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614249631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fde2OWsh9PWXt/uBE7WiMvieEGWK6NTXb0S/6kGyyOM=;
 b=OIfH5f4MFod1ASHBZZMRhksYXilMdzpERpPvd1nVhqVrK+LBMu0Kyiazzs5+ZIEh/6FqXD
 SFWzEaXfINDEOCGEx+Sg/61+Gux0g2GBRilph9xtv1y9Gg40AqA8uBEUuuN27gkUwSc7V7
 WnGJ7uZK+biqf4O5G3y9UJhX3AC3PJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-6w1L_crdOGi5MWEVt59bPw-1; Thu, 25 Feb 2021 05:40:26 -0500
X-MC-Unique: 6w1L_crdOGi5MWEVt59bPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B956801965;
 Thu, 25 Feb 2021 10:40:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7C7010013D6;
 Thu, 25 Feb 2021 10:40:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 66A38113860F; Thu, 25 Feb 2021 11:40:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 02/16] qapi/expr.py: Check for dict instead of
 OrderedDict
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-3-jsnow@redhat.com>
 <87a6rt7qzf.fsf@dusky.pond.sub.org>
 <10b0905f-2c36-48f1-fef4-ac96417e48d8@redhat.com>
Date: Thu, 25 Feb 2021 11:40:23 +0100
In-Reply-To: <10b0905f-2c36-48f1-fef4-ac96417e48d8@redhat.com> (John Snow's
 message of "Wed, 24 Feb 2021 16:23:42 -0500")
Message-ID: <87r1l4toq0.fsf@dusky.pond.sub.org>
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 2/24/21 4:30 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> OrderedDict is a subtype of dict, so we can check for a more general
>>> form. These functions do not themselves depend on it being any
>>> particular type.
>> 
>> True.  The actual arguments can only be OrderedDict, though.  I think we
>> refrained from relaxing to dict in these helpers because we felt
>> "staying ordered" is clearer.
>> 
>
> As a habit, I tend towards declaring the least specific type possible 
> for input and declaring the most specific type possible for output.

This maximimizes generality, which can be quite worthwhile.  Maximizing
generality by default is not a bad habit, I guess.  But cases exist
where generality is not needed, and other considerations take
precedence.

>> We're *this* close to mooting the point, because
>> 
>>      Changed in version 3.7: Dictionary order is guaranteed to be
>>      insertion order. This behavior was an implementation detail of
>>      CPython from 3.6.
>> 
>> https://docs.python.org/3.7/library/stdtypes.html
>> 
>> Is messing with it necessary for later work?  If not, is it a worthwhile
>> improvement?
>> 
>
> Not strictly necessary, but if the expression checkers here don't 
> *require* the type be an ordereddict, why bother to enforce that here?
>
> It's just a bid to slacken the type (my type hints will look for Dict, 
> not OrderedDict) and leave the use of OrderedDict as an "implementation 
> detail" that only parser.py knows about.

"Orderedness" is anything but a detail only parser.py knows about.

Example:

    { 'command': 'blockdev-insert-medium',
      'data': { 'id': 'str',
                'node-name': 'str'} }

AST:

    OrderedDict([('command', 'blockdev-insert-medium'),
                 ('data',
                  OrderedDict([('id', {'type': 'str'}),
                               ('node-name', {'type': 'str'})]))])

For the inner dictionary, order matters, because the difference between

    void qmp_blockdev_insert_medium(const char *id, const char *node_name,
                                    Error **errp);

and

    void qmp_blockdev_insert_medium(const char *node_name, const char *id,
                                    Error **errp);

matters.

For the outer dictionary, order carries no semantic meaning.

My point is: parser.py fundamentally builds *ordered* dicts.  We're
certainly free to relax them to more general types wherever
"orderedness" is not needed.  However, one of the main aims of this
typing exercise is to make the code easier to read, and I doubt making
things more general helps there.

Related: the type aliases for the AST you define later in this series.
I figure relaxing these to more general types where possible would
actually reduce their value.  TopLevelExpression tells me more than
dict.

I'm not against relaxing types per se.  Judicious relaxation is often
useful to keep code more generally useful.  When to relax isn't always
obvious.

> (I needed to change it for prototyping using an off-the-shelf parser, so 
> it was annoying to have it check for a stronger type if it doesn't 
> absolutely have to.)

If your off-the-shelf parse doesn't preserve order, it's not fit for the
purpose :)

>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>


