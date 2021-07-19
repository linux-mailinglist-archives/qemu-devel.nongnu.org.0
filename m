Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880483CE663
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:58:45 +0200 (CEST)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WbM-0003xh-KB
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m5WaV-0003HA-3J
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:57:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m5WaT-0000k8-Bb
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626713868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2q//Pc7sOmWXWMYvWVkVlOC24Y93ghVMoCrEE8xz7Qg=;
 b=CXfZvKPh9Kr3D9XiM8Y0gj+lvFJtg9g9ge6+IIfC1haBo1swEheI7x2axflbLnqJIJwAPG
 xG394ESxNyzNKBo+Nnse7w16kSjzEiTUi8UUOUMRjaIljVsBufsobn+LDO4dPYx47VPPgE
 B6ivwr0dpeNXzFfXHcp4TKU/3mPb5LQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-_WXcAP6aP3WE0m1TK73vDg-1; Mon, 19 Jul 2021 12:57:45 -0400
X-MC-Unique: _WXcAP6aP3WE0m1TK73vDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBA2F10151E1;
 Mon, 19 Jul 2021 16:57:43 +0000 (UTC)
Received: from localhost (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 118665D6A1;
 Mon, 19 Jul 2021 16:57:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.2 v2 00/11] machine: smp parsing fixes and
 improvement
In-Reply-To: <20210719032043.25416-1-wangyanan55@huawei.com>
Organization: Red Hat GmbH
References: <20210719032043.25416-1-wangyanan55@huawei.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 19 Jul 2021 18:57:38 +0200
Message-ID: <875yx69r7h.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19 2021, Yanan Wang <wangyanan55@huawei.com> wrote:

> Hi,
>
> This is v2 of the series [1] that I have posted to introduce some smp parsing
> fixes and improvement, much more work has been processed compared to RFC v1.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00259.html
>
> The purpose of this series is to improve/fix the parsing logic. Explicitly
> specifying a CPU topology parameter as zero is not allowed any more, and
> maxcpus is now uniformly used to calculate the omitted parameters. It's also
> suggested that we should start to prefer cores over sockets over threads on
> the newer machine types, which will make the computed virtual topology more
> reflective of the real hardware.
>
> In order to reduce code duplication and ease the code maintenance, smp_parse
> in now converted into a parser generic enough for all arches, so that the PC
> specific one can be removed. It's also convenient to introduce more topology
> members (e.g. cluster) to the generic parser in the future.

Cc:ing Pierre, as he also had been looking at the smp parsing code (for
s390x) recently.

Also, please keep me on cc: for patches that touch s390x.

>
> Finally, a QEMU unit test for the parsing of given SMP configuration is added.
> Since all the parsing logic is in generic function smp_parse(), this test
> passes diffenent SMP configurations to the function and compare the parsing
> result with what is expected. In the test, all possible collections of the
> topology parameters and the corressponding expected results are listed,
> including the valid and invalid ones. The preference of sockets over cores
> and the preference of cores over sockets, and the support of multi-dies are
> also taken into consideration.
>
> ---
>
> Changelogs:
>
> v1->v2:
> - disallow "anything=0" in the smp configuration (Andrew)
> - make function smp_parse() a generic helper for all arches
> - improve the error reporting in the parser
> - start to prefer cores over sockets since 6.2 (Daniel)
> - add a unit test for the smp parsing (Daniel)
>
> ---
>
> Yanan Wang (11):
>   machine: Disallow specifying topology parameters as zero
>   machine: Make smp_parse generic enough for all arches
>   machine: Uniformly use maxcpus to calculate the omitted parameters
>   machine: Use the computed parameters to calculate omitted cpus
>   machine: Improve the error reporting of smp parsing
>   hw: Add compat machines for 6.2
>   machine: Prefer cores over sockets in smp parsing since 6.2
>   machine: Use ms instead of global current_machine in sanity-check
>   machine: Tweak the order of topology members in struct CpuTopology
>   machine: Split out the smp parsing code
>   tests/unit: Add a unit test for smp parsing
>
>  MAINTAINERS                 |    2 +
>  hw/arm/virt.c               |   10 +-
>  hw/core/machine-smp.c       |  124 ++++
>  hw/core/machine.c           |   68 +--
>  hw/core/meson.build         |    1 +
>  hw/i386/pc.c                |   66 +--
>  hw/i386/pc_piix.c           |   15 +-
>  hw/i386/pc_q35.c            |   14 +-
>  hw/ppc/spapr.c              |   16 +-
>  hw/s390x/s390-virtio-ccw.c  |   15 +-
>  include/hw/boards.h         |   13 +-
>  include/hw/i386/pc.h        |    3 +
>  qapi/machine.json           |    6 +-
>  qemu-options.hx             |    4 +-
>  tests/unit/meson.build      |    1 +
>  tests/unit/test-smp-parse.c | 1117 +++++++++++++++++++++++++++++++++++
>  16 files changed, 1338 insertions(+), 137 deletions(-)
>  create mode 100644 hw/core/machine-smp.c
>  create mode 100644 tests/unit/test-smp-parse.c
>
> -- 
> 2.19.1


