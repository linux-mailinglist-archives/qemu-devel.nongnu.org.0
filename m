Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6622C4B2A20
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:21:56 +0100 (CET)
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYgF-0007Jf-Hn
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nIYYw-0005pe-5B
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:14:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nIYYu-0006qY-94
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644596059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+uqAgVDALfdxvcAVkawiS/WFTY4B6+x6TmzPPvbf7g=;
 b=TmGfF1oqW3puGv4BvhKzgMZ2jgTpF9mu4RCMc7zEXOdjLMn+00R2jF2VnHGDF6c6SFYMBe
 8AHaoIQyVLfov7UlsiN7dV9sorHzUFlflCQXV+e+20dnLYNeFQGwr+03t8Yvhn1HVgUeEI
 Xms0dkBOwx2dEqNoHDTsha0aNjUzofM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-4dRPfqwrOpagkJhUDhLA-Q-1; Fri, 11 Feb 2022 11:14:14 -0500
X-MC-Unique: 4dRPfqwrOpagkJhUDhLA-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A012518B613A;
 Fri, 11 Feb 2022 16:14:13 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 996172BE74;
 Fri, 11 Feb 2022 16:14:12 +0000 (UTC)
Date: Fri, 11 Feb 2022 10:14:10 -0600
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/6] tests/qemu-iotests: Improve the check for GNU sed
Message-ID: <20220211161410.sbxfy7tf7patm25i@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-2-thuth@redhat.com>
 <8332fa43-9e77-34f3-c012-062342d62c92@redhat.com>
 <dd7f32dd-807c-d389-1f19-323141178bba@redhat.com>
 <1d5f544a-8362-6932-2f2a-6fd5f8e53978@redhat.com>
 <10264836-2ca6-c134-5eb9-018ef618edc1@redhat.com>
 <4cc4a814-3dba-11ab-3643-76ba974476c8@amsat.org>
 <80372081-ca28-7566-9fa7-6e6820a7b37f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <80372081-ca28-7566-9fa7-6e6820a7b37f@redhat.com>
User-Agent: NeoMutt/20211029-304-033d7f
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 03:52:19PM +0100, Thomas Huth wrote:
> > > The current code with $SED has been introduced almost three years
> > > ago already...
> > > 
> > > >   Can’t we just do `alias sed=gsed`?
> > > 
> > > Maybe ... but let's ask Philippe and Kevin first, who Signed-off
> > > commit bde36af1ab4f476 that introduced the current way with $SED:
> > > What's your opinion about this?
> > 
> > This commit was to have check-block working on the OpenBSD VM image.
> 
> Sure. The question was whether using an alias as suggested by Hanna would be
> nicer instead of using $SED ?

Scripting with aliases becomes a nightmare to debug, since it is
relatively uncommon.  In particular, in bash, you have to explicitly
opt in to using aliases (contrary to POSIX sh where aliases are
available to scripts at startup).  Using $SED everywhere may require
more hunting, but it is more obvious when reading a test that "oh
yeah, I might be using extensions that the default 'sed' can't
support" than a script that blindly uses 'sed' and depends on it
aliasing to a more-capable sed at a distance.

The other question is how many GNU sed features are we actually
depending on?  Which tests break if we have BSD sed or busybox sed?
Can we rewrite those sed scripts to avoid GNU extensions?  But
auditing for s/sed/$SED/ seems easier than auditing for which
non-portable sed extensions we depend on.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


