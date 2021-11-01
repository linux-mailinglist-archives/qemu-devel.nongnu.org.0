Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3390442396
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:48:55 +0100 (CET)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhg6o-0005Km-Q5
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhfrF-0006qv-K5
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:32:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhfrD-0000TF-VN
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635805967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSjWElxRcx23/d0nb2Eu8vOPj+3TJ9xNFCzK4HtKMdw=;
 b=KEg0tcGRIYd5/l1amDwvErQGOmmIMPbwCx4uDD676vmBKAi9PzhCo/Rg/v/tHvqcqeEDRI
 OCYeq1b3llYb2yCw4s2jwB4IIJFqKKEny6Gf4jNctz9NB5RsTfJHxtLXfG7ZVM4gg+Z1lL
 3yrQ34RtobctNSsnwVTaMQER9CIL7Ao=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-aXjn8pMVNECH1lpt0C4M8w-1; Mon, 01 Nov 2021 18:32:46 -0400
X-MC-Unique: aXjn8pMVNECH1lpt0C4M8w-1
Received: by mail-ed1-f69.google.com with SMTP id
 z20-20020a05640240d400b003dce046ab51so16898909edb.14
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lSjWElxRcx23/d0nb2Eu8vOPj+3TJ9xNFCzK4HtKMdw=;
 b=wsINm8NKv7M+p/5qb/n/LP6q1hqcqsGXWFFE/0nT3qUTpSoa+aq2HhtoSsbeRSZC74
 U1JTnw9I1d5Fj1Lt3TX1Yj106sqO4eQ2ayOQRJ7GxgIs4Xj1rMP291hsdKgZiziHL731
 t2Xwfdv26BOH/2etb21UkIFRjRO6iR/WJvPy1vqo5nbNQK4AOdHZlRotIxYq6U4FYrCn
 EI7xhGwHOzOsRZR0Ms8Coi4hbTlFAG9rYJd2r5JTM5cCxFuya84I8BfzTg7G6Qup/kmS
 L/+Hggka2fJVVfV/FuwexFteY4O7PH/puB9mYtGfdR0ArgQB+BR7aj6+0N8TgZJndmUS
 9jag==
X-Gm-Message-State: AOAM533FGdz5SnJvC7bc8i8SWBTS/mBfQvckYxwLIlskQN4SAFuF/NGW
 23GDD875n85gSS/FyyDLCRbFS3oimcjS6+ejbQuBC80zerWDc51+R34b2jUhgsRL+0HPB4D8ogq
 3oAcLu5WWFAygD0M=
X-Received: by 2002:a17:907:6e26:: with SMTP id
 sd38mr22936644ejc.90.1635805964978; 
 Mon, 01 Nov 2021 15:32:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKduudjy9Anu0+fWC4EwRoxWsXIjIK9tdF36MYktwz71m6B262KA1nITt/3Nz3c1FyrYdXjQ==
X-Received: by 2002:a17:907:6e26:: with SMTP id
 sd38mr22936606ejc.90.1635805964783; 
 Mon, 01 Nov 2021 15:32:44 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id qf9sm850185ejc.18.2021.11.01.15.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:32:44 -0700 (PDT)
Date: Mon, 1 Nov 2021 18:32:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 0/3] pc: Support configuration of SMBIOS entry point
 type
Message-ID: <20211101183224-mutt-send-email-mst@kernel.org>
References: <20211026151100.1691925-1-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026151100.1691925-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 11:10:57AM -0400, Eduardo Habkost wrote:
> This includes code previously submitted[1] by Daniel P. Berrangé
> to add a "smbios-ep" machine property on PC.
> 
> SMBIOS 3.0 is necessary to support more than ~720 VCPUs, as a
> large number of VCPUs can easily hit the table size limit of
> SMBIOS 2.1 entry points.


We need acks from QAPI supporters on this.

> Changes from v2:
> * Renamed option to "smbios-entry-point-type" for clarity
> * Renamed option values to "32" and "64", for two reasons:
>   * The option is not about reporting an exact SMBIOS
>     version, but just the entry point format.
>     FWIW, the SMBIOS specification uses the phrases "32-bit entry
>     point" and "64-bit entry point" more often than "2.1 entry
>     point" and "3.0 entry point".
>   * QAPI doesn't allow us to use enum member names with dots
>     or underscores
> 
> [1] https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redhat.com
>     https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com
> 
> Eduardo Habkost (3):
>   smbios: Rename SMBIOS_ENTRY_POINT_* enums
>   hw/smbios: Use qapi for SmbiosEntryPointType
>   hw/i386: expose a "smbios-entry-point-type" PC machine property
> 
>  include/hw/firmware/smbios.h | 10 ++--------
>  include/hw/i386/pc.h         |  4 ++++
>  hw/arm/virt.c                |  2 +-
>  hw/i386/pc.c                 | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c            |  2 +-
>  hw/i386/pc_q35.c             |  2 +-
>  hw/smbios/smbios.c           |  8 ++++----
>  qapi/machine.json            | 12 ++++++++++++
>  8 files changed, 51 insertions(+), 15 deletions(-)
> 
> -- 
> 2.32.0


