Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE6857FC13
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 11:12:18 +0200 (CEST)
Received: from localhost ([::1]:39118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFu8N-0003gY-Md
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 05:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFu3A-0008Kq-BB
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFu36-00081v-Bm
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658740006;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McgATXcrH5ftgxn/iBN9Cvl0bFo3P0VMm9B0q+jThK8=;
 b=GlVWnaqXVZX4DuKOw1OUO9MIQqs4ChY/ozA/52aYxRCcKansACbSTT6Mot7WhnbsTekGPQ
 RNtqdPLlBKpW8A3/dblkfJIpUUVQAQItaXIUbcnKVbpKupC4ievRn6XJcdVv5X0M9MLNMg
 njuVGTPnrdKi13R+w0QdHlVzpJoFzc4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-qZwLi6ocOGmN8qVZy-mG7w-1; Mon, 25 Jul 2022 05:06:43 -0400
X-MC-Unique: qZwLi6ocOGmN8qVZy-mG7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5E4380418F;
 Mon, 25 Jul 2022 09:06:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 684AC1121319;
 Mon, 25 Jul 2022 09:06:40 +0000 (UTC)
Date: Mon, 25 Jul 2022 10:06:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Delevoryas <peter@pjd.dev>
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, f4bug@amsat.org,
 wainersm@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/1] python/machine: Fix AF_UNIX path too long on macOS
Message-ID: <Yt5dHNDMMrzp/Vah@redhat.com>
References: <20220722182508.89761-1-peter@pjd.dev>
 <20220722182508.89761-2-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722182508.89761-2-peter@pjd.dev>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

On Fri, Jul 22, 2022 at 11:25:08AM -0700, Peter Delevoryas wrote:
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


