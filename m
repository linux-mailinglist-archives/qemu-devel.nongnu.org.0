Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7FC391085
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 08:18:28 +0200 (CEST)
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llms7-0000B5-SW
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 02:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1llmqS-0007Jo-5M
 for qemu-devel@nongnu.org; Wed, 26 May 2021 02:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1llmqO-0000tG-3M
 for qemu-devel@nongnu.org; Wed, 26 May 2021 02:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622009798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ek0E690rgOOcjvIxuIDA9v4XOS+Vk8ed3Q5x61yad7s=;
 b=T9PUPzyof0A+HVahUNy/NikDA2aM3ivRRrePOxaQZ3F0bBBFYZpp/kG7Dqg5H/uoZfys4w
 cpPZTnbykLXtvzaOsOTfkDIxGde3qpw8aHqF9x4PkUYFDWRhYsIwBkIVFRfspbS0EhAY3B
 nnlFYdF5KMTd5/Ko/xzwos1nZIjckEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-AoRLhvkENd6ipwPgWw41ig-1; Wed, 26 May 2021 02:16:36 -0400
X-MC-Unique: AoRLhvkENd6ipwPgWw41ig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FA83107ACE8;
 Wed, 26 May 2021 06:16:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F2575946E;
 Wed, 26 May 2021 06:16:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B9A4618000BB; Wed, 26 May 2021 08:16:33 +0200 (CEST)
Date: Wed, 26 May 2021 08:16:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v6 03/13] virtio-gpu: Add udmabuf helpers
Message-ID: <20210526061633.taqutqwaagszygq3@sirius.home.kraxel.org>
References: <20210524223103.922910-1-vivek.kasireddy@intel.com>
 <20210524223103.922910-4-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210524223103.922910-4-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +#ifdef CONFIG_LINUX

Seems wee need "#if defined(CONFIG_LINUX) && defined(F_GET_SEALS)" here
to cover old linux versions.  I see some build failures in gitlab CI due to
F_GET_SEALS not being defined (crypto-old-nettle for example).

> +#include <sys/fcntl.h>

gitlab ci (build-system-alpine):

/usr/include/sys/fcntl.h:1:2: error: #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h> [-Werror=cpp]
    1 | #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h>

Otherwise series looks good and survived basic testing.

take care,
  Gerd


