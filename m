Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FDD442FF9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:13:46 +0100 (CET)
Received: from localhost ([::1]:34368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuXq-0003xj-2L
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhuCr-0008WP-Gr
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhuCo-0008RL-1V
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635861120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KPLj9WDpEf5PYc/gQSNpVP7P1ukpZ9ge4wb8+s8uoiw=;
 b=GyuBF+ax8Q7Ibuxg3seliessHIGt9CREaWhg9wVaMKVSE4+g/i8tbINueRm16wxsloicH5
 x1/RqphutZ57aUCL6UfpoDIjghbdO1f+5dYBGeMF44iM7pHxJyN58YykNz+78w9DlQvvmF
 IOA+ryXxAbgcDzy0P9bg7oKCI7ZTEjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-e0T5vydpNC-bDJtfGDEUMQ-1; Tue, 02 Nov 2021 09:51:57 -0400
X-MC-Unique: e0T5vydpNC-bDJtfGDEUMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A047802B61;
 Tue,  2 Nov 2021 13:51:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1590167840;
 Tue,  2 Nov 2021 13:51:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3CE90180092D; Tue,  2 Nov 2021 14:51:54 +0100 (CET)
Date: Tue, 2 Nov 2021 14:51:54 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [PATCH v2 1/2] virtio-gpu: splitting one extended mode guest fb
 into n-scanouts
Message-ID: <20211102135154.lfntfm7wdswa5kdf@sirius.home.kraxel.org>
References: <20210706235255.7575-1-dongwon.kim@intel.com>
 <20210726215950.26705-1-dongwon.kim@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210726215950.26705-1-dongwon.kim@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 02:59:49PM -0700, Dongwon Kim wrote:
> When guest is running Linux/X11 with extended multiple displays mode enabled,
> the guest shares one scanout resource each time containing whole surface
> rather than sharing individual display output separately. This extended frame
> is properly splited and rendered on the corresponding scanout surfaces but
> not in case of blob-resource (zero copy).
> 
> This code change lets the qemu split this one large surface data into multiple
> in case of blob-resource as well so that each sub frame then can be blitted
> properly to each scanout.

Fails windows test build too.

take care,
  Gerd


