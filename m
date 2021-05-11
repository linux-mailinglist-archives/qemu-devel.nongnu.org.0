Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6800037ACB9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 19:10:17 +0200 (CEST)
Received: from localhost ([::1]:56144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVtg-0001CK-FY
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 13:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgVqf-0006Wo-UI
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgVqd-0002Et-Jo
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:07:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620752826;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Q1bdOlwx5w6qOb0+8lnjQXaCMA4l4608fe+L3Z66HhI=;
 b=X43KtCyMLrFdNsqQ2SPey/xhdoRMNDwT2uVoVIRxqCvjTnuQl9VIxkVaMr3SZme7bhl3S9
 8ey8CD4QOne/y6Wofcm+BG25ynOMKMdjotaKF6DJOlyrkA4R1BDi3uPCwU5Wi0niTwREVB
 nqqoxlZfMzT7nvyeKwJSocri2J4HRpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-k7HpVUejPk-s5n_RZQ-GGg-1; Tue, 11 May 2021 13:07:04 -0400
X-MC-Unique: k7HpVUejPk-s5n_RZQ-GGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89F57801817;
 Tue, 11 May 2021 17:07:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67B5610016FC;
 Tue, 11 May 2021 17:07:02 +0000 (UTC)
Date: Tue, 11 May 2021 18:06:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 30/33] migration: do not restart VM after successful
 snapshot-load
Message-ID: <YJq5s+VJC52n+RlV@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
 <20210511081350.419428-31-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511081350.419428-31-pbonzini@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 04:13:47AM -0400, Paolo Bonzini wrote:
> The HMP loadvm code is calling load_snapshot rather than
> qmp_snapshot_load, in order to bypass the job infrastructure.  The code
> around it is almost the same, with one difference: hmp_loadvm is
> restarting the VM if load_snapshot fails, qmp_snapshot_load is doing so
> if load_snapshot succeeds.
> 
> Fix the bug in QMP by moving the common code to load_snapshot.

This doesn't appear to have actually fixed the HMP regression.
Instead I think it is duplicated the HMP bug in the QMP code
too.

See the 068  iotest enhancement here that validates the expected
state on success:

https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03091.html


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


