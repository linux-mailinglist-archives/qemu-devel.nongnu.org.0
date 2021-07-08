Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB2B3BF8BB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 13:11:55 +0200 (CEST)
Received: from localhost ([::1]:50354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Rwg-0000ix-OF
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 07:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1Rvh-0007oV-SW
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:10:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1Rvf-0004Im-6v
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625742649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZkkG4glNMgXlSBZz098VdMakdWFGRVSNKly4NMSnJg4=;
 b=HGaTXW+tOx31ZXmN/og1xLXb3TIVtf53u3dEkVOSpXFnTJa0hXqsZeijvcsvAh1inUfSN/
 9fPd8b2o7VBUXNzwQlkq6PcJK8+UDsHiW2RZbArLu1Qw+ku5Q8JLO1LDxOHchTsmyp+OLA
 2hD8mcDWs/lDLa0na8hxMmD3CCKQ/3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-CP5EPRSIPkWyEz50tzGCPg-1; Thu, 08 Jul 2021 07:10:48 -0400
X-MC-Unique: CP5EPRSIPkWyEz50tzGCPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE10019067E0
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 11:10:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF5A75D6A8;
 Thu,  8 Jul 2021 11:10:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4479A1132B52; Thu,  8 Jul 2021 13:10:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Esoteric QMP specification questions of dubious importance
References: <CAFn=p-YDG2BUpt7nm1K78tFMF8dajpYoLvGbK0poHA72rgAPHg@mail.gmail.com>
Date: Thu, 08 Jul 2021 13:10:46 +0200
In-Reply-To: <CAFn=p-YDG2BUpt7nm1K78tFMF8dajpYoLvGbK0poHA72rgAPHg@mail.gmail.com>
 (John Snow's message of "Fri, 2 Jul 2021 13:14:56 -0400")
Message-ID: <87a6mx83ih.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> I'm writing a "fake" QMP server for the purposes of creating unit tests for
> the python QMP library. In doing so, I am left with some esoteric questions:
>
>
> (1) qemu-spec.txt, section 2.4.2, "error":
>
> The format of an "error response" is:
>
>> { "error": { "class": json-string, "desc": json-string }, "id": json-value }
>
> For the purposes of naming internal types in the QMP library, does the
> "error" object value have a canonical type name? It's not defined in QAPI
> that I can see.

No, it isn't.  It's built manually from an Error object in
qmp_error_response():

    rsp = qdict_from_jsonf_nofail("{ 'error': { 'class': %s, 'desc': %s } }",
                                  QapiErrorClass_str(error_get_class(err)),
                                  error_get_pretty(err));

> (2) qemu-spec.txt, section 2.2 "Server Greeting":
>
> The greeting message format is:
>
>> { "QMP": { "version": json-object, "capabilities": json-array } }
>>
>> Where,
>>
>> - The "version" member contains the Server's version information (the format
>>  is the same of the query-version command)
>
> The layout of the "version" object is not specified in the spec itself,
> though it does ask you to refer to the query-version command.
> Hypothetically, is an alternate implementation of QMP in a binary that is
> *not* QEMU allowed to change the layout of the "version" object (so long as
> it matched whatever format it had for a "query-version" command, also not
> mandated by the spec), or must it *always* conform to this precise layout?
>
> (qapi/control.json):
>
>> { 'struct': 'VersionInfo',
>>    'data': {'qemu': 'VersionTriple', 'package': 'str'} }
>
> If so, what should such a hypothetical client that is *not* QEMU do here?
> What version does it report for the "qemu" VersionTriple member? Can I
> report 0.0.0?

Referring to a QMP command is technically a layering violation.  Hasn't
bothered us so far.

qmp-spec.txt was obviously written with a single application in mind:
QEMU.  Evidence: the key for 'VersionTriple' is named 'qemu'.

A second application appeared a year and a half later: the guest agent.
It doesn't fully comply to qmp-spec.txt.  In particular, it doesn't send
a greeting.  Unfortunate, but doesn't seem worth fixing now.

If your application of QMP does send a greeting and has a query-version
command, then it should probably send the same JSON object for both.
Using something other than QEMU's VersionTriple is probably a bad idea.

Whether the actual contents of VersionTriple matters depends on the QMP
client.  In general, clients should use introspection, not version
information.  Whether reporting 0.0.0 is okay depends on what clients
you want to use.

If we want QMP to support applications other than QEMU (and impostors of
QEMU), we have some cleanup work to do on qmp-spec.txt.

> (3) Does the qmp-spec technically mandate any commands being available?
>
> I believe that qmp_capabilities is definitively a requirement of the spec,
> but what about query-commands, query-version, or quit? Are they technically
> requirements of the QMP spec, or just requirements of QEMU?

qmp_capabilities is part of the protocol.

Other commands aren't, although qmp-spec.txt refers to query-version,
query-qmp-schema, and guest-sync-delimited (QGA only).  Can't see any
others.

> Weird questions, I know.

There are no weird questions, only weird people ;-P


