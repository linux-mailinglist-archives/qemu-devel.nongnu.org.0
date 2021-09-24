Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD93B417AE0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:20:49 +0200 (CEST)
Received: from localhost ([::1]:37112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpoW-00005T-Gw
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTpj5-0003Nl-VY
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:15:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTpj1-0002u3-FC
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632507305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nljJ0ZQ2zruDXzVtbJWNOQtfI/+cPxrbqe0Ln0+EkTk=;
 b=f/bn0vu1y13FdNZgqh2QBGZTPh1h84ztAL6xWlXYOjkrRewX91IZ9gnGGdVG3AnSYwx/dR
 Q6d7QM3lCtIP7p1FvYOUqFyrs3ocKZ0jyj4Aw7hVor5AVXA+tsJA2C/BclocFMCXPOJapb
 Ceah/p7Wv3lNxs6Rzreqtphue0vr3Xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-7m4s8WjCMpGswcJOKoMZBQ-1; Fri, 24 Sep 2021 14:15:01 -0400
X-MC-Unique: 7m4s8WjCMpGswcJOKoMZBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23C9B1084684;
 Fri, 24 Sep 2021 18:15:00 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D3B45C1CF;
 Fri, 24 Sep 2021 18:14:45 +0000 (UTC)
Date: Fri, 24 Sep 2021 13:14:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 01/11] qom: Reduce use of error_propagate()
Message-ID: <20210924181444.x7u7fcksusweim7h@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-2-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210924090427.9218-2-kwolf@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 11:04:17AM +0200, Kevin Wolf wrote:
> ERRP_GUARD() makes debugging easier by making sure that &error_abort
> still fails at the real origin of the error instead of
> error_propagate().
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qom/object.c            |  7 +++----
>  qom/object_interfaces.c | 17 ++++++-----------
>  2 files changed, 9 insertions(+), 15 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


