Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71689687875
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:11:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNVcL-0001S3-0z; Thu, 02 Feb 2023 04:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pNVcD-0001Re-8V
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:10:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pNVcA-0008Ey-Jx
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675329039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oInIPsGtgF1SdUE94O8ESsQmc4oBdOS27jmpiGR5HWs=;
 b=ChfB3YiSuiU9KcZfw6AUnqEyI4LhSHoQxR12b3ow5kPPtzG5qjMEKYSnwyGQ4v9VCau0y9
 yGBfo0hKZTUxFOSbFoXwk8mJ19J7wrN+1OYt6cZb1uvFAwIBv+FUuk5//74ncFn1Q0TXDT
 5wYBe2kAyQ/lGMIqI8J1S0n3uw0iOdk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-3wgXyEPcNUqvvKI41lMPKQ-1; Thu, 02 Feb 2023 04:10:33 -0500
X-MC-Unique: 3wgXyEPcNUqvvKI41lMPKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 742D0183B3C6;
 Thu,  2 Feb 2023 09:10:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 388DB112132C;
 Thu,  2 Feb 2023 09:10:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 987DB180061B; Thu,  2 Feb 2023 10:10:31 +0100 (CET)
Date: Thu, 2 Feb 2023 10:10:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kevin O'Connor <kevin@koconnor.net>, seabios <seabios@seabios.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 qemu-devel <qemu-devel@nongnu.org>, paul <paul@xen.org>
Subject: Re: [SeaBIOS] Re: [SeaBIOS PATCH] xen: require Xen info structure at
 0x1000 to detect Xen
Message-ID: <20230202091031.xmnao56wziptjak2@sirius.home.kraxel.org>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
 <Y9scWQ/ASMCrY/uM@morn>
 <fd3259a2765d4b33ccf7baea320ac798bab63159.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd3259a2765d4b33ccf7baea320ac798bab63159.camel@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> Thanks, Kevin.
> 
> I'd like to get the rest of the Xen platform support in to qemu 8.0 if
> possible. Which is currently scheduled for March.
> 
> Is there likely to be a SeaBIOS release before then which Gerd would
> pull into qemu anyway, or should I submit a submodule update to a
> snapshot of today's tree? That would just pull in this commit, and the
> one other fix that's in the SeaBIOS tree since 1.16.1?

Tagging 1.16.2 in time for the qemu 8.0 should not be a problem given
that we have only bugfixes in master.  Roughly around soft freeze is
probably a good time for that.

take care,
  Gerd


