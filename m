Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F496ADD20
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:20:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVMJ-0001eD-0R; Tue, 07 Mar 2023 06:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZVM7-0001X6-Pk
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:19:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZVM6-0003re-2p
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678187981;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6SrL1AbQ+Itkoa3RNRorU2SbEPprnv8O5UQmze/uqJw=;
 b=ATHUw7Y1sXNZd8eNJb4J+XRtGO2LKZnIQQn9Wn/C9ouD8TtxGuGrBU2XXBZe5WWDJHrSE9
 vIM8VDkqwwryOfS+q2uAtKtQJtmoAjwILCNP6Jrb1GTT5rTfFdghQtFer0JlvRN4gBSQDt
 bMNf0ZbG3JWgBPEBLEOW+L4mok/vlOI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-D_FYVZn0NN2ZBc4sV0DhZA-1; Tue, 07 Mar 2023 06:19:40 -0500
X-MC-Unique: D_FYVZn0NN2ZBc4sV0DhZA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1DE8101A521;
 Tue,  7 Mar 2023 11:19:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A171F492B00;
 Tue,  7 Mar 2023 11:19:31 +0000 (UTC)
Date: Tue, 7 Mar 2023 11:19:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/4] Add meson wrap fallback for slirp & dtc
Message-ID: <ZAcdwT5ahZbgb8hV@redhat.com>
References: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
 <ZAW7DcpRDcGF2VQx@redhat.com>
 <de1a7397-210e-1c63-e5bc-7b241e6a07e5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de1a7397-210e-1c63-e5bc-7b241e6a07e5@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

On Mon, Mar 06, 2023 at 12:36:25PM +0100, Paolo Bonzini wrote:
> On 3/6/23 11:06, Daniel P. Berrangé wrote:
> > > This offers developpers a simpler way to build QEMU with missing system
> > > dependencies (ex, libslirp in my case), but also simplify the fallback build
> > > definition of dtc/libfdt.
> > Do we actually need this facility though ? We've already determined
> > that every platform we need has libslirp now, and IIUC Thomas determined
> > recently that dtc is also available everywhere we need it to be.
> 
> libvfio-user can use Meson subprojects instead of submodules, too; and with
> Pip support probably coming in 8.1, we can remove the meson submodule.
> Then, the only mostly-mandatory submodule would be keycodemapdb;

On the topic of keycodemapdb, we designed it as a copylib thing because
it seemed like the simplest approach, but I have wondered whether we
should change tack and promote it as installable data package.

Basically the keycodemap-gen tool ino /usr/bin, and CSV data file into
/usr/share, and perhaps add a pkg-config file to enable apps to query
its existance / path to keycodemap-gen ?

The main downside is we would need to promise back compat of the CLI
tool. The upside is that consumers of it would eliminate a git submodule
and in theory be more up2date, though that depends on the distros actually
updating the datafile periodically.  I'm really on the fence about whether
its worth it vs carrying on as a submodule (or meson subproject if that's
nicer long term).

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


