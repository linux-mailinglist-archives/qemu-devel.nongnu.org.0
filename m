Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E956A3B861D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:14:05 +0200 (CEST)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybuf-00006A-1V
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lybt4-0006v7-0T
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lybsx-0008Pb-UE
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625065938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JAexThhFnM1We87F/mnTJ1NGA3dyKP1w1LXBzVLt7jA=;
 b=J6aQ8/S4UAmeASoJWVRo4kA8O98o3Hm/FNPkgDji7eB3BOvu572RbSmI/bCE8j9AOpk6yj
 XFORUsxI+jhgHMCvy5hXGu6bdeZsfetzbafFDaCTMCjm3gvXSXZXCmJtBRYTJSxJVGQbhd
 d2OeHKJM7VMTIyHG742Ge7azgah9mG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-7v9sp0ClMgOPJahh4TQuvQ-1; Wed, 30 Jun 2021 11:12:14 -0400
X-MC-Unique: 7v9sp0ClMgOPJahh4TQuvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FBD6802C80;
 Wed, 30 Jun 2021 15:12:13 +0000 (UTC)
Received: from localhost (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAE695DEFA;
 Wed, 30 Jun 2021 15:12:12 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v6 07/13] target/s390x: move sysemu-only code out to
 cpu-sysemu.c
In-Reply-To: <20210629141931.4489-8-acho@suse.com>
Organization: Red Hat GmbH
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-8-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 30 Jun 2021 17:12:11 +0200
Message-ID: <87im1vl73o.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cfontana@suse.com, Claudio Fontana <cfontana@suse.de>, acho@suse.com,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> move sysemu-only code out to cpu-sysemu.c
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  target/s390x/cpu-sysemu.c | 309 ++++++++++++++++++++++++++++++++++++++
>  target/s390x/cpu.c        | 285 ++---------------------------------
>  target/s390x/meson.build  |   1 +
>  target/s390x/trace-events |   2 +-
>  4 files changed, 320 insertions(+), 277 deletions(-)
>  create mode 100644 target/s390x/cpu-sysemu.c

Acked-by: Cornelia Huck <cohuck@redhat.com>


