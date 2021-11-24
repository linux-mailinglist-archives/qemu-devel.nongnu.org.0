Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5672B45B5F4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:53:10 +0100 (CET)
Received: from localhost ([::1]:39870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpn5Z-0002wo-6H
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:53:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpmtN-0002qM-Iu
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:40:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpmtK-0000nw-Ni
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637739630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFRzki4tyQyMnmEB1X7V0+VFnBmeqb2eAhcEce8eKM4=;
 b=gVeiXO40OxTqCT0G2AMNbP632SOcmaP3gxhnUGsLqS2vjNVxovUW2exWZE81xRwHlhVTyr
 g7AOCbqd/Yd3JlxIUENVhmvCJKj5cEqOH/YpCa3zMN7UNVWTkb9UFV3pUA79j55gx4149z
 vRWPzUjTRGeFwmHj6FcTxK4+OF/4ONU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-Ko-8qTAaPQ-x2d0VLkAWBQ-1; Wed, 24 Nov 2021 02:40:28 -0500
X-MC-Unique: Ko-8qTAaPQ-x2d0VLkAWBQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 g81-20020a1c9d54000000b003330e488323so1386644wme.0
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PFRzki4tyQyMnmEB1X7V0+VFnBmeqb2eAhcEce8eKM4=;
 b=5WSuAJG0mCIxclixHy+RUdK04dzCi3pyyjv9lv6OgeUp4ADhnZ5pgX62KosUzI97xk
 T5uEtateZ6GTzHIQRbnwWTVCWMVplwa4ne1xXW1CesqZoFP1dQ+ph5BK93RUjrKECPYf
 d5xVLfbEK+79b4Od4SlDeeKwb5lF2YdE//4wGt1rVPIllMu/+ZWxpaZPU97DkeV+yDvn
 6//omUSEGlzTBLpHyqvXsMWdYehl7r/vKeNmPnJ3etko1KnK4q6wExGcPjxScRNv1B/q
 y/3LbsaVD1UUChnronguO7CzEClCQ6HlWLEfaTReMkIdeBeW/S5u/dxCTZC7OV3Kksg6
 BHnQ==
X-Gm-Message-State: AOAM530WXhhgO1kbJcis0558EQSiq37FWWj99vp4QkblnsYTnj4bfSft
 bCPTeyzd2ZlG8Oi/bg7CarHHEeO1tUZVRl4OtvNMdS8FMAle/9wOiTnOmsht9Vb0UVmQgJQmjNH
 1GY/c2Ui+hApWi2Q=
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr12644726wmj.30.1637739627102; 
 Tue, 23 Nov 2021 23:40:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKWKvbwdTupw2DeLXp3kPoP23PH2TOrXtIxcygkHx7DLHqFAKSnOkPEk/9pyf64oMgfTbuEg==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr12644641wmj.30.1637739626497; 
 Tue, 23 Nov 2021 23:40:26 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n32sm5040324wms.1.2021.11.23.23.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 23:40:25 -0800 (PST)
Message-ID: <ea0c858a-1db1-3fb4-1964-2441e4d64678@redhat.com>
Date: Wed, 24 Nov 2021 08:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/4] include/sysemu/blockdev.h: remove drive_get_max_devs
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20211124063640.3118897-1-eesposit@redhat.com>
 <20211124063640.3118897-5-eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124063640.3118897-5-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 07:36, Emanuele Giuseppe Esposito wrote:
> Remove drive_get_max_devs, as it is not used by anyone.

Maybe complete:

  Last use was removed in commit 8f2d75e81d5
  ("hw: Drop superfluous special checks for orphaned -drive").

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/sysemu/blockdev.h |  1 -
>  blockdev.c                | 17 -----------------
>  2 files changed, 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


