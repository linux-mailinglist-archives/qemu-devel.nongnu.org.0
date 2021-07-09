Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D033C274C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:06:39 +0200 (CEST)
Received: from localhost ([::1]:38340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1t1R-0000JR-TJ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1m1szW-0005bW-6M; Fri, 09 Jul 2021 12:04:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:43012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1m1szT-0006qW-Ro; Fri, 09 Jul 2021 12:04:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCC6161377;
 Fri,  9 Jul 2021 16:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625846673;
 bh=flpPt4pUGdCbwNki011wNd+u7fcDbof0eA8262rpqoo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cgx0hV0h/9kUnymrC+MGz9F/qTM8o7iGU/0+sykW8Komt/lZ1Uf5jUe/aqE/kP5M7
 CcTx+1uX1v/6yV7CGLylkDNUQUQkTJ+ao4q3ToEmWi3n9j//6eAukFteX7Iyyu71wL
 5BnQFAUys8SfJJHJuJO1a95Oaj7xJe0ddvhlSSpdMVsSv45Tz6HSzVkdcnrRN7DR0Q
 2HJU7O5AwchIdtI5zLM0V+S3oxwxitTTk+nd+QLanP82rJHr/8BMmN9huKNfoLwxrj
 uafEexBQGSogxApdECp+uQItjEQ0tauLmsEVienamBSQhP9q6+8v0u5tIn1twDhrVG
 IFtCuoYnq6mkA==
Date: Fri, 9 Jul 2021 09:04:30 -0700
From: Keith Busch <kbusch@kernel.org>
To: Mohit Kapoor <mohit.kap@samsung.com>
Subject: Re: [RFC PATCH nvme-cli 2/2] nvme-cli/plugins/mi:add support
Message-ID: <20210709160430.GB291156@dhcp-10-100-145-180.wdc.com>
References: <CGME20210709145458epcas5p35826843853e7a8986098c4ff8fba857a@epcas5p3.samsung.com>
 <20210709145352.GA14300@test-zns>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709145352.GA14300@test-zns>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, p.kalghatgi@samsung.com,
 qemu-block@nongnu.org, k.jensen@samsung.com, d.palani@samsung.com,
 qemu-devel@nongnu.org, linux-nvme@lists.infrared.org, mreitz@redhat.com,
 u.kishore@samsung.com, stefanha@redhat.com, its@irrelevant.dk,
 javier.gonz@samsung.com, prakash.v@samsung.com, jg123.choi@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +int hal_init()
> +{
> +    int retval = -1;
> +    switch (GetSidebandInterface()) {
> +    case qemu_nvme_mi:
> +        retval = qemu_mi_init();
> +        break;
> +    default:
> +        break;
> +    }
> +    return retval;
> +}
> +
> +int hal_open()
> +{
> +    int retval = -1;
> +    switch (GetSidebandInterface()) {
> +    case qemu_nvme_mi:
> +        retval = qemu_mi_open();
> +        break;
> +    default:
> +        break;
> +    }
> +    return retval;
> +}
> +
> +int hal_close()
> +{
> +    int retval = -1;
> +    switch (GetSidebandInterface()) {
> +    case qemu_nvme_mi:
> +        retval = qemu_mi_close();
> +        break;
> +    default:
> +        break;
> +    }
> +    return retval;
> +}
> +
> +int hal_i2c_write(uint8_t *data_out, uint16_t num_bytes)
> +{
> +    int retval = -1;
> +    switch (GetSidebandInterface()) {
> +    case qemu_nvme_mi:
> +        retval = qemu_mi_write(data_out, num_bytes);
> +        break;
> +    default:
> +        break;
> +    }
> +    return retval;
> +}
> +
> +int hal_i2c_read(uint8_t *data_in, uint16_t num_bytes)
> +{
> +    uint32_t retval = -1;
> +    switch (GetSidebandInterface()) {
> +    case qemu_nvme_mi:
> +        retval = qemu_mi_read(data_in, num_bytes);
> +        break;
> +    default:
> +        break;
> +    }
> +    return retval;
> +}

I'm really not a fan of having non-standard interfaces. If you were
going to do that, though, you should create a struct of function
pointers so that you don't need these repetitive "switch (...)"
statements.

But if we're going to have OOB MI support in toolign, they should all
use the same standard defined interface.

