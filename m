Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6169F497ACB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:55:57 +0100 (CET)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBv8m-0002cc-Hq
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:55:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nBv59-0000E0-6w
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 03:52:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nBv55-0001Vb-Ax
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 03:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643014324;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=LXRVvwoiwZzifxDn36r5XLBHH/133EA03m6HU6kUIs8=;
 b=Sa97mxXwyhSib/xb8wzhPzaKqvvtqJyNqZqt1NH64dGKAlVHHDrBbtgR+/KFIvQvX+C9yE
 Da/NMzuzbAhiWbKduQHnYHu33tI8nM43x1gbYPzFzehJVRGemzUoF+HaLl15Aqr7ZyzWEY
 TqMR3PrA14KoEAONRs9899LpULoCGkQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-FxkW9IxWP2G8kLsyXyyX6w-1; Mon, 24 Jan 2022 03:52:02 -0500
X-MC-Unique: FxkW9IxWP2G8kLsyXyyX6w-1
Received: by mail-wm1-f69.google.com with SMTP id
 d140-20020a1c1d92000000b0034edefd55caso4325090wmd.4
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 00:52:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:user-agent:reply-to:date
 :message-id:mime-version;
 bh=LXRVvwoiwZzifxDn36r5XLBHH/133EA03m6HU6kUIs8=;
 b=z1Xa8vtQEXlnVeK8P7nMNzElWWT+OxKhgMks42vBtAb+tm8Er9YbEnBIaVlXB8rqIV
 dies9IsJM/EmZ5iAG7chTs7BAMUgENUDsz0QfxQc9DVUXV3Pxzn9cJ1VN9bjn8RIxDYk
 6hHz1CVXRIpZBVtWJoJ8oejyKpuUNGvibBmUpIqKqNuPHgj6keehhsYNFHsoL7/NSYh6
 IuNkcJzNRCMyBQBGKae1G008Btz+Lqc+25aJH6+EEbQiGa6ivbzBQLJKAfuA2/DjY9Hb
 xcmUdwX+noIlLkifhazxJnV5oRVazt9AAzPuKflHuxOH/5dDHSoZTPnw6Wp1iJ3HifBp
 zJOA==
X-Gm-Message-State: AOAM532e/5XjeOdLCx6AFjis9j6ojFkJzbKte4Tcq4Fyxm3Ycp/GXnnU
 GDRUvO7uHdn9QWaqn/7xsH5KX0RQx9/ZMmtXfRdz0EeZTykiY53Tj9LeDtg3kHW+ZGUWMEWWygn
 B1vvRBxe+5HF0kHk=
X-Received: by 2002:a05:600c:4e4e:: with SMTP id
 e14mr857521wmq.98.1643014320905; 
 Mon, 24 Jan 2022 00:52:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweugE/T1AI2/YI2Cq1E8ZAzZqGnBoCZEb6UCIovSBN7a7OQuU0OFTQ77CISW3JTub+9knOTA==
X-Received: by 2002:a05:600c:4e4e:: with SMTP id
 e14mr857511wmq.98.1643014320687; 
 Mon, 24 Jan 2022 00:52:00 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id l4sm540392wrs.6.2022.01.24.00.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 00:52:00 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call for agenda for 2022-01-25
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 24 Jan 2022 09:51:59 +0100
Message-ID: <87y2355xe8.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This week we have a continuation of 2 weeks ago call to discuss how to
enable creation of machines from QMP sooner on the boot.

There was already a call about this 2 weeks ago where we didn't finished
everything.
I have been on vacation last week and I haven't been able to send a
"kind of resume" of the call.

Basically what we need is:
- being able to create machines sooner that we are today
- being able to change the devices that are in the boards, in
  particular, we need to be able to create a board deciding what devices
  it has and how they are connected without recompiling qemu.
  This means to launch QMP sooner that we do today.
- Several options was proposed:
  - create a new binary that only allows QMP machine creation.
    and continue having the old command line
  - create a new binary, and change current HMP/command line to just
    call this new binary.  This way we make sure that everything can be
    done through QMP.
  - stay with only one binary but change it so we can call QMP sooner.
- There is agreement that we need to be able to call QMP sooner.
- There is NO agreement about how the best way to proceed:
  * We don't want this to be a multiyear effort, i.e. we want something
    that can be used relatively soon (this means that using only one
    binary can be tricky).
  * If we start with a new binary that only allows qmp and we wait until
    everything has been ported to QMP, it can take forever, and during
    that time we have to maintain two binaries.
  * Getting a new binary lets us to be more agreessive about what we can
    remove/change. i.e. easier experimentation.
  * Management Apps will only use QMP, not the command line, or they
    even use libvirt and don't care at all about qemu.  So it appears
    that HMP is only used for developers, so we can be loose about
    backwards compatibility. I.e. if we allow the same functionality,
    but the syntax is different, we don't care.

Discussion was longer, but it was difficult to take notes and as I said,
the only thing that appears that everybody agrees is that we need an
agreement about what is the plan to go there.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


