Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3FB3BB87D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 09:58:25 +0200 (CEST)
Received: from localhost ([::1]:48386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JUm-0003sd-SC
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 03:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m0JSv-0001A2-UZ
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 03:56:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m0JSs-0006qB-Oe
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 03:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625471785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=og21TXKZ/fYYBfV7Ry8OoOFBeTDEFGfNDWli8IUl5lc=;
 b=g+txwBqR6gz4AcFSWYTOEVVDudOvliwftyZk5BmaXN5U7QnmtsppH0sMdBSXcoQSznZ+0K
 wEGpYTxmRJY5VZnK2enGpmoifO3I+tHnSH9ehMfzw+55XI75LctpRdb8Q3B0+5lqaeGSsd
 TSPeDnrbsP88iXcnaeZhtSKxj/H/bPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-PzWIqVkKMLu_OgThJ0XAdw-1; Mon, 05 Jul 2021 03:56:24 -0400
X-MC-Unique: PzWIqVkKMLu_OgThJ0XAdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F05E10C1ADC
 for <qemu-devel@nongnu.org>; Mon,  5 Jul 2021 07:56:23 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6F226268D;
 Mon,  5 Jul 2021 07:56:19 +0000 (UTC)
Date: Mon, 5 Jul 2021 09:56:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 00/53] acpi: refactor error prone build_header() and
 packed structures usage in ACPI tables
Message-ID: <20210705095618.69fed068@redhat.com>
In-Reply-To: <20210702104548-mutt-send-email-mst@kernel.org>
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210702104548-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Jul 2021 10:47:20 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Jun 25, 2021 at 05:17:24AM -0400, Igor Mammedov wrote:
> > Highlights:
> >   * drop pointer arithmetic in ACPI tables code
> >   * use endian agnostic API
> >   * simplifies review of tables. /in most cases just line by line comparision with spec/  
> 
> 
> A hue amount of work, thank you!
> To make it easier to merge, how about splitting it up a bit?
> E.g. I think first 10-11 patches make sense on their own, right?

I think you've meant 01-11 patches, and answer is yes, it's in-depended
of actual ACPI refactoring as was mentioned is cover letter, see below.

[...]
> > 
> > Series also includes optional qtest patches that add missing acpi
> > tests for tables that I'm touching to verify conversion changes.
> > That includes an alternative build time based impl. of
> > qtest_has_accel() API. So if we start bike-shedding this qtest_has_accel()
> > we can safely drop all tests included, till the time discussion settles
> > and some form of a qtest_has_accel() is merged, at which point I'd respin
> > depended tests.
[...]

it's ok to split tests into a separate series if that's what you prefer.


