Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0ED388F6C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:45:46 +0200 (CEST)
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMW9-0004oB-M1
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljMU5-0002Mj-65
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljMU3-0005Hz-Kh
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621431814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lwxgSgSg2Cc9YHb/IU9SJgpbmn4yVEfWGHHDUvS6VHY=;
 b=UdJvtkJmLrxl37+GWddRb+F5yVYr8gkRAmiGut5kZPImRwqFqcW1Tfc//DJwewGjsK9p4I
 2FwOuu3WdRGNI9o2OyKSEBfkGG3YyC69MTXAfJ3NAuP37QMASHxyg+opvWOvNZp4ny5jx7
 V/+nW3SFEZUaoyqlGVKfOQGXq7nD+Ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-UAs5Xk7NMDmiFCLFAKWwtQ-1; Wed, 19 May 2021 09:43:31 -0400
X-MC-Unique: UAs5Xk7NMDmiFCLFAKWwtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE84AC7402;
 Wed, 19 May 2021 13:43:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86F6E60CCC;
 Wed, 19 May 2021 13:43:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0319B113861E; Wed, 19 May 2021 15:43:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dmitry Voronetskiy <davoronetskiy@gmail.com>
Subject: Re: [PATCH] i386/kvm: The value passed to strerror should be positive
References: <20210519113528.12474-1-davoronetskiy@gmail.com>
Date: Wed, 19 May 2021 15:43:15 +0200
In-Reply-To: <20210519113528.12474-1-davoronetskiy@gmail.com> (Dmitry
 Voronetskiy's message of "Wed, 19 May 2021 14:35:28 +0300")
Message-ID: <87zgwqn8jw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Dmitry Voronetskiy <vda1999@yandex.ru>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dmitry Voronetskiy <davoronetskiy@gmail.com> writes:

> From: Dmitry Voronetskiy <vda1999@yandex.ru>
>
> Signed-off-by: Dmitry Voronetskiy <vda1999@yandex.ru>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


