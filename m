Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F7C45B7DA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:57:03 +0100 (CET)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpp1S-0003u9-4j
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:57:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpozc-00023i-FB
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpozZ-0004Mm-JO
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GH4Fx5KuMa+w8XFeNHOCGVTIH/7CvT4s8QziUhmelv4=;
 b=ZgM7Gh87VfrAMOq/6tLjyM+3YHTjw9xKYQjPblkZl5bwvRLH/XZ2ySW/84b5SinfTA0tKW
 TsNW8kD1iv69qe8Z7GuMbeX91gNSrgabnj0i44QxRivKgqpjghEUKT3+b0ds73Q4IylBLE
 0iywaqmvzQqCvJNyjWhK8s4XlFgvcgE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-uUHohwFeO7W80jkiCwaUGA-1; Wed, 24 Nov 2021 04:55:03 -0500
X-MC-Unique: uUHohwFeO7W80jkiCwaUGA-1
Received: by mail-wm1-f69.google.com with SMTP id
 p12-20020a05600c1d8c00b0033a22e48203so1118410wms.6
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0R4psW98FvAEZRjYAq64lNOZ+aSm5b9WccuG2LzKafs=;
 b=JOp6GvMzS/Q8tbTyHnj9k6G2Lj6ofkDTiRi9WNKkd3OL76VD+36kmmpGLHW878q5DD
 yn81mv5Axo337FSgJo5ywOmSdhE5u87/unyH54W4/CpzEmAfK3PN01/rVElrgRWdHY2H
 aJzdh7BtvdDiOeGgZq88FTA/bUwHERtJbISG6a2vwoYyZfvfk5JSruy/pHm2dyVJ8Q93
 T3r10q8cNxuJD05J0Ek/V8uEWowPMRNktmtJhi2JgP4b81e0GDIe68nMeWAs9hcZ1kmQ
 8CzL6rJQTPoQ/SVn84C1i2I0OlpqnFT9NdW2+yc9vjCfGgYwzg+udnAoAgUBvSK+drJt
 rTaA==
X-Gm-Message-State: AOAM531ULHN7bpPA4jdQ1FwUZoOV9Zh0eU6Zd9HTFV6EHzYr7Lbe7r7R
 f9Hg2kzUANecJsGqnikL37DbZnw0woNDLLoZbZoYFvKoATrlx0Sxpl6jHb0IOn6tHmlQC3ki1ot
 87j9MHcgBLSMG+iHt/a7qU7ylwVhu2K/3/4QdCR68DoP5S4zfsboZ4AoPDzGxlY3Wsy0=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr13592508wmg.145.1637747702037; 
 Wed, 24 Nov 2021 01:55:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgU17K6VWm3kA4G0hJvTRmmkWu+6XBBePn+HmmEyNbX+hktfO27XDkU+8P2cWBaRzwaSL8aQ==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr13592472wmg.145.1637747701741; 
 Wed, 24 Nov 2021 01:55:01 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id 21sm3824850wmj.18.2021.11.24.01.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:55:01 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/23] Migration: Transmit and detect zero pages in the
 multifd threads
Date: Wed, 24 Nov 2021 10:54:37 +0100
Message-Id: <20211124095500.42078-1-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi=0D
=0D
This is a rebase against last master.=0D
=0D
And the reason for resend is to configure properly git-publish and=0D
hope this time that git-publish send all the patches.=0D
=0D
Please, review.=0D
=0D
[v1]=0D
Since Friday version:=0D
- More cleanups on the code=0D
- Remove repeated calls to qemu_target_page_size()=0D
- Establish normal pages and zero pages=0D
- detect zero pages on the multifd threads=0D
- send zero pages through the multifd channels.=0D
- reviews by Richard addressed.=0D
=0D
It pases migration-test, so it should be perfect O:+)=0D
=0D
ToDo for next version:=0D
- check the version changes=0D
  I need that 6.2 is out to check for 7.0.=0D
  This code don't exist at all due to that reason.=0D
- Send measurements of the differences=0D
=0D
Please, review.=0D
=0D
[=0D
=0D
Friday version that just created a single writev instead of=0D
write+writev.=0D
=0D
]=0D
=0D
Right now, multifd does a write() for the header and a writev() for=0D
each group of pages.  Simplify it so we send the header as another=0D
member of the IOV.=0D
=0D
Once there, I got several simplifications:=0D
* is_zero_range() was used only once, just use its body.=0D
* same with is_zero_page().=0D
* Be consintent and use offset insed the ramblock everywhere.=0D
* Now that we have the offsets of the ramblock, we can drop the iov.=0D
* Now that nothing uses iov's except NOCOMP method, move the iovs=0D
  from pages to methods.=0D
* Now we can use iov's with a single field for zlib/zstd.=0D
* send_write() method is the same in all the implementaitons, so use=0D
  it directly.=0D
* Now, we can use a single writev() to write everything.=0D
=0D
ToDo: Move zero page detection to the multifd thrteads.=0D
=0D
With RAM in the Terabytes size, the detection of the zero page takes=0D
too much time on the main thread.=0D
=0D
Last patch on the series removes the detection of zero pages in the=0D
main thread for multifd.  In the next series post, I will add how to=0D
detect the zero pages and send them on multifd channels.=0D
=0D
Please review.=0D
=0D
Later, Juan.=0D
=0D
Juan Quintela (23):=0D
  multifd: Delete useless operation=0D
  migration: Never call twice qemu_target_page_size()=0D
  multifd: Rename used field to num=0D
  multifd: Add missing documention=0D
  multifd: The variable is only used inside the loop=0D
  multifd: remove used parameter from send_prepare() method=0D
  multifd: remove used parameter from send_recv_pages() method=0D
  multifd: Fill offset and block for reception=0D
  multifd: Make zstd compression method not use iovs=0D
  multifd: Make zlib compression method not use iovs=0D
  multifd: Move iov from pages to params=0D
  multifd: Make zlib use iov's=0D
  multifd: Make zstd use iov's=0D
  multifd: Remove send_write() method=0D
  multifd: Use a single writev on the send side=0D
  multifd: Unfold "used" variable by its value=0D
  multifd: Use normal pages array on the send side=0D
  multifd: Use normal pages array on the recv side=0D
  multifd: recv side only needs the RAMBlock host address=0D
  multifd: Rename pages_used to normal_pages=0D
  multifd: Support for zero pages transmission=0D
  multifd: Zero pages transmission=0D
  migration: Use multifd before we check for the zero page=0D
=0D
 migration/multifd.h      |  52 +++++++---=0D
 migration/migration.c    |   7 +-=0D
 migration/multifd-zlib.c |  71 +++++--------=0D
 migration/multifd-zstd.c |  70 +++++--------=0D
 migration/multifd.c      | 214 +++++++++++++++++++++++----------------=0D
 migration/ram.c          |  22 ++--=0D
 migration/savevm.c       |   5 +-=0D
 migration/trace-events   |   4 +-=0D
 8 files changed, 231 insertions(+), 214 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


