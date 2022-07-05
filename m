Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236FB567376
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:52:10 +0200 (CEST)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kqO-0003iw-M9
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o8kkT-0002uO-Im
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:46:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o8kkQ-0000lA-8O
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657035957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G9adjm0m8uFJoyqiNFJvAGfDf7Uv2uaAMpXb3irjPy0=;
 b=Ejo3Z2lH92XWQvYdjZ38ccrRxuOJYuXRLCea5hEhmyu0vJUhD5KrIyaT3LK1d/4qeFM7mh
 /Sa1HEPFGxpAe8h7YHEFGp1SSADo2kciCZOJxBp85ybTSBVUJOPuLNkp5gDmpnrxbth5pL
 cYigWKGEHG4gqCt9fs1Ff64PpogjnL8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-DvvV1aXRNKmHP0AVTuTN-Q-1; Tue, 05 Jul 2022 11:45:56 -0400
X-MC-Unique: DvvV1aXRNKmHP0AVTuTN-Q-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-31c9d560435so36418057b3.21
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=G9adjm0m8uFJoyqiNFJvAGfDf7Uv2uaAMpXb3irjPy0=;
 b=N6E5UyHeJAWly/OYWiT04Jh1RGxvZ1FOQCeiF678XGy+Sm9p8zSIDt8rvBlzVLILmT
 3A/Ca8ZKBUi1a+LmCGC+SJJW1aQ/tzoe4KtmTiHVFO76BIs/u6C/1eASRSORAjLGxww6
 t9vUDp584HrBfUQRrJJrcCjdKmQV4JdCTX7HEnqWx560fW8htf3LEqfyrCSsaydDJPpD
 kQNkwlv843AbXazAmNOS1ZW/2i2P1O5AAULLhKp48Wh2G7LfqZqAvklZ1anMKpljVSGJ
 oDISVOs2nVA6fwZtGGbYWFyO+GToUiYkMBpXchyAMCWfPk/VwnpUKCi5lihhvN23Shti
 Cnrg==
X-Gm-Message-State: AJIora/D8Gt3E7O9/BKccuL7hBePz30e1TNfUte7vAAXPVnYwkLE862G
 Qj3Vlez1gAOKCYqqWAtwOHhGuaIXlBzArawm5zW+Fv9rj//xvb89Hkjp3paKqh9udUQr6gADQKP
 /o+uqZ/T7Cdh3elJs9Ey34PHlwonDVc8=
X-Received: by 2002:a81:4904:0:b0:31c:9be2:f0c0 with SMTP id
 w4-20020a814904000000b0031c9be2f0c0mr12066224ywa.72.1657035955461; 
 Tue, 05 Jul 2022 08:45:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t2D+a2t1tXqIZJU+d2oKGs5HA9zRNO47y37iibq80PZ5hj+94wjHIMMxO5qfXCLWPoJ5P4ZIqzdFXC5AT6Des=
X-Received: by 2002:a81:4904:0:b0:31c:9be2:f0c0 with SMTP id
 w4-20020a814904000000b0031c9be2f0c0mr12066203ywa.72.1657035955198; Tue, 05
 Jul 2022 08:45:55 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Jul 2022 08:45:54 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-6-victortoso@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220617121932.249381-6-victortoso@redhat.com>
Date: Tue, 5 Jul 2022 08:45:54 -0700
Message-ID: <CABJz62MhUS4LNOWNwPdf0vwwL2JMUzkmLrPBotezchyomGg58Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/8] qapi: golang: Generate qapi's event types in Go
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01,
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

On Fri, Jun 17, 2022 at 02:19:29PM +0200, Victor Toso wrote:
> This patch handles QAPI event types and generates data structures in
> Go that handles it.
>
> We also define a Event interface and two helper functions MarshalEvent
> and UnmarshalEvent.
>
> At the moment of this writing, this patch generates 51 structures (50
> events)
>
> Example:
>
> qapi:
>   | { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
>   |   'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }
>
> go:
>   | type MemoryDeviceSizeChangeEvent struct {
>   |         EventTimestamp Timestamp `json:"-"`
>   |         Id             *string   `json:"id,omitempty"`
>   |         Size           uint64    `json:"size"`
>   |         QomPath        string    `json:"qom-path"`
>   | }
>
> usage:
>   | input := `{"event":"MEMORY_DEVICE_SIZE_CHANGE",` +
>   |     `"timestamp":{"seconds":1588168529,"microseconds":201316},` +
>   |     `"data":{"id":"vm0","size":1073741824,"qom-path":"/machine/unattached/device[2]"}}`
>   | e, err := UnmarshalEvent([]byte(input)
>   | if err != nil {
>   |     panic(err)
>   | }
>   | if e.GetName() == `MEMORY_DEVICE_SIZE_CHANGE` {
>   |     m := e.(*MemoryDeviceSizeChangeEvent)
>   |     // m.QomPath == "/machine/unattached/device[2]"
>   | }

Generated code:

> type AcpiDeviceOstEvent struct {
>     EventTimestamp Timestamp   `json:"-"`

Any reason for naming this EventTimestamp as opposed to just
Timestamp?

>     Info           ACPIOSTInfo `json:"info"`
> }
>
> func (s *AcpiDeviceOstEvent) GetName() string {
>     return "ACPI_DEVICE_OST"
> }

Getters in Go don't usually start with "Get", so this could be just
Name(). And pointer receivers are usually only recommended when the
underlying object needs to be modified, which is not the case here.

> func (s *AcpiDeviceOstEvent) GetTimestamp() Timestamp {
>     return s.EventTimestamp
> }

Does this even need a getter? The struct member is public, and Go
code seems to favor direct member access.

> type Timestamp struct {
>     Seconds      int64 `json:"seconds"`
>     Microseconds int64 `json:"microseconds"`
> }
>
> type Event interface {
>     GetName() string
>     GetTimestamp() Timestamp
> }
>
> func MarshalEvent(e Event) ([]byte, error) {
>     baseStruct := struct {
>         Name           string    `json:"event"`
>         EventTimestamp Timestamp `json:"timestamp"`
>     }{
>         Name:           e.GetName(),
>         EventTimestamp: e.GetTimestamp(),
>     }
>     base, err := json.Marshal(baseStruct)
>     if err != nil {
>         return []byte{}, err
>     }
>
>     dataStruct := struct {
>         Payload Event `json:"data"`
>     }{
>         Payload: e,
>     }
>     data, err := json.Marshal(dataStruct)
>     if err != nil {
>         return []byte{}, err
>     }
>
>     if len(data) == len(`{"data":{}}`) {
>         return base, nil
>     }
>
>     // Combines Event's base and data in a single JSON object
>     result := fmt.Sprintf("%s,%s", base[:len(base)-1], data[1:])
>     return []byte(result), nil
> }

I have the same concerns about the string manipulation going on here
as I had for unions. Here's an alternative implementation, and this
time I've even tested it :)

  func (s AcpiDeviceOstEvent) MarshalJSON() ([]byte, error) {
      type eventData struct {
          Info ACPIOSTInfo `json:"info"`
      }
      type event struct {
          Name      string    `json:"event"`
          Timestamp Timestamp `json:"timestamp"`
          Data      eventData `json:"data"`
      }

      tmp := event{
          Name:      "ACPI_DEVICE_OST",
          Timestamp: s.EventTimestamp,
          Data:      eventData{
              Info: s.Info,
          },
      }
      return json.Marshal(tmp)
  }

> func UnmarshalEvent(data []byte) (Event, error) {
>     base := struct {
>         Name           string    `json:"event"`
>         EventTimestamp Timestamp `json:"timestamp"`
>     }{}
>     if err := json.Unmarshal(data, &base); err != nil {
>         return nil, errors.New(fmt.Sprintf("Failed to decode event: %s", string(data)))
>     }
>
>     switch base.Name {
>
>     case "ACPI_DEVICE_OST":
>         event := struct {
>             Data AcpiDeviceOstEvent `json:"data"`
>         }{}
>
>         if err := json.Unmarshal(data, &event); err != nil {
>             return nil, errors.New(fmt.Sprintf("Failed to unmarshal: %s", string(data)))
>         }
>         event.Data.EventTimestamp = base.EventTimestamp
>         return &event.Data, nil
>
>     // more cases here
>     }
>     return nil, errors.New("Failed to recognize event")
> }

While I understand the need to have some way to figure out exactly
what type of event we're looking at before being able to unmarshal
the JSON data, I don't like how we force users to go through a
non-standard API for it.

Here's how I think we should do it:

  func GetEventType(data []byte) (Event, error) {
      type event struct {
          Name string `json:"event"`
      }

      tmp := event{}
      if err := json.Unmarshal(data, &tmp); err != nil {
          return nil, errors.New(fmt.Sprintf("Failed to decode event:
%s", string(data)))
      }

      switch tmp.Name {
      case "ACPI_DEVICE_OST":
          return &AcpiDeviceOstEvent{}, nil

      // more cases here
      }

      return nil, errors.New("Failed to recognize event")
  }

  func (s *AcpiDeviceOstEvent) UnmarshalJSON(data []byte) error {
      type eventData struct {
          Info ACPIOSTInfo `json:"info"`
      }
      type event struct {
          Name           string    `json:"event"`
          EventTimestamp Timestamp `json:"timestamp"`
          Data           eventData `json:"data"`
      }

      tmp := event{}
      err := json.Unmarshal(data, &tmp)
      if err != nil {
          return err
      }
      if tmp.Name != "ACPI_DEVICE_OST" {
          return errors.New("name")
      }

      s.EventTimestamp = tmp.EventTimestamp
      s.Info = tmp.Data.Info
      return nil
  }

This way, client code can look like

  in := `{"event":"ACPI_DEVICE_OST","timestamp":{"seconds":1265044230,"microseconds":450486},"data":{"info":{"device":"d1","slot":"0","slot-type":"DIMM","source":1,"status":0}}}`

  e, err := qapi.GetEventType([]byte(in))
  if err != nil {
      panic(err)
  }
  // e is of type AcpiDeviceOstEvent

  err = json.Unmarshal([]byte(in), &e)
  if err != nil {
      panic(err)
  }

where only the first part (figuring out the type of the event) needs
custom APIs, and the remaining code looks just like your average JSON
handling.

Speaking of client code, in the commit message you have

> input := `{"event":"MEMORY_DEVICE_SIZE_CHANGE",` +
>     `"timestamp":{"seconds":1588168529,"microseconds":201316},` +
>     `"data":{"id":"vm0","size":1073741824,"qom-path":"/machine/unattached/device[2]"}}`
> e, err := UnmarshalEvent([]byte(input)
> if err != nil {
>     panic(err)
> }
> if e.GetName() == `MEMORY_DEVICE_SIZE_CHANGE` {
>     m := e.(*MemoryDeviceSizeChangeEvent)
>     // m.QomPath == "/machine/unattached/device[2]"
> }

I don't think we should encourage the use of string comparison for
the purpose of going from a generic Event instance to a specific one:
a better way would be to use Go's type switch feature, such as

  switch m := e.(type) {
      case *MemoryDeviceSizeChangeEvent:
          // m.QomPath == "/machine/unattached/device[2]"
  }

In fact, I don't really see a reason to provide the Name() getter
outside of possibly diagnostics, and given the potential of it being
misused I would argue that it might be better not to have it.

-- 
Andrea Bolognani / Red Hat / Virtualization


