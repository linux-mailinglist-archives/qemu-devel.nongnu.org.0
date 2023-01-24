Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62334679FFF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 18:19:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKMw2-0004Ao-OH; Tue, 24 Jan 2023 12:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKMvz-0004AS-8Q
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 12:18:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKMvx-0006Dl-2U
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 12:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674580688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bb+2+9M4tQrkHnTse1AoDiFnIqiAW4ucIxtrUco4jog=;
 b=coOxBBbEd6Z/DEGQk1IDhNT1qs/bNkr4eCUkNg+HN/9aKcMZ5UYBM3Gh/9p6QkfJ9A3vPn
 +seH24qvjA1DwmkY9lgiU/NBlQc52bq/Grsy+2RACvRvrG2orNJ/RF/L5njd+wMHBl4HWR
 O/M82jfw4NJ8fE8y0ELYDPwDSPxqSx0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-395-_JmGXNMkOP6XBURho3EfTw-1; Tue, 24 Jan 2023 12:18:04 -0500
X-MC-Unique: _JmGXNMkOP6XBURho3EfTw-1
Received: by mail-ej1-f72.google.com with SMTP id
 wz4-20020a170906fe4400b0084c7e7eb6d0so10272411ejb.19
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 09:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bb+2+9M4tQrkHnTse1AoDiFnIqiAW4ucIxtrUco4jog=;
 b=F3MggsU22Fv0/gWfZjcdYEQEmT/cczhL9PMlt/MnhHrM3FqofBQDsO5arWOm51OMJu
 VPpp4jM5UpStwKj05iK61V2Pj53xw9nkYnnseBh3Z9d+xrbdrEEjIi74r+f8sAkg2Wuw
 FAu7BDS7eNzpU3jM7jh/qtdfJumTdzeynnfIBuaCb4WcdAGOQhj9UbKod+ZQNu/zHD30
 P9AjamATjDQdh0lOry+WFGVXLYfARoEAKv5yh911uga4FCEagER9dm7EYzLswEGBDapS
 gF7rKhE7s1XggOX1ZvMEmm1ofxoKL2LU7OEQ3FtP8YUVU1X7kTIWx2kcjUh1RSFxWaPX
 F6RA==
X-Gm-Message-State: AFqh2kowjpwVIhvk9k7Jk+/RH+Jhn1HsOCLxiozIjaTIIsm99/JdPVbk
 u+UrT9yJrsC8dOy5qHLy9v/kzQFbRAeZUjGPZPNgru07Vy/3rpaavpaFLJ53MaC6QXwoC20AGGi
 FuT9nia4czmpNuC8=
X-Received: by 2002:a17:906:f74a:b0:86b:5507:8aef with SMTP id
 jp10-20020a170906f74a00b0086b55078aefmr28533670ejb.65.1674580682506; 
 Tue, 24 Jan 2023 09:18:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvAo/Waszw2Yutbitp8qFoqguGpIBvxNOA0Ngx3sMzjXJ3/vX11e0iFPlqX0ChSjsV3/oQXEQ==
X-Received: by 2002:a17:906:f74a:b0:86b:5507:8aef with SMTP id
 jp10-20020a170906f74a00b0086b55078aefmr28533652ejb.65.1674580682308; 
 Tue, 24 Jan 2023 09:18:02 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 mb17-20020a170906eb1100b007c0a7286ac8sm1168374ejb.69.2023.01.24.09.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 09:18:01 -0800 (PST)
Date: Tue, 24 Jan 2023 18:18:01 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH 4/7] hw/acpi/ich9: Use ICH9_PMIO_GPE0_STS just once
Message-ID: <20230124181801.0511869b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230122170724.21868-5-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-5-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Sun, 22 Jan 2023 18:07:21 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> Cosmetic change emphasizing 

... how 3/7 makes it more confusing
  
> that always the actual address of the gpe0
> block is returned.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/acpi/ich9.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index f8af238974..40a20e01ea 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -348,7 +348,9 @@ static void ich9_pm_get_gpe0_blk(Object *obj, Visitor *v, const char *name,
>                                   void *opaque, Error **errp)
>  {
>      ICH9LPCPMRegs *pm = opaque;
> -    uint64_t value = pm->io.addr + ICH9_PMIO_GPE0_STS;
> +    uint64_t value = pm->io.addr + pm->io_gpe.addr;

do not poke inside of MemoryRegion, right API to use here
if you really want to get it from memory region would be
  
memory_region_find && MemoryRegionSection::offset_within_address_space
magic

I'd just drop 3/7 and this patch

> +
> +    assert(&pm->io == pm->io_gpe.container);
>  
>      visit_type_uint64(v, name, &value, errp);
>  }


