Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193234D5F11
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:02:29 +0100 (CET)
Received: from localhost ([::1]:53066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSc6O-0000zT-6K
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:02:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSc50-0007zf-Or
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:01:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSc4x-000281-1S
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646992857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+cN3QVT7seItrKDJqoj9KF76wKSoYy9ZCLTanPmA8s=;
 b=EgIhCX3VuPqkP0ATr5H8l3rSNTqeXxLy7dfc8CmMbtoW5coVPordnqU3Zmscb9vwwz44dm
 Vpq3V02qbtWv0BYuwrdRvGSHI/rieEtbRnt+LPn3W4Pgou9dR5dESA53ziXs9laHIEVQTY
 8eLviYNdvxOHRUrgGNgG3S2niSoLrwU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-eayIonLpNQeTLgo7ACuQ0Q-1; Fri, 11 Mar 2022 05:00:55 -0500
X-MC-Unique: eayIonLpNQeTLgo7ACuQ0Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 co2-20020a0564020c0200b00415f9fa6ca8so4612161edb.6
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 02:00:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+cN3QVT7seItrKDJqoj9KF76wKSoYy9ZCLTanPmA8s=;
 b=JnAZmJn0To5J4rfETppewFoJDSpDPSQfxwt2zkzyASLPivSBOEdrj7m+PsDcUpHXwt
 8PvCih5x8e5mNslRCIW9IlBi+JbOWZ1pyb3KUIhNFSxJGpUzi4n7JqgRhBBzGUYpV9jn
 kFZyGH0/2bhnapt8//sY0Od71FSelgnBOD+wxYWLmoY5G+pEkJyFhnD+YrmeCDkOQKLP
 x5R8cgwq16sisnpQTcEhOvNb1KVdnbcAm0nOa0roQR7p54QukDHIIkimaPE9y5xltAbI
 27R3DmJdlZtsszYjWLkLS94WAmPYzpUNnkix9UsgNn4r1Q+h4gNwWL4gZ3Ycd4tvM17s
 iHug==
X-Gm-Message-State: AOAM531VPjUrfdelS2J0zoncdzJBlMO85gPIhE5cQeYtwHtaiDbaDiDb
 K18BJ/dfaWhu0URN8T/VJ2Oot6E2XG54SHyx8t3Vu7vVFyl4TMcRkBUGkl41ADfozRSUceX7mVp
 A1Te7i6OjFLgZib4=
X-Received: by 2002:a17:906:4795:b0:6db:7c4e:d2be with SMTP id
 cw21-20020a170906479500b006db7c4ed2bemr7187436ejc.682.1646992854619; 
 Fri, 11 Mar 2022 02:00:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzf88hHlVbNYXzbV96nNQnVr9aIrwRZ80MZYFy+VyF0k+6yxkZksEM0tSUb3nkQgdlCl8mluw==
X-Received: by 2002:a17:906:4795:b0:6db:7c4e:d2be with SMTP id
 cw21-20020a170906479500b006db7c4ed2bemr7187416ejc.682.1646992854418; 
 Fri, 11 Mar 2022 02:00:54 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm3075504edt.15.2022.03.11.02.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 02:00:54 -0800 (PST)
Date: Fri, 11 Mar 2022 11:00:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 01/11] tests/acpi: allow virt memory hotplug changes
Message-ID: <20220311110052.4fab2aa3@redhat.com>
In-Reply-To: <20220311053759.875785-2-kraxel@redhat.com>
References: <20220311053759.875785-1-kraxel@redhat.com>
 <20220311053759.875785-2-kraxel@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Mar 2022 06:37:49 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index dfb8523c8bf4..e569098abddc 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/SSDT.memhp",


