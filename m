Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9663552A8F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 07:42:54 +0200 (CEST)
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Wf7-0007Ag-JU
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 01:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o3WZc-0006Ob-JK
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 01:37:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o3WZY-0002XA-U3
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 01:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655789827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wei9e7Jl/3CRhWBNWLSj7/GHiCL7zWZza4ftNDM/bUo=;
 b=MvpTV2xgBX81TAT/objVUja/li3OcTazc/URQz4rX1mw3AG/vAw7WvfK7/XXikyx06IEzV
 3ZYU+0PkzLYuwmDf9LECAQiSOvlmOe9AW4vseDQ0PChPx/imNgZ6g7fqL8onrYpgv4UBcn
 QD5z31p1keJdjePAqvsBCiIbJ8Mv8Lw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-dglu6eOcMLm5cO4-YxRwRA-1; Tue, 21 Jun 2022 01:37:05 -0400
X-MC-Unique: dglu6eOcMLm5cO4-YxRwRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD8EB811E75;
 Tue, 21 Jun 2022 05:37:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 734D7C28118;
 Tue, 21 Jun 2022 05:37:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 024E01800790; Tue, 21 Jun 2022 07:37:02 +0200 (CEST)
Date: Tue, 21 Jun 2022 07:37:02 +0200
From: Gerd Hoffman <kraxel@redhat.com>
To: Dionna Glaze <dionnaglaze@google.com>
Cc: qemu-devel@nongnu.org, Xu@google.com, Min M <min.m.xu@intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/i386: Add unaccepted memory configuration
Message-ID: <20220621053702.oqzkmij4b4jm4ysd@sirius.home.kraxel.org>
References: <20220620223300.1555849-1-dionnaglaze@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620223300.1555849-1-dionnaglaze@google.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

On Mon, Jun 20, 2022 at 10:33:00PM +0000, Dionna Glaze wrote:
> For SEV-SNP, an OS is "SEV-SNP capable" without supporting this UEFI
> v2.9 memory type. In order for OVMF to be able to avoid pre-validating
> potentially hundreds of gibibytes of data before booting, it needs to
> know if the guest OS can support its use of the new type of memory in
> the memory map.

I think this should be wired up via sev-guest object (see
SevGuestProperties in qapi/qom.json and target/i386/sev.c),
i.e.

qemu -object sev-guest,accept-all-memory=true,$args

(and likewise for -object tdx-guest once merged).

take care,
  Gerd


