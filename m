Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8255FC5F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:46:37 +0200 (CEST)
Received: from localhost ([::1]:53784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6UHM-0004x7-8e
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6U9x-0005Us-M9
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6U9v-0002VI-7i
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656495534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZQ4gRYrbn2E9EawMHLI2FToE49/w4AcSIMr1NiAJHjU=;
 b=Q6neMMYsJ067PXKQgFDMEdF7RElfZxYj5VwGK+Po236whCv49AR9HxDh09KIDkzSRVbKS9
 Ds6okKQN69Q2QxxWBNVnxdQzy+M9vYJfJv333qZebFg6nw/ElWgg8ZV6OW2niWY+642B0A
 +PCk3JQzY1TmLhjFIN13GC3De2Q1UFY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-lGS3ssx6PqGiXdVHH_0Xzw-1; Wed, 29 Jun 2022 05:38:51 -0400
X-MC-Unique: lGS3ssx6PqGiXdVHH_0Xzw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA1CA3801153;
 Wed, 29 Jun 2022 09:38:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B57D940CF8EA;
 Wed, 29 Jun 2022 09:38:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA89B21E691E; Wed, 29 Jun 2022 11:38:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: kwolf@redhat.com,  stefanha@redhat.com,  armbru@redhat.com,
 qemu-block@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 3/4] libvduse: Pass positive value to strerror()
References: <20220627090203.87-1-xieyongji@bytedance.com>
 <20220627090203.87-4-xieyongji@bytedance.com>
Date: Wed, 29 Jun 2022 11:38:49 +0200
In-Reply-To: <20220627090203.87-4-xieyongji@bytedance.com> (Xie Yongji's
 message of "Mon, 27 Jun 2022 17:02:02 +0800")
Message-ID: <877d4zq05y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Xie Yongji <xieyongji@bytedance.com> writes:

> The value passed to strerror() should be positive.
> So let's fix it.
>
> Fixes: Coverity CID 1490226, 1490223
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


