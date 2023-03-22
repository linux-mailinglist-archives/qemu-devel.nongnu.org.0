Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8020E6C4FD7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 17:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0rz-00007Q-VM; Wed, 22 Mar 2023 11:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf0rx-00006k-7J
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:59:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf0rv-0004Au-IB
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679500758;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8urxYxm/8wh7OklY93pcoLPs9aYpMp27A+2TqH7yyGI=;
 b=Qxg7bk9GyZJppDORZkaqSJzw6Z/gOz3JLab2n5e1qlNMLObuFkVB06Miu0sUxLvrhVg1VD
 WBDRP3Wdyj/8Lw99cecVrFHz5Ko9Rcoc6oh4ygK+r8yFSG21oZpdYq/UXgrWUOUVN/dmy1
 KtzpsSgkpat4kvaRPdI7xWwHapx2rtk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-1Zo-c97DN3qVeQMBdBo_5A-1; Wed, 22 Mar 2023 11:59:16 -0400
X-MC-Unique: 1Zo-c97DN3qVeQMBdBo_5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D953886462;
 Wed, 22 Mar 2023 15:59:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2442440C83AC;
 Wed, 22 Mar 2023 15:59:14 +0000 (UTC)
Date: Wed, 22 Mar 2023 15:59:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnichenko <andrew@daynix.com>
Cc: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>, jasowang@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, philmd@linaro.org, armbru@redhat.com,
 eblake@redhat.com, qemu-devel@nongnu.org, mprivozn@redhat.com,
 yan@daynix.com
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
Message-ID: <ZBslzwoXzpN//uHR@redhat.com>
References: <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
 <Y/5CQ5md6huqNsx4@redhat.com> <877cw1ipgg.fsf@toke.dk>
 <Y/5QHonZyB+7vzEN@redhat.com> <87ttz5h1mj.fsf@toke.dk>
 <Y/8bQjj8VZ/7qal1@redhat.com> <871qm8h69w.fsf@toke.dk>
 <Y/9prSBDTQoL7yn5@redhat.com> <87k000f637.fsf@toke.dk>
 <CABcq3pH3SRF1Y91jh=gEZ_xO=SuS0Mm-660nWChWSzY6zByTnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABcq3pH3SRF1Y91jh=gEZ_xO=SuS0Mm-660nWChWSzY6zByTnA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

On Wed, Mar 22, 2023 at 03:26:59PM +0200, Andrew Melnichenko wrote:
> Hi all,
> I've researched an issue a bit. The solution with passing eBPF blob
> and loading in the Libvirt looks promising.
> Overall, the possible solution looks like this:
>  * Libvirt checks virtio-net properties and understands that eBPF
> steering may be required.
>  * Libvirt requests eBPF blob through QMP.
>  * Libvirt loads blob for virtio-net and passes fds from eBPF to QEMU.
> 
> I think that it's a good idea to pass only eBPF blob without
> additional metainformation. Most metainfo that we need could be
> retrieved from eBPF blob, and the only question is to pass fds
> sequence to QEMU.
> I propose to pass them as they appear in the blob itself, like
> "virtio-net-pci,ebpf_rss_fds=<prog>,<map1>,<map2>,<map3>...".

Using ',' for separating FDs is a bad idea, because ',' is already
used for separating QemuOpts arguments.

With -netdev we use ':' for spearating FDs with vhostfds= and fds=
arguments, so I'd suggest following that practice.

> Also, I think it's a good idea to make a "general" QMP request for
> eBPF blobs. Something like "request_ebpf <arg>"(g.e "request_ebpf
> virtio-net-rss").

That's reasonable as a future proofing idea I think.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


