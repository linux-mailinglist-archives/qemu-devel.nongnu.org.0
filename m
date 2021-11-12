Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C0344E47A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:18:09 +0100 (CET)
Received: from localhost ([::1]:45284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlTdI-0002U8-AM
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:18:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mlTbg-00010F-1f
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:16:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mlTbe-0008Bm-FZ
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:16:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636712185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uzHnkHRYYRcaZF4W1+JXTmuP2jd4Z0lDXU20vkZHpuM=;
 b=fPeRQpv7LcNfKILdLPWJ8tQ6f1p3YROThEPdntGJlqiIorxNAsVpu02LEA4DG4c2X+VO8v
 2vSq0GDjk1w0QJUejoKKiFW92igAb+ddKcxnBMsLXsGG0zii1f7W1YTmi3hswhTRi2Qzlw
 I1xwTRp9qBoftIlOYUBhnbnuraq2C1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-L7QsxKHwMZGDjoCtfFhbvA-1; Fri, 12 Nov 2021 05:16:22 -0500
X-MC-Unique: L7QsxKHwMZGDjoCtfFhbvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E61519067F1;
 Fri, 12 Nov 2021 10:16:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0E0E5DF5D;
 Fri, 12 Nov 2021 10:16:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C27F18000AA; Fri, 12 Nov 2021 11:16:10 +0100 (CET)
Date: Fri, 12 Nov 2021 11:16:10 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211112101610.q52xxnjtxuunz5ty@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
 <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
 <20211111031646-mutt-send-email-mst@kernel.org>
 <YYzj6Yizd+ESnoOE@redhat.com>
 <20211111120439-mutt-send-email-mst@kernel.org>
 <YY1cC/F2bmhj2MQa@redhat.com>
 <20211111131530-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211111131530-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> involved, but I think it's more a question of luck.  This until these
> specific patches, but they are only in v2 out of rfc status just today.

Never posted a formal non-rfc version because I had no pending changes.
Maybe I should have done that ...

v2 has no functional changes, it only resolves a conflict,
so effectively the same thing as the rfc series.

take care,
  Gerd


