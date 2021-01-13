Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E48A2F4C4C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:39:21 +0100 (CET)
Received: from localhost ([::1]:38330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgMq-0007SI-LQ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgKc-0005tC-7u
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgKZ-0007u6-M8
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610545017;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozCjCj0KoOgE4Zaz1sfJqi0oRDqpyppOnSMefLyC/cU=;
 b=N6VxJW7khd23frHoRdlaByRIid+QBDgrIXKJ6An1jG72EeYrilNHOzBiivat82TD2RdWKF
 hW1le5YFgJlsHBRrehnSLStLVDpoRQIsidXIlK994MZUxuXObs8anRLlhN2q0YI+LUDMUb
 d51R+womueltejgHD9O0qjqZa7FMTfs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-WhuzXEoRPvKFBdmrxNkQqA-1; Wed, 13 Jan 2021 08:36:54 -0500
X-MC-Unique: WhuzXEoRPvKFBdmrxNkQqA-1
Received: by mail-wr1-f70.google.com with SMTP id u3so959527wri.19
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 05:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4vGOXvngMiIHEkvOxc0i0Ro7ST82YJ/WLMStNoEm3DU=;
 b=gA8LLEmKLXgUM6ebBxh6a0lU9sV5yA5na93YElit7fgEt7y/TVXAi7pFJUbybSDSgS
 JT1FycgDe+emR+AqB/lDJAphmmCiY/uWzMy42GjR5/2vzGC/8ktr1KzA7W+WHHLnRXbS
 BNmKisoZZUUmBPUl8YIGYPtui8ndG00LZblMZXRSu+KbRSPb2dnUoU8Zf44hS6hd6bT6
 3xNkPCVmyIEzV78PknQY1UPtbUPHbW0jCt3IwXyW2sigsQ0EZWTpt/4cRqn4basuUlzo
 Bofqr7OwXDHIPjeO9zzP3+TJYH6gkUcMWes1M8HmhdQgcF40j2iyNIFQwRdn1+8spSTx
 NDQA==
X-Gm-Message-State: AOAM531tjrFYGDxaJeIAtSHW15ImR5qvpMe7dk3xyi9tsSJjTdsYYx+Z
 D+YgsSBI2/wKWw4yV6nlK8CLoM7NpW1NkROG5adKaeUitRJSunydqidAaV2QuNP+WeZMYJLw5Vm
 oI4sJ0gGbJJN+6kI=
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr2248424wmj.146.1610545013346; 
 Wed, 13 Jan 2021 05:36:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziKLTKtR3aMg+YfxIw1PqJnlRcyuT7kiK8U4TP7hhEt08uFhqYq0ypSUAo59dT+YtD92mBaA==
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr2248404wmj.146.1610545013163; 
 Wed, 13 Jan 2021 05:36:53 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id l8sm4332932wrb.73.2021.01.13.05.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:36:52 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v6 03/11] hw/ssi: imx_spi: Convert some debug
 printf()s to trace events
In-Reply-To: <20210112183529.2011863-4-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 Jan 2021 19:35:21
 +0100")
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <20210112183529.2011863-4-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 13 Jan 2021 14:36:51 +0100
Message-ID: <87mtxdgdqk.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> Convert some DPRINTF() to trace events.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
> index 612d3d6087a..20fcaf32df6 100644
> --- a/hw/ssi/trace-events
> +++ b/hw/ssi/trace-events
> @@ -1,3 +1,5 @@
> +# See docs/devel/tracing.txt for syntax documentation.
> +
>  # aspeed_smc.c
> =20
>  aspeed_smc_flash_set_segment(int cs, uint64_t reg, uint64_t start, uint6=
4_t end) "CS%d segreg=3D0x%"PRIx64" [ 0x%"PRIx64" - 0x%"PRIx64" ]"

Not that I am against the comment, but it looks spurious on this patch.


