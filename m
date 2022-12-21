Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B9965335C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 16:27:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p80zh-0005uD-Jy; Wed, 21 Dec 2022 10:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p80zc-0005t4-BY
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 10:26:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p80za-00078q-Ug
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 10:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671636410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+N8MEUe3LKQ/NuNAlF/ow2P5V8BYwIs/I6C+6xZvLgE=;
 b=HZHRg6R8VG45O07x3+pFyzTqMp9XCfGglIycTvW2yZi+dGYSc9CzaQ0e4huR9y0oc8bs73
 gnl7rxTwfG1OL4q+8yp62Y3TKJLjxdqPwcc9j1hKkQI4RoC3luVHEQ3J16zneKUxg7ih46
 wJqvIYCSyQbrk18+hb9Vn46oZLUfMS0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-X1XeLrzQMN-PUA_XyG6rdw-1; Wed, 21 Dec 2022 10:26:47 -0500
X-MC-Unique: X1XeLrzQMN-PUA_XyG6rdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7785087B2A3;
 Wed, 21 Dec 2022 15:26:46 +0000 (UTC)
Received: from localhost (unknown [10.22.32.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 295E240C2064;
 Wed, 21 Dec 2022 15:26:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Zenghui
 Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/2] hw/arm/virt: Make accels in GIC finalize logic
 explicit
In-Reply-To: <20221221092850.61332-3-agraf@csgraf.de>
Organization: Red Hat GmbH
References: <20221221092850.61332-1-agraf@csgraf.de>
 <20221221092850.61332-3-agraf@csgraf.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 21 Dec 2022 16:26:44 +0100
Message-ID: <87len06amj.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Dec 21 2022, Alexander Graf <agraf@csgraf.de> wrote:

> Let's explicitly list out all accelerators that we support when trying to
> determine the supported set of GIC versions. KVM was already separate, so
> the only missing one is HVF which simply reuses all of TCG's emulation
> code and thus has the same compatibility matrix.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v1 -> v2:
>
>   - Include TCG header for tcg_enabled()
> ---
>  hw/arm/virt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


