Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDA2330867
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:48:04 +0100 (CET)
Received: from localhost ([::1]:36926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9gR-0003GC-3D
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJ9d1-0001ux-Hw
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:44:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJ9d0-0006GA-63
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615185868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+IU52f4upeYdwySvE2LK7HmB+eUtwrhgzMWUlimbTgw=;
 b=LKB0A7UlZt96e3IwleXkdxy8QN52yDAIx86dGg83oXkJpPaQfqP+tPTh0I9sv2hGDY4Pdw
 kC+9Y5OZAdfZER4WDVZRz+5+VxgxdgBcxBX3BIW8fAB8k2P9TQjNZMsjIId9GuWX6YNKwe
 JKypVkP08OZAtm/cSiGegY+EIjCZpOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-HVH0cjXmOIaePoKxtTZPEQ-1; Mon, 08 Mar 2021 01:44:25 -0500
X-MC-Unique: HVH0cjXmOIaePoKxtTZPEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A659E18D6A2C;
 Mon,  8 Mar 2021 06:44:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-143.ams2.redhat.com [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A58F26E405;
 Mon,  8 Mar 2021 06:44:11 +0000 (UTC)
Subject: Re: [PATCH v3 04/12] libqtest: add qtest_remove_abrt_handler()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210223144653.811468-1-stefanha@redhat.com>
 <20210223144653.811468-5-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <63f791d0-9e1d-efe9-0f6c-6f647b611cc4@redhat.com>
Date: Mon, 8 Mar 2021 07:44:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210223144653.811468-5-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/2021 15.46, Stefan Hajnoczi wrote:
> Add a function to remove previously-added abrt handler functions.
> 
> Now that a symmetric pair of add/remove functions exists we can also
> balance the SIGABRT handler installation. The signal handler was
> installed each time qtest_add_abrt_handler() was called. Now it is
> installed when the abrt handler list becomes non-empty and removed again
> when the list becomes empty.
> 
> The qtest_remove_abrt_handler() function will be used by
> vhost-user-blk-test.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>   tests/qtest/libqos/libqtest.h | 18 ++++++++++++++++++
>   tests/qtest/libqtest.c        | 35 +++++++++++++++++++++++++++++------
>   2 files changed, 47 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


