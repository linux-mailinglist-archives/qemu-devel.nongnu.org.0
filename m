Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D1D2AFF81
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 06:54:00 +0100 (CET)
Received: from localhost ([::1]:52444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd5YV-0003TP-2Z
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 00:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kd5X5-0002uW-Tk
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 00:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kd5X4-0001k7-8L
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 00:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605160349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMYYTWQPZ+/BjKUOKVlcGoKHh+p0jvD1zUlH9LnAl5g=;
 b=TXqhh0yPJPQBVQ4dcont5Jkx8rVPdr48iw2irVzyNarDzHabnwly7qpka8S+eaesw1/luI
 TAXzzejYgCNdEoB+wCJAl8z5GS8TG9Z33ko7UBRsGqOu4UEesZqmShYcfZUytvkWmNYL4a
 s6+fj090tqNnIla2zLj6bO46S7fWKOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-ggD1wjOgMd6TMuVQ4nrqkg-1; Thu, 12 Nov 2020 00:52:27 -0500
X-MC-Unique: ggD1wjOgMd6TMuVQ4nrqkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4A47425DE
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 05:52:26 +0000 (UTC)
Received: from [10.72.13.122] (ovpn-13-122.pek2.redhat.com [10.72.13.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D04E927CC6;
 Thu, 12 Nov 2020 05:52:25 +0000 (UTC)
Subject: Re: [PATCH] net: do not exit on "netdev_add help" monitor command
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201111105222.1179861-1-pbonzini@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <983b0aa9-64aa-8c95-4cf2-6425c721d20d@redhat.com>
Date: Thu, 12 Nov 2020 13:52:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111105222.1179861-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/11 下午6:52, Paolo Bonzini wrote:
> "netdev_add help" is causing QEMU to exit because the code that
> invokes show_netdevs is shared between CLI and HMP processing.
> Move the check to the callers so that exit(0) remains only
> in the CLI flow.
>
> "netdev_add help" is not fixed by this patch; that is left for
> later work.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


Applied.

Thanks


