Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE45272311
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 13:49:42 +0200 (CEST)
Received: from localhost ([::1]:45474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKKKD-0006XP-Rd
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 07:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKK54-0007kb-O0
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 07:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKK53-0001GO-6M
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 07:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600688040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fBCzJTMBoKBhiyDlU3E6ss2Gw1crlhR4EShssMp+yAY=;
 b=DAq1X/WJ59TgNKk3DzUCcItofCP1R1L1dUMfXdh1ovBZoT1l7I6l9Q02GZ+8qCSozlZNrd
 IXlLLAFX9bSGous4feu+SJ+HnOR1fF9frvVW76vR3SuW3CAdp7dWbGpo+AgKWoijadj3UU
 M2+VKbLSWoHR1cP3ylJWX0IxfClzY2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-dlNOdA-UOXOXwEh2mMWldA-1; Mon, 21 Sep 2020 07:33:56 -0400
X-MC-Unique: dlNOdA-UOXOXwEh2mMWldA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 951131084D73;
 Mon, 21 Sep 2020 11:33:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C61A7368E;
 Mon, 21 Sep 2020 11:33:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E183D16E0A; Mon, 21 Sep 2020 13:33:47 +0200 (CEST)
Date: Mon, 21 Sep 2020 13:33:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/2] microvm: add pcie support
Message-ID: <20200921113347.mrdrxwskh5dzkosv@sirius.home.kraxel.org>
References: <20200918121911.5194-1-kraxel@redhat.com>
 <20200918121911.5194-3-kraxel@redhat.com>
 <20200918083533-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200918083533-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:44:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 18, 2020 at 08:36:14AM -0400, Michael S. Tsirkin wrote:
> On Fri, Sep 18, 2020 at 02:19:11PM +0200, Gerd Hoffmann wrote:
> > Uses the existing gpex device which is also used as pcie host bridge on
> > arm/aarch64.  For now only a 32bit mmio window and no ioport support.
> > 
> > It is disabled by default, use "-machine microvm,pcie=on" to enable.
> > ACPI support must be enabled too because the bus is declared in the
> > DSDT table.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Can we do the reverse and only support a 64 bit window?
> 32 bit resources are a pain, we support them on x86 for purposes
> of legacy guests ...

32bit pci bars too, right?
I suspect we can't that easily take away the 32bit window ...

take care,
  Gerd


