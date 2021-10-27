Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C78E43CA87
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:24:18 +0200 (CEST)
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfiuf-0007ll-KH
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfiUF-0000qZ-1o
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:57:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfiUA-0008Hp-Ny
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635339413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wAbFQ1Cto7J75KXBfv84EPZWI+YaiIU4HqPcCBwmw9M=;
 b=I29Kdi8LAim4ZauVPfIgFJ80/IWQntFYN6yXu+bxsh0lgsn460Ig/o3Qz7p5jFqWyR9yO3
 8UhKU/MjHFDH6/jQfDc5jm4DziDybX4cY8aBEmMIK0+6V8V62HjxJvHEvL2oxlzYbCThfc
 S+YukJT9TkVVKM5ehKEVBvTaGCVq19U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-8d9Y3lTaMHSAyROiOtNL-g-1; Wed, 27 Oct 2021 08:56:50 -0400
X-MC-Unique: 8d9Y3lTaMHSAyROiOtNL-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 966C180F052;
 Wed, 27 Oct 2021 12:56:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29A1A19D9F;
 Wed, 27 Oct 2021 12:56:48 +0000 (UTC)
Date: Wed, 27 Oct 2021 14:56:46 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 6/8] iotests/300: avoid abnormal shutdown race condition
Message-ID: <YXlMjhokWt5R2cQf@redhat.com>
References: <20211026175612.4127598-1-jsnow@redhat.com>
 <20211026175612.4127598-7-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026175612.4127598-7-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.10.2021 um 19:56 hat John Snow geschrieben:
> Wait for the destination VM to close itself instead of racing to shut it
> down first, which produces different error log messages from AQMP
> depending on precisely when we tried to shut it down.
> 
> (For example: We may try to issue 'quit' immediately prior to the target
> VM closing its QMP socket, which will cause an ECONNRESET error to be
> logged. Waiting for the VM to exit itself avoids the race on shutdown
> behavior.)
> 
> Reported-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>

I think this will still expose the race I described in my comment on
patch 2.

Kevin


