Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E74D247E2C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 08:03:12 +0200 (CEST)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7uiE-0002xz-Kn
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 02:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k7uhS-0002Xi-2U
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 02:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k7uhQ-0001z4-BY
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 02:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597730538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zp9RHzCIDmGcVaZ1pmDLCn4PNP3IuSm9t0a9hVlEewQ=;
 b=VnvIAF5bmBDf7Z+zRemKLzDAkv6/Rjd3DPGz6KnofDjBEqnLpUsLe6O9ysNJYc0BfJ5E+T
 Mk08NWSCl/Cg9OSCb/JNa0prJ5LNngBTOJ16K9l7bEM55ALM5+e/zTAL9NYr/dHK8ozRAx
 1i4OT8BltB6Mo2xZZiJuF8SFQTMl0ZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-OkKTlOCBPcW3FeTXr5kc2A-1; Tue, 18 Aug 2020 02:02:17 -0400
X-MC-Unique: OkKTlOCBPcW3FeTXr5kc2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 265F6801AAF;
 Tue, 18 Aug 2020 06:02:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA1931001901;
 Tue, 18 Aug 2020 06:02:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5285C1753B; Tue, 18 Aug 2020 08:02:14 +0200 (CEST)
Date: Tue, 18 Aug 2020 08:02:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH] hw: dev-wacom: Support wacom tablet emulation in linux
 qemu
Message-ID: <20200818060214.z2irps623upmbe2w@sirius.home.kraxel.org>
References: <20200812152149.260163-1-michael@amarulasolutions.com>
 <20200817064701.o3q3plnjhzyz3s42@sirius.home.kraxel.org>
 <CAOf5uwn94gZPZXChFDXWZ-1w0jOY_SxRqzF4Mk8hrtLq-r3yCg@mail.gmail.com>
 <20200817072841.lvbco4k7hzzimxsb@sirius.home.kraxel.org>
 <CAOf5uwn2KAajFo7oXYkZg5q3jbJyRC50hJafcoWCVzrdvkqXMw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOf5uwn2KAajFo7oXYkZg5q3jbJyRC50hJafcoWCVzrdvkqXMw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: none client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 02:02:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Aug 17, 2020 at 06:42:02PM +0200, Michael Nazzareno Trimarchi wrote:
> Hi Gerd
> 
> Have another small question. Do you know how force show cursor working
> in this case?

Which display and which vga do you use?

take care,
  Gerd


