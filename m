Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3709D4D677A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 18:22:11 +0100 (CET)
Received: from localhost ([::1]:50176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSixt-0002Aj-NP
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 12:22:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nSiwX-0001QG-93
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:20:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nSiwU-0007ob-Ef
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647019241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iF0Rvsk19nee1rMX5F0YethIB6ujydzdlwFHIlx6D2g=;
 b=J9BX178R0M0jyg3apJnFXbE6Fm5pal3Yc4LJD62gSTE7ULUSK7faZpuxFvDnZT/4pvBKjY
 kr2MnTTfC5/PDoT189lELiJprh93ClaXU+VO7CArHYmao/6h/TXQJZI9vhT1CS+pLasHk1
 V5rh2mDNaQos3T+2/kGEHp5Kbx9u6YI=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-TVSzEoaMMXuZPHdjQkbUGw-1; Fri, 11 Mar 2022 12:20:40 -0500
X-MC-Unique: TVSzEoaMMXuZPHdjQkbUGw-1
Received: by mail-ot1-f71.google.com with SMTP id
 c25-20020a056830349900b005b234b2cdc1so6556452otu.13
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 09:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iF0Rvsk19nee1rMX5F0YethIB6ujydzdlwFHIlx6D2g=;
 b=61MOkS5El5heYXVYCwk3PTjMx3vTHHyiISp29w6mNKiH4+vlKemzqTBUotWuuaV3ao
 M7YlonYUWYFTtsgosRU2DFMpDexcw1TcCEG6OExZM+x0uhTvXcnyk28afCtKzbN/jqnq
 9Gbuuaijw2Livago5+6WVTOQM57YWFq68Fa+TP99N+uBDPQoXbW9Y34DiXhW92YyyNCW
 V6FrXFt6FokDfZ7h1o1POZ7OQoCKKIuiT7bwQhSdbscReFHizHmd0HWyCBqEJwG9KYcP
 RRGncUSDUIly+sMi1B0CV/1Zk8oqAiZWwBKm/oPVdyvuT7TxCTHk8iSLhOmvGSpggwuj
 FiBQ==
X-Gm-Message-State: AOAM5335ETDNdWige7ogy7znH9a7zdd4rQVVgQq1DahVueQIXbY0RXMn
 mWgXTlkQ91zTi+JgBwfW7B9XwSqhKTdStrk3GR3QQbPeE/MWiba8sfKDA+ABRon2c1zrCaBb102
 oYCKa9JEExJjT15I=
X-Received: by 2002:aca:100f:0:b0:2d9:df12:2dd6 with SMTP id
 15-20020aca100f000000b002d9df122dd6mr13636569oiq.199.1647019239366; 
 Fri, 11 Mar 2022 09:20:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxogkAme60kzaUQUEkro2tZtr1CEEn+0AqqsnQWXuBgPqjCdRhTKpc/5UQhnRwrPaFbkzmQvg==
X-Received: by 2002:aca:100f:0:b0:2d9:df12:2dd6 with SMTP id
 15-20020aca100f000000b002d9df122dd6mr13636516oiq.199.1647019239054; 
 Fri, 11 Mar 2022 09:20:39 -0800 (PST)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 f10-20020a4a8f4a000000b00320e5ecfecdsm3842724ool.46.2022.03.11.09.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 09:20:38 -0800 (PST)
Date: Fri, 11 Mar 2022 14:20:36 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 6/9] tests/avocado/virtiofs_submounts.py: shared_dir may
 not exist
Message-ID: <20220311172036.awiv6zazfhbvasq7@laptop.redhat>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-7-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225210156.2032055-7-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Eric Farman <farman@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 04:01:53PM -0500, Cleber Rosa wrote:
> If the test is skipped because of their conditionals, the shared_dir
> attribute may not exist.
> 
> Check for its existence in the tearDown() method to avoid and
> AttributeError.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/avocado/virtiofs_submounts.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/avocado/virtiofs_submounts.py b/tests/avocado/virtiofs_submounts.py
> index e6dc32ffd4..d9c2c9d9ef 100644
> --- a/tests/avocado/virtiofs_submounts.py
> +++ b/tests/avocado/virtiofs_submounts.py
> @@ -157,9 +157,10 @@ def tearDown(self):
>          except:
>              pass
>  
> -        scratch_dir = os.path.join(self.shared_dir, 'scratch')
> -        self.run(('bash', self.get_data('cleanup.sh'), scratch_dir),
> -                 ignore_error=True)
> +        if hasattr(self, 'shared_dir'):
> +            scratch_dir = os.path.join(self.shared_dir, 'scratch')
> +            self.run(('bash', self.get_data('cleanup.sh'), scratch_dir),
> +                     ignore_error=True)
>  
>      def test_pre_virtiofsd_set_up(self):
>          self.set_up_shared_dir()

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


