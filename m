Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D060567531
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 19:07:54 +0200 (CEST)
Received: from localhost ([::1]:47964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8m1g-0005NS-SC
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 13:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8li5-0006qg-JQ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:47:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8li2-0002oN-53
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657039653;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kZE4wknFWOJktEcX0SsA2wX7zUbtWmw4xDzV0IKnis4=;
 b=TDxrzjRMQrnvGg+GWqPoU42iOF6S4i/P9y7VFJngRTHRokB6TkDxCJ6zwtUyY7cyuuYC8M
 ZGq6jipbn51YdUBtHSXIJaXE6+HKCfPnzI7HkD8QyDbAdqztYR1Li1jRvCskYogr+Nx9tZ
 9B+ci+JArRWRRZZk/RmdD2tcM/qir+g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-eGBsq78WPkmFLes8dwBYUQ-1; Tue, 05 Jul 2022 12:47:30 -0400
X-MC-Unique: eGBsq78WPkmFLes8dwBYUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7F428032E3
 for <qemu-devel@nongnu.org>; Tue,  5 Jul 2022 16:47:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6218A1415108;
 Tue,  5 Jul 2022 16:47:28 +0000 (UTC)
Date: Tue, 5 Jul 2022 17:47:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 5/8] qapi: golang: Generate qapi's event types in Go
Message-ID: <YsRrHbNAZCjmQUcL@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-6-victortoso@redhat.com>
 <CABJz62MhUS4LNOWNwPdf0vwwL2JMUzkmLrPBotezchyomGg58Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABJz62MhUS4LNOWNwPdf0vwwL2JMUzkmLrPBotezchyomGg58Q@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

On Tue, Jul 05, 2022 at 08:45:54AM -0700, Andrea Bolognani wrote:
> On Fri, Jun 17, 2022 at 02:19:29PM +0200, Victor Toso wrote:
> > This patch handles QAPI event types and generates data structures in
> > Go that handles it.
> >
> > We also define a Event interface and two helper functions MarshalEvent
> > and UnmarshalEvent.
> >
> > At the moment of this writing, this patch generates 51 structures (50
> > events)
> >
> > Example:
> >
> > qapi:
> >   | { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
> >   |   'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }
> >
> > go:
> >   | type MemoryDeviceSizeChangeEvent struct {
> >   |         EventTimestamp Timestamp `json:"-"`
> >   |         Id             *string   `json:"id,omitempty"`
> >   |         Size           uint64    `json:"size"`
> >   |         QomPath        string    `json:"qom-path"`
> >   | }
> >
> > usage:
> >   | input := `{"event":"MEMORY_DEVICE_SIZE_CHANGE",` +
> >   |     `"timestamp":{"seconds":1588168529,"microseconds":201316},` +
> >   |     `"data":{"id":"vm0","size":1073741824,"qom-path":"/machine/unattached/device[2]"}}`
> >   | e, err := UnmarshalEvent([]byte(input)
> >   | if err != nil {
> >   |     panic(err)
> >   | }
> >   | if e.GetName() == `MEMORY_DEVICE_SIZE_CHANGE` {
> >   |     m := e.(*MemoryDeviceSizeChangeEvent)
> >   |     // m.QomPath == "/machine/unattached/device[2]"
> >   | }


> > func (s *AcpiDeviceOstEvent) GetTimestamp() Timestamp {
> >     return s.EventTimestamp
> > }
> 
> Does this even need a getter? The struct member is public, and Go
> code seems to favor direct member access.

It satisfies the 'Event' interface, so you can fetch timestamp
without needing to know the specific event struct you're dealing
with.

> 
> > type Timestamp struct {
> >     Seconds      int64 `json:"seconds"`
> >     Microseconds int64 `json:"microseconds"`
> > }
> >
> > type Event interface {
> >     GetName() string
> >     GetTimestamp() Timestamp
> > }
> >


> > func UnmarshalEvent(data []byte) (Event, error) {
> >     base := struct {
> >         Name           string    `json:"event"`
> >         EventTimestamp Timestamp `json:"timestamp"`
> >     }{}
> >     if err := json.Unmarshal(data, &base); err != nil {
> >         return nil, errors.New(fmt.Sprintf("Failed to decode event: %s", string(data)))
> >     }
> >
> >     switch base.Name {
> >
> >     case "ACPI_DEVICE_OST":
> >         event := struct {
> >             Data AcpiDeviceOstEvent `json:"data"`
> >         }{}
> >
> >         if err := json.Unmarshal(data, &event); err != nil {
> >             return nil, errors.New(fmt.Sprintf("Failed to unmarshal: %s", string(data)))
> >         }
> >         event.Data.EventTimestamp = base.EventTimestamp
> >         return &event.Data, nil
> >
> >     // more cases here
> >     }
> >     return nil, errors.New("Failed to recognize event")
> > }
> 
> While I understand the need to have some way to figure out exactly
> what type of event we're looking at before being able to unmarshal
> the JSON data, I don't like how we force users to go through a
> non-standard API for it.
> 
> Here's how I think we should do it:
> 
>   func GetEventType(data []byte) (Event, error) {
>       type event struct {
>           Name string `json:"event"`
>       }
> 
>       tmp := event{}
>       if err := json.Unmarshal(data, &tmp); err != nil {
>           return nil, errors.New(fmt.Sprintf("Failed to decode event:
> %s", string(data)))
>       }
> 
>       switch tmp.Name {
>       case "ACPI_DEVICE_OST":
>           return &AcpiDeviceOstEvent{}, nil
> 
>       // more cases here
>       }
> 
>       return nil, errors.New("Failed to recognize event")
>   }
> 
>   func (s *AcpiDeviceOstEvent) UnmarshalJSON(data []byte) error {
>       type eventData struct {
>           Info ACPIOSTInfo `json:"info"`
>       }
>       type event struct {
>           Name           string    `json:"event"`
>           EventTimestamp Timestamp `json:"timestamp"`
>           Data           eventData `json:"data"`
>       }
> 
>       tmp := event{}
>       err := json.Unmarshal(data, &tmp)
>       if err != nil {
>           return err
>       }
>       if tmp.Name != "ACPI_DEVICE_OST" {
>           return errors.New("name")
>       }
> 
>       s.EventTimestamp = tmp.EventTimestamp
>       s.Info = tmp.Data.Info
>       return nil
>   }
> 
> This way, client code can look like
> 
>   in := `{"event":"ACPI_DEVICE_OST","timestamp":{"seconds":1265044230,"microseconds":450486},"data":{"info":{"device":"d1","slot":"0","slot-type":"DIMM","source":1,"status":0}}}`
> 
>   e, err := qapi.GetEventType([]byte(in))
>   if err != nil {
>       panic(err)
>   }
>   // e is of type AcpiDeviceOstEvent
> 
>   err = json.Unmarshal([]byte(in), &e)
>   if err != nil {
>       panic(err)
>   }
> 
> where only the first part (figuring out the type of the event) needs
> custom APIs, and the remaining code looks just like your average JSON
> handling.

I don't think this kind of detail really needs to be exposed to
clients. Also parsing the same json doc twice just feels wrong.

I think using the dummy union structs is the right approach, but
I'd just call it 'EventFromJSON' rather than 'UnmarshalJSON' to
make it clear this is different from a normal 'UnmarshalJSON'
method.

 
With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


