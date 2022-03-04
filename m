Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF56E4CCBFF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 03:51:10 +0100 (CET)
Received: from localhost ([::1]:42122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPy29-0000oB-Fn
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 21:51:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPy0V-0008JT-5Z
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 21:49:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPy0T-0006UC-46
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 21:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646362163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+5vqmXnn4WJI02b+fYwXOwoU/N0vLWdmO9FEcfdRsrY=;
 b=gLtbQ4Rmc3pP5kFBfzay+NE6etCxrSqUlW0uMX94gBAlHke56onKwAZaCdaOC8zo6ICVx7
 Vax7D6Q0YPWvZC0VpY2WChBuEzCDf3/+S9AUjUJ6/kWYIbwe5oyOQU+WbzlU968viM7LRk
 oS20qMXcFaLAGZfvBqluv0BUkN+YPzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-UTepjUUqOvuDqfnz-AYElA-1; Thu, 03 Mar 2022 21:49:20 -0500
X-MC-Unique: UTepjUUqOvuDqfnz-AYElA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE96D1800D50;
 Fri,  4 Mar 2022 02:49:19 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDFDD305B8;
 Fri,  4 Mar 2022 02:49:18 +0000 (UTC)
Date: Thu, 3 Mar 2022 20:49:16 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 5/5] iotests: fortify compare_images() against crashes
Message-ID: <20220304024916.mcvswhwaz4ihekoi@redhat.com>
References: <20220303205902.4106779-1-jsnow@redhat.com>
 <20220303205902.4106779-6-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303205902.4106779-6-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 03:59:02PM -0500, John Snow wrote:
> Fority compare_images() to be more discerning about the status codes it

Fortify

> receives. If qemu_img() returns an exit code that implies it didn't
> actually perform the comparison, treat that as an exceptional
> circumstance and force the caller to be aware of the peril.
> 
> If a negative test is desired (Perhaps to test how qemu_img compare

perhaps

> behaves on malformed images, for instance), it is still possible to
> catch the exception in the test and deal with that circumstance
> manually.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


