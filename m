Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC0D5222F3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 19:40:22 +0200 (CEST)
Received: from localhost ([::1]:58370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noTqP-0003kG-30
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 13:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1noTo6-0002xh-U2
 for qemu-devel@nongnu.org; Tue, 10 May 2022 13:37:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1noTo3-0004qx-AH
 for qemu-devel@nongnu.org; Tue, 10 May 2022 13:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652204273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ag4Me+u2hMM2n8t363dUOhqJKULxL7F/qe52kwCbNb4=;
 b=I88G1SSi5r4urNlbWE9kyHtH4+6hek9j4q5M4FN32w1+lFo82/68O9LKEkyfEF5Br41toX
 sNatY7YwIqxwXMIGF9RxgwuwDSVpioWwKGho/YQhQs5JsnDL3MtugntZY38zVsrcrAuziB
 dgrj3PEKreXbDt0Im51MsnJPvpZFxf4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-s3Me5-i-O_KFQk7wVpfjWQ-1; Tue, 10 May 2022 13:37:52 -0400
X-MC-Unique: s3Me5-i-O_KFQk7wVpfjWQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 g129-20020a25db87000000b0064b0d671050so2366497ybf.6
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 10:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=Ag4Me+u2hMM2n8t363dUOhqJKULxL7F/qe52kwCbNb4=;
 b=kklT7hFb/wN3dCLENMcOWpMmJGszIm+ZX5t938i9qWTs80jOaP+qaYJZusFsANwd9C
 r3ZsUhb2KK7TJ0WDwVjfyhY3S1yaEShkvs2PAZLFA0lRWT1vPcip6y3cIWS8QumnPiF7
 uc3C4eaBPa7LE2ygi9G5UGo/mt1iLKCmZ0Dvkyc7k5LdwPhbm4E0O7aqNBvtm8SzpBaQ
 AZbOu+x4WwFyFgfPzhz0HLiYjIFw7m+GZxPoKx8aS82W4kg5VepadN4D7mNE2SSbjzT6
 O/hTOoOwujFN5UvzVP5eMc7KBvZXvMeC5BfaQhv9Bg0ZPcz82PjqZnb/7XKiE0YbC6Wm
 QzWw==
X-Gm-Message-State: AOAM532aLKLolR61Sdb7oQT2h1SPr7O4z0ik+ZDuc0wdaccX5VHvlPr3
 mB3a1jVACMh3satMVnjzCMLbYEiq1B0qlIqBnROb5JjNfc8GmMktcTXFTUqDm0EFtRP4LjG68EO
 8xhl7ql1y1VWmxYNwAxey+bAwQvmFUR4=
X-Received: by 2002:a81:2f8a:0:b0:2fb:5:acfd with SMTP id
 v132-20020a812f8a000000b002fb0005acfdmr20634194ywv.481.1652204271720; 
 Tue, 10 May 2022 10:37:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTZje+PE1zwXDdgAfQ+JHZZBAEfF6FlJhqzQxK6KqSzjI/lOrIp/n/hT6wpxoG5Jo8KRhMq2wmy06nS70ycds=
X-Received: by 2002:a81:2f8a:0:b0:2fb:5:acfd with SMTP id
 v132-20020a812f8a000000b002fb0005acfdmr20634160ywv.481.1652204271438; 
 Tue, 10 May 2022 10:37:51 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 May 2022 13:37:50 -0400
From: Andrea Bolognani <abologna@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <20220509102110.slum5rwtbyve5odk@tapioca>
MIME-Version: 1.0
In-Reply-To: <20220509102110.slum5rwtbyve5odk@tapioca>
Date: Tue, 10 May 2022 13:37:50 -0400
Message-ID: <CABJz62MiVBMP-VDYkGJe+eLf6GXnifFYo-5D2_-DUwP1uY8yWg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 09, 2022 at 12:21:10PM +0200, Victor Toso wrote:
> On Tue, Apr 19, 2022 at 11:12:28AM -0700, Andrea Bolognani wrote:
> > Based on the example you have in the README and how commands are
> > defined, invoking (a simplified version of) the trace-event-get-state
> > command would look like
> >
> >   cmd := Command{
> >       Name: "trace-event-get-state",
> >       Arg: TraceEventGetStateCommand{
> >           Name: "qemu_memalign",
> >       },
> >   }
> >   qmp_input, _ := json.Marshal(&cmd)
> >   // qmp_input now contains
> >   //   {"execute":"trace-event-get-state","arguments":{"name":"qemu_memalign"}}
> >   // do something with it
> >
> >   qmp_output :=
> > ([]byte)(`{"return":{"name":"qemu_memalign","state":"disabled"}}`)
> >   ret := cmd.GetReturnType()
> >   _ = json.Unmarshal(qmp_output, &ret)
> >   // ret is a CommandResult instance whose Value member can be cast
> >   // to a TraceEventInfo struct
> >
> > First of all, from an application's point of view there are way too
> > many steps involved:
>
> It can actually get worse. I've used a lot of nested struct to
> define a Base type for a given Type. In Go, If you try to
> initialize a Type that has a nested Struct, you'll need to use
> the nested struct Type as field name and this is too verbose.
>
> See https://github.com/golang/go/issues/29438 (merged with:
> https://github.com/golang/go/issues/12854)
>
> The main reason that I kept it is because it maps very well with
> the over-the-wire protocol.

Right, I had not realized how bad things really were :)

I've noticed the use of base types and while I didn't bring it up in
my initial message because the other concerns seemed of much higher
importance, I actually wondered whether we need to expose them to
users of the Go SDK.

I think we should flatten things. That's what happens with the C
generator already, for example in

  struct InetSocketAddress {
      /* Members inherited from InetSocketAddressBase: */
      char *host;
      char *port;
      /* Own members: */
      bool has_numeric;
      bool numeric;
      /* ... */
  };

This representation mirrors the wire protocol perfectly, so I see no
reason not to adopt it. Am I missing something?

> > performing this operation should really be as
> > simple as
> >
> >   ret, _ := qmp.TraceEventGetState("qemu_memalign")
> >   // ret is a TraceEventInfo instance
> >
> > That's the end state we should be working towards.
> >
> > Of course that assumes that the "qmp" object knows where the
> > QMP socket is, knows how to talk the QMP protocol,
> > transparently deals with serializing and deserializing data...
> > Plus, in some case you might want to deal with the wire
> > transfer yourself in an application-specific manner. So it
> > makes sense to have the basic building blocks available and
> > then build the more ergonomic SDK on top of that - with only
> > the first part being in scope for this series.
>
> Right. Indeed, I thought a bit about what I want to fit into the
> code generator that will reside in QEMU and what we might want to
> develop on top of that.
>
> The goal for this series really is generating the data types that
> can be converted to/from QMP messages.

That's perfectly fine, and in fact I believe that splitting the whole
endeavor into three parts - QMP protocol implementation, QAPI types
serialization/deserialization, and a high-level SDK that gives easy
access to the previous two - is the best approach.

> >   qmp_output :=
> > ([]byte)(`{"return":{"name":"qemu_memalign","state":"disabled"}}`)
> >   ret := TraceEventInfo{}
> >   _ = json.Unmarshal(qmp_output, &ret)
> >   // ret is a TraceEventInfo instance
> >
> > The advantages over the current implementation is that the compiler
> > will prevent you from doing something silly like passing the wrong
> > set of arguments to a commmand, and that the application has to
> > explicitly spell out what kind of object it expects to get as output.
>
> I think that, if we know all types that we can have at QAPI spec,
> the process of marshalling and unmarshalling should verify it.
> So, even if we don't change the expected interface as suggested,
> that work needs to be done. For some types, I've already did it,
> like for Unions and Alternate types.
>
> Example: https://gitlab.com/victortoso/qapi-go/-/blob/main/pkg/qapi/unions.go#L28
>
> This union type can have 4 values for the Any interface type. The
> code generator documents it to help user's out.
>
>   | type SocketAddressLegacy struct {
>   |     // Base type for this struct
>   |     SocketAddressLegacyBase
>   |     // Value based on @type, possible types:
>   |     // * InetSocketAddressWrapper
>   |     // * UnixSocketAddressWrapper
>   |     // * VsockSocketAddressWrapper
>   |     // * StringWrapper
>   |     Value Any
>   | }
>
> On the Marshal function, I used Sprintf as a way to fetch Value's
> type. There are other alternatives but to the cost of adding
> other deps.
>
>   | func (s SocketAddressLegacy) MarshalJSON() ([]byte, error) {
>   |     base, err := json.Marshal(s.SocketAddressLegacyBase)
>   |     if err != nil {
>   |         return nil, err
>   |     }
>   |
>   |     typestr := fmt.Sprintf("%T", s.Value)
>   |     typestr =
>   |     typestr[strings.LastIndex(typestr, ".")+1:]
>
> ...
>
>   |     // "The branches need not cover all possible enum values"
>   |     // This means that on Marshal, we can safely ignore empty values
>   |     if typestr == "<nil>" {
>   |         return []byte(base), nil
>   |     }
>
> And then we have some Runtime checks to be sure to avoid the
> scenario mismatching Value's type.
>
>   |     // Runtime check for supported value types
>   |     if typestr != "StringWrapper" &&
>   |         typestr != "InetSocketAddressWrapper" &&
>   |         typestr != "UnixSocketAddressWrapper" &&
>   |         typestr != "VsockSocketAddressWrapper" {
>   |         return nil, errors.New(fmt.Sprintf("Type is not supported: %s", typestr))
>   |    }
>   |    value, err := json.Marshal(s.Value)
>   |    if err != nil {
>   |        return nil, err
>   |    }
>
> With Alternate type, extra care was need on Unmarshal as we don't
> know the underlying type without looking at the message we
> received. That's the only reason of StrictDecode() helper
> function.
>
> I'm just pointing out with above examples that I agree with you
> with Type safety. It is hard to infer everything at compile-time
> so we need some Runtime checks. Having some nicer APIs will
> definitely help and improve developer experience too.

I agree that in some cases build time validation is simply not
possible, but this doesn't seem to be one of those cases.

For unmarshaling? Sure, especially if we keep in mind the forward
compatibility scenarios that Dan has raised elsewhere in the thread,
and that to be completely honest I haven't gotten around to fully
digesting yet.

But when it comes to marshaling we know ahead of time that the value
is going to be one of a handful of types, and we should get the
compiler to spot violations of this assumption for us. Using "Any"
prevents that.

If you look at libvirt-go-xml-module, alternates are handled with
things like

  type DomainInterfaceSource struct {
      Ethernet  *DomainInterfaceSourceEthernet `xml:"-"`
      Server    *DomainInterfaceSourceServer   `xml:"-"`
      // ...
  }

  type DomainInterfaceSourceEthernet struct {
      IP    []DomainInterfaceIP    `xml:"ip"`
      Route []DomainInterfaceRoute `xml:"route"`
  }

  type DomainInterfaceSourceServer struct {
      Address string                      `xml:"address,attr,omitempty"`
      Port    uint                        `xml:"port,attr,omitempty"`
      Local   *DomainInterfaceSourceLocal `xml:"local"`
  }

and (un)marshaling is done like

  func (a *DomainInterfaceSource) MarshalXML(e *xml.Encoder, start
xml.StartElement) error {
      if a.User != nil {
          return nil
      } else if a.Ethernet != nil {
          if len(a.Ethernet.IP) > 0 && len(a.Ethernet.Route) > 0 {
              return e.EncodeElement(a.Ethernet, start)
          }
          return nil
      } else if // ...
  }

  func (a *DomainInterfaceSource) UnmarshalXML(d *xml.Decoder, start
xml.StartElement) error {
      if a.User != nil {
          return d.DecodeElement(a.User, &start)
      } else if a.Ethernet != nil {
          return d.DecodeElement(a.Ethernet, &start)
      } else if // ...
  }

When using these data structures, you'll then do something like

  iface := DomainInterface{
      Source: &DomainInterfaceSource{
          Network: &DomainInterfaceNetwork{
              Network: "default",
          },
      },
  }

instead of

  iface := DomainInterface{
      Source: DomainInterfaceSource{
          Type:  "network",
          Value: DomainInterfaceNetwork{
              Network: "default",
          },
      },
  }

which is more compact and, crucially, allows the compiler to catch
many typing issues ahead of time. I think this approach would work
really well for QAPI too.

-- 
Andrea Bolognani / Red Hat / Virtualization


