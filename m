Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C02B388C35
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:59:00 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJul-00079Z-9I
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljJsy-0005xV-Ga
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljJsw-0007CI-7o
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621421824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rO2a+kTJerVxaPhZhXFLQSWYCdvD0oryYaS50PbbfBY=;
 b=LdAaROz5o9fUGCpRxhLfC8rkrPoh/qlb9ntbzFg9V0swm1ynWTIJ3mxnxBkp0oAGknIbMa
 7VSeUDcrlY16Ey80oG8fteM1lEofwJhW0aAQ2y1TCAI7aedDk/8TuZP3V6X1LOBaGjq+FD
 NC3ALHqM478NHnzGFrxaKzdZ9bAbfRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-_-6OyS9WM8WYWPABDVycCA-1; Wed, 19 May 2021 06:57:01 -0400
X-MC-Unique: _-6OyS9WM8WYWPABDVycCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06562192205A;
 Wed, 19 May 2021 10:56:59 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2483D1F5;
 Wed, 19 May 2021 10:56:58 +0000 (UTC)
Date: Wed, 19 May 2021 12:56:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] block/vpc: Support probing of fixed-size VHD images
Message-ID: <YKTu+SHgCDiPCinD@merkur.fritz.box>
References: <20210329072559.2668780-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210329072559.2668780-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.03.2021 um 09:25 hat Thomas Huth geschrieben:
> Fixed-size VHD images don't have a header, only a footer. To be able
> to still detect them right, support probing via the file name, too.
> 
> Without this change, images get detected as raw:
> 
> $ qemu-img create -f vpc -o subformat=fixed test.vhd 2G
> Formatting 'test.vhd', fmt=vpc size=2147483648 subformat=fixed
> $ qemu-img info test.vhd
> image: test.vhd
> file format: raw
> virtual size: 2 GiB (2147992064 bytes)
> disk size: 8 KiB
> 
> With this change:
> 
> $ qemu-img info test.vhd
> image: test.vhd
> file format: vpc
> virtual size: 2 GiB (2147991552 bytes)
> disk size: 8 KiB
> 
> Resolves: https://bugs.launchpad.net/qemu/+bug/1819182
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  I've marked the subject with RFC since I'm not quite sure whether this
>  is really a good idea... please let me know what you think about it...

There is precedence for using the file name, and it's convenient, so
when done carefully, I think this is okay.

The classic problem we have with probing is that a malicious guest on a
probed raw image could write a $format header into the image and be
probed as something else the next time. For headers, we prevent this in
the raw driver, for filename based probes we don't.

Of course, if you call your raw image .vhd and use probing, you're
almost explicitly asking for trouble.

What happens if you do it anyway and the guest writes a VHD footer? In
theory, we can know that it's a VHD_FIXED image, and fixed image footers
don't contain anything that would allow a guest more than destroying
itself. Other than carrying the additional metadata in the footer, they
behave the same as raw images anyway.

We have a bug in vpc_open(), though: It sets the local variable
disk_type correctly, but other functions use s->footer.type instead and
we never check that it actually matches the disk type we think we're
opening.

So I think we need to add this check (and we need to add it even if we
don't change probing), and then the change to vpc_probe() is probably
okay.

Kevin


