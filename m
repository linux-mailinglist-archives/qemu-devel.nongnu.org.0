Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7ED337534
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:14:31 +0100 (CET)
Received: from localhost ([::1]:55874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKM57-0008SF-HH
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKLt1-0008I0-Qk
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:01:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKLsu-0006jR-5b
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615471311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oONQ0P13rATRHU4XnDddDhPeM7ifJvVl4Ooob2QTQBE=;
 b=TVJpUlcB9oeWoYb0Ucc7dZeUyIdYAQH6zSxvJ4+0yi5AgncwCDPUyIVqNDc96j1YiPpszr
 xmvJIW6JAHCEX0HRYJCPHLZgYuPFI5uoPu+nSCMxbgEhHv62lOXTHGKQ6KZMcwHgQ0u7HK
 CUN8nvnMhgYCqNe+MEuaci9dr0jnBj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-qk2kT0BMPhmbDywBPpgwqw-1; Thu, 11 Mar 2021 09:01:49 -0500
X-MC-Unique: qk2kT0BMPhmbDywBPpgwqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58B13192FDA0;
 Thu, 11 Mar 2021 14:01:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18F9610016FC;
 Thu, 11 Mar 2021 14:01:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 96CE91132C12; Thu, 11 Mar 2021 15:01:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box>
 <YEnK9rgRRz+0qyGh@angien.pipo.sk>
 <20210311083711.GA9008@merkur.fritz.box>
 <YEn997A568x3i743@angien.pipo.sk>
 <20210311114142.GE9008@merkur.fritz.box>
Date: Thu, 11 Mar 2021 15:01:46 +0100
In-Reply-To: <20210311114142.GE9008@merkur.fritz.box> (Kevin Wolf's message of
 "Thu, 11 Mar 2021 12:41:42 +0100")
Message-ID: <87r1kln60l.fsf@dusky.pond.sub.org>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, Peter Krempa <pkrempa@redhat.com>,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 11.03.2021 um 12:24 hat Peter Krempa geschrieben:
>> On Thu, Mar 11, 2021 at 09:37:11 +0100, Kevin Wolf wrote:
>> > Am 11.03.2021 um 08:47 hat Peter Krempa geschrieben:
>> > > On Wed, Mar 10, 2021 at 18:30:44 +0100, Kevin Wolf wrote:
>> > > > Am 10.03.2021 um 15:31 hat Paolo Bonzini geschrieben:
>> > > > > On 10/03/21 15:22, Peter Krempa wrote:
>> 
>> [...]
>> 
>> > > -object memory-backend-ram,id=ram-node2,size=24578621440,host-nodes=1-2,host-nodes=5,host-nodes=7,policy=bind
>> > 
>> > Oh, we have ranges, too... That makes the compatibility code even
>> > nastier to write. I doubt that we can implement this in the keyval
>> > parser alone without touching the visitor. :-/
>> > 
>> > > If any of the above is to be deprecated we'll need to adjust our
>> > > JSON->commandline generator accordignly.
>> > > 
>> > > Luckily the 'host-nodes' is storeable as a bitmap and the generator is
>> > > actually modular to allow plugging an array interpretor which actually
>> > > does the above conversion from a JSON array.
>> > > 
>> > > So, what is the preferred syntax here? Additionally we might need a
>> > > witness property to detect when to use the new syntax if basing it on
>> > > the object-add qapification will not be enough.
>> > 
>> > The list syntax supported by the keyval parser is the one you know from
>> > -blockdev: host-nodes.0=3,host-nodes.1=7, ...
>> 
>> I think that should be easy enough to convert to.
>
> We could also support JSON syntax in QEMU. That would probably be even
> more convenient for libvirt?

Cleanly QAPIfied options like -blockdev do

    if (optarg[0] == '{') {
        parse @optarg as JSON with qobject_from_json()
        convert to C type with qobject_input_visitor_new()
    } else {
        parse @optarg with keyval_parse()
        convert to C type with qobject_input_visitor_new_keyval()
    }

Options where compatibility problems defeat keyval_parse() can do

    if (optarg[0] == '{') {
        parse @optarg as JSON with qobject_from_json()
        convert to C type with qobject_input_visitor_new()
    } else {
        parse the old way
        convert to C type somehow
    }

Precedence: -display.  There, the old way is an ad hoc parser, and the
conversion to C type DisplayOptions is manual.  For -object, the old way
would be QemuOpts, and the conversion would use the opts visitor.

>> Is it safe to do right away (with the old parser?). Otherwise we need
>> to agree on something which will let us detect when it's safe to
>> change.
>
> Neither keyval nor JSON syntax work with the old QemuOpts parser.
>
> What is the usual way to do this for command line options? If we don't
> have a good way there, we can always tie it to something in the QAPI
> schema. If we still get this solved in time for 6.0, we could use the
> existence of ObjectOptions. Or all else failing, we can use a feature
> flag.

You should not look for types in output of query-qmp-schema, only for
commands and events.  To discourage looking for types, query-qmp-schema
masks the names of user-defined types.

A feature flag is fine as last resort.  That's what they were designed
for.


