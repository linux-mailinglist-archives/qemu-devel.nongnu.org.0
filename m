Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0400D68D1C5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:51:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJhQ-0006LQ-De; Tue, 07 Feb 2023 03:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJhN-0006KY-Sm
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJhK-00058a-6o
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675759889;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=J5RPqdvU1ZjlDacrj4WFFjyTwcINaahcMI9ncmEqXNk=;
 b=KCjPaJWcY8IVowUhaw/EI4sBD/ehP20M/w7rVlBPKqUHlP3SMJ/aEuemXZC2RLOe+pmsK6
 bmkfCx2C4TF5Nlba8jaowudq9Pjmc344dvmPW1xZG5afOF2hBUmJClB9DYepvTldL5kpQ4
 J1QDvz2esTGQmXR2XZhMDH6/vT4SBhM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-Rpk6JfopPm-frUzaxnKoOw-1; Tue, 07 Feb 2023 03:51:28 -0500
X-MC-Unique: Rpk6JfopPm-frUzaxnKoOw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso6924916wms.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J5RPqdvU1ZjlDacrj4WFFjyTwcINaahcMI9ncmEqXNk=;
 b=RNZUoqWB+/UgRui2yVg7aNNi80nxJMBXxi+ZQeYgjDRdAeOG3g+t4JjRZ4LI06OE7N
 pAxkQU5RllQlAk3pJmh6VZGDcLydWXt9PUvAySyi+1CNOez3MhmfcsJfIA0Z9+0MvNWe
 axP6r4a+ZNNycZE6uEz71GllbX8xukO7XBnYZyZnnxTP+YVQRaI69P6U6bOf8nyJQ4vs
 Uq77bPcTfteAkcY2WgvUZm8l8J8DDQemkMMhLYZzd6Lfa6FVFsWGgCBPX+5TqAbMf6lI
 PiWnoCaW8/0KvqPNduaS1YEbCDVxz8qkovtYu14TzInUWf/iY9KQ935PFHn1/GWhPEa7
 O0tA==
X-Gm-Message-State: AO0yUKUZJQuU+XIBBnnPF0dHuz9PsM7fibdS+IAMT9e/NSOC0FAu86Uq
 V7jm6prqaunfVbePaTC0fhSGMmeRvNO2KwB3nLTQ5RYAoR3u39aBH+KHSuYrkTJWYG8FqxOA7tI
 cvAcw/X0GPF9AfpU=
X-Received: by 2002:adf:e610:0:b0:2bf:d7c1:ad95 with SMTP id
 p16-20020adfe610000000b002bfd7c1ad95mr1684847wrm.16.1675759887278; 
 Tue, 07 Feb 2023 00:51:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+TJZxhtVGy9CMPTMB9yLeXcVmjd7DpFcL7CM7SUu47CymEX4H5DzVE7O2J0rinVg45CEs6uQ==
X-Received: by 2002:adf:e610:0:b0:2bf:d7c1:ad95 with SMTP id
 p16-20020adfe610000000b002bfd7c1ad95mr1684830wrm.16.1675759887059; 
 Tue, 07 Feb 2023 00:51:27 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d694f000000b002c3e1e6eda0sm7216522wrw.99.2023.02.07.00.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:51:26 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 jiri@resnulli.us,  jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com,  zhanghailiang@xfusion.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 06/12] hw/acpi: Dumb down acpi_table_add() stub
In-Reply-To: <20230207075115.1525-7-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 7 Feb 2023 08:51:09 +0100")
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-7-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 09:51:25 +0100
Message-ID: <87cz6lc0z6.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> The QERR_ macros are leftovers from the days of "rich" error objects.
> We've been trying to reduce their remaining use.
>
> acpi_table_add() is only ever called on behalf of CLI option
> -acpitable.  Since qemu-options.hx sets @arch_mask to QEMU_ARCH_I386,
> it is reachable only for these targets.  Since they provide a real
> acpi_table_add(), the stub is unreachable.
>
> There's no point in unreachable code keeping QERR_UNSUPPORTED alive.
> Dumb it down to g_assert_not_reached().
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


