Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182EC20CDC6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 12:06:52 +0200 (CEST)
Received: from localhost ([::1]:45986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpqgd-0004IW-36
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 06:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jpqdu-00022A-3A
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 06:04:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52511
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jpqds-0004wB-4x
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 06:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593425039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=216KWQbs07bf2q477jk3xqQME23P6wpcSGcCns3RG6o=;
 b=TGA/c38bwi2NTVnR9Bf7EwC2CJqtkzH009IbKkN6YQxsmh3WbAcI96J+8DUWSThyVTizls
 8avh5ViC+Kd/cN9cgDZMKpZWM3WUeZvz+TD5Wql5GhcxUOgRmUovNUd7BqE51ifFvAqJgA
 voDkS51CRYWdPsGmCGD7onW4b2xneGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-6eBCklCvP9Oa72APN3weVA-1; Mon, 29 Jun 2020 06:03:57 -0400
X-MC-Unique: 6eBCklCvP9Oa72APN3weVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DB30800FFD;
 Mon, 29 Jun 2020 10:03:55 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A6FE612A5;
 Mon, 29 Jun 2020 10:03:53 +0000 (UTC)
Date: Mon, 29 Jun 2020 11:03:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v3 29/30] gitlab: limit re-builds of the containers
Message-ID: <20200629100350.GF1298906@redhat.com>
References: <20200626181357.26211-1-alex.bennee@linaro.org>
 <20200626181357.26211-30-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200626181357.26211-30-alex.bennee@linaro.org>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:10:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: fam@euphon.net, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 26, 2020 at 07:13:56PM +0100, Alex Bennée wrote:
> Most of the time we are just rebuilding the same things. We can skip
> this although currently there is no mechanism for picking up new
> distro releases.
> 
> Rather than try to be too fine grained allow any change to trigger all
> the images being rebuilt.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/containers.yml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 20b2fb1de5d..f56aa44f711 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -19,6 +19,10 @@
>      - docker push "$TAG"
>    after_script:
>      - docker logout
> +  only:
> +    changes:
> +      - .gitlab-ci.d/containers.yml
> +      - tests/docker/*

How does this work for a person who forks the QEMU git repo and pushes
a change which doesn't touch the containers.yml file ?  AFAICT, all
their jobs will fail due to not having previously built any container
images in their brand new fork.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


