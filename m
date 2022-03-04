Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8A94CD5B3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:58:15 +0100 (CET)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8Ri-0004LG-QW
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:58:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ87F-00067t-Dm
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ87C-0000CW-7x
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1h50/fHVkmdbmF+WjM8R5TsLrLHjhpRq0Bo3aRxv6Qw=;
 b=Qxh2K2XxZ0WeLKgkVVJd4omcCzzcLO6MEQc6ZugfalP5M6Vb7Xh+PCwAtRGfAuly7JtrAA
 x9oLgKH85lGJ6ChhEK3l83BFxaTsiKxZGKX+8RSakeLq1+K81q67GEiENrRRYS8a8TvZA/
 xXzUln3tNWUIYaSAnOL6LIC5v3sfkZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-p96oijndPnSLaz5yrBHcCw-1; Fri, 04 Mar 2022 08:36:58 -0500
X-MC-Unique: p96oijndPnSLaz5yrBHcCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 296911854E21;
 Fri,  4 Mar 2022 13:36:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80DF1866C0;
 Fri,  4 Mar 2022 13:36:40 +0000 (UTC)
Date: Fri, 4 Mar 2022 14:36:39 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 0/3] block: Make bdrv_refresh_limits() non-recursive
Message-ID: <YiIV5yAW8wZf8lsz@redhat.com>
References: <20220216105355.30729-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216105355.30729-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.02.2022 um 11:53 hat Hanna Reitz geschrieben:
> Hi,
> 
> v1 with detailed reasoning:
> https://lists.nongnu.org/archive/html/qemu-block/2022-02/msg00508.html
> 
> This series makes bdrv_refresh_limits() non-recursive so that it is
> sufficient for callers to ensure that the node on which they call it
> will not receive concurrent I/O requests (instead of ensuring the same
> for the whole subtree).
> 
> We need to ensure such I/O does not happen because bdrv_refresh_limits()
> is not atomic and will produce intermediate invalid values, which will
> break concurrent I/O requests that read these values.

Thanks, applied to the block branch.

Kevin


