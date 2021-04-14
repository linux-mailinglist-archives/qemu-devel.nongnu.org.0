Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400B035FD6F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 23:49:28 +0200 (CEST)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWnO3-0004tP-0v
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 17:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lWnNF-0004Sv-NT
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 17:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lWnNC-000825-On
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 17:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618436913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=JZQl31+Ihrf2aglFAb+Kr54/lsYY1bPdmxK/niNdHE4=;
 b=NEEj6BvrwNQDy1/pmq+ibgBJJuuqYs1wnldBSRoTbzduU2BGejgi3HkBYU8ItZjt9CvNZ4
 0Z9TMCLap4T1vqqiGB+DbFYIbXi8g2xlKsRjKwFXs0vbP50rxOMHCP00tHymBRGWMN+qRy
 JOAccZfeabKkw9x0pzY9fIN6HMMT6J4=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-iLDCEtdLORWhEJZIil2orw-1; Wed, 14 Apr 2021 17:48:31 -0400
X-MC-Unique: iLDCEtdLORWhEJZIil2orw-1
Received: by mail-oi1-f198.google.com with SMTP id
 s9-20020acadb090000b0290101bacefaa4so7024839oig.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 14:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding:cc
 :subject:from:to:date:message-id:in-reply-to;
 bh=JZQl31+Ihrf2aglFAb+Kr54/lsYY1bPdmxK/niNdHE4=;
 b=SZWZ84xuwr4WqGuIfU7wPkpB0aOXPEf6eBU0M1treZEK6dNWdikqnFxr3Asq8TJ8E7
 SqO/GskbYDf+gpVgcpjYe3lyXZgEfIc9z9CtcbDgGXbVyS1ExL+uNX3WReQdwokIkbq8
 +chtz4q3xZ4PrhrZol51IDUF7AsbXNB3zKu6s4yyBMaO/tfXPG3TOdeLCFf8LhkStgoS
 lpZc/sOBR6lKiPKP19Vt8ye20TZblyVQb96trC52T7gTePIVO58ifOGtHVNPAhePtTMs
 wjkVn9g8xvSc85kG+xXWuSqcZ8v0kcu8jXz4vhPY3j2Jskm7wsm/2YqWhIip6qdrZeDr
 kq0Q==
X-Gm-Message-State: AOAM533VnGgDzbeSVpY81FoJ4ND154W7KlbZjSlSaoY23LR0o77RFaf7
 Zb2x6EElMwV9+mrNkdnansZRiD/hSfz43fXJnLelUKxr85losMhDG4I+0anC8J5ueidNQ0OWoF2
 heoCMPedtC96Bn0E=
X-Received: by 2002:a4a:925a:: with SMTP id g26mr205486ooh.29.1618436910766;
 Wed, 14 Apr 2021 14:48:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXuVylyqIkLi2ZtSTt5GuGfXmRpyjdIB3faMZBhm4GPyVocUdQzI+/mBJlOugRbYZiGZvBdw==
X-Received: by 2002:a4a:925a:: with SMTP id g26mr205478ooh.29.1618436910559;
 Wed, 14 Apr 2021 14:48:30 -0700 (PDT)
Received: from localhost (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id t20sm164047oou.6.2021.04.14.14.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 14:48:30 -0700 (PDT)
Mime-Version: 1.0
Subject: Re: [Virtio-fs] [PATCH 2/2] virtiofsd: Add help for -o xattr-mapping
From: "Connor Kuehl" <ckuehl@redhat.com>
To: "Carlos Venegas" <jose.carlos.venegas.munoz@intel.com>,
 <virtio-fs@redhat.com>
Date: Wed, 14 Apr 2021 16:44:26 -0500
Message-Id: <CANRX0ORJA43.22ADKWIJW7DI0@redhat>
In-Reply-To: <20210414201207.3612432-3-jose.carlos.venegas.munoz@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed Apr 14, 2021 at 3:12 PM CDT, Carlos Venegas wrote:
> The option is not documented in help.
>
> Add small help about the option.
>
> Signed-off-by: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
> ---
> tools/virtiofsd/helper.c | 3 +++
> 1 file changed, 3 insertions(+)
>
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index 28243b51b2..5e98ed702b 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -172,6 +172,9 @@ void fuse_cmdline_help(void)
> " default: no_writeback\n"
> " -o xattr|no_xattr enable/disable xattr\n"
> " default: no_xattr\n"
> + " -o xattrmap=3D<mapping> Enable xattr mapping (enables xattr)\n"
> + " <mapping> is a string consists of a series of rules\n"
> + " e.g. -o xattrmap=3D:map::user.virtiofs.:\n"

This is a helpful note, but it doesn't tell the whole story. I think
it'd be helpful to add one last note to this option which is to
recommend reading the virtiofsd(1) man-page for more information on
xattrmap rules.

Connor


