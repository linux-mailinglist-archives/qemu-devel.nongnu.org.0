Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD712CDC9A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:43:43 +0100 (CET)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksdq-0003CS-KO
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksPi-00031x-WD
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:29:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksPe-0005F6-EC
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607016538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rz2H2g6BTxf3boA5vJnUsLsMTEHCCesGpvJKSvMoL4I=;
 b=XEub11m2RmuKNoiww4BXtveiNo2HME2cU/3uuyuHZOHOwgOOxRabFoqWlqD6zxPI2ThP/r
 H1L593u3FQUpXwpqGsdJXTDKshHlWqq+CJN6hhnb1ONP696IhHkwe2blhAMnzVZAsfBWik
 QghN9pdU3i6kdFZNTIcluov08hd2O58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-Cqj3tDCMM7OkXGOUwVnUqw-1; Thu, 03 Dec 2020 12:28:56 -0500
X-MC-Unique: Cqj3tDCMM7OkXGOUwVnUqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BB3E801F95;
 Thu,  3 Dec 2020 17:28:55 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C73D71A890;
 Thu,  3 Dec 2020 17:28:53 +0000 (UTC)
Date: Thu, 3 Dec 2020 18:28:51 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Gan Qixin <ganqixin@huawei.com>
Subject: Re: [PATCH v2 0/4] Use lock guard macros in block
Message-ID: <20201203172851.GB5409@merkur.fritz.box>
References: <20201203075055.127773-1-ganqixin@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201203075055.127773-1-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, armbru@redhat.com, kuhn.chenqun@huawei.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.12.2020 um 08:50 hat Gan Qixin geschrieben:
> v1->v2:
> 
> -Patch1:
>     Add Paolo Bonzini reviewed tag and delete the .c suffix in the commit
> message.
> 
> -Patch2:
>     Add Paolo Bonzini reviewed tag and delete the .c suffix in the commit
> message.
> 
> -Patch3:
>     Delete the .c suffix in the commit.
>     Changes suggested by Kevin Wolf: Fix wrong indentation format.
>     
> -Patch4:
>     Delete the .c suffix in the commit.
>     Changes suggested by Kevin Wolf: Replace QEMU_LOCK_GUARD with
> WITH_QEMU_LOCK_GUARD, and delete the redundant qemu_mutex_unlock().

Thanks, applied to the block branch.

Kevin


