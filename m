Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C040FAFD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 17:00:43 +0200 (CEST)
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFM1-00074s-DP
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 11:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mRF7a-0007U8-JB
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mRF7X-0002ZC-72
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6qoWqHfUhVqmp+QqqQNE/LFkJb3ZJZHcpEkl5FTUaqU=;
 b=FYp5qzfpwD2Mi0kK189NSVd1EzOlvygccElHmI3wDI/0YIHMcb7yIrpcH1al8LVq/ADd42
 fGix1nG1f5gOyFAAzUYG0BGvnJB8YuKpLo3HGHnZvcmSU8CLbR6fEnhgF/NeCaZiMlA/Eg
 DkrbrwRTWkKUh/gVkgZLSuGGT32aA6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-UNBsCsSDMsCI63qEasJzuw-1; Fri, 17 Sep 2021 10:45:41 -0400
X-MC-Unique: UNBsCsSDMsCI63qEasJzuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B4CD19057A4;
 Fri, 17 Sep 2021 14:45:40 +0000 (UTC)
Received: from redhat.com (ovpn-113-101.phx2.redhat.com [10.3.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A2319729;
 Fri, 17 Sep 2021 14:45:33 +0000 (UTC)
Date: Fri, 17 Sep 2021 09:45:31 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH RFC 3/5] qapi: Move compat policy from QObject to generic
 visitor
Message-ID: <20210917144531.tmo4umfds2yzkhtr@redhat.com>
References: <20210915192425.4104210-1-armbru@redhat.com>
 <20210915192425.4104210-4-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210915192425.4104210-4-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 09:24:23PM +0200, Markus Armbruster wrote:
> The next commit needs to access compat policy from the generic visitor
> core.  Move it there from qobject input and output visitor.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


