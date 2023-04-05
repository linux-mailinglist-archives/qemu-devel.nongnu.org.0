Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869A36D7C95
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 14:29:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk2Eo-0008NI-VT; Wed, 05 Apr 2023 08:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pk2Em-0008N4-KY
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:27:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pk2Eh-0007UE-Vl
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680697654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=icTuyBMthjPmXwlHW7ITnJz1g39lABwqIZzJqDVuY6Q=;
 b=VV5qkpMRa8mpzlEmoQ92jETQlfrJoeViFZGnzcP2k4YZWkJrXYo6bqtduOH1tkDoCcPUVX
 jUaSEpIJq3ExtjJeLGxF5+4pykm79fNhMsS8qk8c3pdv3cIa2M+Nfjea/JRHX19wTsSLaN
 OxlNvSQIJZai09f21TIkM33WDvBb0HU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-G33bGAzRM3Og9e-Yb1POjA-1; Wed, 05 Apr 2023 08:27:33 -0400
X-MC-Unique: G33bGAzRM3Og9e-Yb1POjA-1
Received: by mail-ed1-f69.google.com with SMTP id
 t26-20020a50d71a000000b005003c5087caso49304580edi.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 05:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680697652;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=icTuyBMthjPmXwlHW7ITnJz1g39lABwqIZzJqDVuY6Q=;
 b=04UFRx6pCFIPMJJw6q/wp0xCahGH/Lczg2d9jpEH65XltuoUTyvC1WvdFHK45gD970
 8pzUamhgsrUxpOiEG1zpKQ3eUZr8Z8fUqjWVOoAhRZc2G+4xfjcRKZb60WOBRasLzZsg
 HTcFlhGcE5LqUJsffbzJvPiHLAB7RTB7dfp5Gx7Sc8xDvRaTvcCI8BQELTTOHTyay95u
 0Jy1Bhhvcy7OmNnXHgGh58wkPQ3040hoAoJAAOEdQeg5CLELV7KGKnj6PHCIXJ0Hwe3r
 PXk3wIiWFeFaZ7zGluHYbIRm0g+JAIkqgih8ilUQsJAotCo1F8H5PdTRU6bhlq5POM3E
 yQXQ==
X-Gm-Message-State: AAQBX9fMZVV6HYN3lF8kMSjMK5VVHB0n+leENb+SgPUTzRHNLCdxUu5D
 k6byeTsGNAEn9CStksAR7iByAmf1FZRT9CwjtIZTptI3GKO4VJ2VOF4PwIOskwGXlt5HBY4eXKE
 qQlVNK79xSXksz3Q=
X-Received: by 2002:a17:907:8b95:b0:932:c1e2:9984 with SMTP id
 tb21-20020a1709078b9500b00932c1e29984mr3229682ejc.58.1680697652119; 
 Wed, 05 Apr 2023 05:27:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YQKr/XvCy+nF2wPE6hh7wrw0DxiEwbL5eBWbOP5zrzMRWs9IUahwtkZnvfuCR6KEJSkopfFQ==
X-Received: by 2002:a17:907:8b95:b0:932:c1e2:9984 with SMTP id
 tb21-20020a1709078b9500b00932c1e29984mr3229668ejc.58.1680697651856; 
 Wed, 05 Apr 2023 05:27:31 -0700 (PDT)
Received: from redhat.com ([2.52.139.22]) by smtp.gmail.com with ESMTPSA id
 l24-20020a170906079800b00930d22474dbsm7340429ejc.97.2023.04.05.05.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 05:27:31 -0700 (PDT)
Date: Wed, 5 Apr 2023 08:27:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230405082425-mutt-send-email-mst@kernel.org>
References: <20230403131833-mutt-send-email-mst@kernel.org>
 <20230404102807.4626b0be@imammedo.users.ipa.redhat.com>
 <20230404084603-mutt-send-email-mst@kernel.org>
 <20230404160435.45c2513d@imammedo.users.ipa.redhat.com>
 <20230404104122-mutt-send-email-mst@kernel.org>
 <20230405093020.3cbcd6e7@imammedo.users.ipa.redhat.com>
 <20230405043026-mutt-send-email-mst@kernel.org>
 <20230405112416.38e83b0c@imammedo.users.ipa.redhat.com>
 <20230405055833-mutt-send-email-mst@kernel.org>
 <20230405140332.2dd50298@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405140332.2dd50298@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Apr 05, 2023 at 02:03:32PM +0200, Igor Mammedov wrote:
> On Wed, 5 Apr 2023 05:59:06 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, Apr 05, 2023 at 11:24:16AM +0200, Igor Mammedov wrote:
> > > > > PS:
> > > > > See commit message, Windows is not affected as it doesn't
> > > > > clear GPE status bits during ACPI initialization
> > > > > (at least the one version I've tested with, and I won't bet
> > > > > on this with other versions or staying this way)    
> > > > 
> > > > So I am saying linux should match windows. Clearing GPE
> > > > is a bad idea as you then miss events.  
> > > 
> > > I'd say it depends on if guest OS is able to handle hot[un]plug
> > > at boot time when it enables GPE handlers (or any other time).
> > > (My point of view here, it's a guest OS policy and management
> > > layer should know what installed guest is capable of and what
> > > quirks to use with it)
> > > 
> > > I'll try to send a kernel patch to remove GPEx.status clearing,
> > > though it might be more complex than it seems,
> > > hence I'm quite sceptical about it.  
> > 
> > In the world of ACPI, windows is basically the gold standard,
> > whatever it does linux has to do ;)
> I'd say other way around (with their limited acpi interpreter,
> it's getting better though),
> While linux basically is acpica reference code.

For a spec compliant acpi like ours maybe but on real hardware
it is like this because BIOS vendors test their ACPI with windows only.

-- 
MST


