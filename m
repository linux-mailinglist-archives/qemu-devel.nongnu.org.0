Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E0552233F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 20:03:46 +0200 (CEST)
Received: from localhost ([::1]:47686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noUD3-00018V-8T
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 14:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noUC0-0000N7-61
 for qemu-devel@nongnu.org; Tue, 10 May 2022 14:02:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noUBw-0000A0-Iu
 for qemu-devel@nongnu.org; Tue, 10 May 2022 14:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652205755;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=imWvpLyfkIcn6pqta2BpT4Z1XcOjoWKJBBw+2LKBhtY=;
 b=eqdEeJMPFfPTy0N4QzBigJzOmTD8xRx4nUYa8DXkNn3JGWwXOtCxtVj0sbFv/J5Xuu8mzd
 9kqTqR0xulfl9stVZyNPcSFXmdaiL8WubG3B4pq29euiJ4WtIlk1FTSxAdj/CWe5CSRsQn
 ZR1OYE0pAqeE2dHcNj0+7HXkobpNd+k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-6KiqTDyQMsmAJXbx-zGS5Q-1; Tue, 10 May 2022 14:02:33 -0400
X-MC-Unique: 6KiqTDyQMsmAJXbx-zGS5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C548811E80
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 18:02:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C3C72166B2F;
 Tue, 10 May 2022 18:02:24 +0000 (UTC)
Date: Tue, 10 May 2022 19:02:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <YnqorSdh1pOmMDN0@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <20220509102110.slum5rwtbyve5odk@tapioca>
 <CABJz62MiVBMP-VDYkGJe+eLf6GXnifFYo-5D2_-DUwP1uY8yWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABJz62MiVBMP-VDYkGJe+eLf6GXnifFYo-5D2_-DUwP1uY8yWg@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Tue, May 10, 2022 at 01:37:50PM -0400, Andrea Bolognani wrote:
> On Mon, May 09, 2022 at 12:21:10PM +0200, Victor Toso wrote:
> > On Tue, Apr 19, 2022 at 11:12:28AM -0700, Andrea Bolognani wrote:
> > > Based on the example you have in the README and how commands are
> > > defined, invoking (a simplified version of) the trace-event-get-state
> > > command would look like
> > >
> > >   cmd := Command{
> > >       Name: "trace-event-get-state",
> > >       Arg: TraceEventGetStateCommand{
> > >           Name: "qemu_memalign",
> > >       },
> > >   }

Note there is clear redundancy here between 'Name' and the struct
type. IMHO the better approach would be

       cmd := TraceEventGetStateCommand{
          Name: 'qemu_memalign'
       }

and have 'Command' simply as an interface that TraceEventGetStateCommand
implements. I don't think the interface would need more than a
Marshal and Demarshal method, which serialize the 'Arg' and then add
the Name field explicitly. 


> > >   qmp_input, _ := json.Marshal(&cmd)
> > >   // qmp_input now contains
> > >   //   {"execute":"trace-event-get-state","arguments":{"name":"qemu_memalign"}}
> > >   // do something with it
> > >
> > >   qmp_output :=
> > > ([]byte)(`{"return":{"name":"qemu_memalign","state":"disabled"}}`)
> > >   ret := cmd.GetReturnType()
> > >   _ = json.Unmarshal(qmp_output, &ret)
> > >   // ret is a CommandResult instance whose Value member can be cast
> > >   // to a TraceEventInfo struct
> > >
> > > First of all, from an application's point of view there are way too
> > > many steps involved:
> >
> > It can actually get worse. I've used a lot of nested struct to
> > define a Base type for a given Type. In Go, If you try to
> > initialize a Type that has a nested Struct, you'll need to use
> > the nested struct Type as field name and this is too verbose.
> >
> > See https://github.com/golang/go/issues/29438 (merged with:
> > https://github.com/golang/go/issues/12854)
> >
> > The main reason that I kept it is because it maps very well with
> > the over-the-wire protocol.
> 
> Right, I had not realized how bad things really were :)
> 
> I've noticed the use of base types and while I didn't bring it up in
> my initial message because the other concerns seemed of much higher
> importance, I actually wondered whether we need to expose them to
> users of the Go SDK.
> 
> I think we should flatten things. That's what happens with the C
> generator already, for example in
> 
>   struct InetSocketAddress {
>       /* Members inherited from InetSocketAddressBase: */
>       char *host;
>       char *port;
>       /* Own members: */
>       bool has_numeric;
>       bool numeric;
>       /* ... */
>   };
> 
> This representation mirrors the wire protocol perfectly, so I see no
> reason not to adopt it. Am I missing something?

The main reason not to flatten is if you have scenarios where it is
useful to work against the base type directly. I'm not sure that we
have such a need though.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


