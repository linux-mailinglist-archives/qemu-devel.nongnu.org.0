Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421BF6F67A3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:39:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUTd-0008CO-Sp; Thu, 04 May 2023 04:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puUTc-0008Bz-BF
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:38:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puUTa-0001aM-Pv
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683189490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a/mPJEfMKvz5HSdtX5WcSLWogwmXho3bvo86f/hth3w=;
 b=iwucYPIHvkwHbj1VM/nGMIWc86PvDhreCPXc+fgjoagtBH3RbWilfiNKa85bRTOYQjes9G
 M+tVIpOVtvlOMWvgNRKRRF3SjLVxxBWiaaB4GlE1eA//IXF4DCgGvRzcsT0c+YNGqhIbPN
 KeJbc6bpMybxIXSM6q6C0Qo4H2dl6FI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-41adlEhvOke0ChJJ2c-KeQ-1; Thu, 04 May 2023 04:38:06 -0400
X-MC-Unique: 41adlEhvOke0ChJJ2c-KeQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 495F3185A790;
 Thu,  4 May 2023 08:38:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10CCA40C2064;
 Thu,  4 May 2023 08:38:02 +0000 (UTC)
Date: Thu, 4 May 2023 10:38:01 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Peter Xu <peterx@redhat.com>,
 John Snow <jsnow@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PULL 11/18] migration: Create migrate_block_bitmap_mapping()
 function
Message-ID: <ZFNu6YsZ/7YbhlQb@redhat.com>
References: <20230427152234.25400-1-quintela@redhat.com>
 <20230427152234.25400-12-quintela@redhat.com>
 <ZFJw1lSMcQ5sqZBD@redhat.com> <87bkj1qqu5.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkj1qqu5.fsf@secure.mitica>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

Am 03.05.2023 um 19:15 hat Juan Quintela geschrieben:
> Kevin Wolf <kwolf@redhat.com> wrote:
> > Am 27.04.2023 um 17:22 hat Juan Quintela geschrieben:
> >> Notice that we changed the test of ->has_block_bitmap_mapping
> >> for the test that block_bitmap_mapping is not NULL.
> >> 
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> >> 
> >> ---
> >> 
> >> Make it return const (vladimir)
> >
> > (I don't think this part was actually meant for the commit message)
> 
> yeap.  My understandig has always been that this is the way to put
> commenst for the email.

Yes, but this only works if you then actually apply the patch from the
mail with "git am". Seems you directly cherry-picked your local commit
instead, so the comment below "---" has now become part of the git
history.

We were asked a while ago to always use "git am -m" to include the
Message-ID header from the email, so applying from the list is what we
should be doing anyway, even for our own patches.

Kevin


