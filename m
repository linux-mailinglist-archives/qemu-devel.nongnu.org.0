Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D043D2B55
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:44:41 +0200 (CEST)
Received: from localhost ([::1]:59830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ckS-00078Z-Rx
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6chm-00050S-IB
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6chj-0003H2-46
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626975709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtAyOBo648YBw063GiZxEBn3OMYm/GR2zthTTmvAvQ4=;
 b=iY3JHCAfGi6D0Sp/kSWN/FssHpLHcooQ+sL/2c01uuAy7BQc9fW59T6CuRiTWxP9psHUky
 ui10yyhWNOas6hOC1Y6evtvdBEK+gd1vdGlhhLezSWy8ZySYTMhXET/po6l3AvlG2eoJvm
 99WDnrjoX5JBPlp8gyvf8P+IjsFATpA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-2oQdgo3oMy2dXSdcaSbbPg-1; Thu, 22 Jul 2021 13:41:48 -0400
X-MC-Unique: 2oQdgo3oMy2dXSdcaSbbPg-1
Received: by mail-wr1-f72.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so2721616wru.6
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QtAyOBo648YBw063GiZxEBn3OMYm/GR2zthTTmvAvQ4=;
 b=pPFoF83ysHBVpmXyUy3YHT0vSADk3/7qdo2Oi4AwK36qV27sB//I+Mn3FTGCLWZay9
 qj4rN60YW4E0cia2zZi6Z5OrNFy/iou7nyH4J4Z6I5QebFYb6WWGtrjcK3TdXpb/+j4E
 yW8by0myXOgXQ++RoPbnAkIg7wFOlT3WRocseqEb/IvBdE+8SaDNpmNeyZgdYCiQaZhH
 W885tuqu++cI/WtjG4frqCfAyhcUYreFwM6QD7APJpNX5AAuryFDMCzCRBxDFck3Ey79
 oAb0PnARshxXTWLTHgTC8us7QJzoGJZ0dG0u/ke5ju44G96ER7HhGKoSJR5DO3ND8mik
 Azfw==
X-Gm-Message-State: AOAM531xkmfrTNlPhuTOu82Z/lqIG4CqxsIZZa6uOUzIfl4qRsYsSSmS
 r0YICr7DbvgY4rpRfz6WujjHMExu2zkq/n+xnlrEzO6d0xsMVNeFPLvBw+qLamz219bcg//Z/0o
 4kabzOrGANJjJEpw=
X-Received: by 2002:adf:f642:: with SMTP id x2mr1112346wrp.37.1626975707485;
 Thu, 22 Jul 2021 10:41:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbXVZBfxcZUr9VkvNrCTt8ROuydjg+AusjLOeGhC7G3sGVrtJPOL3FXwdVkpP9ivGP8spzTw==
X-Received: by 2002:adf:f642:: with SMTP id x2mr1112326wrp.37.1626975707263;
 Thu, 22 Jul 2021 10:41:47 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id j3sm21899467wms.30.2021.07.22.10.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:41:46 -0700 (PDT)
Subject: Re: [PULL 04/15] chardev-spice: add missing module_obj directive
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210722153612.955537-1-pbonzini@redhat.com>
 <20210722153612.955537-5-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e87624e5-3263-9282-23f4-5d32af61a7a2@redhat.com>
Date: Thu, 22 Jul 2021 19:41:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722153612.955537-5-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Frederic Bezies <fredbezies@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/21 5:36 PM, Paolo Bonzini wrote:
> The chardev-spicevmc class was not listed in chardev/spice.c, causing
> "-chardev spicevmc" to fail when modules are enabled.
> 
> Reported-by: Frederic Bezies <fredbezies@gmail.com>
> Fixes: 9f4a0f0978 ("modules: use modinfo for qom load", 2021-07-09)
> Resolves: //gitlab.com/qemu-project/qemu/-/issues/488

Thanks for the detail of updating to full url, however "https:'
got lost ;) Gitlab doesn't notice because of the leading '//'
I suppose. Not worth respining the pullreq.

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20210719164435.1227794-1-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  chardev/spice.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/chardev/spice.c b/chardev/spice.c
> index 3ffb3fdc0d..bbffef4913 100644
> --- a/chardev/spice.c
> +++ b/chardev/spice.c
> @@ -382,6 +382,7 @@ static const TypeInfo char_spicevmc_type_info = {
>      .parent = TYPE_CHARDEV_SPICE,
>      .class_init = char_spicevmc_class_init,
>  };
> +module_obj(TYPE_CHARDEV_SPICEVMC);
>  
>  static void char_spiceport_class_init(ObjectClass *oc, void *data)
>  {
> 


