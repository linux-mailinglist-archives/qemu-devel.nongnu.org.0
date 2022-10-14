Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE25FEC5F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 12:13:15 +0200 (CEST)
Received: from localhost ([::1]:53408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojHgn-0003B4-U8
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 06:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ojHew-00013Z-N7
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 06:11:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ojHet-0005Tw-MR
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 06:11:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665742274;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=8FGCSnmWS9YSeKOVf31i5PwnQR2o9ASrKbCvKXlkXbo=;
 b=ak5lus/UbEJ1lkIvtwNNrin9+LgNVEhRIHs/6/9voF+ObPSmMZLlE+aGtHsBmSTZln/oGb
 3NPrak2+cKD39rehe42bx/B+JzPunla7R49Mgw3ktmeCKQc6UWPlZXGWV4Uhz000iyK6Ll
 BKB9lmXNKPNxqu2igxfnUuB4dA+GuI4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-171-EuPDi0o6NDq46BLgpSdgww-1; Fri, 14 Oct 2022 06:11:12 -0400
X-MC-Unique: EuPDi0o6NDq46BLgpSdgww-1
Received: by mail-wr1-f70.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so1754338wrg.4
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 03:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8FGCSnmWS9YSeKOVf31i5PwnQR2o9ASrKbCvKXlkXbo=;
 b=jIEiW2FbMFjKRRqJg6OE1bJBjyjifO7ZO5xuBMxfFnE6301QlR5zDDJ75kN3vn9tYV
 wbIhBHRnmnhCE6MWN0kqR4E2PtssGJWQqIEz70Wuqc0t1/3R4YmZOAmQzLhKZEuPj3fy
 J+1PEJXfcIYRPFtQRAm/v2OwXGAUw14E9Vz7BoDgMjGRNpBiRJQqGCZcWM8oAR8Hxgmc
 5i1bjBSCwvVHB32MFVLlcYUmhzIxGxcXTZ2t9rYEKp62sqSrnLruYD2kYXlWVz1W1pjX
 SSIbybNk0apE8Dc/op6tEqM5ByxD7Uv0xFnPUbK5DygKvSGGn81EUmuqkQhye67KEBQ/
 M05A==
X-Gm-Message-State: ACrzQf3FOVf4eMRfBuUNKseteajOESVdKBcvPH8BV/0CNO/mgv7/uhum
 76pDA5GqYbR1bHqyoaBk7ZbTahCq4l0ZWsBb0jQcQdSvqHg/jXabFCtC4sXPNdJG8aLoQN1il1P
 M3yIyD2B8X7WESeQ=
X-Received: by 2002:a05:600c:3543:b0:3b4:ba45:9945 with SMTP id
 i3-20020a05600c354300b003b4ba459945mr9577712wmq.58.1665742271724; 
 Fri, 14 Oct 2022 03:11:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6A2Bin5AZhSEMXDLhNhYgDun/z4RfB6byLpdAGZq7yTCkkZL3M2MiC2ssF7e8YTATSpoq2dQ==
X-Received: by 2002:a05:600c:3543:b0:3b4:ba45:9945 with SMTP id
 i3-20020a05600c354300b003b4ba459945mr9577700wmq.58.1665742271495; 
 Fri, 14 Oct 2022 03:11:11 -0700 (PDT)
Received: from localhost (static-28-206-230-77.ipcom.comunitel.net.
 [77.230.206.28]) by smtp.gmail.com with ESMTPSA id
 m187-20020a1ca3c4000000b003b476cabf1csm1734772wme.26.2022.10.14.03.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 03:11:11 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM Call for 2022-10-18
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 14 Oct 2022 12:11:10 +0200
Message-ID: <871qran29t.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Hi

Please, send any topic that you are interested in covering.

For next week, we have a topic:

- VFIO and migration

We are going to discuss what to do with vfio devices that support
migration.  See my RFC on the list, so far we are discussing:

- we need a way to know the size of the vfio device state
  (In the cases we are discussing, they require that the guest is
  stopped, so I am redoing how we calculate pending state).

- We need an estimate/exact sizes.
  Estimate can be the one calculated last time.  This is supposed to be
  fast, and needs to work with the guest running.
  Exact size is just that, we have stopped the guest, and we want to
  know how big is the state for this device, to know if we can complete
  migration ore we will continue in iterative stage.

- We need to send the state asynchronously.
  VFIO devices are very fast at doing whatever they are designed to do.
  But copying its state to memory is not one of the things that they do
  fast.  So I am working in an asynchronous way to copy that state in
  parallel.  The particular setup that caused this problem was using 4
  network vfio cards in the guest.  Current code will:

  for i in network cards:
     copy the state from card i into memory
     send the state from memory from card i to destination

  what we want is something like:

  for i in network cards:
     start asyrchronous copy the state from card i into memory

  for i in network cards:
     wait for copy the state from card i into memory to finish
     send the state from memory from card i to destination

So the cards can tranfer its state to memory in parallel.


At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

   https://calendar.google.com/calendar/u/0?cid=ZWdlZDdja2kwNWxtdTF0bmd2a2wzdGhpZHNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


