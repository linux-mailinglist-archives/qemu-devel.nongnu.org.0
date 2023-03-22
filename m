Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908116C5267
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:24:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2By-0005Mh-7u; Wed, 22 Mar 2023 13:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf2Bu-0005MW-OQ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf2Bt-0008C5-2z
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679505839;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=c/EVp/f9nkekG2X5CydgMKaW+E2UccIMcSkI3UntYlI=;
 b=aLk5PQX6kenN7vylmt7OXBVs1aQ8jg/HilN+mX0OBl5AuvjL15kmNWfn96PNok6kC4fu1C
 xASwUrxe0efe44MjnTCPga7/e2VYQKHc3ojm+oeHyZ+7WmFmUcTEtRClQNs8V+NlSUOrfi
 EJs/nIoroOtAOXaA18lD7m1fNgqYa9Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-xCLYiBMnOJicqesW7X_g8A-1; Wed, 22 Mar 2023 13:23:56 -0400
X-MC-Unique: xCLYiBMnOJicqesW7X_g8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBC8088FBA1;
 Wed, 22 Mar 2023 17:23:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8284140E96A;
 Wed, 22 Mar 2023 17:23:54 +0000 (UTC)
Date: Wed, 22 Mar 2023 17:23:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
 sw@weilnetz.de, clg@kaod.org
Subject: Re: [PATCH v4 3/4] qga/vss-win32: fix warning for clang++-15
Message-ID: <ZBs5qMkfIk8+n3HJ@redhat.com>
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
 <20230221153006.20300-4-pierrick.bouvier@linaro.org>
 <cfde8400-2df9-73d7-3eb0-b3a81f838311@linaro.org>
 <CAPMcbCoat--fGMLXYUodctORdiws9=H1dL7GiL3q_jv3VKJLLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPMcbCoat--fGMLXYUodctORdiws9=H1dL7GiL3q_jv3VKJLLg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

On Wed, Mar 22, 2023 at 07:18:11PM +0200, Konstantin Kostiuk wrote:
> Hi Pierrick,
> 
> Thanks for reminding me. You are fully right to ping me. I really lost this
> commit.
> As QEMU is already at the code freeze stage, I don't want to push this into
> 8.0.

FWIW, this kind of fix is perfectly ok to merge during code freeze,
especially in rc0/rc1 timeframe. The initial freeze date merely cuts
off new feature additions, but bug fixes are still allowed. Once we
get to rc2 then we're more focused on bug fixes that target regressions
from the previous release.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


