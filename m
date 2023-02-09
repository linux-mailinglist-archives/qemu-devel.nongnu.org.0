Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC57690DA1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:54:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9E7-0006tt-97; Thu, 09 Feb 2023 10:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=au1U=6F=zx2c4.com=Jason@kernel.org>)
 id 1pQ9E4-0006ta-GK
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:52:44 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=au1U=6F=zx2c4.com=Jason@kernel.org>)
 id 1pQ9E2-0005lB-BG
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:52:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E18A7B8214B;
 Thu,  9 Feb 2023 15:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39A6C433D2;
 Thu,  9 Feb 2023 15:52:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="T7479kc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675957953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ClkILBFhwZ0hiKBY6JMu424+AE+9QOn/sCNADO5raM4=;
 b=T7479kc0O5QmNDeC9Qyyjh2xEhjUPOaZMFArkBoVaJdeKu5s8jYbfZ3xK5J1iDriwR9uXN
 3rZodz28XhNZYDKZ2BNgwrbtP0eDeGzvsjyTpVCHnMY+cbpXIJyED9KhTuTJmG/5qUk7Jv
 78ZT6IAAB0MueXiEXNco+4O6qJhrNR8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 79d27562
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 9 Feb 2023 15:52:33 +0000 (UTC)
Date: Thu, 9 Feb 2023 16:52:32 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH RFC 6/7] Revert "x86: return modified setup_data only if
 read as memory, not as file"
Message-ID: <Y+UWwJRY/ejrIqv7@zx2c4.com>
References: <20230208211212.41951-1-mst@redhat.com>
 <20230208211212.41951-7-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208211212.41951-7-mst@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=au1U=6F=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On Wed, Feb 08, 2023 at 04:12:51PM -0500, Michael S. Tsirkin wrote:
> This reverts commit e935b735085dfa61d8e6d276b6f9e7687796a3c7.
> 
> Fixes: e935b73508 ("x86: return modified setup_data only if read as memory, not as file")
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  include/hw/nvram/fw_cfg.h | 22 -------------------
>  hw/i386/x86.c             | 46 +++++++++------------------------------
>  hw/nvram/fw_cfg.c         | 12 +++++-----
>  3 files changed, 16 insertions(+), 64 deletions(-)
> 
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index 2e503904dc..c1f81a5f13 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -117,28 +117,6 @@ struct FWCfgMemState {
>   */
>  void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t len);
>  
> -/**
> - * fw_cfg_add_bytes_callback:
> - * @s: fw_cfg device being modified
> - * @key: selector key value for new fw_cfg item
> - * @select_cb: callback function when selecting
> - * @write_cb: callback function after a write
> - * @callback_opaque: argument to be passed into callback function
> - * @data: pointer to start of item data
> - * @len: size of item data
> - * @read_only: is file read only
> - *
> - * Add a new fw_cfg item, available by selecting the given key, as a raw
> - * "blob" of the given size. The data referenced by the starting pointer
> - * is only linked, NOT copied, into the data structure of the fw_cfg device.
> - */
> -void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
> -                               FWCfgCallback select_cb,
> -                               FWCfgWriteCallback write_cb,
> -                               void *callback_opaque,
> -                               void *data, size_t len,
> -                               bool read_only);
> -
>  /**
>   * fw_cfg_add_string:
>   * @s: fw_cfg device being modified
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index a00881bc64..29a5bef1d5 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -693,12 +693,12 @@ static const VMStateDescription vmstate_fw_cfg = {
>      }
>  };
>  
> -void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
> -                               FWCfgCallback select_cb,
> -                               FWCfgWriteCallback write_cb,
> -                               void *callback_opaque,
> -                               void *data, size_t len,
> -                               bool read_only)
> +static void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
> +                                      FWCfgCallback select_cb,
> +                                      FWCfgWriteCallback write_cb,
> +                                      void *callback_opaque,
> +                                      void *data, size_t len,
> +                                      bool read_only)
>  {
>      int arch = !!(key & FW_CFG_ARCH_LOCAL);

Could you leave these snippets in? This function is useful and will be
needed in the reprise.

Jason

