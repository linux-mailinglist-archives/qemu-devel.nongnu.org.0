Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A3F392BF4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 12:38:03 +0200 (CEST)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmDOs-00074r-OI
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 06:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lmDA3-0007HX-Pb
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:22:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lmD9z-0003um-NI
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:22:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622110957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L2J2Dzl5WaM5eVFPIXMuLy4PUeeS8yJpijCanIlWExg=;
 b=Upcue0CeM5BSkVJZ5ffrh32MNn8kEUvBCTAvS4uWv3eDaT0pkB7qkfljWEGKUdr3BwNSif
 K5H+ZZD8LhU9WGqwkkrBGqCQhF92gow6wIhNhD0viAn3v69Z2WjX8+IQoM6n49OrPHmq93
 C0a+GaPO9Jt8NULYZudAyQsKLBXGrWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-1wCWV3m5PIGmwdAJ5flQEA-1; Thu, 27 May 2021 06:22:35 -0400
X-MC-Unique: 1wCWV3m5PIGmwdAJ5flQEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EAF5801106;
 Thu, 27 May 2021 10:22:34 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-201.ams2.redhat.com [10.36.114.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10F32503E5;
 Thu, 27 May 2021 10:22:32 +0000 (UTC)
Date: Thu, 27 May 2021 12:22:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/2] vvfat: fix two crashes.
Message-ID: <YK9y5yH9XpxO9wsi@merkur.fritz.box>
References: <20210524101257.119377-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210524101257.119377-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: programmingkidx@gmail.com, berto@igalia.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.05.2021 um 12:12 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi!
> 
> As reported by Programmingkid, command 
> 
> qemu-system-ppc -usb -device usb-storage,drive=fat16 -drive file=fat:rw:fat-type=16:"<path of a host folder>",id=fat16,format=raw,if=none
> 
> crashes.
> 
> I tested it with qemu-system-x86_64 and it reproduces for me. I even
> kept "<path of a host folder>" as is :).
> 
> So, here are two fixes.

Thanks, applied to the block branch.

Kevin


