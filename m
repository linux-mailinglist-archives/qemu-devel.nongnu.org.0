Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46222C5FC1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 06:27:08 +0100 (CET)
Received: from localhost ([::1]:48820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiWHj-0001rq-Uh
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 00:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kiWGe-0001Pd-De
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 00:26:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kiWGc-0000CX-Eh
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 00:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606454757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZuZg+iGz1qIj/+eOXqD+fyDqPzf4jZ5I+vzdNvvW6A=;
 b=Ku58+kji+sM2XVvvN6pGfA2FaNsaQZrSqgLXuhCpyKZALkdlvtY6UT7wnE8leKL9ZQhOND
 ympM0Dw7VUG4XGDlyhS2o2NjFNrnDGgzmdffS4hvbu5SAGzNJb0yrRZSYptp4bgewMOgPU
 pxTJwPvgITXwYvg/URlukSESyjrVoMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-K57HsX-7OBGyn6g4vvP1kg-1; Fri, 27 Nov 2020 00:25:55 -0500
X-MC-Unique: K57HsX-7OBGyn6g4vvP1kg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C1328030AC;
 Fri, 27 Nov 2020 05:25:54 +0000 (UTC)
Received: from [10.72.13.168] (ovpn-13-168.pek2.redhat.com [10.72.13.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AAB8189B4;
 Fri, 27 Nov 2020 05:25:52 +0000 (UTC)
Subject: Re: [PATCH 0/1] net: Fix handling of id in netdev_add and netdev_del
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201125100220.50251-1-armbru@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c9730775-08f6-322e-bb41-76ba957858e4@redhat.com>
Date: Fri, 27 Nov 2020 13:25:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201125100220.50251-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: yuri.benditovich@daynix.com, andrew@daynix.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/25 下午6:02, Markus Armbruster wrote:
> This is a regression fix, but the regression is already in 5.0.  I
> think it's too late for 5.2.  If I'm right, then the issue should be
> documented in the release notes (I can do that).


Please do that and I've queued this for the next release.

Thanks


>
> Markus Armbruster (1):
>    net: Fix handling of id in netdev_add and netdev_del
>
>   net/net.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
>


