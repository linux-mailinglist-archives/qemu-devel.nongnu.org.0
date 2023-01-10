Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1702E663D26
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:43:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFB4h-0000fk-RP; Tue, 10 Jan 2023 04:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFB4G-0000Yg-EO
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:37:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFB4B-00079M-4J
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673343430;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21yD9fSnQFd2+zKkbU39lIOyJn1w/oPz00IlLmBxYmY=;
 b=NLT0Cqv2e1dwtoi4pWJ6Buuq2+3CukxY2GcsEQCHEP0FxTA8kK0u1vAWqFH376a8/bPP5H
 eb4FYLZozyFja7ghGS30TvmFRaekIyvJZ5HeN3KD+czwIWVnYDNXI5aRe5FqdZFHRdSUJd
 Uc/QLR/LWQZu0AhNSOYBDLhDbVg+9vM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-BnCxYIVKNrCQ775LFclONg-1; Tue, 10 Jan 2023 04:37:04 -0500
X-MC-Unique: BnCxYIVKNrCQ775LFclONg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9CB6185A78B;
 Tue, 10 Jan 2023 09:37:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFD752166B26;
 Tue, 10 Jan 2023 09:37:02 +0000 (UTC)
Date: Tue, 10 Jan 2023 09:36:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Delevoryas <peter@pjd.dev>
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, philmd@linaro.org,
 wainersm@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/1] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <Y70xugPLvN0mZdlK@redhat.com>
References: <20230110080756.38271-1-peter@pjd.dev>
 <20230110080756.38271-2-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230110080756.38271-2-peter@pjd.dev>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Tue, Jan 10, 2023 at 12:07:56AM -0800, Peter Delevoryas wrote:
> On macOS, private $TMPDIR's are the default. These $TMPDIR's are
> generated from a user's unix UID and UUID [1], which can create a
> relatively long path:
> 
>     /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> 
> QEMU's avocado tests create a temporary directory prefixed by
> "avo_qemu_sock_", and create QMP sockets within _that_ as well.
> The QMP socket is unnecessarily long, because a temporary directory
> is created for every QEMUMachine object.
> 
>     /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock
> 
> The path limit for unix sockets on macOS is 104: [2]
> 
>     /*
>      * [XSI] Definitions for UNIX IPC domain.
>      */
>     struct  sockaddr_un {
>         unsigned char   sun_len;        /* sockaddr len including null */
>         sa_family_t     sun_family;     /* [XSI] AF_UNIX */
>         char            sun_path[104];  /* [XSI] path name (gag) */
>     };
> 
> This results in avocado tests failing on macOS because the QMP unix
> socket can't be created, because the path is too long:
> 
>     ERROR| Failed to establish connection: OSError: AF_UNIX path too long
> 
> This change resolves by reducing the size of the socket directory prefix
> and the suffix on the QMP and console socket names.
> 
> The result is paths like this:
> 
>     pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
>     $ tree qemu*
>     qemu_df4evjeq
>     qemu_jbxel3gy
>     qemu_ml9s_gg7
>     qemu_oc7h7f3u
>     qemu_oqb1yf97
>     ├── 10a004050.con
>     └── 10a004050.qmp
> 
> [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
> [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>  python/qemu/machine/machine.py         | 6 +++---
>  tests/avocado/avocado_qemu/__init__.py | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


