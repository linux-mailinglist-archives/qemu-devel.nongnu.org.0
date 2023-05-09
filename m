Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C246FCB3E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:21:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQ5V-0001VR-HW; Tue, 09 May 2023 12:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pwQ5T-0001VI-L4
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:21:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pwQ5N-0004s7-Tx
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683649267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mlisN33hVdRgNQI4AGoktS6VrNMNkp6fTK425drHkAM=;
 b=DzHlydXcZ2IMwVGtuDopGmeIp9hqMW4usVFVSwjflay0qMBfWChEGnlDZeA7Lf7RtHLX4O
 thxTArGzlJ/s382Ve1VrDMxqMfzDNkGO2Ry/dEjfWxVybhKmcgflVWYq+EylUQSwTUNG2g
 3tR2vXa59rj7IjkgInluyaqJOC3+8ZU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-iXSHcKQgNjqDDLL7VUL7iw-1; Tue, 09 May 2023 12:21:06 -0400
X-MC-Unique: iXSHcKQgNjqDDLL7VUL7iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0F0E800047;
 Tue,  9 May 2023 16:21:05 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F154540C2063;
 Tue,  9 May 2023 16:21:04 +0000 (UTC)
Date: Tue, 9 May 2023 11:21:03 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] iotests: Test resizing image attached to an iothread
Message-ID: <6mce356xe4d6smj4idgro5zivfepolobwqhtuwkgsym5g4eavi@6mv7zba7llro>
References: <20230509134133.373408-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509134133.373408-1-kwolf@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, May 09, 2023 at 03:41:33PM +0200, Kevin Wolf wrote:
> This tests that trying to resize an image with QMP block_resize doesn't
> hang or otherwise fail when the image is attached to a device running in
> an iothread.
> 
> This is a regression test for the recent fix that changed
> qmp_block_resize, which is a coroutine based QMP handler, to avoid
> calling no_coroutine_fns directly.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
> v2:
> - Not all formats/protocols support resizing, restrict the list
> - Filter _img_info output, it varies between formats

Shoot, I read my email out-of-order today and gave R-b on v1 before
even seeing that you had already posted v2.

These changes make sense, and make the test better.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


