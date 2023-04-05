Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15376D7C29
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 14:05:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk1rs-0001BF-VD; Wed, 05 Apr 2023 08:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pk1rq-0001AD-Jn
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pk1ro-0000x9-9Z
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680696234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R04Ve/J3b5Dtba/pIzl+GCHJxHI6qGUd0P4syUgs3AI=;
 b=iVe96TS5h0CU3h4Cs5h3XDaOKF9FOz0ymPug23m3kOJ9/NMEWWoVEZNNk/ja1AJ8tIl2J/
 Y2Prad+PAeK6lnpXtxs/UaY0g+g7Z7CHqWskgXYzCpPRg19iVoBZ8FtRAR70gCnTWO9fcK
 WNX8uHHe5dJCjJ1R7PZoHlWoSsJJ5qw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-K5YpzphzPm2NV5UacpO5jw-1; Wed, 05 Apr 2023 08:03:37 -0400
X-MC-Unique: K5YpzphzPm2NV5UacpO5jw-1
Received: by mail-qt1-f200.google.com with SMTP id
 h6-20020ac85846000000b003e3c23d562aso24201103qth.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 05:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680696216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R04Ve/J3b5Dtba/pIzl+GCHJxHI6qGUd0P4syUgs3AI=;
 b=QYty5jgmCjdhuF0+1AT3dKWDquq4bUGxGt9OlSdPZpkBQCjNAG0daJi+8LcRpjBACe
 UECdkZegjxoGUDjgCIq0EodSHMRbc/4Z8t+o9G8s2SY6orQy9GEcB622LxfAIEPX+AVM
 brIbzJEKfKGHOU21Rb78Jmz31vglqBGy/P04CWZ2daNYgBcKOemzTYBzF74cULpJc1FH
 VFY10m4LbxrIy1SWTV3kwcei17yCi08BOpH7nuh0iDbJ4kD0jxvyZANbFXCXdaA3KkUm
 1zvfcvA22I8/G8s7eZkilr65AaMavk9ozkJV4Y8ezuZlR/Y0Ze8BSkK55zl1aRK9Y6hk
 EWWQ==
X-Gm-Message-State: AAQBX9cHD4bgJRC2TiliaajXE4WBlWQ/vFWH71ryToA67ON0nq/IF6Hr
 JWkwz5G7gbODcwOfvonI41VaqeVG6FY2uHNo+HgysRyu15M+s1Mf1WcEfL2S/Mx2SqmWDs85moM
 2fcEGSN62wTkaSqI=
X-Received: by 2002:ac8:7d54:0:b0:3db:786f:d91a with SMTP id
 h20-20020ac87d54000000b003db786fd91amr4349241qtb.57.1680696216591; 
 Wed, 05 Apr 2023 05:03:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350bCivEID9IcFQfN1L3OPeXzSXpQVNLxi0d00+4gdnoKiYejeyc26nlRFyxoxDVIy6aLig9FNw==
X-Received: by 2002:ac8:7d54:0:b0:3db:786f:d91a with SMTP id
 h20-20020ac87d54000000b003db786fd91amr4349198qtb.57.1680696216235; 
 Wed, 05 Apr 2023 05:03:36 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 q12-20020ac8450c000000b003dd8ad765dcsm3923287qtn.76.2023.04.05.05.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 05:03:35 -0700 (PDT)
Date: Wed, 5 Apr 2023 14:03:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230405140332.2dd50298@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230405055833-mutt-send-email-mst@kernel.org>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <20230404102807.4626b0be@imammedo.users.ipa.redhat.com>
 <20230404084603-mutt-send-email-mst@kernel.org>
 <20230404160435.45c2513d@imammedo.users.ipa.redhat.com>
 <20230404104122-mutt-send-email-mst@kernel.org>
 <20230405093020.3cbcd6e7@imammedo.users.ipa.redhat.com>
 <20230405043026-mutt-send-email-mst@kernel.org>
 <20230405112416.38e83b0c@imammedo.users.ipa.redhat.com>
 <20230405055833-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Wed, 5 Apr 2023 05:59:06 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Apr 05, 2023 at 11:24:16AM +0200, Igor Mammedov wrote:
> > > > PS:
> > > > See commit message, Windows is not affected as it doesn't
> > > > clear GPE status bits during ACPI initialization
> > > > (at least the one version I've tested with, and I won't bet
> > > > on this with other versions or staying this way)    
> > > 
> > > So I am saying linux should match windows. Clearing GPE
> > > is a bad idea as you then miss events.  
> > 
> > I'd say it depends on if guest OS is able to handle hot[un]plug
> > at boot time when it enables GPE handlers (or any other time).
> > (My point of view here, it's a guest OS policy and management
> > layer should know what installed guest is capable of and what
> > quirks to use with it)
> > 
> > I'll try to send a kernel patch to remove GPEx.status clearing,
> > though it might be more complex than it seems,
> > hence I'm quite sceptical about it.  
> 
> In the world of ACPI, windows is basically the gold standard,
> whatever it does linux has to do ;)
I'd say other way around (with their limited acpi interpreter,
it's getting better though),
While linux basically is acpica reference code.


