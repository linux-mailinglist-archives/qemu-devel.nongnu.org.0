Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E2D62439C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:50:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7wg-0002aH-P8; Thu, 10 Nov 2022 08:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot7wc-0002TW-FD
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:50:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot7wb-0000en-0T
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668088211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fG4Dlyrw4/wcELH+PXvkLGV//sUWVYopkLyPZ5J1yJA=;
 b=Cn3FoL0kwx598p2D+6NV2wRsq6ZDKbIw8sDvoqRyehbFY+Xeftrk+A3QexOjow1GWUdmN8
 6FjUEAxKEZ0aoAF3rlBGbKWSCjyzS3OZpsPUiJ26pZme0Mdh+gDDlWQWsnTfRTDedglLkh
 7Y1/iFBRI+0JWYKV3ZYW1xUwBfc/fgQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-rMRGJRtpOS-xc-JmbSXMxw-1; Thu, 10 Nov 2022 08:50:08 -0500
X-MC-Unique: rMRGJRtpOS-xc-JmbSXMxw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F701185A794;
 Thu, 10 Nov 2022 13:50:08 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92796492B0F;
 Thu, 10 Nov 2022 13:50:07 +0000 (UTC)
Date: Thu, 10 Nov 2022 14:50:06 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Subject: Re: intermittent failures in iotest 108
Message-ID: <Y20BjmHPuljWY4Q4@redhat.com>
References: <6e73cae7-7bef-76b9-4c5a-24f2364a4c11@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e73cae7-7bef-76b9-4c5a-24f2364a4c11@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 07.11.2022 um 14:36 hat Claudio Fontana geschrieben:
> Hello Kevin and all,
> 
> I seem to be getting intermittent failures with mainline iotest 108. Is this already known?
> 
> ../configure --enable-tcg --enable-kvm --enable-modules --enable-debug
> make -j
> make -j check

At least I haven't hit it yet. Running just the one test case in a loop
doesn't seem to trigger it either. Maybe it only fails under load?

Kevin


