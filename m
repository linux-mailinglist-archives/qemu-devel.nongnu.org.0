Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E035EF9E9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:13:20 +0200 (CEST)
Received: from localhost ([::1]:46838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwA2-0001Sx-Nu
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1odtu3-00077C-Ui
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1odtu1-0006Uv-82
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664459316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fWj6jcTa3DeVfQ3FmqR63pwi+8DEn6QHRBAQ7XEy0Q0=;
 b=LJ19j42yw8lVLAVO1UxfQSrFFGoTyFQLnlSPSSeI6zK9+PXJDW75+J9qg0grjVYZLRrbN7
 vWTlryLsD5BkrzwmpNiknH3mBv5zUhpVaxd6r2Zj+fxprZKG+sYIMZk/KEUskUpAZHo/Wk
 Qh7bI5gD6Dp3hUWDaN80ZO473f0zyKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-xg7dyTu-OAyGw8D2cOoywA-1; Thu, 29 Sep 2022 09:48:32 -0400
X-MC-Unique: xg7dyTu-OAyGw8D2cOoywA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67E4C88B7A7;
 Thu, 29 Sep 2022 13:48:31 +0000 (UTC)
Received: from localhost (unknown [10.39.193.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BE0B492B05;
 Thu, 29 Sep 2022 13:48:30 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v3 1/5] hw/arm/virt: Introduce virt_set_high_memmap()
 helper
In-Reply-To: <20220921231349.274049-2-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-2-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 29 Sep 2022 15:48:29 +0200
Message-ID: <878rm2e1g2.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
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

On Thu, Sep 22 2022, Gavin Shan <gshan@redhat.com> wrote:

> This introduces virt_set_high_memmap() helper. The logic of high
> memory region address assignment is moved to the helper. The intention
> is to make the subsequent optimization for high memory region address
> assignment easier.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 74 ++++++++++++++++++++++++++++-----------------------
>  1 file changed, 41 insertions(+), 33 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


