Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F649B95B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:56:40 +0100 (CET)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCP7X-0000rV-9S
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:56:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCOxC-0007lo-23
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:46:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCOx1-0000KJ-8Q
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643129130;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=uIvna9YQgR1Kgio93JKJJObogMUbnRctGnTPlditYbI=;
 b=dfYBFbkWITD2tFD/5jgWOB9Sa1uoT8GcFooA5JZFcr+nBb0uEFdakhKmrhFye3XKspfhgE
 cnoXdwZMDltfCYurD506EcQQmVYx2ftY3ZiE68L8zB6g1NSDFiFgWFSNnpitZmpBpUEQzU
 oPYSvgZi15pj16P9gwXKr90RR4KvtVg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-x6Z32WpIMeOIz93SH3WT4g-1; Tue, 25 Jan 2022 11:45:28 -0500
X-MC-Unique: x6Z32WpIMeOIz93SH3WT4g-1
Received: by mail-wm1-f71.google.com with SMTP id
 s1-20020a1ca901000000b0034ece94dd8cso1415028wme.5
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 08:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:user-agent:reply-to:date
 :message-id:mime-version;
 bh=uIvna9YQgR1Kgio93JKJJObogMUbnRctGnTPlditYbI=;
 b=h7I89kGVswrn5MaYJFDDvdjiGEbs3lUL8cglQMVvUVVe8QqdD25xz85qDlYf4Vo8HI
 tdwQHslqdkgEjlH0SDT6Yk0REi0ybKmxj04ewHgUd41XFRftxn8qRqCL54w8/wGddDgZ
 VytuXoi+XuIwJxZFoiJU2BVgB4+/KQqAqEQPq46KWdYCj5eAsSeNPtFewswHNq5DRR8L
 y3spqGA8vnwxk/oL4fnDk3AV/IzhL6jB7QbFg1g3jlhM5EZga/mXsBKhL9FxfUuMMosl
 vT0z50W9sVyiHEOUEbKDuRk7LcZNRafy5PiT1qo8057pxfsUWB+GY0KkzYVGStNEy1VF
 eVWQ==
X-Gm-Message-State: AOAM532oT6w29quS5Ph4OKFq0Bs6LRDyeKtbkzxccL8hYpLN2y4ip5l5
 hYrVMyuZAWhbiqAitSuB4Y5AC2UFVN9yGQieC/uLGyrGWQZpltsvma/H2BJ02n50XyyY9AHwDrP
 Yt9SOrLyox4AHb2k=
X-Received: by 2002:adf:f94c:: with SMTP id q12mr18934741wrr.166.1643129126840; 
 Tue, 25 Jan 2022 08:45:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3ZVAv+oYBiIXH7L5YgJ4zJeY6nIJKIbd905+9lC15R8sNSVTzFZI0XQSjcTxYAbSl2HADaQ==
X-Received: by 2002:adf:f94c:: with SMTP id q12mr18934731wrr.166.1643129126672; 
 Tue, 25 Jan 2022 08:45:26 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id n13sm922945wms.8.2022.01.25.08.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 08:45:26 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Daniel Berrange <berrange@redhat.com>
Subject: KVM call for agenda for 2022-02-08
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 17:45:25 +0100
Message-ID: <875yq7rcgq.fsf@secure.mitica>
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

For last week call, we already have one topic.
- get QMP startup early

People asked for Paolo and Daniel to discuss this, so I added them to
this email.

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.


By popular demand, a google calendar public entry with it

  https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately.
If you want to be added to the invite, contact me privately.

Thanks, Juan.


