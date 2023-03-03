Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118DF6AA034
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:40:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYBEo-0000CA-EY; Fri, 03 Mar 2023 14:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <somlo@andrew.cmu.edu>)
 id 1pYBEn-0000Bp-2k
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:38:41 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <somlo@andrew.cmu.edu>)
 id 1pYBEl-0001Xp-G7
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:38:40 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id op8so2467053qvb.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 11:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmu.edu; s=google-2021; t=1677872313;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HYQ/b/2CMo0jQZJbl9gbztbb/ds7IDeF+eF3lNwAa+E=;
 b=K+wxfTujSJzhr547gDW560HtpnMx27zP4k30p5i8muJ4xRciDbc7FbZRVsoKV8HTuV
 44z32zSMrVEk/ivCmb2jTREfE4m+O7Pz/qEjziFnraeZwQWJzk33TiUQKiutakpx1am4
 L13odP2/Bv8vfiMlpR+aGKQlKNlL5o3pge9UTCFWhp6hgbDXL1tKOiXZMtCmP/r7Cv5/
 ebn148CLiRFPy+SoPzbEU6yag+m5Ft9F+5hJyxYMnlfKpzENQcNeFKgWwcB5itQzcxGJ
 tCMyAumYLL+STXBAvplYXbZnrcvxQSRgFaQyy5UWMQ2859c05ZPxwbOMXgGuOBD4oesq
 mPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677872313;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HYQ/b/2CMo0jQZJbl9gbztbb/ds7IDeF+eF3lNwAa+E=;
 b=dEa6MCQTbHu3/nOFWsKj1rtZJu86q5/TdVOiwV34qZ8itNbB7NK5Dfq0I+LRcuaX7T
 GQlk9I8zLfCButj/YhY8eRCZQ5/R3AshqEOO7CWVwd83Ybl5deo/9fepdhs2xxeukQCu
 PiZVIQjBm+HvWkpThG47FwCqaMr0EmTl6Q68tfNC8iBPVN82RhcUIv2ZeDCXWZ0U6Xop
 RhaB3KuIu+5khjD8GJ2f6YbhNHDDHBIQcsLhskbkqJgPWMol+Vmz1khKQpU1Y1Q0glAh
 +0JivL+KLAHua9PkWywps4RMUuYyo6d5xMIbKuSTkvqgHQNJ/qzBXsdfMO6QZiyHMQxx
 4rDQ==
X-Gm-Message-State: AO0yUKUEpWiWSfldcH2PGDFiAVtWg2tC46GtQsFjeO1zkEsOcQ5p6NGv
 z23XOHfmkiYpPYxykuTzKuH7ig==
X-Google-Smtp-Source: AK7set8SAOoXYTlT0gXqz99dKGbNwHBxgqZB5lr3AWbdV3Fq4g/KydoSI12RgxFiqZ48VoTewdmFIA==
X-Received: by 2002:a05:6214:1c8e:b0:56b:eda1:de3e with SMTP id
 ib14-20020a0562141c8e00b0056beda1de3emr4744326qvb.36.1677872313396; 
 Fri, 03 Mar 2023 11:38:33 -0800 (PST)
Received: from errol.ini.cmu.edu (pool-72-77-81-136.pitbpa.fios.verizon.net.
 [72.77.81.136]) by smtp.gmail.com with ESMTPSA id
 29-20020a05620a049d00b00741a984943fsm2321202qkr.40.2023.03.03.11.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 11:38:33 -0800 (PST)
Date: Fri, 3 Mar 2023 14:38:31 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qemu_fw_cfg: make kobj_type structure constant
Message-ID: <ZAJMt3nMgvfUpKAi@errol.ini.cmu.edu>
References: <20230227-kobj_type-firmware-qemu-v1-1-fc0c8b44424f@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230227-kobj_type-firmware-qemu-v1-1-fc0c8b44424f@weissschuh.net>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=somlo@andrew.cmu.edu; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Feb 27, 2023 at 03:19:56AM +0000, Thomas Weiﬂschuh wrote:
> Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
> the driver core allows the usage of const struct kobj_type.
> 
> Take advantage of this to constify the structure definition to prevent
> modification at runtime.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  drivers/firmware/qemu_fw_cfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
> index a69399a6b7c0..f41de793f41b 100644
> --- a/drivers/firmware/qemu_fw_cfg.c
> +++ b/drivers/firmware/qemu_fw_cfg.c
> @@ -452,7 +452,7 @@ static void fw_cfg_sysfs_release_entry(struct kobject *kobj)
>  }
>  
>  /* kobj_type: ties together all properties required to register an entry */
> -static struct kobj_type fw_cfg_sysfs_entry_ktype = {
> +static const struct kobj_type fw_cfg_sysfs_entry_ktype = {

Reviewed-by: Gabriel L. Somlo <somlo@cmu.edu>

Thanks,
--Gabriel

>  	.default_groups = fw_cfg_sysfs_entry_groups,
>  	.sysfs_ops = &fw_cfg_sysfs_attr_ops,
>  	.release = fw_cfg_sysfs_release_entry,
> 
> ---
> base-commit: 2fcd07b7ccd5fd10b2120d298363e4e6c53ccf9c
> change-id: 20230227-kobj_type-firmware-qemu-7746b6320db0
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 

