Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297C56F7121
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:37:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puco4-0006mz-Uh; Thu, 04 May 2023 13:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puaiC-0000al-KR
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puaiA-0002lH-UM
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683213457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7xef6Yq9nh6UN98Ef7pgFajhkIlC2iLPuR5R77mrCoo=;
 b=XHJaUWvOCW0izpwetEzW670NFtVMYDNJmVDZjOnKzK/24H1ZL7pc3DdLKvCZ6SHcuKE/BO
 J7NMwBXK9K653mDDolWUsvNzG9nIYOwd1ginWe9eacy5eMsxqTuOKsldYNbfRRQwKS3Mc4
 8MDx5vLWWfgWy9lB1sY8BpLWJj8TLLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-XUBdn49jPm6XBu0hZaAF-Q-1; Thu, 04 May 2023 11:17:36 -0400
X-MC-Unique: XUBdn49jPm6XBu0hZaAF-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE647A0F387;
 Thu,  4 May 2023 15:17:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC88D40C2064;
 Thu,  4 May 2023 15:17:34 +0000 (UTC)
Date: Thu, 4 May 2023 17:17:33 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 12/20] mirror: Require GRAPH_RDLOCK for accessing a
 node's parent list
Message-ID: <ZFPMjfTz478ZuJGE@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
 <20230504115750.54437-13-kwolf@redhat.com>
 <vvrehglysx4vfeuusciyfamfshz54u3dqhqb3cnenjzalysiqi@ekx46ms77hv7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vvrehglysx4vfeuusciyfamfshz54u3dqhqb3cnenjzalysiqi@ekx46ms77hv7>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 04.05.2023 um 15:17 hat Eric Blake geschrieben:
> On Thu, May 04, 2023 at 01:57:42PM +0200, Kevin Wolf wrote:
> > This adds GRAPH_RDLOCK annotations to declare that functions accessing
> > the parent list of a node need to hold a reader lock for the graph. As
> > it happens, they already do.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  block/mirror.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

Oops, sorry for failing to pick up your R-b for this patch in v1 (seems
I only changed the subject line and forgot about the reviews), and
thanks for renewing it. :-)

Kevin


