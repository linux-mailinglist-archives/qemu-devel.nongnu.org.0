Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82374CD06B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 09:48:06 +0100 (CET)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ3bZ-00058y-Tz
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 03:48:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ3Zo-0004F0-O1
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 03:46:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ3Zn-0005Z2-94
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 03:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646383574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jzk0dMr8EVsMSElj76YzoXlsVfC+VlmT4VUsaGTmG0Y=;
 b=KPv+VNBJgalj+NKJOwOmhowsTBxTgWXhNe/IX7rmY3Jevao772ogNXswJnNn9bkaFoTN+e
 jftbzJvj3n6XHnIerpROUPZEO4gSRPya1ZJawWf0pmT2ukbaV8zUerkShhcse8XQh2Rjqp
 VdhTAkPLnbfPh1+VdvrMfi1vwDCfCpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-XLYqsssfORm1hMHfqpvRfA-1; Fri, 04 Mar 2022 03:46:11 -0500
X-MC-Unique: XLYqsssfORm1hMHfqpvRfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C36C800423;
 Fri,  4 Mar 2022 08:46:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94CE383189;
 Fri,  4 Mar 2022 08:46:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CA67318007A2; Fri,  4 Mar 2022 09:46:06 +0100 (CET)
Date: Fri, 4 Mar 2022 09:46:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
Message-ID: <20220304084606.dkvbhnpwldrziceg@sirius.home.kraxel.org>
References: <20220228075203.60064-1-gshan@redhat.com>
 <20220228100820.477e2311@redhat.com>
 <41eb791c-a74a-7ed6-df05-cd1867ecbb5f@redhat.com>
 <20220301114257.2bppjnjqj7dgxztc@sirius.home.kraxel.org>
 <ee76dcac-8914-2f24-9920-9d93aa29c22d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ee76dcac-8914-2f24-9920-9d93aa29c22d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Shan Gavin <shan.gavin@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> because 128MB node memory size isn't used in practice. If the EDK2 error
> message can be improved, we might have something like below:
> 
> ASSERT [MemoryInit] /home/lacos/src/upstream/qemu/roms/edk2/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLibConstructor.c(93): NewSize >= 0x08000000
> 
> to
> 
> The first NUMA node should have more than 128MB memory

Well, except the firmware doesn't even know yet at that point
whenever it runs on a NUMA machine or not ...

take care,
  Gerd


