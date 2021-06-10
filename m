Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852D3A27DB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:10:47 +0200 (CEST)
Received: from localhost ([::1]:37966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGi6-0000lF-66
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGh3-0008E8-Fn
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:09:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGh1-0007y9-TO
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623316179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IvPC6d5OiA0aNc0qiEQJMnSV0cLwXi41+/yjLCPZxz4=;
 b=cRPS3Wxp0XOJCv1r6AOYPC9Aqr7iZKfirnenfLPsrtNAACSeJJDr4UF1gk7WVC87Z0jPJ9
 7mD2jRGbcKL4DnosJ5nqgHZ9hU8ffYAmN9IZ+myyXBCWHVmX+RuZh1cqjnd2g/ZaKapedz
 c9Z5853c4VPSjjzUSwzA3TcsDKCObUQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-Fak5tAqJO5SNJNgHUmVdVA-1; Thu, 10 Jun 2021 05:09:38 -0400
X-MC-Unique: Fak5tAqJO5SNJNgHUmVdVA-1
Received: by mail-wr1-f72.google.com with SMTP id
 n4-20020a5d42040000b0290119fef97609so572797wrq.18
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 02:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IvPC6d5OiA0aNc0qiEQJMnSV0cLwXi41+/yjLCPZxz4=;
 b=RbGSdEeU+wbTlvz2UGLUqNa/HY2MwkO99519bV26L9LMl3HNCv6ve+3dmQVn76OGSX
 w20F+5Ltwr3DwF/SzPm3kVO2IodHMdZQCiUec2EWDi/S4b+g73Qhb/llitSm6AWK0hoN
 6I11nViz/gh1CJGJjYZBUg52+HS9BSsiA7CdPEObte2uRamDmm5/Ep44zMLxTFMDY2uX
 J91aXiSJ7geOu0AWDdpb7c9BM6Zl7sF9lJMCGnYElJs6exdssc/vVBoEjXqZo3fd3LaR
 gcEwvcWlQHr3N+b0KBbDpYcQk/pnp63zMiMjGWLa9G2ixD0OyIbJl7jI1SrZCed2MFHG
 rV4Q==
X-Gm-Message-State: AOAM530sQNRvJeLqDnCmuGl2ze6aHtB5CSVuq9CMozL+26LPZE+SC1DP
 K+wYtVWlfUrawDpZ3nIdDd8/TmMZuGihukiQnHT0kMw8EsnpvRJ3enrcRdWsV108jIv8GRi7zUV
 pKz0Tb5b238CxwIs=
X-Received: by 2002:adf:eac3:: with SMTP id o3mr4139262wrn.157.1623316177088; 
 Thu, 10 Jun 2021 02:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwszvhL5F/sFUT8zalAcj9e+wcmVPG7RsczIA9nPySa6utJklSKi+yBvbAVi0Q8aIBece340Q==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr4139249wrn.157.1623316176922; 
 Thu, 10 Jun 2021 02:09:36 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id 89sm2917087wri.94.2021.06.10.02.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:09:36 -0700 (PDT)
Date: Thu, 10 Jun 2021 11:09:34 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 3/7] vhost: Return 0/-errno in vhost_dev_init()
Message-ID: <20210610090934.2mm4hulkqfuani65@steredhat>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-4-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609154658.350308-4-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:46:54PM +0200, Kevin Wolf wrote:
>Instead of just returning 0/-1 and letting the caller make up a
>meaningless error message, switch to 0/-errno so that different kinds of
>errors can be distinguished in the caller.
>
>This involves changing a few more callbacks in VhostOps to return
>0/-errno: .vhost_set_owner(), .vhost_get_features() and
>.vhost_virtqueue_set_busyloop_timeout(). The implementations of these
>functions are trivial as they generally just send a message to the
>backend.
>
>Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>---
> hw/virtio/vhost-backend.c |  4 +++-
> hw/virtio/vhost-user.c    | 10 +++++++---
> hw/virtio/vhost-vdpa.c    |  4 +++-
> hw/virtio/vhost.c         |  8 ++++----
> 4 files changed, 17 insertions(+), 9 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


