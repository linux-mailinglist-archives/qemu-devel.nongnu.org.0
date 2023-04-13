Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366186E123D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 18:27:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmzmt-0001W5-48; Thu, 13 Apr 2023 12:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pmzmq-0001UI-Hn
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pmzmb-0005Yx-9f
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681403203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jjEColx6Y/+5GqriS+We/yJxgqmi4yKf6sKABLPkgM=;
 b=Y3yHz38YKwONMC+2ZBtNxWHmAgEQJJ4Ud5ObVJUpJNxrLXJYzDmdR4brR+rSyhiVcJUmfD
 RcXGv3VoTnP5C5HUwre7dzjnL7JC/7t1Z9AYOItPnuj5su9+80qbqAVXC3BQ864IPFOL0C
 f3FmevWTubzN+5+MolZMGGERQHDimso=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-i9tJc1GRPAKweLnkhD3Cjg-1; Thu, 13 Apr 2023 12:26:42 -0400
X-MC-Unique: i9tJc1GRPAKweLnkhD3Cjg-1
Received: by mail-pj1-f71.google.com with SMTP id
 a11-20020a17090a854b00b00246cadfd77eso4469534pjw.2
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 09:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681403201; x=1683995201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7jjEColx6Y/+5GqriS+We/yJxgqmi4yKf6sKABLPkgM=;
 b=W+cYcMokAimMLEMEV7v0IVsu+bQLO7eGcAJ87OcbiPUsSC9/q3FxnMtTp3xkzC6X4G
 L5buK1uUEJ52GbZWejcPKLdU+gzjgxzfrSxQX4jzHMBBkhNSxE1ptTKqgjyOMwQgz9r4
 VsqrOIwTkk6c8gWNBG/p0y31oHpBoJ4R58qfxtCIYL7SjdYHQkJ0MilfZzTE+j8sfEIQ
 oYqSpM7kxN9KuiKR3HeKPPtX7h/sH5L2OnyJfinirsHTICk999UfFMCcd/xloBPa7+Mw
 mrKRdDbqVMhaQZ2SjjVOC7sON14SJY8lpHXLHYJTmvtgifmQD5id4FjTg8rsCFr3vT3Y
 76AA==
X-Gm-Message-State: AAQBX9e6aJKQDOuM32yC00FYaT1kKNhKZRMTTiwrU7mAS3WK/pcdVRT7
 wTXnaSMsQwrIvAlfau/19/JwNRyzZZseckWMNqv/znxcFUuv2bI/NawtjZ4MSP3rqIeLkQf2ziu
 pbYUrlpPbS+Fx+qCpRd5AZoTkA6VMbvg=
X-Received: by 2002:a65:4388:0:b0:513:f5d8:85ae with SMTP id
 m8-20020a654388000000b00513f5d885aemr696919pgp.8.1681403201418; 
 Thu, 13 Apr 2023 09:26:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZX3AheORVAHZXyT4w21quL93Oez95LJ5v5B3Gwgj/52INuCs2IWtAPIYzv7Yc1XxulyS8XJwzMAfu7SAxrwCA=
X-Received: by 2002:a65:4388:0:b0:513:f5d8:85ae with SMTP id
 m8-20020a654388000000b00513f5d885aemr696918pgp.8.1681403201147; Thu, 13 Apr
 2023 09:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <20230328211119.2748442-2-jsnow@redhat.com>
 <d49d0152-ff58-a317-7eca-a243ed080ca0@redhat.com>
In-Reply-To: <d49d0152-ff58-a317-7eca-a243ed080ca0@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 13 Apr 2023 12:26:29 -0400
Message-ID: <CAFn=p-Z9_Ow7ELbHn+R+mim59C31LfOyo4qwSmnksJJkxLsMDA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] python: add mkvenv.py
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Mar 29, 2023 at 8:56=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> BTW, another way to repair Debian 10's pip is to create a symbolic link
> to sys.base_prefix + '/share/python-wheels' in sys.prefix +
> '/share/python-wheels'.  Since this is much faster, perhaps it can be
> done unconditionally and checkpip mode can go away together with
> self._context?
>
> Paolo
>

I'm coming around on this one a bit; it's definitely going to be a lot
faster. As you say, my version is more robust, but more complex and
with more lines. We may decide to drop any workarounds for Debian 10
entirely and we can live without either fix. I'll mention this in the
commit message for the Debian 10 workaround.

I do not know right now if other distros suffer from the same problem;
we could attempt to omit the fix and just see if anyone barks. Not
very nice, but impossible to enumerate all of the bugs that exist in
various downstream distros...

--js


