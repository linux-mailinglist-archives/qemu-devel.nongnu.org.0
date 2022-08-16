Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00815955DE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 11:05:50 +0200 (CEST)
Received: from localhost ([::1]:38794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNsWC-0004CZ-Nl
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 05:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNsTX-0002IV-Mh
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNsTT-0000WL-95
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660640578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kxENZmfM+Ob32xEjaB822Ew8zA7lnjWOr2PHgxQ0NuM=;
 b=X2t6KrJHGq7VBAKf5CCrrrAk7XBXErDwR0TfGU41ERFHPbqQpyH5jUsif9zMW4jbwvlNwy
 T1zDYcZfPMP8KFJmNnstSPrfiJ7icDEx36XMf0MbmCu3VxzB6+KmRZtntXwYNQqcdavB/r
 4O+wTwn+3SRtagRlBg0kWxBsL8WuVNc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-k3CtZFS2PBqnOe4XpcFT2g-1; Tue, 16 Aug 2022 05:02:54 -0400
X-MC-Unique: k3CtZFS2PBqnOe4XpcFT2g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E7BF299E76E;
 Tue, 16 Aug 2022 09:02:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CBFD1121315;
 Tue, 16 Aug 2022 09:02:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E5F5118003A8; Tue, 16 Aug 2022 11:02:52 +0200 (CEST)
Date: Tue, 16 Aug 2022 11:02:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, mcascell@redhat.com, f4bug@amsat.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 for-7.1] hw/usb/hcd-xhci: Fix unbounded loop in
 xhci_ring_chain_length() (CVE-2020-14394)
Message-ID: <20220816090252.f7gbl4w67zodheki@sirius.home.kraxel.org>
References: <20220804131300.96368-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804131300.96368-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +
> +        /*
> +         * According to the xHCI spec, Transfer Ring segments should have
> +         * a maximum size of 64 kB (see chapter "6 Data Structures")
> +         */
> +    } while (length < TRB_LINK_LIMIT * 65536 / TRB_SIZE);

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


