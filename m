Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16295E64E4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:15:13 +0200 (CEST)
Received: from localhost ([::1]:41394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMyu-0006EK-Fc
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obLT9-0005W2-N1
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obLT6-0006sx-Gl
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663850295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uv9cmY4jlDk+x+QD2HnLadtUs/Xl/1IY2hz7KLYpLRI=;
 b=fwjE+srrXdqHA6e/ENEqAPL1rhkwvaVykDOOUj+5YZEJY4OaxZ2gA7cJY0CI9vRCpPthvO
 3HTPR3HpqLBZb+I8mDd092g1X3Asc+M96mf5pmZqC1iVzMSnYRxcB5FxAhNz+sNYdnMl3/
 u6IBRIjKYNH92GljnRpzWvtWaUuXHdE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-Q9I3XpSdNUupJGIynpYt3Q-1; Thu, 22 Sep 2022 08:38:14 -0400
X-MC-Unique: Q9I3XpSdNUupJGIynpYt3Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 cb22-20020a05622a1f9600b0035bb51792d2so6264720qtb.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 05:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Uv9cmY4jlDk+x+QD2HnLadtUs/Xl/1IY2hz7KLYpLRI=;
 b=nPk47/CdK93UDXl0szDO0Z5lOZAA0s1MVYjucPLBa71MwXlCq0Cp+NXEoVqTD8OIIt
 d2vC5Mycg42OdL9q9YLZ9ZUq0xWYVPq9hhsAx5SUJHVvnMo5qUzmW48Ze3d4i5qFPsh3
 3vciNjMMnPa3IvVS2AnbxxE7e6QDRb7LwppCXIFGJRbrfu1l5rKBv9ov/HAHAyiWt2Ry
 +mX9sHiB0jmta4R20okM3rvygivcdce3OCnvNrOymJJYSAUMv/LpiwAM8rG4igYjNndJ
 4d6qjG2f3tX1dmbwQEoiARYBZUNcVevGthYvlFDq8azS8I3IAG9kTfYZLytRPltWB3SW
 8tUw==
X-Gm-Message-State: ACrzQf1CBzLAFJvPcw0X3OgPnx8V793jGtBXjXgy/l/EhAnmsj6n5T4h
 0aT52MZ2xU9HDn0SsvRNPboGQr/m/Gqxx8BTPUVDDJz55mPJfQeQ4dSqe0aQRccytWU5pNQOjoD
 Wz+358fSGZWRAOft91EInwJYOD48L9D8=
X-Received: by 2002:a05:620a:220f:b0:6ce:cead:f39e with SMTP id
 m15-20020a05620a220f00b006ceceadf39emr1879215qkh.233.1663850294437; 
 Thu, 22 Sep 2022 05:38:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77XVEjklfVa6pEJFL3+S0rqbKAJ06fZ3p+HvE1CK75BVl1+XqdwCHAkUwmTXvBJ3cWcHAwzCuNoRa8MiXETx8=
X-Received: by 2002:a05:620a:220f:b0:6ce:cead:f39e with SMTP id
 m15-20020a05620a220f00b006ceceadf39emr1879196qkh.233.1663850294222; Thu, 22
 Sep 2022 05:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220922101454.1069462-1-kraxel@redhat.com>
 <YyxF2TNwnXaefT6u@redhat.com>
 <20220922122058.vesh352623uaon6e@sirius.home.kraxel.org>
In-Reply-To: <20220922122058.vesh352623uaon6e@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 22 Sep 2022 14:38:02 +0200
Message-ID: <CABgObfavcPLUbMzaLQS2Rj2=r5eAhuBuKdiHQ4wJGfgPm_=XsQ@mail.gmail.com>
Subject: Re: [PATCH v4] x86: add etc/phys-bits fw_cfg file
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org, 
 Marcelo Tosatti <mtosatti@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 2:21 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> No.  This will basically inform the guest that host-phys-bits has been
> enabled (and pass the number of bits).  So the firmware can make use of
> the available address space instead of trying to be as conservative as
> possible to avoid going beyond the (unknown) limit.

Intel processors that are not extremely old have host-phys-bits equal
to 39, 46 or 52. Older processors that had 36, in all likelihood,
didn't have IOMMUs (so no big 64-bit BARs).

AMD processors have had 48 for a while, though older consumer processors had 40.

QEMU has always used 40, though many downstream packages (IIRC RHEL
and Ubuntu) just use host-phys-bits = true when using KVM.

Would it work to:

1) set host-phys-bits to true on new machine types when not using TCG
(i.e. KVM / HVF / WHPX)

2) in the firmware treat 40 as if it were 39, to support old machine types?

Paolo


