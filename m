Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E46769D0DA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:46:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU8Lm-0003ul-7r; Mon, 20 Feb 2023 10:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU8Lj-0003uU-50
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:45:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU8Lg-0001xT-Fk
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676907903;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=f+JGwozkLPm2oPQYDN23s0pD5MFeLKFYk/fhH+WyIeQ=;
 b=OYKHUqcp1uJKZPicSlof+GC8W4wyjcqCfz6oBzXzd8DFhj6VNxxV2ewg4xYg/LGpu+h3Kl
 L8oS5zYinpijyLVIkaweatIBE3jwW6aKcY2ApMJNcHgIqKE2UjgYWCPLKhdH811Zd6Dii6
 5RROVl1QKzD4oLUOa5HmAjXbOxbN03I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-tZDMdVlJO0mFUVKT8EoRNA-1; Mon, 20 Feb 2023 10:45:02 -0500
X-MC-Unique: tZDMdVlJO0mFUVKT8EoRNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86BEE196EF8B;
 Mon, 20 Feb 2023 15:45:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C826B40B40D7;
 Mon, 20 Feb 2023 15:45:00 +0000 (UTC)
Date: Mon, 20 Feb 2023 15:44:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: matoro_mailinglist_qemu@matoro.tk
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] crypto: allow client/server cert chains
Message-ID: <Y/OVaeIyGCt++yFH@redhat.com>
References: <20230213180049.19093-1-matoro_mailinglist_qemu@matoro.tk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230213180049.19093-1-matoro_mailinglist_qemu@matoro.tk>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 13, 2023 at 01:00:49PM -0500, matoro_mailinglist_qemu--- via wrote:
> From: matoro <matoro@users.noreply.github.com>
> 
> The existing implementation assumes that client/server certificates are
> single individual certificates.  If using publicly-issued certificates,
> or internal CAs that use an intermediate issuer, this is unlikely to be
> the case, and they will instead be certificate chains.  While this can
> be worked around by moving the intermediate certificates to the CA
> certificate, which DOES currently support multiple certificates, this
> instead allows the issued certificate chains to be used as-is, without
> requiring the overhead of shuffling certificates around.
> 
> Corresponding libvirt change is available here:
> https://gitlab.com/libvirt/libvirt/-/merge_requests/222
> 
> Signed-off-by: matoro <matoro_mailinglist_qemu@matoro.tk>

I'm afraid that because the Signed-off-by is intended as a legal
statement that you're permitted to contribute this change, we
require it to use the person's legal recognised real name (both
forename + surname), not a psuedo-name, nor merely a partial
name. Could you either resend this submission, or just reply
to this mail giving a new Signed-off-by.

The email address can be of your choosing, but should generally
be matched to the git commit authorship


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


