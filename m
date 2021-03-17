Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5C233F3F2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:22:39 +0100 (CET)
Received: from localhost ([::1]:35872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMY0M-0003DD-SX
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMXeX-0005uJ-Ov
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMXeS-0003He-K1
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615993199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+BDdM9gXKSQtJLhJUxpien2ggDPCiUyMvQzbXfmDAA=;
 b=GJ//M5zNyFlbDSfXxVJjCtrVHfsDMG2P5+RkW9qFbvAhaQ9zu1nVxHRdxlU8u7N7UFBovZ
 Fcl98phza7VPQ8OLbLWKXJPWfP//FnVq5QEKu8dWwUwQOpmxAxArltZVVxRmBJh5qVNCgu
 6vslNOzEPFF2RimBAKUaW6ZTsJUFMB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-r5b9-z8vPiaB3tEUhX97NQ-1; Wed, 17 Mar 2021 10:59:58 -0400
X-MC-Unique: r5b9-z8vPiaB3tEUhX97NQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB9E9108BD0F;
 Wed, 17 Mar 2021 14:59:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEE775C1CF;
 Wed, 17 Mar 2021 14:59:55 +0000 (UTC)
Subject: Re: [PATCH 1/2] utils: Tighter tests for qemu_strtosz
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210317143325.2165821-1-eblake@redhat.com>
 <20210317143325.2165821-2-eblake@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5e1a096a-d0e6-a1c4-2a7d-64f28c79e0a7@redhat.com>
Date: Wed, 17 Mar 2021 15:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317143325.2165821-2-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/2021 15.33, Eric Blake wrote:
> Our tests were not validating the return value in all cases, nor was
> it guaranteeing our documented claim that 'res' is unchanged on error.
> For that matter, it wasn't as thorough as the existing tests for
> qemu_strtoi() and friends for proving that endptr and res are sanely
> set.  Enhancing the test found one case where we violated our
> documentation: namely, when failing with EINVAL when endptr is NULL,
> we shouldn't modify res.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/unit/test-cutils.c | 117 +++++++++++++++++++++++++++++++++++++--
>   util/cutils.c            |   4 +-
>   2 files changed, 114 insertions(+), 7 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


