Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90A470209
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 14:45:20 +0100 (CET)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvgD8-0004pw-53
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 08:45:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvgB5-00033K-GW
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:43:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvgB2-0008VB-Bw
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639143786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADfDSTEujWhKiDZMRPGu9SylECkk8Pr18oSjDjkdGEQ=;
 b=gDK7r+yw6T9chU73UyjEOVPy309fpwAjzReMJTI+XA4KZ093O+InD5fnMR2n/dmkE5H6ji
 FxSUQXTEUL3PYe8qOHjqYXXp+eA1PeYEUe2P/ZYFifW7xq9uD5/99Ug1B/+WXMpC3wopbq
 B9XIFTZfP6qt3iGJ8UlAjPUFxtZa/sI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-ZdYXr7QMMNqfT6o7zdrySw-1; Fri, 10 Dec 2021 08:43:03 -0500
X-MC-Unique: ZdYXr7QMMNqfT6o7zdrySw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4FA981CCB9;
 Fri, 10 Dec 2021 13:43:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B456E5BE17;
 Fri, 10 Dec 2021 13:42:54 +0000 (UTC)
Date: Fri, 10 Dec 2021 14:42:53 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 0/3] hw/block/fdc: Fix CVE-2021-20196
Message-ID: <YbNZXXoqhB1nqEYE@redhat.com>
References: <20211124161536.631563-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124161536.631563-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.11.2021 um 17:15 hat Philippe Mathieu-Daudé geschrieben:
> Since v3:
> - Preliminary extract blk_create_empty_drive()
> - qtest checks qtest_check_clang_sanitizer() enabled
> - qtest uses null-co:// driver instead of file
> 
> Philippe Mathieu-Daudé (3):
>   hw/block/fdc: Extract blk_create_empty_drive()
>   hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
>   tests/qtest/fdc-test: Add a regression test for CVE-2021-20196

If I may ask a meta question: No doubt that this is a bug and it's good
that we fixed it, but why was it assigned a CVE?

Any guest can legitimately shut down and we don't consider that a denial
of service. This bug was essentially just another undocumented way for
the guest kernel to shut down, as unprivileged users in the guest can't
normally access the I/O ports of the floppy controller. I don't think we
generally consider guests killing themselves a security problem as long
as it requires kernel or root privileges in the guest.

Kevin


