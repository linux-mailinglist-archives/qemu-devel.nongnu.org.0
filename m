Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3932ED86
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:57:50 +0100 (CET)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBtl-0000Lm-K0
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lIBsv-00081e-88
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:56:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lIBst-0002XU-Bx
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614956213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UKRX4+7q9McxwT3a8IQp5a5oCsCcryJWs0xxC1NbKCw=;
 b=iXsIocLDbvhRzzoc2Ri6x5re+vin94HoK/GiwVDCSW89g2vpWBeYtiKBsxXMBszK53Oydj
 SrKUqc2LRRBibHQa+hsOKlZ5mUXxmeN9XvOCnJZOUvu6CHcMULDwnLHhHpw3mMzPh/jeFc
 C2rxI7HSifLI9PKhLrd0nimLkua725c=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-KTiNy-DPNA2PFxNGdJBYIg-1; Fri, 05 Mar 2021 09:56:50 -0500
X-MC-Unique: KTiNy-DPNA2PFxNGdJBYIg-1
Received: by mail-ua1-f69.google.com with SMTP id w21so319490uao.23
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UKRX4+7q9McxwT3a8IQp5a5oCsCcryJWs0xxC1NbKCw=;
 b=MXwojrPK5tYF8yA+EXt0J23U+H9jpnf9//iJ47lrFUMf9SF3qWsF41BDbPc7vBy0Qq
 W9RUJ1VAecxyRZdrFlEGV69IAzS8FhlAUHubIwWX6YJU5Ey0wPFZK+rA+PT1YLjK0gLV
 168ipCKH59XPotC4pyISZ5w0foUyvai0loVWP8Y8LmgUbFrtfcUU+qmBpxjJ30+zHQ08
 84xUdcgt10+/RBwDE2Edd+jFKP90L+p413VMkStPoh0dmqUQPQjHH4wb2uDJVrayXAE3
 5u3p0pNdjsnM1/4vIPIIOzOx2BSAqnGc1ktETLIK1n3ofJbHXrK6vjKHNNX0+6NW3uY5
 4Ivw==
X-Gm-Message-State: AOAM533Ad4HsO/fATH4Nctauz5uGcrIYpduN2O3qqvrXyw7tmKWO1y9H
 xrv5p7hqfd5H9kqnVTlZSjowPhvsuuZetEZzg2Kd5ourRQ2Pvj3y8E4mhozLvBO4plUTd5EQ6Dn
 dnWlyncrtUzcLwY7Zt/bDevSHJwsTOxc=
X-Received: by 2002:ab0:660d:: with SMTP id r13mr5690964uam.5.1614956210305;
 Fri, 05 Mar 2021 06:56:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfiXfWazzAAcNis8qemOLDBIL3CwtA/CPTcVGTBSDVQlZF45QqtjIczovDh13AAMcls5jzm9UXbvmIrn3pLSU=
X-Received: by 2002:ab0:660d:: with SMTP id r13mr5690946uam.5.1614956210153;
 Fri, 05 Mar 2021 06:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-4-nieklinnenbank@gmail.com>
In-Reply-To: <20210304203540.41614-4-nieklinnenbank@gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 5 Mar 2021 11:56:24 -0300
Message-ID: <CAKJDGDYmXH0xpOW534AMWhG_i0bqym=t4YyDpjQ3SoJRN_mAvw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] tests/acceptance/boot_linux_console: change URL
 for test_arm_orangepi_bionic_20_08
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 4, 2021 at 5:42 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> Update the download URL of the Armbian 20.08 Bionic image for
> test_arm_orangepi_bionic_20_08 of the orangepi-pc machine.
>
> The archive.armbian.com URL contains more images and should keep stable
> for a longer period of time than dl.armbian.com.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  tests/acceptance/boot_linux_console.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


