Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909883CFAF5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:44:46 +0200 (CEST)
Received: from localhost ([::1]:52632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5q3B-0003hT-HT
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5q1D-0001I7-Hc
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5q1B-0004ti-VZ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626788561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbgQ4koNjwN8N2l8r6v0wHs4DYn7ekng7boW6EzueSE=;
 b=fiuI2G2uDiGohDgsPiuk9FH3hbXJKSooN+ULtV0pyLLSb9uakCKvnd5Bxk8ru0FYznkDfo
 wmaN7Q5bwG2zwiydgPTQpjFt5GK/tS0F4TbgRXGCXy8qEtQphKTEwpqYMlEy3+gh41ZprG
 EYoLiCH7U5RVmijlEqNHt0UBemWFQHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-MvSM5aznOuKqMkqRpC6THA-1; Tue, 20 Jul 2021 09:42:38 -0400
X-MC-Unique: MvSM5aznOuKqMkqRpC6THA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33B5E800C78;
 Tue, 20 Jul 2021 13:42:37 +0000 (UTC)
Received: from redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B79575D6A1;
 Tue, 20 Jul 2021 13:42:21 +0000 (UTC)
Date: Tue, 20 Jul 2021 08:42:20 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 01/16] error: Use error_fatal to simplify obvious fatal
 errors (again)
Message-ID: <20210720134220.vokqvfa6pjcdsj2l@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-2-armbru@redhat.com>
User-Agent: NeoMutt/20210205-614-b535a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cornelia Huck <cornelia.huck@de.ibm.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 02:53:53PM +0200, Markus Armbruster wrote:
> We did this with scripts/coccinelle/use-error_fatal.cocci before, in
> commit 50beeb68094 and 007b06578ab.  This commit cleans up rarer
> variations that don't seem worth matching with Coccinelle.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

I agree with your assessment that this is not bug-fix material needed
in 6.1.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


