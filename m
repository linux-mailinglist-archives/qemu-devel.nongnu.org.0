Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3F66A41E5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:44:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcpB-0005s8-2R; Mon, 27 Feb 2023 07:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWcoU-0005dR-1j
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:41:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWcoS-0001pn-L7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677501663;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JlBgzsgSw8DYt21D6Sr1RCIpUsY9HRBJVPv+S2ORs0k=;
 b=J7/VwChndQuf0VseibRbnFweWBON+2nvydKqXeKfOfqgDm9M7qRAMCVpuoA8UtOyNunkxO
 ZQE5IU6FGDXIe8x1Vqphp5gTaMRnC3YA6EuErjkvWjzmUzw/WXWR7CoD9Al9vEK/2ErP82
 3qrcfG6ia4Zj3XVZQJFaXQyRlCourwk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-113-IxKs219HNJKzfkNLnqx2xA-1; Mon, 27 Feb 2023 07:41:02 -0500
X-MC-Unique: IxKs219HNJKzfkNLnqx2xA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so2343825wms.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JlBgzsgSw8DYt21D6Sr1RCIpUsY9HRBJVPv+S2ORs0k=;
 b=rJtftw9qDubUkwIto8v3q0cAA6G1QkIe5eMMyPfzGM37llXpWRfHDGmnVMXjyZ4qUI
 7svh12arvd4Y5Oc/PJdQr/ivcGxN2TywtV8vQFZ3dX+sIAFaTQgORxL4CGkn5JlcMV6k
 bflZi1D0z+yidrPGMCNpcB902ELxpZegpbn3bjOX1u2praWd28MSiM29Ta2SNtgeTaWm
 McRDIf7XdXag4/A7ZiokytrtWbn0FIrop5pZ997cUn2XOeTIn628e9/zq/yzNSSPZmrI
 u0NEH4A71LIboQetQluwwV0ysWYcphXilUUv4cwgWgP0GRi8iZKZfyMCZ2yWbXexnBgY
 yYMw==
X-Gm-Message-State: AO0yUKXHAMxBFc5yF1ls6SJQjYUwMR6lg/OgqAbdzM3lxNo8skBbBrIT
 ++1h6354GG4SKAhy3shjHABx8cx535rPGOMn6kZixCag9lxDOZHtsBwTxE/2atQWa0tn9L6D7H0
 dCDoVCTYi/k/M5GY=
X-Received: by 2002:a05:600c:755:b0:3eb:3945:d3f9 with SMTP id
 j21-20020a05600c075500b003eb3945d3f9mr5026848wmn.4.1677501661291; 
 Mon, 27 Feb 2023 04:41:01 -0800 (PST)
X-Google-Smtp-Source: AK7set/rLrq3CscNsPD4MXBZeTAME8REk9KfeW8ICOXxEyShEKfQjmuMw2CAEPKTzl135JLjGmMxrw==
X-Received: by 2002:a05:600c:755:b0:3eb:3945:d3f9 with SMTP id
 j21-20020a05600c075500b003eb3945d3f9mr5026832wmn.4.1677501661059; 
 Mon, 27 Feb 2023 04:41:01 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c470700b003eb3933ef10sm7405311wmo.46.2023.02.27.04.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:41:00 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] qapi: Do not generate default switch case in
 gen_visit_object_members()
In-Reply-To: <20230224155451.20211-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 24 Feb 2023 16:54:50
 +0100")
References: <20230224155451.20211-1-philmd@linaro.org>
 <20230224155451.20211-2-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 27 Feb 2023 13:40:59 +0100
Message-ID: <87a60zp9gk.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> When iterating over a QAPISchemaEnumType, all possible
> values are covered. The 'default' switch case is unreachable,
> remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Althought my qapi is rusty.


