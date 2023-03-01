Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3CE6A76BF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 23:21:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUnG-00075j-06; Wed, 01 Mar 2023 17:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUnD-0006wi-9B
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:19:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUnB-0002dr-P9
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677709160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gEZMnp3771gv5eYO4rbQY0LOaiYVb7iXkQat+LC38sU=;
 b=fx+KugTaio4yjAMB32LyREwQQDN7L1o3xn8Qqs4KIvngJ1xEfaZhA2DhR2zcPzXdO7C5pW
 lO97AhI3jSpJUfMfQ4oI2N5aEYZjN2N9NHHbXUINcHEWBzu4JJ4b6gHkNqrXr1RzCxElvg
 oSZeZF/GzyGwhP8g5jInGMlbqRvDgfo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-1I8o2CUUNeWH0E-yZfslZw-1; Wed, 01 Mar 2023 17:19:19 -0500
X-MC-Unique: 1I8o2CUUNeWH0E-yZfslZw-1
Received: by mail-wr1-f72.google.com with SMTP id
 u5-20020a5d6da5000000b002cd82373455so1730806wrs.9
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 14:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677709158;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gEZMnp3771gv5eYO4rbQY0LOaiYVb7iXkQat+LC38sU=;
 b=4XmbH/XPoJUDXDjLpswr8JF2JbWdoJTrc36TYYt69V3jdykISMio+1Fbu6bMh30BtC
 1RKlfiv99hXu6CNfuQ1U0aWw0i4nZzElzWDsF7VVMfLWwNnYpt9YxZJGTwd+8rVOyFQj
 4D6NH00pPode3/HZZPbfrINXL3R/BGUNUbbF6KnujfJxgereL6ylcpS3rWl9ZdUOz37r
 tLyFhM7NqhedSrAifO0KhXEuo0pFCbqpxGcgulVq57zgrjMpLDIytdQPxuUiQzNzkd26
 kTjGwADz4GsAj0Ne3yVgfyHqQhNGumzFwiksGBXRoUmM3EW8sXGQfE6gjTuOnqMh/kaf
 IM4g==
X-Gm-Message-State: AO0yUKW2N2YUcm6pWarXNPxpA425xfrQSRr4MVe5K9i35a65qmtmll/V
 RsbNnfB+kTUZfSJEKZFsbjn8eCIQx/Xuz2rJ6NLGfF1EHMBzZRbIUV98eR+o54bcIocraYZFvzw
 f+O1EGdjB6nvpsz0=
X-Received: by 2002:a5d:59c2:0:b0:2c5:4c5e:412b with SMTP id
 v2-20020a5d59c2000000b002c54c5e412bmr11385035wry.23.1677709158432; 
 Wed, 01 Mar 2023 14:19:18 -0800 (PST)
X-Google-Smtp-Source: AK7set821w4sHtYg8/kKl/xa3cc0lQwzUrhOaxNmWPvGim56pAwycuDrFhwZG1fXbw6A3P8u4dfQuw==
X-Received: by 2002:a5d:59c2:0:b0:2c5:4c5e:412b with SMTP id
 v2-20020a5d59c2000000b002c54c5e412bmr11385004wry.23.1677709158116; 
 Wed, 01 Mar 2023 14:19:18 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 ja20-20020a05600c557400b003eb596cbc54sm897392wmb.0.2023.03.01.14.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 14:19:17 -0800 (PST)
Date: Wed, 1 Mar 2023 17:19:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH v7 00/23] Consolidate PIIX south bridges
Message-ID: <20230301171819-mutt-send-email-mst@kernel.org>
References: <20230212123805.30799-1-shentey@gmail.com>
 <A5067C75-87DB-4D58-B49E-97BEDF303831@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A5067C75-87DB-4D58-B49E-97BEDF303831@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 23, 2023 at 05:25:23PM +0000, Bernhard Beschow wrote:
> Ping
> 
> Can we queue the piix3 part already? Now that the series doesn't introduce a PIC proxy any more the piix3 part is essentially QOM cleanup.
> 
> Note that I cautiously dropped some Reviewed-by tags in the piix3 part as well.
> 
> Best regards,
> Bernhard

This conflicts with ICH9 cleanup - I guess once that is merged you will
rebase right?

-- 
MST


