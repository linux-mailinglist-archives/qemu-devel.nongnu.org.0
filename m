Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28F64C45E7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:20:20 +0100 (CET)
Received: from localhost ([::1]:46836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNaW7-0000Rj-UV
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:20:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1nNa6a-00013U-Ns
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:53:53 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:53740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1nNa6X-0000Hi-Tq
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:53:51 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 04C8C61BE3;
 Fri, 25 Feb 2022 12:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0045C340E7;
 Fri, 25 Feb 2022 12:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1645793625;
 bh=jjBQuBeYq3qaMfp8i+UQXNPw/kN4Q0Mg9LOFbd3gysI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WCqPyv+zxFiY8sTgXAyj29WG6lI03Iz69wsxSc+15tnqswX0riTTvEfZUxrt8mwSV
 9LLMZC8I58YC5Qz2ABrJuPRBtA9AMXnxt8BWoqfg7Kf9kv9LjvOftd3Jo/x5XXoWx5
 8K1QzTydyvwSibjqZEn4XR9T5DWR4VCvlolaH0B4=
Date: Fri, 25 Feb 2022 13:53:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing
 RNG on VM fork
Message-ID: <YhjRVz2184xhkZK3@kroah.com>
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225124848.909093-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=gregkh@linuxfoundation.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, mst@redhat.com,
 raduweis@amazon.com, qemu-devel@nongnu.org, linux@dominikbrodowski.net,
 kys@microsoft.com, ardb@kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 ben@skyportsystems.com, decui@microsoft.com, ebiggers@kernel.org,
 lersek@redhat.com, ehabkost@redhat.com, adrian@parity.io, jannh@google.com,
 haiyangz@microsoft.com, graf@amazon.com, tytso@mit.edu, colmmacc@amazon.com,
 berrange@redhat.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, imammedo@redhat.com, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 01:48:48PM +0100, Jason A. Donenfeld wrote:
> +static struct acpi_driver acpi_driver = {
> +	.name = "vmgenid",
> +	.ids = vmgenid_ids,
> +	.owner = THIS_MODULE,
> +	.ops = {
> +		.add = vmgenid_acpi_add,
> +		.notify = vmgenid_acpi_notify,
> +	}
> +};
> +
> +static int __init vmgenid_init(void)
> +{
> +	return acpi_bus_register_driver(&acpi_driver);
> +}
> +
> +static void __exit vmgenid_exit(void)
> +{
> +	acpi_bus_unregister_driver(&acpi_driver);
> +}
> +
> +module_init(vmgenid_init);
> +module_exit(vmgenid_exit);

Nit, you could use module_acpi_driver() to make this even smaller if you
want to.

thanks,

greg k-h

