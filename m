Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC6658233C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:36:02 +0200 (CEST)
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdST-0000Q3-FY
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGdMW-0004Cu-Px
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:30:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGdMP-0003Ts-G1
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658914184;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9hotjTpabDOTq6aMmT4deKJYsYoUcbg94Uv6QsAY/D4=;
 b=R8EIxEFUp8ki/6DpZYG75bN1ggzzTT8ZxiAyWzrTI5IqziNo+RpZ8C8EEs8P0RYbc6cB2s
 5VpU7xyyr4ezzlER0sP8lVQXdZQiFJg2YG1ZgmHPwP/1E9tdKzkLo9YzMrQFGAmwEa4/Qs
 ySqR9LBsYBzf2+q0b5887d30YTldwMg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-M6I3u9viMbuMQ88JCWptVQ-1; Wed, 27 Jul 2022 05:29:41 -0400
X-MC-Unique: M6I3u9viMbuMQ88JCWptVQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 946051C00AC1;
 Wed, 27 Jul 2022 09:29:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D9BC492C3B;
 Wed, 27 Jul 2022 09:29:38 +0000 (UTC)
Date: Wed, 27 Jul 2022 10:29:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 1/3] qga: Replace 'blacklist' command line and config
 file options by 'block-rpcs'
Message-ID: <YuEFfizE+lpguU7g@redhat.com>
References: <20220727092135.302915-1-thuth@redhat.com>
 <20220727092135.302915-2-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220727092135.302915-2-thuth@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Wed, Jul 27, 2022 at 11:21:33AM +0200, Thomas Huth wrote:
> Let's use a more appropriate wording for this command line and config
> file option. The old ones are still accepted for compatibility reasons,
> but marked as deprecated now so that it could be removed in a future
> version of QEMU.
> 
> This change is based on earlier patches from Philippe Mathieu-Daudé,
> with the idea for the new option name suggested by BALATON Zoltan.
> 
> And while we're at it, replace the "?" in the help text with "help"
> since that does not have the problem of conflicting with the wildcard
> character of the shells.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst  | 19 +++++++++++++++++++
>  docs/interop/qemu-ga.rst   |  8 ++++----
>  qga/main.c                 | 18 +++++++++++++-----
>  tests/unit/test-qga.c      |  2 +-
>  tests/data/test-qga-config |  2 +-
>  5 files changed, 38 insertions(+), 11 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


