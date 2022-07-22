Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A057E35D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 17:04:33 +0200 (CEST)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEuCe-0008Rq-3t
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 11:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEu9g-0004pl-7D
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:01:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEu9d-0008RE-NW
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658502084;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4UlmYg5VpFqIDi+LGql/J8TMOZrAqGxSsEG9zdT6WA=;
 b=MNrUbbIeLLnqVMWKRAnrDTL5LcgDEML2E73KsZ5wZVUoOBlz35ZnrD1eU/oCpABcuMAI+r
 mxo51pPwNILwWdgdb/SbUDPt73BIloJ5KckZPPXofVPacPgpqH6WCBgl9nf90rawmQ4EEZ
 VBdIdkSYP/3W2DU6iGM99prv64wsr4Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-G70PfSy5MvKNkUVpS6B94Q-1; Fri, 22 Jul 2022 11:01:23 -0400
X-MC-Unique: G70PfSy5MvKNkUVpS6B94Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08275811E87
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 15:01:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F7A02166B26;
 Fri, 22 Jul 2022 15:01:21 +0000 (UTC)
Date: Fri, 22 Jul 2022 16:01:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 1/2] migration-test: Use migrate_ensure_converge() for
 auto-converge
Message-ID: <Ytq7v+ATRJK5Ye9F@redhat.com>
References: <20220722145654.81103-1-peterx@redhat.com>
 <20220722145654.81103-2-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722145654.81103-2-peterx@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Jul 22, 2022 at 10:56:53AM -0400, Peter Xu wrote:
> Thomas reported that auto-converge test will timeout on MacOS CI gatings.
> Use the migrate_ensure_converge() helper too in the auto-converge as when
> Daniel reworked the other test cases.
> 
> Since both max_bandwidth / downtime_limit will not be used for converge
> calculations, make it simple by removing the remaining check, then we can
> completely remove both variables altogether, since migrate_ensure_converge
> is used the remaining check won't make much sense anyway.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/qtest/migration-test.c | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


