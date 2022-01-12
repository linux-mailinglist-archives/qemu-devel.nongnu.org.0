Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F9748C268
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:38:31 +0100 (CET)
Received: from localhost ([::1]:36690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7b1S-0007BE-J0
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:38:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7az7-0005fC-LZ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:36:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7az2-000497-R9
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641983758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KoaLOU5XRLtPFUFMFaUB9E1hkx4OGmPt+n6pRaebRVQ=;
 b=dJGDLWQjuSuu7N8An1/ki+LXqAyOgRz8aJlLvfhA3ZbUkNGrcaHONE5hjVgUUP/UBLmtUM
 8dcAm0qsAMl7k2+OqBTQFnNyIx2q+TrJOepTZ5KwIx+fSJgtfKRpwLHGARt/lt6Jzaht8i
 jUGFA0jOw+DlF/U034JGXPrxo1uzeY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-HqQTorBzMBCWbySPRCesfg-1; Wed, 12 Jan 2022 05:35:57 -0500
X-MC-Unique: HqQTorBzMBCWbySPRCesfg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A46A1083F60;
 Wed, 12 Jan 2022 10:35:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 186E9752D8;
 Wed, 12 Jan 2022 10:35:54 +0000 (UTC)
Date: Wed, 12 Jan 2022 11:35:53 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] iotests/308: Fix for CAP_DAC_OVERRIDE
Message-ID: <Yd6vCaBj77NAw2ZX@redhat.com>
References: <20220103120014.13061-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220103120014.13061-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.01.2022 um 13:00 hat Hanna Reitz geschrieben:
> With CAP_DAC_OVERRIDE (which e.g. root generally has), permission checks
> will be bypassed when opening files.
> 
> 308 in one instance tries to open a read-only file (FUSE export) with
> qemu-io as read/write, and expects this to fail.  However, when running
> it as root, opening will succeed (thanks to CAP_DAC_OVERRIDE) and only
> the actual write operation will fail.
> 
> Note this as "Case not run", but have the test pass in either case.
> 
> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Fixes: 2c7dd057aa7bd7a875e9b1a53975c220d6380bc4
>        ("export/fuse: Pass default_permissions for mount")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Thanks, applied to the block branch.

Kevin


