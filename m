Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4B5219324
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 00:10:29 +0200 (CEST)
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtIGq-0002BO-5W
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 18:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jtHkE-0004Lz-9Y
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:36:46 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47076
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jtHkC-0003Hk-GK
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594244203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWfsvVA9dxBdQ4lr8dTDMwX5Q8C4l21TT73g5EASinU=;
 b=Yijxe+MEeHW2VGjnz8rOSHwNB+w9HqBvmgoZ7WCX0NvtOYfkEqgoHPX3aeWA5ErZwqBkKM
 KZQvc89E8UAK365lzdqnAorduto/JzGydm5BMJ23BNQy8p1xggxHrT9AGN/uXAICD2DdJr
 6EYKFW9wXFtNLwjusFY43DLGoOQUaVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-3xTCb6eTNKu0bOATGeyAbA-1; Wed, 08 Jul 2020 05:34:24 -0400
X-MC-Unique: 3xTCb6eTNKu0bOATGeyAbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C147218CB720;
 Wed,  8 Jul 2020 09:34:23 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-206.ams2.redhat.com [10.36.114.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18E5419C4F;
 Wed,  8 Jul 2020 09:34:15 +0000 (UTC)
Date: Wed, 8 Jul 2020 11:34:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: =?utf-8?B?6IuP5oCd5am3?= <susiting@bytedance.com>
Subject: Re: Qemu core dump when stop guest with virtio-blk(remote storage)
 and iothread
Message-ID: <20200708093330.GC4902@linux.fritz.box>
References: <26A897E7-7AAC-4A5B-B004-681602F298C0@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <26A897E7-7AAC-4A5B-B004-681602F298C0@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-block@nongnu.org, mst@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.07.2020 um 06:07 hat 苏思婷 geschrieben:
> Description of problem:
> 	Qemu core dump when stop guest with virtio-blk(remote storage) and iothread
> 
> Version-Release number pf selected component (if applicable):
> 	kernel version:4.19.36.bsk.9-amd64
> 	qemu-kvm version:QEMU emulator version 2.12.1

Version 2.12.1 is rather old. Can you retest with a current version? We
fixed a few iothread locking bugs since then.

Kevin


