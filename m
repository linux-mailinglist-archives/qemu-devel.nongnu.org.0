Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D37366991
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 12:58:14 +0200 (CEST)
Received: from localhost ([::1]:59246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZAYf-0006BJ-BD
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 06:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lZAXv-0005m7-9q
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lZAXt-0006El-72
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619002643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LSTj57Z21HuHT1YJn0OhQqd1Ooc8D3wzP8JdvMdPwMk=;
 b=TwBQy7u72HL8JNFruO3xeoTJMF93uxdFDms9gnk7KEi/Y6xTx/VpPhczgSH8z1wqoT2wcz
 8bJSrSd89i6jDE2qTjlzwYY/i1F6c9MwuKlPx521s7Pv7zQw7S2s4SA5Nq20oKTrqjgrW2
 AJuhW+++0kz3v3pm6xMaoYtm4zD21Lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-XFf2L906NHek8rBjcc6H2g-1; Wed, 21 Apr 2021 06:57:21 -0400
X-MC-Unique: XFf2L906NHek8rBjcc6H2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A959343A0;
 Wed, 21 Apr 2021 10:57:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-178.ams2.redhat.com
 [10.36.112.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B21C25D9F2;
 Wed, 21 Apr 2021 10:57:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0D9B9180084D; Wed, 21 Apr 2021 12:57:19 +0200 (CEST)
Date: Wed, 21 Apr 2021 12:57:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v2 02/12] virtio-gpu: Add udmabuf helpers
Message-ID: <20210421105719.a2kv24p2kicxt73q@sirius.home.kraxel.org>
References: <20210420065347.2685768-1-vivek.kasireddy@intel.com>
 <20210420065347.2685768-3-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210420065347.2685768-3-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

> --- /dev/null
> +++ b/include/standard-headers/linux/udmabuf.h

> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh

Separate patch please.

thanks,
  Gerd


