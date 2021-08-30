Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9303FB4B7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 13:42:17 +0200 (CEST)
Received: from localhost ([::1]:37258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKfg7-0002mq-77
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 07:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mKfcZ-0001n9-Bb
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:38:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mKfcU-0007PU-Ho
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630323508;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=aHw0WHUDjplHhyM2x7z49ozQEApYFi2qNDHdSE7wkJ4=;
 b=RWkIAkXPgqtYT2L9IFswZ5NxsVCKlHmEs1idvBqbZk3n3h5Uuubev5ql3S8SDnpF0vB7eN
 QomHdQLqQ/WW+pdY4Z50/x4vQy9RTSItkKYOpv/0zPzttg7YA/Ht2gtQQqeBjq01ukwCap
 g3DwTFEFVUo7AN6wDMghK4dixtSuguY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-ZNyjYpN9OP2O6R4iO7pBcA-1; Mon, 30 Aug 2021 07:38:25 -0400
X-MC-Unique: ZNyjYpN9OP2O6R4iO7pBcA-1
Received: by mail-wm1-f70.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so4598983wmc.3
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 04:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:user-agent:reply-to:date
 :message-id:mime-version;
 bh=aHw0WHUDjplHhyM2x7z49ozQEApYFi2qNDHdSE7wkJ4=;
 b=sO0gHrAnEFVgMjIVXQqJf2R7C/FZdej4/nGOzmUqBZ64Ia1I9JPFsJ4pNoBYNkaErF
 pWo8S6EIMCKLmMxFi/C1XOccQUafTjzpmYclaQ8qdBCzEisBr2IDKdaHiovjjgJiDskh
 mm8+AIo+3Rp3GJ+UKbLSh06DjQuBXR2OKr6WCFt4WdKgHaNwNOcMkNmHXAroD0x+AhIj
 8HFP8DM1cns/BNzTgVMA+nuxI0z+ogZO+WBVrYEI0DjfBhjzFsfOjSENyk1NiUT3ueKR
 vTnTGi+w6Meg6PaWxl+6baE9b0nDRGO0SUxKemvQD2jpFvk81NBjQ3/QNLOR6LgmJsnD
 Uvmg==
X-Gm-Message-State: AOAM530uATROUrgov34QXH/brGbySWjf1em8MAStbpUlk97wL7J+L1bk
 bbk9Z+zr8cRaSv1rxaxGuNJxA6GdEAQ6ICjvG2jcFdY0L/FXURf6o4FgL8yu2G8pFzx0nL3A1dO
 8WknUr9PUhxd4GY4=
X-Received: by 2002:a05:600c:ac7:: with SMTP id
 c7mr21198201wmr.40.1630323504735; 
 Mon, 30 Aug 2021 04:38:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJXH67bayqR9aHgrx805eJZykx5xZYfFq27eKtVG304N1Rq5OGFXrWr5hyR/agotbGjIS6NQ==
X-Received: by 2002:a05:600c:ac7:: with SMTP id
 c7mr21198189wmr.40.1630323504572; 
 Mon, 30 Aug 2021 04:38:24 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id g1sm17621628wmk.2.2021.08.30.04.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 04:38:24 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call for agenda for 2021-09-07
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 30 Aug 2021 13:38:23 +0200
Message-ID: <87wno32mds.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


