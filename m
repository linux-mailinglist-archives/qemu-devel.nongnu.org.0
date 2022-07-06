Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9BA568490
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:05:52 +0200 (CEST)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91up-0003nr-WD
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o91do-0006fG-Q8
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:48:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o91dl-0001ok-Qn
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657100893;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4e2W7LI7RhkCv5XLcikXMmAuadQFaVukMwmUJ6U8y4=;
 b=b2BCUojR374T5RlgnrTlwYUtsxDJjbqO2p0Sz7evB3r4iWVZzRET4ztzhjOoXx3lYykGHK
 Rtdwj+E09V5dc1Qy2dw2LUMKq1hRMdjsUDnlNg83rEbPG1wtd+qdA0Y9g2ATp3Pn3hHcB5
 yx6RC0QTObzBdeHWdu8riron+o5bUkw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-V-9_y3HkPq6w1ObIc8o7CA-1; Wed, 06 Jul 2022 05:48:11 -0400
X-MC-Unique: V-9_y3HkPq6w1ObIc8o7CA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 263C41C04B41
 for <qemu-devel@nongnu.org>; Wed,  6 Jul 2022 09:48:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43C05492C3B;
 Wed,  6 Jul 2022 09:48:09 +0000 (UTC)
Date: Wed, 6 Jul 2022 10:48:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>,
 Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 4/8] qapi: golang: Generate qapi's union types in Go
Message-ID: <YsVaVpXPE4YVjmVt@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-5-victortoso@redhat.com>
 <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
 <YsRoTs/Ev+MPiIoN@redhat.com>
 <CABJz62NwXK7SErZt4520iKpgEaeVH86L7am4GcMyr8PbG29RCA@mail.gmail.com>
 <YsVX7ir+41NPA6Xy@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsVX7ir+41NPA6Xy@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Wed, Jul 06, 2022 at 10:37:54AM +0100, Daniel P. Berrangé wrote:
> On Wed, Jul 06, 2022 at 04:28:16AM -0500, Andrea Bolognani wrote:
> > On Tue, Jul 05, 2022 at 05:35:26PM +0100, Daniel P. Berrangé wrote:
> > > On Tue, Jul 05, 2022 at 08:45:30AM -0700, Andrea Bolognani wrote:
> > > > All this string manipulation looks sketchy. Is there some reason that
> > > > I'm not seeing preventing you for doing something like the untested
> > > > code below?
> > > >
> > > >   func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
> > > >       if s.HyperV != nil {
> > > >           type union struct {
> > > >               Discriminator string                      `json:"type"`
> > > >               HyperV        GuestPanicInformationHyperV `json:"hyper-v"`
> > > >           }
> > > >           tmp := union {
> > > >               Discriminator: "hyper-v",
> > > >               HyperV:        s.HyperV,
> > > >           }
> > > >           return json.Marshal(tmp)
> > > >       } else if s.S390 != nil {
> > > >           type union struct {
> > > >               Discriminator string                      `json:"type"`
> > > >               S390          GuestPanicInformationHyperV `json:"s390"`
> > > >           }
> > > >           tmp := union {
> > > >               Discriminator: "s390",
> > > >               S390:          s.S390,
> > > >           }
> > > >           return json.Marshal(tmp)
> > > >       }
> > > >       return nil, errors.New("...")
> > > >   }
> > >
> > > Using these dummy structs is the way I've approached the
> > > discriminated union issue in the libvirt Golang XML bindings
> > > and it works well. It is the bit I like the least, but it was
> > > the lesser of many evils, and on the plus side in the QEMU case
> > > it'll be auto-generated code.
> > 
> > It appears to be the standard way to approach the problem in Go. It
> > sort of comes naturally given how the APIs for marshal/unmarshal have
> > been defined.
> > 
> > > > > func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
> > > > >     type Alias GuestPanicInformation
> > > > >     peek := struct {
> > > > >         Alias
> > > > >         Driver string `json:"type"`
> > > > >     }{}
> > > > >
> > > > >     if err := json.Unmarshal(data, &peek); err != nil {
> > > > >         return err
> > > > >     }
> > > > >     *s = GuestPanicInformation(peek.Alias)
> > > > >
> > > > >     switch peek.Driver {
> > > > >
> > > > >     case "hyper-v":
> > > > >         s.HyperV = new(GuestPanicInformationHyperV)
> > > > >         if err := json.Unmarshal(data, s.HyperV); err != nil {
> > > > >             s.HyperV = nil
> > > > >             return err
> > > > >         }
> > > > >     case "s390":
> > > > >         s.S390 = new(GuestPanicInformationS390)
> > > > >         if err := json.Unmarshal(data, s.S390); err != nil {
> > > > >             s.S390 = nil
> > > > >             return err
> > > > >         }
> > > > >     }
> > > > >     // Unrecognizer drivers are silently ignored.
> > > > >     return nil
> > > >
> > > > This looks pretty reasonable, but since you're only using "peek" to
> > > > look at the discriminator you should be able to leave out the Alias
> > > > type entirely and perform the initial Unmarshal operation while
> > > > ignoring all other fields.
> > >
> > > Once you've defined the dummy structs for the Marshall case
> > > though, you might as well use them for Unmarshall too, so you're
> > > not parsing the JSON twice.
> > 
> > You're right, that is undesirable. What about something like this?
> > 
> >   type GuestPanicInformation struct {
> >       HyperV *GuestPanicInformationHyperV
> >       S390   *GuestPanicInformationS390
> >   }
> > 
> >   type jsonGuestPanicInformation struct {
> >       Discriminator string                       `json:"type"`
> >       HyperV        *GuestPanicInformationHyperV `json:"hyper-v"`
> >       S390          *GuestPanicInformationS390   `json:"s390"`
> >   }
> 
> It can possibly be even simpler with just embedding the real
> struct
> 
>    type jsonGuestPanicInformation struct {
>        Discriminator string
>        GuestPanicInformation
>    }
> 
> > 
> >   func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
> >       if (s.HyperV != nil && s.S390 != nil) ||
> >           (s.HyperV == nil && s.S390 == nil) {
> >           // client hasn't filled in the struct properly
> >           return nil, errors.New("...")
> >       }
> > 
> >       tmp := jsonGuestPanicInformation{}
> > 
> >       if s.HyperV != nil {
> >           tmp.Discriminator = "hyper-v"
> >           tmp.HyperV = s.HyperV
> >       } else if s.S390 != nil {
> >           tmp.Discriminator = "s390"
> >           tmp.S390 = s.S390
> >       }
> > 
> >       return json.Marshal(tmp)
> >   }
> 
> And...
> 
>        var discriminator string
>        if s.HyperV != nil {
>            discriminator = "hyper-v"
>        } else if s.S390 != nil {
>            discriminator = "s390"
>        }
> 
>        tmp := jsonGuestPanicInformation{ discriminator, s}
>        return json.Marshal(tmp)
> 
> > 
> >   func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
> >       tmp := jsonGuestPanicInformation{}
> > 
> >       err := json.Unmarshal(data, &tmp)
> >       if err != nil {
> >           return err
> >       }
> > 
> >       switch tmp.Discriminator {
> >       case "hyper-v":
> >           if tmp.HyperV == nil {
> >               return errors.New("...")
> >           }
> >           s.HyperV = tmp.HyperV
> >       case "s390":
> >           if tmp.S390 == nil {
> >               return errors.New("...")
> >           }
> >           s.S390 = tmp.S390
> >       }
> 
> I'm not actually sure this works, because the first json.Unmarshal
> call won't know which branch to try unmarhsalling. So it might be
> unavoidable to parse twice.  With the XML parser this wouldn't be
> a problem as it has separated the parse phase and then fills the
> struct after.

Right afer sending, I remember how this is supposed to be done. It
involves use of 'json.RawMessage' eg examples at:

  https://pkg.go.dev/encoding/json#example-RawMessage-Unmarshal

So it would look like:

   type GuestPanicInformation struct {
       HyperV *GuestPanicInformationHyperV
       S390   *GuestPanicInformationS390
   }
 
   type jsonGuestPanicInformation struct {
       Discriminator string   `json:"type"`
       Payload *json.RawMessage
   }


    func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
        var p *json.RawMesage
        var err error
        if s.HyperV != nil {
            d = "hyper-v"
            p, err = json.Marshal(s.HyperV)
        } else if s.S390 != nil {
            d = "s390"
            p, err = json.Marshal(s.S390)
        } else {
	    err = fmt.Errorf("No payload defined")
	}
        if err != nil {
            return []byte{}, err
        }
  
        return json.Marshal(jsonGuestPanicInformation{d, p}), nil
    }


 
   func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
       tmp := jsonGuestPanicInformation{}
 
       err := json.Unmarshal(data, &tmp)
       if err != nil {
           return err
       }
 
       switch tmp.Discriminator {
       case "hyper-v":
           s.HyperV := GuestPanicInformationHyperV{}
           err := json.Unmarshal(tmp.Payload, s.HyperV)
           if err != nil {
              return err
           }
       case "s390":
           s.S390 := GuestPanicInformationS390{}
           err := json.Unmarshal(tmp.Payload, s.S390)
           if err != nil {
              return err
           }
       }

       return fmt.Errorf("Unknown type '%s'", tmp.Discriminator)
  }

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


