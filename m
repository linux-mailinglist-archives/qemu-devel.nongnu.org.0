Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FF474614
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:10:56 +0100 (CET)
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9SB-0005bG-SB
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:10:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx9I0-0008UO-Lz
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:00:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx9Hv-0001Fm-Cs
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639494018;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tCWEcOmcuomeCLBgo6dkmKuNq0aygbLxblh4epyKV3k=;
 b=PlYrJoX3pl8hIKWhkiPKB01yuchYBsotmEzbAXmDo40gDMm6QFiVZK54zk/DZCjQIqnLsY
 QNMhT7PTxK/AswWgD4yLV/vmhPzuhtt76kpszisxQN6lmR2qxajeEP5mYaGPGehGcThuuh
 5CNm8J75rs+E8reF6iR0hW0YQ8Dznv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-_GQ6Nzv8NxiVm3ovJZAZyA-1; Tue, 14 Dec 2021 10:00:15 -0500
X-MC-Unique: _GQ6Nzv8NxiVm3ovJZAZyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 704C510168C3;
 Tue, 14 Dec 2021 15:00:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D958F5ED5B;
 Tue, 14 Dec 2021 15:00:12 +0000 (UTC)
Date: Tue, 14 Dec 2021 15:00:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Henry Kleynhans <hkleynhans@fb.com>
Subject: Re: [PATCH] Relax X509 CA cert sanity checking
Message-ID: <YbixeezdNHXgRwWv@redhat.com>
References: <20211214113930.9205-1-henry.kleynhans@gmail.com>
 <YbiZNMxfHFRZFjFS@redhat.com>
 <BY5PR15MB35728B48C640AC319375D99AB8759@BY5PR15MB3572.namprd15.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR15MB35728B48C640AC319375D99AB8759@BY5PR15MB3572.namprd15.prod.outlook.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Henry Kleynhans <henry.kleynhans@gmail.com>,
 "henry.kleynhans@fb.com" <henry.kleynhans@fb.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 02:55:02PM +0000, Henry Kleynhans wrote:
> Hi Daniel,
> 
> I agree that this would allow QEMU startup with a broken
> TLS setup.  Maybe the better solution is to only validate
> the chain of trust.  Would a patch that does that be acceptable?

Yes, that would be fine. It was only ever intended to validate
the chain of trust needed for QEMU's usage. It simply never
occurred to me that someone who have extra redundant certs in
their bundle, so I didn't do anything special to handle that.

BTW, there's a decent amount of unit test coverage for this code
in tests/unit/test-crypto-tlscredsx509.c which could be fairly
easily extended to cover the scenarios of extra certs outside
the required chain of trust.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


