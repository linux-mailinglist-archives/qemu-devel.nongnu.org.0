Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24042F8218
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:23:02 +0100 (CET)
Received: from localhost ([::1]:59274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0SoN-0004G1-2j
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0Smj-00039m-Go
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:21:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0Smh-0001JD-Cf
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610731274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ByY2zsD/6nZRGOrykiiiPRjjiEC9K0p5e8ym+LUUbkw=;
 b=YRG32DUTXbVWQ5zwFh7S8qq3Q5P8xkNk3tt6lTCs3KjaSjKc64DQsWpXv88Dl28kdNjYBI
 WMSlWFzsg2EGVKOAkL4wWtWblkMgTMyQZem696IOfJ+2QLzGrvvOFegSHGFQEi85BqKJ4U
 Q9K6s2Casmb92imRAMV3Bxd048G4vD4=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-wufhSd0rNo-n1MOYUzKtWA-1; Fri, 15 Jan 2021 12:21:12 -0500
X-MC-Unique: wufhSd0rNo-n1MOYUzKtWA-1
Received: by mail-vk1-f199.google.com with SMTP id p184so4390603vkd.18
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 09:21:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ByY2zsD/6nZRGOrykiiiPRjjiEC9K0p5e8ym+LUUbkw=;
 b=DxxdLOH3m5AeFQ3zxCvDNSWMjXDgQDBlZlPaOyKyyvdeLPSa8PXq57TB5JbTElgDmZ
 ZrKW2QtrW3MC+vLntiPZ6Gw3e8z4m0+Vk3zrBCd2ZzuKsfHx/VktAMDia5rwjXfo0WQe
 RAJRfTHJ+r+uBXsPgT4wG9v8HSlpPAJhySVtVeXLBq/c/Ep6S3N/D21fCh9QC6c+4Itl
 7Jr8v/YGHhIe5K4lMqyec+1Dlh7gNG5quLaZvU5zhZYvmE4kWROAQza7saAKoyMhuad0
 bLXLqd9Fnhcy69mrgtbi51d2UTb/w8IdYA+8qv1Y8XYFKK+7s0C5stmCZhGBY2YfVrtJ
 90hw==
X-Gm-Message-State: AOAM532veVtmXKrvn2Gwlp3zOC2579XmnJ/L7bLUkpLoLApEPHEfMP0O
 Svycxv9TFDt9NVfi/y9hm5lAwTvnm0dv9+eQClY6E6hqE8Cx9o5naoFmIiR+A8OvHnjpUu6RScB
 V2Ake6Uy7dAd7+MIAk7ma1AmGs1wr9sM=
X-Received: by 2002:a67:c282:: with SMTP id k2mr10963268vsj.1.1610731271413;
 Fri, 15 Jan 2021 09:21:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrshv23snTPC4AODKGNeOfaOlgBNIfu7vO4Yh1JRlEoGfaiQQxZcJ/J/i/8E7g9AHm+8ylqUUs6ldVPvRF6Ss=
X-Received: by 2002:a67:c282:: with SMTP id k2mr10963245vsj.1.1610731271273;
 Fri, 15 Jan 2021 09:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-4-thuth@redhat.com>
In-Reply-To: <20210112164045.98565-4-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 14:20:45 -0300
Message-ID: <CAKJDGDZng=SxwSGrpdmG9ZQ_d5uqU2Z5uyzdAmWir9-RVuMT8Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] tests/acceptance: Add a test for the virtex-ml507 ppc
 machine
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
Cc: Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 1:45 PM Thomas Huth <thuth@redhat.com> wrote:
>
> The "And a hippo new year" image from the QEMU advent calendar 2020
> can be used to test the virtex-ml507 ppc machine.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/acceptance/machine_ppc.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


