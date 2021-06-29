Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD503B75D2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:46:13 +0200 (CEST)
Received: from localhost ([::1]:34088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFwC-00030h-Oq
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lyFuh-00024V-R0
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:44:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lyFug-0007jH-Dn
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624981477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rKoFAmyPd6EB5JIuu5yliDydk7dT6Y8exP3HdTsitIk=;
 b=XlI1gMfTAISXMdBGJHtm6oFg6CHFaX2A4vmQ9VjWI4mg+izHsLz/a7FR6T1WcMVY9nN4jo
 +rkAD7DvmwvU3ZB72nW3y3kXjjdwO0+rkzFdzxIK/rgWcxZmOPZIhCKj0SAoIN36xLnAUL
 tz+Qo4kzPzyUuykI8c9YkiaazsS3ec8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-k0RIUNNANvqnZwryaBQkrg-1; Tue, 29 Jun 2021 11:44:34 -0400
X-MC-Unique: k0RIUNNANvqnZwryaBQkrg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FC03100CCC5;
 Tue, 29 Jun 2021 15:44:33 +0000 (UTC)
Received: from redhat.com (ovpn-114-170.ams2.redhat.com [10.36.114.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53DF65D705;
 Tue, 29 Jun 2021 15:44:28 +0000 (UTC)
Date: Tue, 29 Jun 2021 17:44:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 0/2] introduce QEMU_AUTO_VFREE
Message-ID: <YNs/2lu2DBkUlqkw@redhat.com>
References: <20210628121133.193984-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210628121133.193984-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: eesposit@redhat.com, qemu-block@nongnu.org, eblake@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.06.2021 um 14:11 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> There is a good movement to use g_autofree macro, that helps to
> automatically call g_free on exit from code block.
> 
> We lack similar possibility for qemu_memalign() functions family. Let's
> add, it seems rather simple with help of "cleanup" attribute.
> 
> v2: rewrite 01 (as first version was just wrong)

Thanks, applied to the block branch.

Kevin


