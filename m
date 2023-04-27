Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7486F00E1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 08:38:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prvF5-0002nX-Uc; Thu, 27 Apr 2023 02:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prvF4-0002nN-6Q
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 02:36:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prvF2-0007rQ-CE
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 02:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682577391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ni/OuRER6ioVuMy6vgc5MZo2UeJz/5TOyTgq9xkm5po=;
 b=ioZx976NDmC0BwOERuXOi/H4o3yyNYxJXJZgtIKXXrPwbqq/UqRAP0V8SVKnJNKf/EMq70
 WobWiGxdmU+NEhBD+X3n32E3FP4jlJD98hrX7wNhnUh3F4O9fg+MBBoYLp+/gIkwiFj9ww
 7tEGyE3Q4mNLZLaTki2sI1QQrK/xQ/0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-o-SVN7n_NsGZ71E0swAu8A-1; Thu, 27 Apr 2023 02:36:27 -0400
X-MC-Unique: o-SVN7n_NsGZ71E0swAu8A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f315735edeso7699165e9.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 23:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682577386; x=1685169386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ni/OuRER6ioVuMy6vgc5MZo2UeJz/5TOyTgq9xkm5po=;
 b=jUuuorKNT/5h2UJ7bMs8sinVBTpEuUJswtSJwRefCGc6f69WCV2reODlL1YNjOubnY
 rs0Hb23JQjUyUx8LN6AMGm7tdCVadRpyxSXitsaoUnQN8vP4Y8+U0o7U7WQjRC2v/hxL
 Viz0bwT9aI9hs87oiTvh+5vLpHetU2TC8QQ34meknQpreyOh7+TxgMXDvAVKRxzgKWIq
 2UZ0z3gvdMR4qVfBWfr2JhoJnv6Tu+fAAX6nKBg/Vw2dLORyUFSK/g0x1Xdqz3Jvjw6J
 RnP3kNHAd+EL3m/fZqdEA9+rZ59UGFPyUiL/XUtRCUDeYlORgz+oEogmS8xVaA+lTU0J
 ZJIQ==
X-Gm-Message-State: AC+VfDzEu4tkc32BD4bcrnBC5Ttqj3rkJmcQIIZKEafy3lfy/piQG4X9
 pbMnOKDSa+TQrkdl6XromxMVrFkKzsarbsQpN4h/ytmoAsmEDFTkXl7ql1rssIjKTUpBWoj7p84
 Gb5fdbgt5TSMeM8o=
X-Received: by 2002:adf:f205:0:b0:2f0:2e16:7e0c with SMTP id
 p5-20020adff205000000b002f02e167e0cmr3335231wro.26.1682577386140; 
 Wed, 26 Apr 2023 23:36:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5D2SbucKCBu1i9/VmxgHteMDtv/tmQWEfpzpFhq9eJB5LRtLjBziAD8nx9yyvF+J37UO3Zww==
X-Received: by 2002:adf:f205:0:b0:2f0:2e16:7e0c with SMTP id
 p5-20020adff205000000b002f02e167e0cmr3335202wro.26.1682577385849; 
 Wed, 26 Apr 2023 23:36:25 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a5d4bc7000000b002fefe2edb72sm17552051wrt.17.2023.04.26.23.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 23:36:25 -0700 (PDT)
Message-ID: <3facd914-1518-3dc4-84bc-4fca921bb7a3@redhat.com>
Date: Thu, 27 Apr 2023 08:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 8/8] raven: disable reentrancy detection for iomem
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "open list:PReP" <qemu-ppc@nongnu.org>
References: <20230426161951.2948996-1-alxndr@bu.edu>
 <20230426161951.2948996-9-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230426161951.2948996-9-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 26/04/2023 18.19, Alexander Bulekov wrote:
> As the code is designed for re-entrant calls from raven_io_ops to
> pci-conf, mark raven_io_ops as reentrancy-safe.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   hw/pci-host/raven.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
> index 072ffe3c5e..9a11ac4b2b 100644
> --- a/hw/pci-host/raven.c
> +++ b/hw/pci-host/raven.c
> @@ -294,6 +294,13 @@ static void raven_pcihost_initfn(Object *obj)
>       memory_region_init(&s->pci_memory, obj, "pci-memory", 0x3f000000);
>       address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
>   
> +    /*
> +     * Raven's raven_io_ops use the address-space API to access pci-conf-idx
> +     * (which is also owned by the raven device). As such, mark the
> +     * pci_io_non_contiguous as re-entrancy safe.
> +     */
> +    s->pci_io_non_contiguous.disable_reentrancy_guard = true;
> +
>       /* CPU address space */
>       memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
>                                   &s->pci_io);

Reviewed-by: Thomas Huth <thuth@redhat.com>


