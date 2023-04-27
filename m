Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CCC6F0A6F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 19:02:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps4z0-0000Fo-VP; Thu, 27 Apr 2023 13:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ps4yz-0000Fg-K9
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 13:00:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ps4yx-0003N3-VF
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 13:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682614834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t+MSJZd73ON+De4IE6IQt3001PzY72Fxgu0F3myqzsk=;
 b=f35uGyZ8OQ133b5KuIzwFo6arNi6bMPwGl17GRlqwpCZ+aIzlnsVp4vl7tuLTBWZz8v4q9
 ZgOFKowuCK4Vo8tk0PWpLzzHSj2hvtIprT7a6coIJVOqu9pR+5vJUvsFzqdjlnepTSaGa+
 Y2kIdLpbPGR+1wy975cmd1SiapVLuKk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-el3tHnrdMVGr6cfx5WtDOw-1; Thu, 27 Apr 2023 13:00:33 -0400
X-MC-Unique: el3tHnrdMVGr6cfx5WtDOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8B41857FB6;
 Thu, 27 Apr 2023 17:00:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF00740C6EC4;
 Thu, 27 Apr 2023 17:00:31 +0000 (UTC)
Date: Thu, 27 Apr 2023 19:00:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "open list:Block layer core" <qemu-block@nongnu.org>,
 "Hajnoczi, Stefan" <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH 03/20] block: bdrv/blk_co_unref() for calls in coroutine
 context
Message-ID: <ZEqqLnWqFi4WH1yq@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-4-kwolf@redhat.com>
 <CABgObfbOD+cpEdP0JE6Os1-vYvrp1zMvCFOST0YrBw3H0s9noQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfbOD+cpEdP0JE6Os1-vYvrp1zMvCFOST0YrBw3H0s9noQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 27.04.2023 um 16:30 hat Paolo Bonzini geschrieben:
> Il mar 25 apr 2023, 19:32 Kevin Wolf <kwolf@redhat.com> ha scritto:
> 
> > These functions must not be called in coroutine context, because they
> > need write access to the graph.
> >
> 
> With these patches applied vrc is still complaining about calls to
> bdrv_unref_child from qcow2_do_open and qcow2_do_close.

bdrv_unref_child() is addressed in one of the patches that I'll probably
send in the next batch, so it should be covered without additional work.

> Otherwise, the situation looks pretty good.

Thanks for checking!

By the way, and slightly unrelated, can vrc somehow help with finding
places that call coroutine wrappers without holding the AioContext lock?
(This results in an abort() when AIO_WAIT_WHILE() tries to unlock the
AioContext.) This is one of the classes of bugs we're seeing in 8.0.

Kevin


