Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCC96BFC12
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 19:00:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdaqC-0001Hr-19; Sat, 18 Mar 2023 13:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pdaq9-0001HF-CL
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 13:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pdaq7-0001TE-HH
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 13:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679162373;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=OJEVScnaLDHPfvx83sUGg69fsesIBjFMqQlpwoU8/S0=;
 b=ghcVMcrkYK44r1FD2Qv7cziGz3u9IH1buqbflBkBcWvpboNSIyEm+dKkkMfGGW5DUD2WcP
 KTLO4BtRbGDkdpG95SVhLISyegEpEAHMfGV5qxXMRsjR10L54G5uwsRA177aTyGREyPAun
 m3gP/Qa6nAqFaoAb1Dmk21+6uGF+5yw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-3vhya29hM7ClrgodbEvQYA-1; Sat, 18 Mar 2023 13:59:32 -0400
X-MC-Unique: 3vhya29hM7ClrgodbEvQYA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o37-20020a05600c512500b003edd119ec9eso52107wms.0
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 10:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679162370;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OJEVScnaLDHPfvx83sUGg69fsesIBjFMqQlpwoU8/S0=;
 b=VsbdXAeekLkDCoQezqLNGeIundKn0BdtpGPtpeJdyviX9l3W2QAFBpFFnrMhaedL8u
 LIgoal+/fmtdiZV8+daRr8KB9UsUr8C0cwWQPQoqXkUWbT734JD/9XLkBUrPEeXUFgCi
 6tVGP38oYPLyfH++V0tmTFUA9Hxeqai6kiPDQY6ZzvnLQjRU1DOuDxGn7ieUg+vCnVDL
 WeohvhtFJqyBpWl8F834WzVVoP+jhxwUQQEbM4aQvQkRIPDk8IukOm+scHagW7x5Nn/y
 Cd3XPsYnWAyqGnfbNbevbW6dlfYoW9PCPng7jtFqyvnMhaxYzzOxBBVNHc/rjn1RtdO3
 omPg==
X-Gm-Message-State: AO0yUKUlqhY+EPn8zdoG4xeGajdm267fLV0OkDXG7mjaxbOhluXQ+6o7
 JvFYRtNxBaYE1kgE+K/yqT8GB1OXlYg4ERoLbI2eS8smKyPMyxWDwjD74EDy1BL9Yle1g+9p3q3
 VJnKsD1h3ptkF/FWCndwfOto71US+SJ+rrfYTr59xxt09sXlgMU7MXVuShyeIRFVmdNgi/Nv3+Z
 3cFn8M
X-Received: by 2002:a5d:4311:0:b0:2d1:a818:6c23 with SMTP id
 h17-20020a5d4311000000b002d1a8186c23mr7486527wrq.39.1679162370613; 
 Sat, 18 Mar 2023 10:59:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set+YPaUznPcUWXi0WWRMpRB/TajlljOehVWXlea9GX4ZNX+Vc1GOTm/9EGE8FRa89zZa3pmkMA==
X-Received: by 2002:a5d:4311:0:b0:2d1:a818:6c23 with SMTP id
 h17-20020a5d4311000000b002d1a8186c23mr7486513wrq.39.1679162370301; 
 Sat, 18 Mar 2023 10:59:30 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a5d4305000000b002c3f81c51b6sm4779444wrq.90.2023.03.18.10.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 10:59:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel <qemu-devel@nongnu.org>, kvm-devel <kvm@vger.kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: KVM call for agenda for 2023-03-21
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Sat, 18 Mar 2023 18:59:28 +0100
Message-ID: <87zg8aj5z3.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Hi

NOTE, NOTE, NOTE

Remember that we are back in that crazy part of the year when daylight
saving applies.  Call is done on US timezone.  If you are anything else,
just doublecheck that it is working for you properly.

NOTE, NOTE, NOTE

Topics in the backburner:
- single qemu binary
  Philippe?
- The future of icount.
  Alex?  My understanding is that you are interested in
  qemu 8.1 to open.

Anything else?


Please, send any topic that you are interested in covering.

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NWR0NWppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMjEwMThUMTMwMDAwWiBlZ2VkN2NraTA1bG11MXRuZ3ZrbDN0aGlkc0Bn&tmsrc=eged7cki05lmu1tngvkl3thids%40group.calendar.google.com&scp=ALL

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


