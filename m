Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ED35E68F0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:58:41 +0200 (CEST)
Received: from localhost ([::1]:51914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPX7-00018o-1m
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obOm0-00008b-6M
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:10:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obOlx-0008OH-FA
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663862996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e9J9sCGWJEywZ9VixUwNZD06NBDOTqHvdgVaWezfiEc=;
 b=Mi1vhWCe2VwcnZxUmMl2j7O0ryz9pDbQvjteXCbFZu2cBjLP4IX5usHMQlp6f79I/PVHwB
 1KfFCOrUrYIxUh84emWZVgNOoD4ekDh47g59QwcGqRg6BnMseyTUb/Fgzk1Mb/eCac8oo5
 6h4FE6ydYY3161bSM/93sGjWQZmGoec=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-6K8hGzdhOtS-kch7wQYtQw-1; Thu, 22 Sep 2022 12:09:52 -0400
X-MC-Unique: 6K8hGzdhOtS-kch7wQYtQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08384882824;
 Thu, 22 Sep 2022 16:09:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CE8640C2066;
 Thu, 22 Sep 2022 16:09:50 +0000 (UTC)
Date: Thu, 22 Sep 2022 18:09:49 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, hreitz@redhat.com,
 integration@gluster.org,
 Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
Subject: Re: [PATCH] gluster: stop using .bdrv_needs_filename
Message-ID: <YyyIzT0QPVEtrZWJ@redhat.com>
References: <20220811164905.430834-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220811164905.430834-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 11.08.2022 um 18:49 hat Stefan Hajnoczi geschrieben:
> The gluster protocol driver used to parse URIs (filenames) but was
> extended with a richer JSON syntax in commit 6c7189bb29de
> ("block/gluster: add support for multiple gluster servers"). The gluster
> drivers that have JSON parsing set .bdrv_needs_filename to false.
> 
> The gluster+unix and gluster+rdma drivers still to require a filename
> even though the JSON parser is equipped to parse the same
> volume/path/sockaddr details as the URI parser. Let's allow JSON parsing
> for these drivers too.
> 
> Note that the gluster+rdma driver actually uses TCP because RDMA support
> is not available, so the JSON server.type field must be "inet".
> 
> Drop .bdrv_needs_filename since both the filename and the JSON parsers
> can handle gluster+unix and gluster+rdma. This change is in preparation
> for eventually removing .bdrv_needs_filename across the entire codebase.
> 
> Cc: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks, applied to the block branch.

Kevin


