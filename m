Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E28457E36A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 17:08:30 +0200 (CEST)
Received: from localhost ([::1]:42834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEuGT-0005lw-FR
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 11:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEuBu-0007ac-Km
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:03:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEuBt-0000jC-0a
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658502224;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+rTnOpsOD7HoEKmuJTqVlLUxyJHj0kQKSfRAx4t+j8=;
 b=IZvuj6SmB/sVg1NljXZqSQvBFcxmFFE7H6wMa5JGjjW+d0o9u1Npw5SjUNXTFLbERvPyGq
 qR3o0PTV1iYTvguKNlyvcV9DM21+tpZVgXpqGEGR26e4vXLglUELJXj34lZroqx68d3nVC
 VLGWQbUzk1YPvl2MkLqWR99FLKI9t+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-ThpU9SY3P5mXYJP8TlnAYg-1; Fri, 22 Jul 2022 11:03:43 -0400
X-MC-Unique: ThpU9SY3P5mXYJP8TlnAYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED5EE805F34
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 15:03:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 102F42026D64;
 Fri, 22 Jul 2022 15:03:41 +0000 (UTC)
Date: Fri, 22 Jul 2022 16:03:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 2/2] migration-test: Allow test to run without uffd
Message-ID: <Ytq8S/4KcYBt+rpg@redhat.com>
References: <20220722145654.81103-1-peterx@redhat.com>
 <20220722145654.81103-3-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722145654.81103-3-peterx@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 22, 2022 at 10:56:54AM -0400, Peter Xu wrote:
> We used to stop running all tests if uffd is not detected.  However
> logically that's only needed for postcopy not the rest of tests.
> 
> Keep running the rest when still possible.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/qtest/migration-test.c | 48 +++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 23 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


