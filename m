Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681DA44D869
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:36:30 +0100 (CET)
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBBk-00055F-Or
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:36:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlAwB-0000dr-Lf
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:20:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlAw8-0007JY-Ol
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636640419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LfCqjkL6KxQExsxIawSP+2oS0mSPifEUe7LrZ9Pnxfw=;
 b=Ev5zdzECthbonbuRM0mv9KsOCrbGakKk8cWCjGmN31XZWN9h67hxyFpRpMb+tL+hDZcY+9
 bX0tSudhDZQ1yS/C4vA+cCnpm5isNiaJi6o5MTaBWojfeDRX7iJYhiIOoFoXX7pdAK4aR4
 rVSiFg9OUhorfcFVem+s6CcUK/dF2vg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-2qFAChxgMmOOGW3vdBAxEQ-1; Thu, 11 Nov 2021 09:20:18 -0500
X-MC-Unique: 2qFAChxgMmOOGW3vdBAxEQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so1018531wro.18
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LfCqjkL6KxQExsxIawSP+2oS0mSPifEUe7LrZ9Pnxfw=;
 b=vmWxGNt+Ztbdud/Zj1TFIhZayA9WZNcrIWk3GirlbiZdP6zsQzdXVRiCcAxFx+Bspn
 QZoLVh7ekKfPDf5buwtuBUfrfNEy9CIt70No1JOv4cK8EmqLbnGS+97zQyVguoDfHRVW
 psgaIi2uocYQJC36H/73HKCbMPROOJ33ywyDNp39UMaUgggCZgCJyQBEqcoeCHmpcd+m
 8IrglX+dMBeYUKhOOO5bxhzYsrs2H3nVyrqMUbsozoaZj6haXs6+k0I7g/nDMCx2YFjI
 2nJZsVGY4SyHhJzSq0L2ND4dcg5PRmgtm9N76Hn03aFqe9Cdb9cCabPYHZwylAjLNSec
 qrsg==
X-Gm-Message-State: AOAM530iRFJncmrPjdTLsVVGRvwy9i7dGdS+ml3cMzbDKJ/FyKfSGrLJ
 jGm6Sf9sBqJ7jC+UWlDPxGI3ngfEfB9ofqSt9dieIC8NtejVt6UKKnNn/HQDutjUh3lUXcLky01
 rpuxZxNbIhn/txds=
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr8509726wmi.167.1636640416960; 
 Thu, 11 Nov 2021 06:20:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLkospgN64LyE1ucik3RzAzhg1YVPHUGxfcPK5e1kSPntjuiZ2oiD9IaJV4YWiOHI4zLbmIQ==
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr8509704wmi.167.1636640416796; 
 Thu, 11 Nov 2021 06:20:16 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v185sm9167469wme.35.2021.11.11.06.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 06:20:16 -0800 (PST)
Message-ID: <237570d9-028c-ccda-6eb5-d85f4433a3fc@redhat.com>
Date: Thu, 11 Nov 2021 15:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] hw/core/loader: return image sizes as ssize_t
To: Jamie Iles <jamie@nuviainc.com>, qemu-devel@nongnu.org
References: <20211111141141.3295094-1-jamie@nuviainc.com>
 <20211111141141.3295094-2-jamie@nuviainc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211111141141.3295094-2-jamie@nuviainc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lmichel@kalray.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 15:11, Jamie Iles wrote:
> Various loader functions return an int which limits images to 2GB which
> is fine for things like a BIOS/kernel image, but if we want to be able
> to load memory images or large ramdisks then any file over 2GB would
> silently fail to load.
> 
> Cc: Luc Michel <lmichel@kalray.eu>
> Signed-off-by: Jamie Iles <jamie@nuviainc.com>
> ---
>  hw/arm/armv7m.c          |  2 +-
>  hw/arm/boot.c            |  8 ++--
>  hw/core/generic-loader.c |  2 +-
>  hw/core/loader.c         | 81 +++++++++++++++++++++-------------------
>  hw/i386/x86.c            |  2 +-
>  hw/riscv/boot.c          |  5 ++-
>  include/hw/loader.h      | 55 +++++++++++++--------------
>  7 files changed, 80 insertions(+), 75 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


