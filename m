Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462324C716E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:13:11 +0100 (CET)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOie6-0005pO-Bx
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:13:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOiZY-0006yM-2I
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:08:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOiZS-0003hz-4N
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646064499;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7vxn8tbOS2f7CD5I4aSiP90cKsMLgRBMB+DV2TX5ua4=;
 b=Y3Q3FaVV8Pvanppgmd+UsRpjZgWC4WXFTsUrLY2q7Ge9bPLRLba19zi1inHRMPNMVWyNIs
 8n4jUOdQBLxkNAOJ0LDu678n3LuecO4UfCrZ+W/6iIu9cTOXF/3O4lz+w5LyH6oGm4MCcO
 ypKcgpFwTosPtJQbpaxp3vne7jVcKk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-hQ7LENk3PW62OqS43-sZqw-1; Mon, 28 Feb 2022 11:08:11 -0500
X-MC-Unique: hQ7LENk3PW62OqS43-sZqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4110E180FD73;
 Mon, 28 Feb 2022 16:08:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C70C710589D4;
 Mon, 28 Feb 2022 16:08:08 +0000 (UTC)
Date: Mon, 28 Feb 2022 16:08:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Simeon Schaub <schaub@mit.edu>
Subject: Re: [PATCH] explicitly link libqemuutil against rt
Message-ID: <YhzzZVt0KhjS1xST@redhat.com>
References: <eddf5c19-5582-7d88-5232-2052f87583ae@mit.edu>
 <CAFEAcA-dStng7OmArapZTMXx=fF9cme3VftLAAd-nQgcv0ZgGA@mail.gmail.com>
 <YhzeYQ7akrGqAIW7@redhat.com>
 <949b0675-cbae-51dc-5a3b-d0215738279b@mit.edu>
MIME-Version: 1.0
In-Reply-To: <949b0675-cbae-51dc-5a3b-d0215738279b@mit.edu>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 10:13:15AM -0500, Simeon Schaub wrote:
> We generally target glibc 2.12 in the Julia ecosystem, since CentOS 6 is
> still quite common in the HPC community.

Oh wow, we dropped RHEL/CentOS 6 support a very long time ago for QEMU,
and also dropped RHEL-7 last year.

FWIW, our platform target policy is set out here:

   https://www.qemu.org/docs/master/about/build-platforms.html

Currently RHEL-8 is the oldest RHEL we support since RHEL-7
also dropped out under the rule

  "Support for the previous major version will be dropped
   2 years after the new major version is released"

I'm surprised you didn't have to patch lots of other aspects of QEMU,
since a system targetting glibc 2.12 would be likely to have a GCC
version that we explicitly block use of at build time, as well as
other outdated 3rd party libraries we check min versions of in
configure.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


