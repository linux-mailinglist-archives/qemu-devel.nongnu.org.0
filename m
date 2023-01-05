Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274AB65E85D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMyx-0000Qq-Ad; Thu, 05 Jan 2023 04:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMys-0000Qb-AD
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:56:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMyq-0006gs-Qv
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672912572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vwHdP5GV0RWsTUzsY6/1f/oL1VXvRtk/UkoQUUrWTdM=;
 b=Z85FnCTDcwS8s3zfDkxKGjwlzMb8pthb01yEZnTPSIQd0hJh5ZdnlOdbXh2iMFeSxaTnhn
 WwADtpUQO681TSjC1Aqy4vZk0Vi2xY+zL++uo74/atKfu1J9cW95SzUiEoXhlGKaY2GblM
 NsmQktV49Atw9+LG98IiQyYynTUKrjU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-5253-fAoNi2n5AD0dTiyPQ-1; Thu, 05 Jan 2023 04:56:10 -0500
X-MC-Unique: 5253-fAoNi2n5AD0dTiyPQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 q10-20020a056402518a00b0048e5bc8cb74so6719682edd.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwHdP5GV0RWsTUzsY6/1f/oL1VXvRtk/UkoQUUrWTdM=;
 b=yGIMswctma3dXNU4/hK3tb3p1Au3tyBzNYqZkN8i1DUmTal8tPwuPPNUezjVb1tXLz
 hVtumazIXDXPdsEknw0wg0urwug7XrgltCxvcmcbx5ws/+qw/f4rk7ztjecDaqTfh6+/
 5nUa/iVtbvyrB0hTjsK0T5g3ey1SVJ+VCvXCdbHPEc1QxLG4MxMsp9I0IIiEjbgXZEqw
 N79ODuCB0mKzVVr9dMkjj8E1kCg3BFiahpstqcZ+G4ZmTgtMM599JSQyYmWFUsxBYZIu
 bT4EBy/Dyf0nHN0JOMv/Uz8yDSQ13D4RrCcQ803/uqfk+ASnkzylbVZ6Bpp6W4AjRqpP
 qtAw==
X-Gm-Message-State: AFqh2kpwcamEWwhqyx++DoTbNCNwkoXpks95f7TDSdntIONkaLYi1aL3
 yNUyvEQREICrVlm150ikFi1Qbnf40XXCcZDWqv3wOqLgQPJCcujUPQfRIFl26TdwUIFmKRF1Y6Z
 E5fgxMCnDaZqbEDmIll+xXlzRv6jLBPmZVQT/1vUUDBHNVcz0UhHv+rlebMW8
X-Received: by 2002:a17:907:6d12:b0:7c1:79f5:9545 with SMTP id
 sa18-20020a1709076d1200b007c179f59545mr62138385ejc.42.1672912569107; 
 Thu, 05 Jan 2023 01:56:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvPbTzWcpJfxjdM4CjGvEWHSZgMFHtlOQ4Ya3HV6LYpHUGkz1pHexF8dywCE3NuYehj+b6vKw==
X-Received: by 2002:a17:907:6d12:b0:7c1:79f5:9545 with SMTP id
 sa18-20020a1709076d1200b007c179f59545mr62138356ejc.42.1672912568742; 
 Thu, 05 Jan 2023 01:56:08 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 n21-20020a170906725500b007c11f2a3b3dsm16352567ejk.107.2023.01.05.01.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:56:08 -0800 (PST)
Date: Thu, 5 Jan 2023 04:56:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laszlo Ersek <lersek@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PULL 50/51] acpi: cpuhp: fix guest-visible maximum access size
 to the legacy reg block
Message-ID: <20230105045544-mutt-send-email-mst@kernel.org>
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105091310.263867-51-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-51-mst@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jan 05, 2023 at 04:17:06AM -0500, Michael S. Tsirkin wrote:
> From: Laszlo Ersek <lersek@redhat.com>

I noticed v2 is forthcoming. dropped now.


