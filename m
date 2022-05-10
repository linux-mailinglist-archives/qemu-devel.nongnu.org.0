Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11DE52160E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 14:55:05 +0200 (CEST)
Received: from localhost ([::1]:40854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noPOK-0003s0-Kr
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 08:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noPKd-0002MU-0v
 for qemu-devel@nongnu.org; Tue, 10 May 2022 08:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noPKa-0003xj-68
 for qemu-devel@nongnu.org; Tue, 10 May 2022 08:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652187070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=co/UvIpHS5c4lKktMiObpZUp6Iqqvkhl/eeCFrrFD98=;
 b=MSQxyUowNuaRCyA5dvJj9dAHQOpJcVxg7i66AbCaY4H4gEZddueoz32EBXvvvJEPTXmTld
 O2ONzIcHpuyPUqYejNXJc/DrJv+3WgJBr/+hjkjpXpMWnk+rjAV1g5T4OMAfZeNxLL9lAg
 //3I5DL8nZjXBHm7nmfHOZJSdq9OEjs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-MTceztqgOau0xE-nEKPUsg-1; Tue, 10 May 2022 08:51:09 -0400
X-MC-Unique: MTceztqgOau0xE-nEKPUsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C2C5811E76
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 12:51:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E48F214C1D4D;
 Tue, 10 May 2022 12:51:07 +0000 (UTC)
Date: Tue, 10 May 2022 13:51:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
 Victor Toso <victortoso@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <YnpfuYvBu56CCi7b@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnpbuzKo681VwDkn@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 10, 2022 at 01:34:03PM +0100, Daniel P. Berrangé wrote:
> On Tue, May 10, 2022 at 02:02:56PM +0200, Markus Armbruster wrote:
> > > For a minimum viable use case, this doesn't feel all that difficult, as
> > > conceptually instead of deleting the field from QAPI, we just need to
> > > annotate it to say when it was deleted from the QEMU side.  The QAPI
> > > generator for internal QEMU usage, can omit any fields annotated as
> > > deleted in QAPI schema. The QAPI generator for external app usage,
> > > can (optionally) be told to include deleted fields ranging back to
> > > a given version number. So apps can chooses what degree of compat
> > > they wish to retain.
> > 
> > Consider this evolution of command block_resize
> 
> To help us understand, I'll illustrate some possible interfaces
> in both Go and Python, since that covers dynamic and static
> languages
> 
> > * Initially, it has a mandatory argument @device[*].
> 
> Python definition:
> 
>    def block_resize(device, size)
> 
> Caller:
> 
>   block_resize('dev0', 1*GiB)
> 
> 
> Golang definition
> 
>    type BlockResizeCommand struct {
>        Device string
>        Size int
>    }
> 
> Caller
> 
>    cmd := &BlockResizeCommand{
>        Device: "dev0",
>        Size: 1 * GiB,
>    }
> 
> > * An alternative way to specify the command's object emerges: new
> >   argument @node-name.  Both old @device and new @node-name become
> >   optional, and exactly one of them must be specified.  This is commit
> >   3b1dbd11a6 "qmp: Allow block_resize to manipulate bs graph nodes."
> 
> Python definition. Tricky, as non-optional params must be before
> optional params, but size is naturally the last arg. One option
> is to pointlessly mark 'size' as optional
> 
>    def block_resize(device=None, node_name=None, size=None)
> 
> Caller
> 
>     block_resize(device="dev0", size=1*GiB)
>     block_resize(node_name="devnode0", size=1*GiB)
> 
> 
> In golang definition
> 
>    type BlockResizeArguments struct {
>        Device string
>        NodeName string
>        Size int
>    }
> 
> Caller choice of
> 
>    cmd := &BlockResizeCommand{
>        Device: "dev0",
>        Size: 1 * GiB,
>    }
> 
>    cmd := &BlockResizeCommand{
>        NodeName: "devnode0",
>        Size: 1 * GiB,
>    }
> 
> 
> Neither case can easily prevent passing Device and NodeName
> at same time.
> 
> > * At some future date, the old way gets deprecated: argument @device
> >   acquires feature @deprecated.
> 
> Ok, no change needed to the APIs in either case. Possibly have
> code emit a warning if a deprecated field is set.
> 
> > * Still later, the old way gets removed: @device is deleted, and
> >   @node-name becomes mandatory.
> 
> Again no change needed to APIs, but QEMU will throw back an
> error if the wrong one is used. 
> 
> > What is the proper version-spanning interface?
> > 
> > I figure it's both arguments optional, must specify the right one for
> > the version of QEMU actually in use.  This spans versions, but it fails
> > to abstract from them.
> 
> Yep, I think that's inevitable in this scenario. THe plus side
> is that apps that want to span versions can do so. The downside
> is that apps that don't want smarts to span version, may loose
> compile time warnings about use of the now deleted field.

Having said that, a different way to approach the problem is to expose
the versioning directly in the generated code.

Consider a QAPI with versioning info about the fields

  { 'command': 'block_resize',
    'since': '5.0.0',
    'data': { 'device': ['type': 'str', 'until': '5.2.0' ],
              '*device': ['type': 'str', 'since': '5.2.0', 'until': '7.0.0' ],
              '*node-name': ['type': 'str', 'since': '5.2.0', 'until: '7.0.0' ],
              'node-name': ['type': 'str', 'since': '7.0.0' ],
              'size': 'int' } }

Meaning

  * Introduced in 5.0.0, with 'device' mandatory
  * In 5.2.0, 'device' becomes optional, with optional 'node-name' as alternative
  * In 7.0.0, 'device' is deleted, and 'node-name' becomes mandatory

Now consider the Go structs

In 5.0.0 we can generate:

   type BlockResizeArguments struct {
       V500 *BlockResizeArguments500
   }

   type BlockResizeArgumentsV1 struct {
        Device string
        Size int
    }

app can use

    dev := "dev0"
    cmd := BlockResizeArguments{
       V500: &BlockResizeArguments500{
          Device: dev,
	  Size: 1 * GiB
       }
    }


In 5.2.0 we can now generate

   type BlockResizeArguments struct {
       V500 *BlockResizeArgumentsV500
       V520 *BlockResizeArgumentsV520
   }

   type BlockResizeArgumentsV500 struct {
        Device string
        Size int
    }

   type BlockResizeArgumentsV520 struct {
        Device *string
	NodeName *string
        Size int
    }


App can use the same as before, or switch to one of

    dev := "dev0"
    cmd := BlockResizeArguments{
       V520: &BlockResizeArguments520{
          Device: &dev,
	  Size: 1 * GiB
       }
    }

or

    node := "nodedev0"
    cmd := BlockResizeArguments{
       V520: &BlockResizeArguments520{
          NodeName: &node,
	  Size: 1 * GiB
       }
    }



In 7.0.0 we can now generate


   type BlockResizeArguments struct {
       V500 *BlockResizeArgumentsV500
       V520 *BlockResizeArgumentsV520
       V700 *BlockResizeArgumentsV700
   }

   type BlockResizeArgumentsV500 struct {
        Device string
        Size int
   }

   type BlockResizeArgumentsV520 struct {
        Device *string
	NodeName *string
        Size int
   }

   type BlockResizeArgumentsV700 struct {
	NodeName string
        Size int
   }



App can use the same as before, or switch to

    node := "nodedev0"
    cmd := BlockResizeArguments{
       V700: &BlockResizeArguments700{
          NodeName: node,
	  Size: 1 * GiB
       }
    }


This kind of per-command/type versioning is not uncommon when defining API
protocols/interfaces.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


