Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA8A1D19F5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 17:53:17 +0200 (CEST)
Received: from localhost ([::1]:59662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYth6-0007ZN-UX
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 11:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jYtgK-0007A5-7A
 for qemu-devel@nongnu.org; Wed, 13 May 2020 11:52:28 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25843
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jYtgJ-00075k-5t
 for qemu-devel@nongnu.org; Wed, 13 May 2020 11:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589385146;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jV5m4gv+7D5YGDD0W8RPM7y0xwxz7W5aYTLSO33TKk=;
 b=Ph2MfRonduzaHhm/h7hou8QXJAn9vfRQxGKzmpi+N5UPch986LpZ0B60ZVDi+AhyBC2B1G
 aUA89OotUOWvGv2VbDVsN/v2t7hx13oU5Qoq1hzjEYQ4TePUWrKzDOv/GFyROOVYIFdLA5
 4TKMxQVo4Nl0ldrsArGKtrQV5epoAQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-uWNx8_KkO2OqDHV75wVr0w-1; Wed, 13 May 2020 11:52:24 -0400
X-MC-Unique: uWNx8_KkO2OqDHV75wVr0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9000C1083E88;
 Wed, 13 May 2020 15:52:23 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6451F783B3;
 Wed, 13 May 2020 15:52:15 +0000 (UTC)
Date: Wed, 13 May 2020 16:52:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Subject: Re: [PATCH v3 1/3] qemu-sockets: add abstract UNIX domain socket
 support
Message-ID: <20200513155212.GK1253949@redhat.com>
References: <20200510061422.24841-1-zxq_yx_007@163.com>
 <20200510061422.24841-2-zxq_yx_007@163.com>
MIME-Version: 1.0
In-Reply-To: <20200510061422.24841-2-zxq_yx_007@163.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 04:17:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_EXCESS_BASE64=0.979, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 10, 2020 at 02:14:20PM +0800, xiaoqiang zhao wrote:
> unix_listen/connect_saddr now support abstract address types
> 
> two aditional BOOL switches are introduced:
> tight: whether to set @addrlen to the minimal string length,
>        or the maximum sun_path length. default is TRUE
> abstract: whether we use abstract address. default is FALSE
> 
> cli example:
> -monitor unix:/tmp/unix.socket,abstract,tight=off
> OR
> -chardev socket,path=/tmp/unix.socket,id=unix1,abstract,tight=on
> 
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  chardev/char-socket.c |  4 ++++
>  chardev/char.c        |  7 +++++++
>  qapi/sockets.json     |  9 ++++++++-
>  util/qemu-sockets.c   | 39 ++++++++++++++++++++++++++++++++-------
>  4 files changed, 51 insertions(+), 8 deletions(-)

With the changes Eric suggests, then

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


