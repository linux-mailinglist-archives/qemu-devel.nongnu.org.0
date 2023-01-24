Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917CC679CDB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 16:04:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKKpo-0001uC-OL; Tue, 24 Jan 2023 10:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pKKpS-0001pe-Cm
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 10:03:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pKKpN-0000it-8X
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 10:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674572592;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=K7kvdv6wvYJP9dCVajEv6FN9lfYBZBvsojCGxfXmS5o=;
 b=gPrbr6QRbn66lJy8fAbDum8zRhsT0jO6qg3H8bVBFRiWc9XfbcWex5rwJIbGYmwfgxnqQG
 nYdZG419bPtWM1g0af8UuJafn60EZhjllL8X13bMkdPVEUAGsBbgRLyMzBK3ViizkD+Xiy
 /Rcdv/iWkzmKyk/G8LT22DkzwXEEmAU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-LTHskGI7P8CzkzuHzqNQZw-1; Tue, 24 Jan 2023 10:03:08 -0500
X-MC-Unique: LTHskGI7P8CzkzuHzqNQZw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v5-20020adf8b45000000b002bde0366b11so2676242wra.7
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 07:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K7kvdv6wvYJP9dCVajEv6FN9lfYBZBvsojCGxfXmS5o=;
 b=qTUa+RHLfvDRmlz+9UEMQGbjV+QKemgdoJNPJsK/+TO8a275WWxN5wUAVNIZl1ueZm
 DIKFTfVtkh6PaT97ea8+yqfYHNvmtHRzBJDoCogJG3e+Nx1iz8hGJHq1TPI6ynQjrciI
 YmO3yO5j384HJkJqm1oIF2Znpj0gCCmVPCIoVdxFSN9Day4dr+IaOn52s8KT9qxZjgZ8
 WLAP8tepP0wCKvBBXiClvZ9xhvL1TEkt6XU10JLNzhA/INWpQCQWrpk6m4WtJKZUJZey
 SESrfRA06lv5XxP4vQx+eeO+bW37yWwaVV6axhC2nxtmXv1BsjtwZUQRw7GpgCvculOl
 0c4A==
X-Gm-Message-State: AFqh2kojkODW/0KQFKPPwja/W6wpZaIQCHXP+bJi5QcVnkGv2qTpa03a
 sZ1s/2+TtLrPomOI8j5mQacawOeOxvGyiZE9Sm8oyCSrsb7vfyVgJAamWnfqOe/4QGHUQRWgN4u
 fK1dw5rLxE4q141Q=
X-Received: by 2002:adf:dc81:0:b0:2a1:328f:23aa with SMTP id
 r1-20020adfdc81000000b002a1328f23aamr25278414wrj.6.1674572587610; 
 Tue, 24 Jan 2023 07:03:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/jOZZNEY7RIrjFi14RFrGKUr8JfW5Mnq9RXNm4iHolDENzoTRYfQ+JrxTyUv32+zY0omTvQ==
X-Received: by 2002:adf:dc81:0:b0:2a1:328f:23aa with SMTP id
 r1-20020adfdc81000000b002a1328f23aamr25278387wrj.6.1674572587312; 
 Tue, 24 Jan 2023 07:03:07 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 x10-20020adfdcca000000b002bbddb89c71sm2044330wrm.67.2023.01.24.07.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 07:03:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org, Markus
 Armbruster <armbru@redhat.com>, Paul Moore <pmoore@redhat.com>,
 peter.maydell@linaro.org
Subject: Fortnightly KVM call for 2023-02-07
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 24 Jan 2023 16:03:05 +0100
Message-ID: <87o7qof00m.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Please, send any topic that you are interested in covering in the next
call in 2 weeks.

We have already topics:
- single qemu binary
  People on previous call (today) asked if Markus, Paolo and Peter could
  be there on next one to further discuss the topic.

- Huge Memory guests

  Will send a separate email with the questions that we want to discuss
  later during the week.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NWR0NWppODdqNXFyYzAwbzYza3RxN2dob3VfMjAyMjEwMThUMTMwMDAwWiBlZ2VkN2NraTA1bG11MXRuZ3ZrbDN0aGlkc0Bn&tmsrc=eged7cki05lmu1tngvkl3thids%40group.calendar.google.com&scp=ALL

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


