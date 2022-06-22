Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10205543BF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 10:09:03 +0200 (CEST)
Received: from localhost ([::1]:52078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3vQ6-0008VL-HP
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 04:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o3vLY-0007XJ-T7
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o3vLV-0003rO-0g
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655885055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=12bFolkpSP2zlJtPoKU+AksKKicuqZrUj+5ffdJHhsY=;
 b=RH2wK5l6mh/sMLjcXrFJQdiaRwdGnLWr/qzLH5jeZEPjMgwLWCZg6KuSEDq7uiGdOx5Sy9
 mH/zGla2iBdKec8oGbcSdoGwn4kiXM+6vcHjn3zRnh8b4aerywWk0oykiIZwRHpfUZB9F3
 bEcorIeAC6kb3012KEV9KzQx/JWiLfQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-gNPha7y4OPqsJp7GcUFC6A-1; Wed, 22 Jun 2022 04:04:10 -0400
X-MC-Unique: gNPha7y4OPqsJp7GcUFC6A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EFE6101E98C;
 Wed, 22 Jun 2022 08:04:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 331BA40C5BF;
 Wed, 22 Jun 2022 08:04:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F26C71800081; Wed, 22 Jun 2022 10:04:07 +0200 (CEST)
Date: Wed, 22 Jun 2022 10:04:07 +0200
From: Gerd Hoffman <kraxel@redhat.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: Dionna Glaze <dionnaglaze@google.com>, qemu-devel@nongnu.org,
 Xu@google.com, Min M <min.m.xu@intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/i386: Add unaccepted memory configuration
Message-ID: <20220622080407.xnohl6t276cljoik@sirius.home.kraxel.org>
References: <20220620223300.1555849-1-dionnaglaze@google.com>
 <5d6b2bdb-dc17-2985-c723-9449b40c26f2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d6b2bdb-dc17-2985-c723-9449b40c26f2@amd.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  Hi,

> AFAIU 'true' is the behavior you are proposing with your EFI changes?
> Saying that what's the difference between 'false' & 'default' wrt EFI
> firmware? Just wondering do we need default?

true/false will force the one or the other no matter what.

'default' allows the firmware to choose depending on various factors,
for example have cc-specific build variants have a different default
behavior than the generic builds.

It also keeps the door open to change default behavior in the future.
One reasonable approach would be to start with firmware accepting all
memory by default, wait until support for unaccepted memory has found
its way into linux distro kernels, then flip the default to pass
unaccepted memory to the linux kernel.

In case the uefi boot service spec gets updated to allow negotiating
unaccepted memory support automatically this can be used easily by
making that the firmware's default behavior.

take care,
  Gerd


