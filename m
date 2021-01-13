Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317372F4BE0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:01:14 +0100 (CET)
Received: from localhost ([::1]:50648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzflx-0003nD-6K
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzfjD-0002Ja-Td
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:58:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzfjC-0007uf-Fy
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610542701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/1j43UlmJszJZewIyMgF/qC97dAQtogCvpJalb1tkA=;
 b=GzNIeSFjdUndNDqjkSAx9mAVE4tN3cJb5kGKGSgLRYNvIdvwzUrGH1+kCBKkam7UZS5+X1
 WGPXsypaLV4KAVOzuJRQpSlH9x++/TasvMrrmhS6PNA2s4fYnKkuWGON5du2w0P+XoCuxx
 OJpOBeWBVRKtoURq2dSWXoBypAU2wl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-lvqxsMTCNsGVvueyPlN7Cw-1; Wed, 13 Jan 2021 07:58:20 -0500
X-MC-Unique: lvqxsMTCNsGVvueyPlN7Cw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7067CE647
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 12:58:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA0985D9DC;
 Wed, 13 Jan 2021 12:58:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7222D11386A7; Wed, 13 Jan 2021 13:58:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 3/7] migration: Refactor migrate_cap_add
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-4-eblake@redhat.com>
Date: Wed, 13 Jan 2021 13:58:17 +0100
In-Reply-To: <20201223221102.390740-4-eblake@redhat.com> (Eric Blake's message
 of "Wed, 23 Dec 2020 16:10:58 -0600")
Message-ID: <87im810z9y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> Instead of taking a list parameter and returning a new head at a
> distance, just return the new item for the caller to insert into a
> list via QAPI_LIST_PREPEND.  Update some variable names to avoid long
> lines, and drop a useless comment.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Already in master as commit eaedde5255.


