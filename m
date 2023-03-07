Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2546AE033
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:19:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXD5-0005z5-8s; Tue, 07 Mar 2023 08:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pZXD3-0005yD-5A
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:18:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pZXD1-0001AR-GV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678195106;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=fZXlBc6lyZ1c6TnC6FQTVuc3F72zR+pjVNdoPMqVdpU=;
 b=CbY/x0ESYWtdkF5hYo3mimw0ZYb7zAmS6HcVtio9wl/KHwkQnv1699Dm8TgNSGRsIExhBd
 jzn0e01SnYev23JfkFm8BXkjJm3RcGiVRWOAlr55Wmu1tROFhg1dNeItyElWcAtjKidHG8
 dKl+DKVd93qyCK2X/W2m2L+aGOU3Ock=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-bLY8P4TCMFmilb52SVOOtQ-1; Tue, 07 Mar 2023 08:18:25 -0500
X-MC-Unique: bLY8P4TCMFmilb52SVOOtQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo4797952wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678195104;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fZXlBc6lyZ1c6TnC6FQTVuc3F72zR+pjVNdoPMqVdpU=;
 b=If9lKgktAZZ+k/201P1jlxWP2xpjspoBWp5q7S2Dg0tTW0JCDPq9h9v7KUEBfZAQpl
 S5b6juyNHMK5QPMwqUbzhFmBaRmBHC2MAKls6o/cPnCnxlqoPIrCFvZ6fL4QwFu13843
 hZZprjEi4TpB2eX7TySYVo8TpCiV+/nf9L6XK3UkKa3MKJ7/pUs72bWE5vP1jQpuet79
 h0nbN7AptY0KU2pPQRBfne+AD9ZLcXTVCEf7tzKcpbtaKhyxD5pV1UBLXQeFuC09AAdK
 3DQlqoEqcJOU0NFxAUSiGbc7jniJubJi1N86y6ABTJbNNd9D6sjYBRH3LdOe355CHivn
 kVQw==
X-Gm-Message-State: AO0yUKWP0cxKUBydXPFSO6AGun9dU1UX52uk/riOF0r1iOwcg2PB9MEI
 9K/sETdPR05hnap+S5h/z05S93NscRuW4OW4Kxhiy8DTAPPSmfiO575SlgkN6bszEjrJiGrkwIU
 ZB17bNlaHtFZUJLS8ur4pGwKZS0dCwaVyf7SI8m27r0tz7pnVnH2UxXoS308EgcwUjpSxUYd++4
 fWPQ==
X-Received: by 2002:a05:600c:1990:b0:3e2:20c7:6553 with SMTP id
 t16-20020a05600c199000b003e220c76553mr12918643wmq.13.1678195103866; 
 Tue, 07 Mar 2023 05:18:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9qqcuKyXfe8vdjQpA9gaFeQPQjWpqpLIBNPq4OIFWyyhUZaXXjLreRGq4C5WS1fj/Pp2kzaQ==
X-Received: by 2002:a05:600c:1990:b0:3e2:20c7:6553 with SMTP id
 t16-20020a05600c199000b003e220c76553mr12918620wmq.13.1678195103511; 
 Tue, 07 Mar 2023 05:18:23 -0800 (PST)
Received: from redhat.com ([46.136.252.15]) by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c47d500b003e11ad0750csm12584213wmo.47.2023.03.07.05.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:18:22 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org, kvm-devel <kvm@vger.kernel.org>
Subject: QEMU/KVM call minutes for 2022-02-21
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Mar 2023 14:18:21 +0100
Message-ID: <87356gk8de.fsf@secure.mitica>
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

Sorry for the delay, some of the topics of the previous call:

Record of sessions:
- What do peple think?

  This makes things easier for people that can't attend due to whatever
  reason.  Mainly TZ problems.

- Should we do another one next week?  Which one?
  TDX migration
  VFIO/VPDA/Vhost migration
  qemu single binary


- The future of icount

icount and determism

determinism with icount: imposible
icount without determisim: interesting and useful

can we consider and icount while also doing a multithread.  Probably
yes and lots of advantages in lot of fields.


icount now simple implementation of decrementing a counter each time
one block is executed.

Now looks like a 50Mhz cpu.
instrument with plugins different parts of qemu
rigth now tcg plugins only do passive "things"
be able to intrument small things.

icount in main code only for counting insttructions.  Everything else to plugins.

Use round robin to make multithread/core deterministic.  Help with debugging CPU's.

Plugins that control the flow of time.  Is that ok with the community.

Use this to glue two emulators together?



Do we have an agenda for next weeks KVM call yet? If there is space I'd
like to take some time to discuss the future direction of icount.

Specifically I believe there might be some proposals for how we could
support icount with MTTCG worth discussing. From my point of view icount
provides too things:

  - a sense of time vaguely related to execution rather than wall clock
  - determinism 

I would love to divorce the former from icount and punt it to plugins.
The plugin would be free to instrument as heavily or lightly as it sees
fit and provide its best guess as to guest time on demand. I wrote this
idea up as a card in Linaro's JIRA if anyone is interested:

  https://linaro.atlassian.net/browse/QEMU-481  

Being able to punt cost modelling and sense of time into plugins would
allow the core icount support to concentrate on determinism. Then any
attempt to enable icount for MTTCG would then have to ensure it stays
deterministic.

Richard and I have discussed the problem a few times and weren't sure it
was solvable but I'm totally open to hearing ideas on how to do it.
Fundamentally I think we would have to ensure any TB's doing IO would
have to execute in an exclusive context. The TCG code already has
mechanisms to ensure all IO is only done at the end of blocks so it
doesn't seem a huge leap to ensure we execute those blocks exclusively.
However there is still the problem of what to do about other pure
computation threads getting ahead or behind of the IO blocks on
subsequent runs.

Anyway does anyone else have ideas to bring to the discussion?

Later, Juan.


