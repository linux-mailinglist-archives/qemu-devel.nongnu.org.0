Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE9054C253
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 09:04:10 +0200 (CEST)
Received: from localhost ([::1]:36518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1N4S-0000XA-Hw
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 03:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1MyA-0006gl-7D
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 02:57:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1My5-00012I-Ea
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 02:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655276252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SrA8FzBUEdeGRKPBITHs1wfmxyw/e3sW7P/oFwToI3k=;
 b=V0kp57836YAbNgvVyWuSJUOCL/n6kUXk33jqanm3wt7NSsp0a1ZepeIuDpuSbXXQBVNEXo
 EYHzuJVhHdwKv1DeJ9TZUaDNUocVM1p8Ieoi+xXHEfqlIGoHnb74kQX4mG3WH9XwCiDLUF
 pCKBd5Sd4rhZ5NWaSH/M+k9VEG4ziiw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-Q4HCAZ0xNGmhl3GorvNVWw-1; Wed, 15 Jun 2022 02:57:29 -0400
X-MC-Unique: Q4HCAZ0xNGmhl3GorvNVWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB3433C025CC;
 Wed, 15 Jun 2022 06:57:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79B511415106;
 Wed, 15 Jun 2022 06:57:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0EB5B1800081; Wed, 15 Jun 2022 08:57:27 +0200 (CEST)
Date: Wed, 15 Jun 2022 08:57:27 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 lersek@redhat.com, imammedo@redhat.com
Subject: Re: [PATCH] =?utf-8?B?cTM177yaRW5hYmw=?= =?utf-8?Q?e?= TSEG only
 when G_SMRAME and TSEG_EN both enabled
Message-ID: <20220615065727.wznkjmuqsc5ejjmv@sirius.home.kraxel.org>
References: <20220615034501.2733802-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615034501.2733802-1-zhenzhong.duan@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jun 15, 2022 at 11:45:01AM +0800, Zhenzhong Duan wrote:
> According to spec:
> "TSEG Enable (T_EN): Enabling of SMRAM memory for Extended SMRAM space
> only. When G_SMRAME = 1 and TSEG_EN = 1, the TSEG is enabled to appear
> in the appropriate physical address space. Note that once D_LCK is set,
> this bit becomes read only."

edk2 agrees and explicitly sets SMRAM_G_SMRAME:

  //
  // TSEG should be closed (see above), but unlocked, initially. Set G_SMRAME
  // (Global SMRAM Enable) too, as both D_LCK and T_EN depend on it.
  //
  PciAndThenOr8 (
    DRAMC_REGISTER_Q35 (MCH_SMRAM),
    (UINT8)((~(UINT32)MCH_SMRAM_D_LCK) & 0xff),
    MCH_SMRAM_G_SMRAME
    );

Good.

> -    if (pd->config[MCH_HOST_BRIDGE_ESMRAMC] & MCH_HOST_BRIDGE_ESMRAMC_T_EN) {
> +    if ((pd->config[MCH_HOST_BRIDGE_ESMRAMC] & MCH_HOST_BRIDGE_ESMRAMC_T_EN) &&
> +        (pd->config[MCH_HOST_BRIDGE_SMRAM] & SMRAM_G_SMRAME)) {

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


