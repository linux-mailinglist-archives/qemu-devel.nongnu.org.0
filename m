Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA22D8065
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 22:06:45 +0100 (CET)
Received: from localhost ([::1]:34006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knpci-0000Ek-Ak
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 16:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knpWp-00078v-3k
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:00:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knpWn-0001cy-D4
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:00:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607720436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=/PxRnCBKesBbO0VAgUMqJ2xRHtMQLK+solftA7B8lYA=;
 b=P7oYVBgE8c/DYY6mzzhgVO2WUhxwqzdl/6tUI2Fessf+rwhXau5v0diBluxvS1KTsWALJN
 1NT5jY3QYkupKcpyW4efvexWgqcjM4zrcMl/mxbcuftqPUeaY46kuKZ0uT3FoMsMWEhzby
 DL8omhZjXAPOllzb1Z3PhqpLAXQHkGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-UZmn4oRwNGWaYU1eoY5A-w-1; Fri, 11 Dec 2020 16:00:33 -0500
X-MC-Unique: UZmn4oRwNGWaYU1eoY5A-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD8B10054FF;
 Fri, 11 Dec 2020 21:00:31 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41C8B10023B5;
 Fri, 11 Dec 2020 21:00:26 +0000 (UTC)
Date: Fri, 11 Dec 2020 16:00:25 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH v2 00/12] qom: Convert some properties to class properties
Message-ID: <20201211210025.GH1289986@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vikram Garhwal <fnu.vikram@xilinx.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Ondrej Ille <ondrej.ille@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 11, 2020 at 01:38:11PM -0500, Eduardo Habkost wrote:
> Class properties make QOM introspection simpler and easier, as it
> doesn't require an object to be instantiated.  This series
> converts a few existing object_property_add*() calls to register
> class properties instead.
> 
> Changes v1 -> v2:
> * Bug fix at "i386: Register feature bit properties as class properties"
> * Included patches that were originally submnitted as part of
>   "qom: Make all -object types use only class properties"
> * All other patches are unchanged from v1

I'm queueing this series, excluding patch 12/12.

-- 
Eduardo


