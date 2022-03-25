Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AD24E6C23
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 02:39:50 +0100 (CET)
Received: from localhost ([::1]:47330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXYvd-00024f-MQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 21:39:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXYud-0001GM-6Z
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 21:38:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXYub-0005CD-SP
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 21:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648172325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L8TTnzbve8hABmfOpM1E2p+OHQoJwS4HJHhjRHWwMiQ=;
 b=bBoOiZ/ezwjlslUUCHqrWJ8kwjt7oPmN0OELfh9OwF4ro9neTBoW/g8Hlmn5jhzqhBD6EA
 6vn2iuK8cqra3IhTssgc/YT+NIBAQvmlMuc+SNPBSBH1fZecrEv4FoPHsq7o4wDbdM+Dkf
 AlPJ/uAIP024XQMtAaH1t4cDoDodJJc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-u5sMryPBMaS_8Es8gVAnhQ-1; Thu, 24 Mar 2022 21:38:39 -0400
X-MC-Unique: u5sMryPBMaS_8Es8gVAnhQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD60C1C05ED2;
 Fri, 25 Mar 2022 01:38:38 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C49BA111F3D9;
 Fri, 25 Mar 2022 01:38:34 +0000 (UTC)
Date: Thu, 24 Mar 2022 20:38:33 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 14/17] iotests/image-fleecing: switch to qemu_io()
Message-ID: <20220325013833.rvvqpug6tuxiyync@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
 <20220324183018.2476551-15-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220324183018.2476551-15-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-512-43304b
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 02:30:15PM -0400, John Snow wrote:
> This test expects failure ... but only sometimes. When? Why?
> 
> It's for reads of a region not defined by a bitmap. Adjust the test to
> be more explicit about what it expects to fail and why.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/tests/image-fleecing | 28 +++++++++++++++++--------
>  1 file changed, 19 insertions(+), 9 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


