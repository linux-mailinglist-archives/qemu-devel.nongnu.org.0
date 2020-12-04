Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BD72CEBA1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 11:05:30 +0100 (CET)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl7xx-0004Fm-16
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 05:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kl7wp-0003ob-BD
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 05:04:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kl7wn-0004UU-3v
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 05:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607076255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rOR0d+S5nkznNLT3Lw47O+qWhE9Qjmmo97Ia499Wo34=;
 b=gVMK8+VDlIlhUlRTXIQg1ckoVjvhAFr9J741HEaABW41nOgmWN7ksye8eXgvDilsNongwX
 3nAjZGLmimKFoAgJLRsXs6db5ZuaX4MxiUrpHIUVt6qbFKjWZQuESmBXAZdVkLBG0mUr7p
 1n4ymFYs3g4XVZwPN7AI357Ncgu2eX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-tuj5X1zPPCmfJ77n-9UTDA-1; Fri, 04 Dec 2020 05:04:11 -0500
X-MC-Unique: tuj5X1zPPCmfJ77n-9UTDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63CB9800D53;
 Fri,  4 Dec 2020 10:04:10 +0000 (UTC)
Received: from kaapi (ovpn-112-166.ams2.redhat.com [10.36.112.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 348275D6BA;
 Fri,  4 Dec 2020 10:03:56 +0000 (UTC)
Date: Fri, 4 Dec 2020 15:33:51 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH-for-5.2 1/2] net: Do not accept packets bigger then
 NET_BUFSIZE
In-Reply-To: <20201127154524.1902024-2-philmd@redhat.com>
Message-ID: <o5n678r1-r38n-3n85-64r5-83sr9qr9124q@erqung.pbz>
References: <20201127154524.1902024-1-philmd@redhat.com>
 <20201127154524.1902024-2-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 BOUNDARY="-1463810047-305027910-1607075561=:373362"
Content-ID: <qsr45n1n-6nor-ssrq-op9p-q6prr9735772@erqung.pbz>
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-305027910-1607075561=:373362
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <on49482s-1ros-or69-6o6-p3p24p492r4@erqung.pbz>

+-- On Fri, 27 Nov 2020, Philippe Mathieu-Daudé wrote --+
| Do not allow qemu_send_packet*() and qemu_net_queue_send()
| functions to accept packets bigger then NET_BUFSIZE.
| 
| We have to put a limit somewhere. NET_BUFSIZE is defined as:
|  /* Maximum GSO packet size (64k) plus plenty of room for
|   * the ethernet and virtio_net headers
|   */
|  #define NET_BUFSIZE (4096 + 65536)
| 
| +    if (size > NET_BUFSIZE) {
| +        return -1;
| +    }
| +

/usr/include/linux/if_ether.h
  #define ETH_MIN_MTU 68        /* Min IPv4 MTU per RFC791  */                      
  #define ETH_MAX_MTU 0xFFFFU   /* 65535, same as IP_MAX_MTU    */

  if (size < ETH_MIN_MTU || size > ETH_MAX_MTU) {
      return -1;
  }

Should there be similar check for minimum packet size?

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-305027910-1607075561=:373362--


