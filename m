Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F2556841E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:55:32 +0200 (CEST)
Received: from localhost ([::1]:41652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91ko-0007El-B6
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o91Tr-00051y-7z
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o91To-0005cA-9s
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657100275;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEQRxX0puqKi293WgrAlIsi0VcXqsKCKvpO9hOIBo80=;
 b=LBGKMDWw0S1ONihJhQMgdR1JEHP/FoIEbuvGT+zWxBsiszJ72TtPShX8OqJ/uF9X1KJfNC
 mfPHhbcaBAXUVBVm7B/Ll/VrjSk/p1/43O8oCbBv81MAJe1UKaxvyl0uKepBgk6MgQLzYG
 Wjxt9julTGhVOIMjJPhMy7KvAtF58m4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-E4E_vsI6Nsu3omT59ih4Vg-1; Wed, 06 Jul 2022 05:37:54 -0400
X-MC-Unique: E4E_vsI6Nsu3omT59ih4Vg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1212B811E76
 for <qemu-devel@nongnu.org>; Wed,  6 Jul 2022 09:37:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E00D5400DB35;
 Wed,  6 Jul 2022 09:37:52 +0000 (UTC)
Date: Wed, 6 Jul 2022 10:37:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 4/8] qapi: golang: Generate qapi's union types in Go
Message-ID: <YsVX7ir+41NPA6Xy@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-5-victortoso@redhat.com>
 <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
 <YsRoTs/Ev+MPiIoN@redhat.com>
 <CABJz62NwXK7SErZt4520iKpgEaeVH86L7am4GcMyr8PbG29RCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABJz62NwXK7SErZt4520iKpgEaeVH86L7am4GcMyr8PbG29RCA@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jul 06, 2022 at 04:28:16AM -0500, Andrea Bolognani wrote:
> On Tue, Jul 05, 2022 at 05:35:26PM +0100, Daniel P. Berrangé wrote:
> > On Tue, Jul 05, 2022 at 08:45:30AM -0700, Andrea Bolognani wrote:
> > > All this string manipulation looks sketchy. Is there some reason that
> > > I'm not seeing preventing you for doing something like the untested
> > > code below?
> > >
> > >   func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
> > >       if s.HyperV != nil {
> > >           type union struct {
> > >               Discriminator string                      `json:"type"`
> > >               HyperV        GuestPanicInformationHyperV `json:"hyper-v"`
> > >           }
> > >           tmp := union {
> > >               Discriminator: "hyper-v",
> > >               HyperV:        s.HyperV,
> > >           }
> > >           return json.Marshal(tmp)
> > >       } else if s.S390 != nil {
> > >           type union struct {
> > >               Discriminator string                      `json:"type"`
> > >               S390          GuestPanicInformationHyperV `json:"s390"`
> > >           }
> > >           tmp := union {
> > >               Discriminator: "s390",
> > >               S390:          s.S390,
> > >           }
> > >           return json.Marshal(tmp)
> > >       }
> > >       return nil, errors.New("...")
> > >   }
> >
> > Using these dummy structs is the way I've approached the
> > discriminated union issue in the libvirt Golang XML bindings
> > and it works well. It is the bit I like the least, but it was
> > the lesser of many evils, and on the plus side in the QEMU case
> > it'll be auto-generated code.
> 
> It appears to be the standard way to approach the problem in Go. It
> sort of comes naturally given how the APIs for marshal/unmarshal have
> been defined.
> 
> > > > func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
> > > >     type Alias GuestPanicInformation
> > > >     peek := struct {
> > > >         Alias
> > > >         Driver string `json:"type"`
> > > >     }{}
> > > >
> > > >     if err := json.Unmarshal(data, &peek); err != nil {
> > > >         return err
> > > >     }
> > > >     *s = GuestPanicInformation(peek.Alias)
> > > >
> > > >     switch peek.Driver {
> > > >
> > > >     case "hyper-v":
> > > >         s.HyperV = new(GuestPanicInformationHyperV)
> > > >         if err := json.Unmarshal(data, s.HyperV); err != nil {
> > > >             s.HyperV = nil
> > > >             return err
> > > >         }
> > > >     case "s390":
> > > >         s.S390 = new(GuestPanicInformationS390)
> > > >         if err := json.Unmarshal(data, s.S390); err != nil {
> > > >             s.S390 = nil
> > > >             return err
> > > >         }
> > > >     }
> > > >     // Unrecognizer drivers are silently ignored.
> > > >     return nil
> > >
> > > This looks pretty reasonable, but since you're only using "peek" to
> > > look at the discriminator you should be able to leave out the Alias
> > > type entirely and perform the initial Unmarshal operation while
> > > ignoring all other fields.
> >
> > Once you've defined the dummy structs for the Marshall case
> > though, you might as well use them for Unmarshall too, so you're
> > not parsing the JSON twice.
> 
> You're right, that is undesirable. What about something like this?
> 
>   type GuestPanicInformation struct {
>       HyperV *GuestPanicInformationHyperV
>       S390   *GuestPanicInformationS390
>   }
> 
>   type jsonGuestPanicInformation struct {
>       Discriminator string                       `json:"type"`
>       HyperV        *GuestPanicInformationHyperV `json:"hyper-v"`
>       S390          *GuestPanicInformationS390   `json:"s390"`
>   }

It can possibly be even simpler with just embedding the real
struct

   type jsonGuestPanicInformation struct {
       Discriminator string
       GuestPanicInformation
   }

> 
>   func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
>       if (s.HyperV != nil && s.S390 != nil) ||
>           (s.HyperV == nil && s.S390 == nil) {
>           // client hasn't filled in the struct properly
>           return nil, errors.New("...")
>       }
> 
>       tmp := jsonGuestPanicInformation{}
> 
>       if s.HyperV != nil {
>           tmp.Discriminator = "hyper-v"
>           tmp.HyperV = s.HyperV
>       } else if s.S390 != nil {
>           tmp.Discriminator = "s390"
>           tmp.S390 = s.S390
>       }
> 
>       return json.Marshal(tmp)
>   }

And...

       var discriminator string
       if s.HyperV != nil {
           discriminator = "hyper-v"
       } else if s.S390 != nil {
           discriminator = "s390"
       }

       tmp := jsonGuestPanicInformation{ discriminator, s}
       return json.Marshal(tmp)

> 
>   func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
>       tmp := jsonGuestPanicInformation{}
> 
>       err := json.Unmarshal(data, &tmp)
>       if err != nil {
>           return err
>       }
> 
>       switch tmp.Discriminator {
>       case "hyper-v":
>           if tmp.HyperV == nil {
>               return errors.New("...")
>           }
>           s.HyperV = tmp.HyperV
>       case "s390":
>           if tmp.S390 == nil {
>               return errors.New("...")
>           }
>           s.S390 = tmp.S390
>       }

I'm not actually sure this works, because the first json.Unmarshal
call won't know which branch to try unmarhsalling. So it might be
unavoidable to parse twice.  With the XML parser this wouldn't be
a problem as it has separated the parse phase and then fills the
struct after.

>       // if we hit none of the cases above, that means the
>       // server has produced a variant we don't know about
> 
>       return nil
>   }
> 
> This avoid parsing the JSON twice as well as having to define
> multiple dummy structs, which keeps the code shorter and more
> readable.
> 
> I've also thrown in some additional error checking for good measure,
> ensuring that we abort when the input is completely nonsensical from
> a semantical standpoint.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


