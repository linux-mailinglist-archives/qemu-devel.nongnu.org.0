Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B953A49F96A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 13:31:35 +0100 (CET)
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDQPd-0003Kz-Le
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 07:31:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDPrf-0006Dv-9i
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:56:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDPrd-0004G1-O5
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m6juYpVGSq454dD7recww2oMQC6SXHU1irJlAMK3Tu4=;
 b=Jxtc2xHKtq/9wWaziDFrCfOm67XKo8Na8oKSH/c9SbEGteS0baVXljBMjYefXMqnfvUIQZ
 QXIjht6qYzQ4NC7oSNZxuU8VZnRMh8LqILtaV4aq2n9HmqwIn2qag4mOc2AtcC3GQXHeZL
 2bDqGwRqbrejYjySIQD24/mlT38A6ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-12kgxziONoiPOrJyBrU4Gw-1; Fri, 28 Jan 2022 06:56:22 -0500
X-MC-Unique: 12kgxziONoiPOrJyBrU4Gw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07EE41083F70;
 Fri, 28 Jan 2022 11:56:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A48407A5C2;
 Fri, 28 Jan 2022 11:56:20 +0000 (UTC)
Date: Fri, 28 Jan 2022 11:56:19 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: Block alignment of qcow2 compress driver
Message-ID: <20220128115619.GR1127@redhat.com>
References: <20220128110732.GA19514@redhat.com>
 <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, eblake@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


I hacked nbdcopy to ignore block alignment (the error actually comes
from libnbd refusing to send the unaligned request, not from
qemu-nbd), and indeed qemu-nbd accepts the unaligned request without
complaint.

Eric - maybe having some flag for nbdcopy to ignore unaligned requests
when we know the server doesn't care (qemu-nbd) would work?

Rich.

--- a/copy/nbd-ops.c
+++ b/copy/nbd-ops.c
@@ -59,6 +59,10 @@ open_one_nbd_handle (struct rw_nbd *rwn)
     exit (EXIT_FAILURE);
   }
 
+  uint32_t sm = nbd_get_strict_mode (nbd);
+  sm &= ~LIBNBD_STRICT_ALIGN;
+  nbd_set_strict_mode (nbd, sm);
+
   nbd_set_debug (nbd, verbose);
 
   if (extents && rwn->d == READING &&


-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


