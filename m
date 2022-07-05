Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5282E5674CA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:50:31 +0200 (CEST)
Received: from localhost ([::1]:43948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8lks-00082d-Cv
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8lWZ-0000mA-Fp
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8lWV-0000pI-3K
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657038937;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=i/YheKfnhDlAf94dix+Beg5qV/KUnrYB89jtNdjGHq0=;
 b=i7Oa8L3p1WEjzdWhm4ibr6zQnPpj6a3nfGaIMw670eFwa6j5jYkme3aj+vj6q7nfxUI1Iu
 OmAyekArAnQPt2tTsq5fjgGoGN8/4lt41W98MswgAGKTcKaEOlWX0an9rJgdObabBU5J7a
 1g7HUrXyZyOVOewWwl+9hiWBXutDqYQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-pHq86FQZOWqAIg0fo4fOMg-1; Tue, 05 Jul 2022 12:35:30 -0400
X-MC-Unique: pHq86FQZOWqAIg0fo4fOMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0C92802D1F
 for <qemu-devel@nongnu.org>; Tue,  5 Jul 2022 16:35:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCDF7C2811C;
 Tue,  5 Jul 2022 16:35:28 +0000 (UTC)
Date: Tue, 5 Jul 2022 17:35:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 4/8] qapi: golang: Generate qapi's union types in Go
Message-ID: <YsRoTs/Ev+MPiIoN@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-5-victortoso@redhat.com>
 <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABJz62P_Fy=eyn-QjhOBSvTs_YRgMA=2=teeQwN9SsYGNKGLcQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

On Tue, Jul 05, 2022 at 08:45:30AM -0700, Andrea Bolognani wrote:
> On Fri, Jun 17, 2022 at 02:19:28PM +0200, Victor Toso wrote:
> > qapi:
> >   | { 'union': 'SetPasswordOptions',
> >   |   'base': { 'protocol': 'DisplayProtocol',
> >   |             'password': 'str',
> >   |             '*connected': 'SetPasswordAction' },
> >   |   'discriminator': 'protocol',
> >   |   'data': { 'vnc': 'SetPasswordOptionsVnc' } }
> >
> > go:
> >   | type SetPasswordOptions struct {
> >   | 	// Base fields
> >   | 	Password  string             `json:"password"`
> >   | 	Connected *SetPasswordAction `json:"connected,omitempty"`
> >   |
> >   | 	// Variants fields
> >   | 	Vnc *SetPasswordOptionsVnc `json:"-"`
> >   | }
> 
> Generated code:
> 
> > type GuestPanicInformation struct {
> >     // Variants fields
> >     HyperV *GuestPanicInformationHyperV `json:"-"`
> >     S390   *GuestPanicInformationS390   `json:"-"`
> > }
> >
> > func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
> >     type Alias GuestPanicInformation
> >     alias := Alias(s)
> >     base, err := json.Marshal(alias)
> >     if err != nil {
> >         return nil, err
> >     }
> >
> >     driver := ""
> >     payload := []byte{}
> >     if s.HyperV != nil {
> >         driver = "hyper-v"
> >         payload, err = json.Marshal(s.HyperV)
> >     } else if s.S390 != nil {
> >         driver = "s390"
> >         payload, err = json.Marshal(s.S390)
> >     }
> >
> >     if err != nil {
> >         return nil, err
> >     }
> >
> >     if len(base) == len("{}") {
> >         base = []byte("")
> >     } else {
> >         base = append([]byte{','}, base[1:len(base)-1]...)
> >     }
> >
> >     if len(payload) == 0 || len(payload) == len("{}") {
> >         payload = []byte("")
> >     } else {
> >         payload = append([]byte{','}, payload[1:len(payload)-1]...)
> >     }
> >
> >     result := fmt.Sprintf(`{"type":"%s"%s%s}`, driver, base, payload)
> >     return []byte(result), nil
> 
> All this string manipulation looks sketchy. Is there some reason that
> I'm not seeing preventing you for doing something like the untested
> code below?
> 
>   func (s GuestPanicInformation) MarshalJSON() ([]byte, error) {
>       if s.HyperV != nil {
>           type union struct {
>               Discriminator string                      `json:"type"`
>               HyperV        GuestPanicInformationHyperV `json:"hyper-v"`
>           }
>           tmp := union {
>               Discriminator: "hyper-v",
>               HyperV:        s.HyperV,
>           }
>           return json.Marshal(tmp)
>       } else if s.S390 != nil {
>           type union struct {
>               Discriminator string                      `json:"type"`
>               S390          GuestPanicInformationHyperV `json:"s390"`
>           }
>           tmp := union {
>               Discriminator: "s390",
>               S390:          s.S390,
>           }
>           return json.Marshal(tmp)
>       }
>       return nil, errors.New("...")
>   }

Using these dummy structs is the way I've approached the
discriminated union issue in the libvirt Golang XML bindings
and it works well. It is the bit I like the least, but it was
the lesser of many evils, and on the plus side in the QEMU case
it'll be auto-generated code.

> 
> > func (s *GuestPanicInformation) UnmarshalJSON(data []byte) error {
> >     type Alias GuestPanicInformation
> >     peek := struct {
> >         Alias
> >         Driver string `json:"type"`
> >     }{}
> >
> >     if err := json.Unmarshal(data, &peek); err != nil {
> >         return err
> >     }
> >     *s = GuestPanicInformation(peek.Alias)
> >
> >     switch peek.Driver {
> >
> >     case "hyper-v":
> >         s.HyperV = new(GuestPanicInformationHyperV)
> >         if err := json.Unmarshal(data, s.HyperV); err != nil {
> >             s.HyperV = nil
> >             return err
> >         }
> >     case "s390":
> >         s.S390 = new(GuestPanicInformationS390)
> >         if err := json.Unmarshal(data, s.S390); err != nil {
> >             s.S390 = nil
> >             return err
> >         }
> >     }
> >     // Unrecognizer drivers are silently ignored.
> >     return nil
> 
> This looks pretty reasonable, but since you're only using "peek" to
> look at the discriminator you should be able to leave out the Alias
> type entirely and perform the initial Unmarshal operation while
> ignoring all other fields.

Once you've defined the dummy structs for the Marshall case
though, you might as well use them for Unmarshall too, so you're
not parsing the JSON twice.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


