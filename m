Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0921A67ED08
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 19:06:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLT6V-0001uX-JS; Fri, 27 Jan 2023 13:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pLT6S-0001uA-Se
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:05:32 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pLT6Q-0000TH-R1
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:05:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E210A618C5;
 Fri, 27 Jan 2023 18:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C926C433D2;
 Fri, 27 Jan 2023 18:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674842720;
 bh=FNk5O2nMDZRZ4nsVzbrBX9duBUtNbM5zNga9Ek+YZGg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ispgKXK1vVVFxa3AQ2E/5cMSUiDFBlEHjaype2LY7U49b4Lxm8eWafy0YWxqsLios
 nymvWqppUK/Xo4LBuk8dvGF+onNyt9MFcey3m9EncbaNqHqM/SuTRP5mNNNFdt7LVj
 j4FJhWWZIc2WJwjqiQV8pSdR1MS9mcUkDlziRxFlS0zDzBuDsoaZtpe5N5AeowhrHV
 jS04+2JF9XKOKVlYEsAGifun5rrDG/lgTMB3nH4gUMD+L5WsIUDQCFH747xIgO58vs
 HZs997JaajYhREC+ym7/UtZH/M8iuYcIcOUNhfVgyFQK0LlA080Gh0nN+DxdWa1//7
 kpFq7gcQR8p3A==
Date: Fri, 27 Jan 2023 10:05:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] hw/xen/xen_pt: fix uninitialized variable
In-Reply-To: <20230127050815.4155276-1-marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2301271004530.1978264@ubuntu-linux-20-04-desktop>
References: <20230127050815.4155276-1-marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="8323329-1316837341-1674842720=:1978264"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1316837341-1674842720=:1978264
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 27 Jan 2023, Marek Marczykowski-Górecki wrote:
> xen_pt_config_reg_init() reads only that many bytes as the size of the
> register that is being initialized. It uses
> xen_host_pci_get_{byte,word,long} and casts its last argument to
> expected pointer type. This means for smaller registers higher bits of
> 'val' are not initialized. Then, the function fails if any of those
> higher bits are set.
> 
> Fix this by initializing 'val' with zero.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen_pt_config_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> index cde898b744..8b9b554352 100644
> --- a/hw/xen/xen_pt_config_init.c
> +++ b/hw/xen/xen_pt_config_init.c
> @@ -1924,7 +1924,7 @@ static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
>      if (reg->init) {
>          uint32_t host_mask, size_mask;
>          unsigned int offset;
> -        uint32_t val;
> +        uint32_t val = 0;
>  
>          /* initialize emulate register */
>          rc = reg->init(s, reg_entry->reg,
> -- 
> 2.37.3
> 
--8323329-1316837341-1674842720=:1978264--

