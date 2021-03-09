Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273B2332252
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:49:21 +0100 (CET)
Received: from localhost ([::1]:38174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYzQ-0001gD-5s
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJYtw-0005B8-3s
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:43:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJYtu-0004Mp-O2
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615283018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SSXbvHS9ZnpF+XIujL9sau25iOSsQioAc1WZ5UA2k7Q=;
 b=LjLLT9xTmaGsTQbigWt+stQ91GLYYSC2QKwnJmBkzkuES4HqtjIVNxj337NXUrjw9nL8Sl
 kSAd2W2xBZkE/EdWgXBK0x36ILN8gKBDChXgG4XwLjNVeFxtKOHot+luAD27kKsQDnbr4o
 dux0WlLYjdYKwRVnXAXtA4vyXCTqXkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-2gjwY5B3ObmLO80vBw3rBw-1; Tue, 09 Mar 2021 04:43:36 -0500
X-MC-Unique: 2gjwY5B3ObmLO80vBw3rBw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 316CB1007B1F;
 Tue,  9 Mar 2021 09:43:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-41.ams2.redhat.com
 [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1702788E0;
 Tue,  9 Mar 2021 09:43:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5A99F18000A2; Tue,  9 Mar 2021 10:43:33 +0100 (CET)
Date: Tue, 9 Mar 2021 10:43:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ben Leslie <benno@benno.id.au>
Subject: Re: What is the intended behaviour of usb_host_get_port for root hubs?
Message-ID: <20210309094333.smyv73qdqimacbof@sirius.home.kraxel.org>
References: <CABZ0LtCh37eXx0evxYNsZigFJgq-RY+wdFvA0SMDH4HgxpK-zw@mail.gmail.com>
 <20210309072359.6ep2bmu2zda6ojud@sirius.home.kraxel.org>
 <CABZ0LtCpm66=AO_XuXjMbYWPFWcR9Q+Uvu_UkLsn=C8_+SMF9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABZ0LtCpm66=AO_XuXjMbYWPFWcR9Q+Uvu_UkLsn=C8_+SMF9g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> Of course, reading the current code more carefully, usb_host_get_port
> is never actually called with a hub device (let alone a root hub),

Ah, the root hub itself.  I've assumed you mean a device plugged into
the root hub.  That explains the confusion.

Yes, passing through hubs is simply not supported, only individual
devices, so that should never happen.

> so I guess it is a valid assumption that libusb_get_port_numbers will
> always return at least 1 in the non-error path.

Correct.

take care,
  Gerd


