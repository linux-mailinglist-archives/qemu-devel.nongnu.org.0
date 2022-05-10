Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC2D5211E9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:12:55 +0200 (CEST)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMrN-0001v7-28
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noMl5-0002nu-Gc
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noMl3-0007Hx-HU
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652177180;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/ztcGSWwkccR1Ks/Jlpr+rTcNCXfYHQf1j7zfOpISmI=;
 b=WvQWyXAXm0DyRuJP/vP1559FK1xwUob/hBxGUMbC2nPX+kDZoO7nWYGPrri3AT/XJIKqdK
 O/5b32MSJkus+Wy0m9dkugc9G9MNSFSfZ1h2jmha/rZOdLJr/as2mzqJFwZ8AA/m3DX82B
 008CoaJZtoyytkFApSgcjZaq1BH9mB4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-ySXeuekvMEWN_x6yPyv38g-1; Tue, 10 May 2022 06:06:19 -0400
X-MC-Unique: ySXeuekvMEWN_x6yPyv38g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B58F801210
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 10:06:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D47C400E899;
 Tue, 10 May 2022 10:06:18 +0000 (UTC)
Date: Tue, 10 May 2022 11:06:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 1/8] qapi: golang: Generate qapi's enum types in Go
Message-ID: <Yno5GC8Fs3ypv7MQ@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <20220401224104.145961-2-victortoso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220401224104.145961-2-victortoso@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

On Sat, Apr 02, 2022 at 12:40:57AM +0200, Victor Toso wrote:
> This patch handles QAPI enum types and generates its equivalent in Go.
> 
> The highlights of this implementation are:
> 
> 1. For each QAPI enum, we will define an int32 type in Go to be the
>    assigned type of this specific enum

I think there's a potential case to be made for considering
representation of enums as strings in Golang, as it more
gracefully degrades.

Consider the 'SHUTDOWN' event in QEMU, which has a 'reason' field.

This implementation has

type ShutdownCause int32

const (
        ShutdownCauseNone               ShutdownCause = iota
        ShutdownCauseHostError                        // An error prevents further use of guest
        ShutdownCauseHostQmpQuit                      // Reaction to the QMP command 'quit'
        ShutdownCauseHostQmpSystemReset               // Reaction to the QMP command 'system_reset'
        ShutdownCauseHostSignal                       // Reaction to a signal, such as SIGINT
        ShutdownCauseHostUi                           // Reaction to a UI event, like window close
        ShutdownCauseGuestShutdown                    // Guest shutdown/suspend request, via ACPI or other hardware-specific means
        ShutdownCauseGuestReset                       // Guest reset request, and command line turns that into a shutdown
        ShutdownCauseGuestPanic                       // Guest panicked, and command line turns that into a shutdown
        ShutdownCauseSubsystemReset                   // Partial guest reset that does not trigger QMP events and ignores --no-reboot. This is useful for sanitizing hypercalls on s390 that are used during kexec/kdump/boot
)


and


type ShutdownEvent struct {
        Guest  bool          `json:"guest"`  // If true, the shutdown was triggered by a guest request (such as a guest-initiated ACPI shutdown request or other hardware-specific action) rather than a host request (such as sending qemu a SIGINT). (since 2.10)
        Reason ShutdownCause `json:"reason"` // The @ShutdownCause which resulted in the SHUTDOWN. (since 4.0)
}

Consider that the application is compiled against the QAPI generated
API from QEMU 7.0. The application is believed to run happily against
7.1, because app doesn't need any of the functionality added in 7.1
QAPI.  But consider that QEMU 7.1 had introduced a new shutdown reason
value.

The application may want to know that the guest has shutdown, but does
NOT care about the  reason for the shutdown.

Since the ShutdownReason is implemented as an int though, the unmarshalling
for the reason field is going to fail.

If the enums were just represented as strings, then we can gracefully
accept any new enum value that arrives in future. The application can
thus also still log the shutdown reason string, even though it was not
a value explicitly known to the generated API.

> 
> 2. While in the Go codebase we can use the generated enum values, the
>    specification requires that, on the wire, the enumeration type's
>    value to be represented by its string name.
> 
>    For this reason, each Go type that represent's a QAPI enum will be
>    implementing the Marshaler[0] and Unmarshaler[1] interfaces to
>    seamless handle QMP's string to Go int32 value and vice-versa.
> 
> 3. Naming: CamelCase will be used in any identifier that we want to
>    export [2], which is everything in this patch.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


