Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C6131F608
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:49:33 +0100 (CET)
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD1Tg-0003fm-Pu
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD1QN-0002Uj-FE
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD1QJ-0006YG-5C
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613724361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dLbFV8JW+4+i8XnusMK1V7QBorV8dsNkPJGp3IwvmUM=;
 b=N0i0l4OW8+QJnpP12UQ5Nlhvw9gPfNbjnMOvXqNcVk7/5NNRZmeEleM3435UcLjIv9WzbM
 tTiZD5bStsnMeEj9ybEOETDZCGN3BTbUGsPXEcawKElCyo/rvc+cy1r+ie38RgQ/kXuul6
 2CK16gbtZakAK76SeCxnK1eFcQ+sVb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-A_dJzR8wNKekpiisT_OuqQ-1; Fri, 19 Feb 2021 03:46:00 -0500
X-MC-Unique: A_dJzR8wNKekpiisT_OuqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2E71100CCC0;
 Fri, 19 Feb 2021 08:45:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 707625D9C6;
 Fri, 19 Feb 2021 08:45:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B993718003B0; Fri, 19 Feb 2021 09:45:45 +0100 (CET)
Date: Fri, 19 Feb 2021 09:45:45 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210219084545.stb4wjn6ggwent4g@sirius.home.kraxel.org>
References: <20210218022227.979741-1-pasic@linux.ibm.com>
 <6c0f5acf-9ebb-ba04-1389-c6690796a6ad@redhat.com>
 <20210218113438.3fe80078.pasic@linux.ibm.com>
 <20210218135618.06532573.cohuck@redhat.com>
 <20210218133820.cflf455nj44mxzja@sirius.home.kraxel.org>
 <20210219035206.730f145e.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210219035206.730f145e.pasic@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> I don't see way around target-specific modules. With the modifications
> suggested by Thomas and Connie, I was able to get the new module to
> compile regardless of the target,

Cool (should have checked all mails before sending replies ...).

> but that "fixes" s390x at the expense
> of breaking all the other targets. For example:
> ./qemu-system-x86_64 -device help
> Type 'virtio-gpu-ccw' is missing its parent 'virtio-ccw-device'
> Aborted

Hmm, this is a new failure variant.  In the PCI case (see other mail)
the module doesn't load in the first place due to missing symbols.

Maybe we need a type_register_mayfail() variant which doesn't abort in
case the parent isn't found (see also commit
501093207eb1ed4845e0a65ee1ce7db7b9676e0b).

HTH,
  Gerd


