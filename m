Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B8E507753
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:13:29 +0200 (CEST)
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsLw-0000qo-Fl
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1ngsL5-00005C-EO
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:12:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1ngsL3-0006Sz-Mg
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650391951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RUIpZX2KrUr0JjptR0oioKLZ/X5CDDCZO0Of6MT6cPE=;
 b=Gxct2xNnGHWA+jabnUCMRN7ea5ntGy6Tu/Jap6Fx7oklhIprtZ8jrNMfFStEnZSTEFdk0L
 J/AKct06MzdI588qUAr0Dz44ZNEBQA7uBLP8ERhWSq/day2ZegfbvurPE+H17COPk87KBv
 Xfht8gKhRm7ilKP/Ro8lF2J+OycKpuI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-kGXrd8fxMve5fSEHSX9c5A-1; Tue, 19 Apr 2022 14:12:30 -0400
X-MC-Unique: kGXrd8fxMve5fSEHSX9c5A-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2ec12272fb2so152418237b3.6
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=RUIpZX2KrUr0JjptR0oioKLZ/X5CDDCZO0Of6MT6cPE=;
 b=LBlcAWb7FONYyA3ERczLq7iOnuiH/F3ohe2+0g90PBtNI10qA2fW8Rbmr2nXQxzanD
 H4N0CTv9JbkRJvz+2gcPKL9bh2BC0oXxOjy9OigsLUPB/XjN6hFXOJe/CV2bZT3fuYI1
 XkWre8KZTBPeGKtLBe70l0TlGl2L/6o3J5VWMOov6hgX55sWXBPXq1O5DE4Bo2SDpbiJ
 UJ8LmwqjM8MobgnsyEsP5uuNjmeb6LqFuUkE7NakVEyVq9Izd6W9ASAT4+A3i3bYU9tT
 +f1y4EhZv9FpguuQPOV3z+Bu2otaZDVhg1Gr42Ey+PlkeSv9cgwc97kX3uqXpA3IDVho
 fEAA==
X-Gm-Message-State: AOAM531D6ugbFDh8xk24VHEUabgpvA2br3rRawk/U/W7jVxKol7C7am/
 bTnapV5ImHc+2LOjj0c3dA+8J+px+OFO4L7tQRaTYHptaRT/6nM7PsUeRI4/5OcULj8p1qG8Uno
 lWEHR00gjwjA5BcIjayDZgRmrez639V0=
X-Received: by 2002:a0d:ff05:0:b0:2ea:25ed:d714 with SMTP id
 p5-20020a0dff05000000b002ea25edd714mr17084184ywf.454.1650391949567; 
 Tue, 19 Apr 2022 11:12:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDxvB9yVe2iaiQhpZBVnZ8Xb/VndqHuM6uj+0rYMBXDKIhIxG8P+AKqIM/EwkacjjxiWQ0N4BZJZVpuFdcNvQ=
X-Received: by 2002:a0d:ff05:0:b0:2ea:25ed:d714 with SMTP id
 p5-20020a0dff05000000b002ea25edd714mr17084152ywf.454.1650391949315; Tue, 19
 Apr 2022 11:12:29 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Apr 2022 11:12:28 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220401224104.145961-1-victortoso@redhat.com>
Date: Tue, 19 Apr 2022 11:12:28 -0700
Message-ID: <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="000000000000e14e5105dd05d19d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e14e5105dd05d19d
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 02, 2022 at 12:40:56AM +0200, Victor Toso wrote:
> Thanks for taking a look, let me know if you have questions, ideas
> or suggestions.

Full disclosure: I have only given the actual implementation a very
cursory look so far, and I've focused on the generated Go API
instead.

Overall things look pretty good.

One concern that I have is about naming struct members: things like
SpiceInfo.MouseMode and most others are translated from the QAPI
schema exactly the way you'd expect them, but for example
ChardevCommon.Logappend doesn't look quite right. Of course there's
no way to programmatically figure out what to capitalize, but maybe
there's room for adding this kind of information in the form of
additional annotations or something like that? Same for the various
structs or members that have unexpectedly-capitalized "Tls" or "Vnc"
in them.

To be clear, I don't think the above is a blocker - just something to
be aware of, and think about.

My biggest concern is about the interface offered for commands.

Based on the example you have in the README and how commands are
defined, invoking (a simplified version of) the trace-event-get-state
command would look like

  cmd := Command{
      Name: "trace-event-get-state",
      Arg: TraceEventGetStateCommand{
          Name: "qemu_memalign",
      },
  }
  qmp_input, _ := json.Marshal(&cmd)
  // qmp_input now contains
  //   {"execute":"trace-event-get-state","arguments":{"name":"qemu_memalign"}}
  // do something with it

  qmp_output :=
([]byte)(`{"return":{"name":"qemu_memalign","state":"disabled"}}`)
  ret := cmd.GetReturnType()
  _ = json.Unmarshal(qmp_output, &ret)
  // ret is a CommandResult instance whose Value member can be cast
  // to a TraceEventInfo struct

First of all, from an application's point of view there are way too
many steps involved: performing this operation should really be as
simple as

  ret, _ := qmp.TraceEventGetState("qemu_memalign")
  // ret is a TraceEventInfo instance

That's the end state we should be working towards.

Of course that assumes that the "qmp" object knows where the QMP
socket is, knows how to talk the QMP protocol, transparently deals
with serializing and deserializing data... Plus, in some case you
might want to deal with the wire transfer yourself in an
application-specific manner. So it makes sense to have the basic
building blocks available and then build the more ergonomic SDK on
top of that - with only the first part being in scope for this
series.

Even with that in mind, the current interface is IMO problematic
because of its almost complete lack of type safety. Both Command.Arg
and CommandResult.Value are of type Any and CommandBase.Name, which
is used to drive the JSON unmarshal logic as well as ending up on the
wire when executing a command, is just a plain string.

I think the low-level interface should look more like

  cmd := TraceEventGetStateCommand{
      Name: "qemu_memalign",
  }
  qmp_input, _ := json.Marshal(&cmd)
  // qmp_input looks the same as before

  qmp_output :=
([]byte)(`{"return":{"name":"qemu_memalign","state":"disabled"}}`)
  ret := TraceEventInfo{}
  _ = json.Unmarshal(qmp_output, &ret)
  // ret is a TraceEventInfo instance

The advantages over the current implementation is that the compiler
will prevent you from doing something silly like passing the wrong
set of arguments to a commmand, and that the application has to
explicitly spell out what kind of object it expects to get as output.

I'm attaching an incomplete implementation that I used for playing
around. It's obviously too simplistic, but hopefully it will help
illustrate my point.

Dealing with errors and commands that don't have a return value might
require us to have generic CommandResult wrapper after all, but we
should really try as hard as we can to stick to type safe interfaces.

-- 
Andrea Bolognani / Red Hat / Virtualization

--000000000000e14e5105dd05d19d
Content-Type: text/plain; charset="us-ascii"; name="command.go"
Content-Disposition: attachment; filename="command.go"
Content-Transfer-Encoding: base64
X-Attachment-Id: 8db98513b2e334f1_0.1

cGFja2FnZSBtYWluCgppbXBvcnQgKAoJImVuY29kaW5nL2pzb24iCgkiZm10IgopCgp0eXBlIFRy
YWNlRXZlbnRHZXRTdGF0ZUNvbW1hbmQgc3RydWN0IHsKCU5hbWUgc3RyaW5nIGBqc29uOiJuYW1l
ImAKfQoKZnVuYyAoc2VsZiAqVHJhY2VFdmVudEdldFN0YXRlQ29tbWFuZCkgTWFyc2hhbEpTT04o
KSAoW11ieXRlLCBlcnJvcikgewoJdHlwZSBBcmd1bWVudHMgVHJhY2VFdmVudEdldFN0YXRlQ29t
bWFuZAoJcmV0dXJuIGpzb24uTWFyc2hhbCgmc3RydWN0IHsKCQlFeGVjdXRlICAgc3RyaW5nICAg
ICBganNvbjoiZXhlY3V0ZSJgCgkJQXJndW1lbnRzICpBcmd1bWVudHMgYGpzb246ImFyZ3VtZW50
cyJgCgl9ewoJCUV4ZWN1dGU6ICAgInRyYWNlLWV2ZW50LWdldC1zdGF0ZSIsCgkJQXJndW1lbnRz
OiAoKkFyZ3VtZW50cykoc2VsZiksCgl9KQp9Cgp0eXBlIFRyYWNlRXZlbnRJbmZvIHN0cnVjdCB7
CglOYW1lICBzdHJpbmcgYGpzb246Im5hbWUiYAoJU3RhdGUgc3RyaW5nIGBqc29uOiJzdGF0ZSJg
Cn0KCmZ1bmMgKHNlbGYgKlRyYWNlRXZlbnRJbmZvKSBVbm1hcnNoYWxKU09OKGRhdGEgW11ieXRl
KSBlcnJvciB7Cgl0eXBlIFJldHVybiBUcmFjZUV2ZW50SW5mbwoJcmV0IDo9IHN0cnVjdCB7CgkJ
UmV0dXJuIFJldHVybiBganNvbjoicmV0dXJuImAKCX17fQoJZXJyIDo9IGpzb24uVW5tYXJzaGFs
KGRhdGEsICZyZXQpCglpZiBlcnIgIT0gbmlsIHsKCQlyZXR1cm4gZXJyCgl9CglzZWxmLk5hbWUg
PSByZXQuUmV0dXJuLk5hbWUKCXNlbGYuU3RhdGUgPSByZXQuUmV0dXJuLlN0YXRlCglyZXR1cm4g
bmlsCn0KCmZ1bmMgbWFpbigpIHsKCXZhciBlcnIgZXJyb3IKCXZhciBxbXBfaW5wdXQgW11ieXRl
Cgl2YXIgcW1wX291dHB1dCBbXWJ5dGUKCgljbWQgOj0gVHJhY2VFdmVudEdldFN0YXRlQ29tbWFu
ZHsKCQlOYW1lOiAicWVtdV9tZW1hbGlnbiIsCgl9CglpZiBxbXBfaW5wdXQsIGVyciA9IGpzb24u
TWFyc2hhbCgmY21kKTsgZXJyICE9IG5pbCB7CgkJcGFuaWMoZXJyKQoJfQoJZm10LlByaW50Zigi
ICAgY21kOiAldlxuIiwgY21kKQoJZm10LlByaW50ZigiLT4gcW1wX2lucHV0OiAldlxuIiwgc3Ry
aW5nKHFtcF9pbnB1dCkpCgoJcW1wX291dHB1dCA9IChbXWJ5dGUpKGB7InJldHVybiI6eyJuYW1l
IjoicWVtdV9tZW1hbGlnbiIsInN0YXRlIjoiZGlzYWJsZWQifX1gKQoJcmV0IDo9IFRyYWNlRXZl
bnRJbmZve30KCWlmIGVyciA9IGpzb24uVW5tYXJzaGFsKHFtcF9vdXRwdXQsICZyZXQpOyBlcnIg
IT0gbmlsIHsKCQlwYW5pYyhlcnIpCgl9CglmbXQuUHJpbnRmKCI8LSBxbXBfb3V0cHV0OiAldlxu
Iiwgc3RyaW5nKHFtcF9vdXRwdXQpKQoJZm10LlByaW50ZigiICAgcmV0OiAldlxuIiwgcmV0KQp9
Cg==
--000000000000e14e5105dd05d19d--


