Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EB055FC60
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:47:04 +0200 (CEST)
Received: from localhost ([::1]:55014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6UHn-0005mE-FA
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6U9i-0004m4-7c
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6U9g-0002SW-SB
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656495520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CzzNi652DNfw5a+680ehXcb/P0R9Ic0MIymP1WgZtOs=;
 b=F5csDpV6DG1bp1HeKFobziyx4hBUE2sVcBsqXakzOiP8tvitNIDi7Ii5oGr8Jrk1Z8P/kp
 XJEL98myqtSmF2Gab2P9bW8K0z9fusysgoU4STcCNY8xd379l3M7hFDS33eNcRXT6dWpZV
 dfe6s5ifSHhcI6WvflwLoQhHdRdbOxc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-Sbcjj63DMT6JEDhkR2weQg-1; Wed, 29 Jun 2022 05:38:35 -0400
X-MC-Unique: Sbcjj63DMT6JEDhkR2weQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 315B6800971;
 Wed, 29 Jun 2022 09:38:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C4741415108;
 Wed, 29 Jun 2022 09:38:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0222221E690D; Wed, 29 Jun 2022 11:38:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: kwolf@redhat.com,  stefanha@redhat.com,  armbru@redhat.com,
 qemu-block@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 2/4] libvduse: Replace strcpy() with strncpy()
References: <20220627090203.87-1-xieyongji@bytedance.com>
 <20220627090203.87-3-xieyongji@bytedance.com>
Date: Wed, 29 Jun 2022 11:38:33 +0200
In-Reply-To: <20220627090203.87-3-xieyongji@bytedance.com> (Xie Yongji's
 message of "Mon, 27 Jun 2022 17:02:01 +0800")
Message-ID: <87bkubq06e.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Xie Yongji <xieyongji@bytedance.com> writes:

> Coverity reported a string overflow issue since we copied
> "name" to "dev_config->name" without checking the length.
> This should be a false positive since we already checked
> the length of "name" in vduse_name_is_invalid(). But anyway,
> let's replace strcpy() with strncpy() to fix the coverity
> complaint.

Mention why you can't use something nicer from GLib?

> Fixes: Coverity CID 1490224
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


