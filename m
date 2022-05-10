Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8025213A9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 13:25:45 +0200 (CEST)
Received: from localhost ([::1]:37112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noNzs-0006Dn-82
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 07:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noNuo-000239-K1
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:20:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noNul-00047w-AW
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652181626;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOl9E9oPR3YyVsR/UOXbKuvNlj8t4cwL9T/vNwCpA0g=;
 b=D84zVVhdbWcTanNRCN6OKWpuewb6tdYL5npH8dpacLzIbmejq0WNkkj69IFj5CFyG/No8j
 qRft6H8phpJ29CEjYhOnUeLZWPWK8aVGAwI2/xYMVG8pYMSZB6ppHdM+KbaUJe5BGydNdR
 BT+Qobq2r4SaEX9YRSbGZ19BI4++ipI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-tGWN0XURPXKU9VDPtYGA3Q-1; Tue, 10 May 2022 07:20:25 -0400
X-MC-Unique: tGWN0XURPXKU9VDPtYGA3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5394E1C06ED8
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 11:20:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4328F2024CBB;
 Tue, 10 May 2022 11:20:00 +0000 (UTC)
Date: Tue, 10 May 2022 12:19:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 1/8] qapi: golang: Generate qapi's enum types in Go
Message-ID: <YnpKXf4fynWupiVC@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <20220401224104.145961-2-victortoso@redhat.com>
 <Yno5GC8Fs3ypv7MQ@redhat.com>
 <20220510111532.tm5cyljsxxnvk7l2@tapioca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510111532.tm5cyljsxxnvk7l2@tapioca>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

On Tue, May 10, 2022 at 01:15:32PM +0200, Victor Toso wrote:
> Hi,
> 
> On Tue, May 10, 2022 at 11:06:16AM +0100, Daniel P. Berrangé wrote:
> > On Sat, Apr 02, 2022 at 12:40:57AM +0200, Victor Toso wrote:
> > > This patch handles QAPI enum types and generates its equivalent in Go.
> > > 
> > > The highlights of this implementation are:
> > > 
> > > 1. For each QAPI enum, we will define an int32 type in Go to be the
> > >    assigned type of this specific enum
> > 
> > I think there's a potential case to be made for considering
> > representation of enums as strings in Golang, as it more
> > gracefully degrades.
> > 
> > Consider the 'SHUTDOWN' event in QEMU, which has a 'reason' field.
> > 
> > This implementation has
> > 
> > type ShutdownCause int32
> > 
> > const (
> >         ShutdownCauseNone               ShutdownCause = iota
> >         ShutdownCauseHostError                        // An error prevents further use of guest
> >         ShutdownCauseHostQmpQuit                      // Reaction to the QMP command 'quit'
> >         ShutdownCauseHostQmpSystemReset               // Reaction to the QMP command 'system_reset'
> >         ShutdownCauseHostSignal                       // Reaction to a signal, such as SIGINT
> >         ShutdownCauseHostUi                           // Reaction to a UI event, like window close
> >         ShutdownCauseGuestShutdown                    // Guest shutdown/suspend request, via ACPI or other hardware-specific means
> >         ShutdownCauseGuestReset                       // Guest reset request, and command line turns that into a shutdown
> >         ShutdownCauseGuestPanic                       // Guest panicked, and command line turns that into a shutdown
> >         ShutdownCauseSubsystemReset                   // Partial guest reset that does not trigger QMP events and ignores --no-reboot. This is useful for sanitizing hypercalls on s390 that are used during kexec/kdump/boot
> > )
> > 
> > and
> > 
> > type ShutdownEvent struct {
> >         Guest  bool          `json:"guest"`  // If true, the shutdown was triggered by a guest request (such as a guest-initiated ACPI shutdown request or other hardware-specific action) rather than a host request (such as sending qemu a SIGINT). (since 2.10)
> >         Reason ShutdownCause `json:"reason"` // The @ShutdownCause which resulted in the SHUTDOWN. (since 4.0)
> > }
> > 
> > Consider that the application is compiled against the QAPI
> > generated API from QEMU 7.0. The application is believed to run
> > happily against 7.1, because app doesn't need any of the
> > functionality added in 7.1 QAPI.  But consider that QEMU 7.1
> > had introduced a new shutdown reason value.
> > 
> > The application may want to know that the guest has shutdown,
> > but does NOT care about the reason for the shutdown.
> > 
> > Since the ShutdownReason is implemented as an int though, the
> > unmarshalling for the reason field is going to fail.
> 
> Marshalling does error if you try to convert an int that is not
> in the range of the enum type.
> 
> Unmarshalling should not error in this case, but the field ends
> up not being set which defaults to 0 (in this case,
> ShutdownCauseNone). That could mislead the *actual* reason but
> not without a warning which is expected in this case, imho.
> 
> (I know is not an actual warning, just a Println, but it'll be
> fixed in the next iteration)

I don't thinnk we should be emitting warnings/printlns at all
in this case though. The app should be able to consume the
enum without needing a warning.  If the app wants to validate
against a specific set of constants, it can decide to emit
a warning if there was a case it can't handle. We shouldn't
emit warnings/errors in the unmarshalling step though,as it
isn't the right place to decide on such policy.

> 
>   | func (s *ShutdownCause) UnmarshalJSON(data []byte) error {
>   |     var name string
>   |
>   |     if err := json.Unmarshal(data, &name); err != nil {
>   |         return err
>   |     }
>   |
>   |     switch name {
>   |     case "none":
>   |         (*s) = ShutdownCauseNone
>   |     case "host-error":
>   |         (*s) = ShutdownCauseHostError
>   |     case "host-qmp-quit":
>   |         (*s) = ShutdownCauseHostQmpQuit
>   |     case "host-qmp-system-reset":
>   |         (*s) = ShutdownCauseHostQmpSystemReset
>   |     case "host-signal":
>   |         (*s) = ShutdownCauseHostSignal
>   |     case "host-ui":
>   |         (*s) = ShutdownCauseHostUi
>   |     case "guest-shutdown":
>   |         (*s) = ShutdownCauseGuestShutdown
>   |     case "guest-reset":
>   |         (*s) = ShutdownCauseGuestReset
>   |     case "guest-panic":
>   |         (*s) = ShutdownCauseGuestPanic
>   |     case "subsystem-reset":
>   |         (*s) = ShutdownCauseSubsystemReset
>   |     default:
>   |         fmt.Println("Failed to decode ShutdownCause", *s)
>   |     }
>   |     return nil
>   | }
> 
> > If the enums were just represented as strings, then we can
> > gracefully accept any new enum value that arrives in future.
> > The application can thus also still log the shutdown reason
> > string, even though it was not a value explicitly known to the
> > generated API.
> 
> As a string, the warning should still exist and default value of
> "" or nil for ptr would apply. IMHO, between string + warning and
> int + warning, I'd still go with int here.
> 
> That's a design decision to be made. All in all, I don't know
> much about the changes in QEMU/QAPI per version to take this
> decision, so I'll rely on you and the list for this, not just for
> enums but for the other types too.

Essentially every release of QEMU will have QAPI changes. Most of
the time these are append-only changes. ie a new struct, new command,
new field, new enum value.  Sometimes there will be removals due
to deprecation, though note my other reply saying that we really
ought to stop doing removals from the schema, and instead just
annotate when a field stops being used.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


