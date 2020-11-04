Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774612A62D6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 12:03:28 +0100 (CET)
Received: from localhost ([::1]:59586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaGZb-0006Nk-I6
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 06:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kaGUa-0000J2-Ta
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 05:58:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kaGUV-0006UB-IY
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 05:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604487490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uz/YdtP/q2t/rptiXfBl/fTJMlAyO+xsKhFNprkzWLM=;
 b=PNSKX4eFEebqpZ2y+FKa8d7nYLh+3WVX1MU06gxWHd6yOmnc4T9RM0+X1g4pXJKjrEsq8H
 wISmYt39a/GKuqYNAhfKrtwqsJ7gqjmitp3qdTBkuP7GgA+AiTYHIiu5Rl+nRBgNQeo5kS
 3khY2mmJYyxlt0ESGTOcxpIrXH5dbPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-uvteCJLBPi2LgA0hGZjLXQ-1; Wed, 04 Nov 2020 05:58:07 -0500
X-MC-Unique: uvteCJLBPi2LgA0hGZjLXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19E4987951C;
 Wed,  4 Nov 2020 10:58:05 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.194.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08E9960C84;
 Wed,  4 Nov 2020 10:58:02 +0000 (UTC)
Subject: Re: [PATCH for-5.2 2/3] hw/block/nvme: fix uint16_t use of uint32_t
 sgls member
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20201104102248.32168-1-its@irrelevant.dk>
 <20201104102248.32168-3-its@irrelevant.dk>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <eb38e6f4-2597-8858-eb4f-f9fc5f7e2a1b@redhat.com>
Date: Wed, 4 Nov 2020 11:58:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104102248.32168-3-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.11.20 11:22, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> nvme_map_sgl_data erroneously uses the sgls member of NvmeIdNs as a
> uint16_t.
> 
> Reported-by: Coverity (CID 1436129)
> Fixes: cba0a8a344fe ("hw/block/nvme: add support for scatter gather lists")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


