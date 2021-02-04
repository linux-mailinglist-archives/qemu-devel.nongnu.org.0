Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D5530F200
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:26:49 +0100 (CET)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cme-00031U-C3
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7clY-0002Le-K0
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7clV-0005Ov-AS
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612437934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BVCCBm3Ww4oN4R/Q2vAokPsWPOa/OVAcDB7Qp0s84/c=;
 b=Z1bR9pIDWD/5uo8K/12PAUSdq2eXzaoY453kwJdCjrcmUpdC8gyaattHVacAJWfjrnvA9Q
 Yt2ol658TIR8JCZclOsVPMqMzPDySfnUqG29rdLn23Q3k059kV22UI1viMuVFWh+czyg+C
 QdwiF4hIJQjh4tKdqsNGEbqEzpKtvyI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-s2_c3YTUO5ii_Fr1PsSyQA-1; Thu, 04 Feb 2021 06:25:33 -0500
X-MC-Unique: s2_c3YTUO5ii_Fr1PsSyQA-1
Received: by mail-qv1-f72.google.com with SMTP id k18so1908378qvj.15
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 03:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BVCCBm3Ww4oN4R/Q2vAokPsWPOa/OVAcDB7Qp0s84/c=;
 b=g2SpswAe904mOZVisF7au2X2AQLN0DFfDiyPQx3x76q+yR6iXCFWUapH+jxQjq0Wsx
 4utN2CzlNpKWEOFtW4M3Hu7IvjegaAvYD9quaIDicB858Tjahg2D3k4U/3uPfUv4+Qtx
 8zfnvzw6ageg5rX8uJGTCuLnGolVA1g+n0VSoXMvQWGF3zzNdRf6bFoORwKt74cACU4x
 NxNqYMiMcg9yCkz6ayhUm7d11S5fM2AGHnzBXBYIu9wFzphFi00KrG3Lu6pxeGDu8x8g
 LKZZvTCvnH30c2MjRPonGbnGTo4rg+FugUC/PMSEOZESPuitr7hX2AMTz/IjBczPbypl
 5WBA==
X-Gm-Message-State: AOAM531gWpYtcMvVoX4y0dLjswLqaSXu6Euv7b56jjIxPxzQV409pOlW
 N4PVgBxMbT/70IamlmENERsFFqynk4nYGdXLZkCsehrS5oSosmCngvkPHZ5CeZR+LXgfxqk9kC8
 pPHSCBBTC3UlI1W8=
X-Received: by 2002:a37:d01:: with SMTP id 1mr7056776qkn.247.1612437932776;
 Thu, 04 Feb 2021 03:25:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLfKqqO/lVw3UNIuwagT0wAUhasUjDaCar3n3A6wH+ZkeHsDBtRExJWkwXxoYIjoxGiaUe5g==
X-Received: by 2002:a37:d01:: with SMTP id 1mr7056756qkn.247.1612437932631;
 Thu, 04 Feb 2021 03:25:32 -0800 (PST)
Received: from localhost ([181.191.236.144])
 by smtp.gmail.com with ESMTPSA id x74sm4660795qkb.55.2021.02.04.03.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:25:31 -0800 (PST)
Date: Thu, 4 Feb 2021 08:25:29 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 16/22] Acceptance Tests: introduce method for requiring
 an accelerator
Message-ID: <20210204112529.xamzxax3kora7ili@laptop.redhat>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-17-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-17-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 12:23:51PM -0500, Cleber Rosa wrote:
> Some tests explicitly require a QEMU accelerator to be available.
> Given that this depends on some runtime aspects not known before
> the test is started, such as the currently set QEMU binary, it's
> left to be checked also at runtime.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 24 ++++++++++++++++
>  tests/acceptance/boot_linux.py            | 34 ++++++-----------------
>  tests/acceptance/virtiofs_submounts.py    |  5 +---
>  3 files changed, 34 insertions(+), 29 deletions(-)

Reviewed-by: Beraldo Leal <bleal@redhat.com>


