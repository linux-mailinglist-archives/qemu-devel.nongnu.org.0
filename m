Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F10417B5A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:57:10 +0200 (CEST)
Received: from localhost ([::1]:44930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqNh-00010l-1t
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqKQ-0007vJ-W7
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:53:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqKN-0001ry-NK
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632509622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8zt0x+o2T+s8Pi3RyykjbIq8KBGPVMhPYwT7K1ifdU=;
 b=OiYMyNBI70z+RNVX/SJroiz4ItG8McCAX9YqMGJ/H1KUN9fAp/qWVQnZsgTl5siDTlefLR
 SXO/y0hg+Ri7RxjJH/9Zy29+vp3Suwhpeq0yWYNKtAkgVLRSSKNzjt+/DSDkAG1GT3xzgO
 PTUldt6ooGo4OH22EbuUTD+rR2IzA9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-ucsy99-aNWiGM8IzmtyV_A-1; Fri, 24 Sep 2021 14:53:41 -0400
X-MC-Unique: ucsy99-aNWiGM8IzmtyV_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99D0E88CE2D;
 Fri, 24 Sep 2021 18:53:40 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB7C610016FB;
 Fri, 24 Sep 2021 18:53:39 +0000 (UTC)
Date: Fri, 24 Sep 2021 13:53:37 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 08/11] qdev: Base object creation on QDict rather than
 QemuOpts
Message-ID: <20210924185337.zeiccr5h2qq6rlwp@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-9-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210924090427.9218-9-kwolf@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 11:04:24AM +0200, Kevin Wolf wrote:
> QDicts are both what QMP natively uses and what the keyval parser
> produces. Going through QemuOpts isn't useful for either one, so switch
> the main device creation function to QDicts. By sharing more code with
> the -object/object-add code path, we can even reduce the code size a
> bit.
> 
> This commit doesn't remove the detour through QemuOpts from any code
> path yet, but it allows the following commits to do so.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/hw/qdev-core.h |  8 ++---
>  hw/core/qdev.c         |  5 ++--
>  hw/net/virtio-net.c    |  4 +--
>  hw/vfio/pci.c          |  4 +--
>  softmmu/qdev-monitor.c | 67 +++++++++++++++++++-----------------------
>  5 files changed, 41 insertions(+), 47 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


