Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7702E6C3218
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 13:57:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebXQ-00074t-Bv; Tue, 21 Mar 2023 08:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pebXN-00074P-DP
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 08:56:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pebXL-0006WX-T0
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 08:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679403382;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IiFVpn9jj6h337K3NSpiQFh78X4x0ZgqQ+4RHW0aroc=;
 b=dYobzfrMKzRtxr1444VytPbDPS9cW5wmKlwGlXEZ5WsJCuaGjcAkZwoCDCnjmN0fG9gZmL
 kRLdpvXhKstFhnLEbSGDJ3F6OFlpuh0CgWzEZC26A+DNXbg6xztwzfE/4+gzR1GauzljCS
 Y8D2KDQluO5pduUnYzLy/4tD87dZW60=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-htoAmp6JNB2-j1CJfkxtQg-1; Tue, 21 Mar 2023 08:56:20 -0400
X-MC-Unique: htoAmp6JNB2-j1CJfkxtQg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j27-20020a05600c1c1b00b003edd2023418so4048234wms.4
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 05:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679403379;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IiFVpn9jj6h337K3NSpiQFh78X4x0ZgqQ+4RHW0aroc=;
 b=g3juwMqv7InePhKSlWmG2qo9kjIwyc2m0FahZ1aTBjs1HR517ClWfXUypiORoP8s4A
 oHu2Gq4ikEWl3PyxDWvm3yfXwAgq7Ft2vpiqM0sIt0CRs8kPRrVjE2ZA7jZVhhcli+oq
 XfZD32ZYXCZNKM4PpnihOPhYY8HuyIqhh+x/xqDqeZHyqkTuhJ3GZeYYW+/h6VKf76Vp
 o3jvt/oc6eBshLrEQ5CQ2UGW1ZswL3/Q5Ccp1dH9zLq/LoBKvaKRqWWjSiwpCmxGlqy/
 vqN1CDT/+AlLmLYl472uBfmcZjcGJCyeJ0R2Mtz0tZG8wrRbCehHpt2u/U4MxtPezwQc
 HFzw==
X-Gm-Message-State: AO0yUKVdzKzD3rm9HxQ6uEJ0Nt/90rmh/stcgjxGGsIJ3kpzWJ5clSBt
 2V9pANeg8caPqMcQDch696Lk+ROOgj6CAAO661OFmW2dKWhzjyr/eUMz2V6e4Mjgub1/mX26w0I
 PJJyXtQ7jF3XwChA=
X-Received: by 2002:adf:edcd:0:b0:2cf:e3e3:5b01 with SMTP id
 v13-20020adfedcd000000b002cfe3e35b01mr2198735wro.56.1679403379798; 
 Tue, 21 Mar 2023 05:56:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set8XrEjtv2gHFlYtrP+Al1IJ4Dz1hfwY1bOy3NH2Gq0zit81C6P2mj1ERTd53zLRyPdKyHbyCQ==
X-Received: by 2002:adf:edcd:0:b0:2cf:e3e3:5b01 with SMTP id
 v13-20020adfedcd000000b002cfe3e35b01mr2198722wro.56.1679403379508; 
 Tue, 21 Mar 2023 05:56:19 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d48ce000000b002d45575643esm9247132wrs.43.2023.03.21.05.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 05:56:19 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH-for-8.1 5/5] bulk: Replace __attribute__((noreturn)) ->
 G_NORETURN
In-Reply-To: <20230320134219.22489-6-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 20 Mar 2023 14:42:19
 +0100")
References: <20230320134219.22489-1-philmd@linaro.org>
 <20230320134219.22489-6-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 21 Mar 2023 13:56:18 +0100
Message-ID: <87bkkmjma5.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
> Under MSYS2, G_NORETURN is expanded to '[[noreturn]]'.
> Simpler to use the same definition everywhere, unifying
> the code style.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


