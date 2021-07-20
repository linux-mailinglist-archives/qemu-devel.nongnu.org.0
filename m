Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55A63CF252
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 05:02:53 +0200 (CEST)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5g20-0004KL-Do
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 23:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m5g13-0003dw-ST
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 23:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m5g10-0000Lt-EC
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 23:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626750108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mw7AqXHhcA3vcmpYIgMorAuF7j0KPEgQFVVUsTw9ouA=;
 b=abCyh6iqsRwDKKw3UaPk6QFKRQZp8q35wr8EaJ7RsmakRqxPf0pZW6ERwvqEPJtwDT938C
 v5emF8RjdrNS5Fxhpni+TVp0wqiA2yD7a2dqe1Kp+D0n+c7huecbKtp/H3n/yyaEBsgSJx
 cwu1oot1GfiNV+OdVZPOyRozkhPUzBw=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-44gZRbdONSKdrPCckN-F0g-1; Mon, 19 Jul 2021 23:01:46 -0400
X-MC-Unique: 44gZRbdONSKdrPCckN-F0g-1
Received: by mail-ot1-f69.google.com with SMTP id
 p13-20020a9d4e0d0000b02904cdb63ceafcso10305096otf.6
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 20:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Mw7AqXHhcA3vcmpYIgMorAuF7j0KPEgQFVVUsTw9ouA=;
 b=bLXZwugcgQZTj/K87pfwLW1YQ00s8oMZLfFte6AfFsowT/T21HYJG2brQUXUpmKFYC
 5Meo/12bSEPGmrvNJvXWQuBdj7OwmqNNUHiIFz5unpcZWRCuBm25ZZhLPAbyWWT4f/k7
 fie730b5c5KJWcIrU5D9XVdHc0dm0oYtxe7iUDL4euxgoUyHlvSfOimaGbYdL0zrWG2q
 pJdMtaVByvdr6Axul3AKHYlxhZZSChy9pBdyE3y9RNhy8onzIbd1Q9NDip5f8kE9et3j
 Y/A+8HUpP136gqwmZESJ28u2BrbUWUuggdFQ2gze8tP7BvQbtmbKsQ5+GXyPzKiZ3ZZK
 N7VA==
X-Gm-Message-State: AOAM532tnbsw+/2WEPY3Xt5t/gAwnsgzHY+jfWAz61hRhhzZqPGUfqas
 GnoNP3WqCko2WH/PtR9qLqOk0JvijXXO3QIDJMJWH8OXDI8GjC3xcRQybZ+0vodo42LmKD2oYjZ
 JdJ4nEe2mYUfQZ/0=
X-Received: by 2002:a05:6808:2105:: with SMTP id
 r5mr23883423oiw.57.1626750106059; 
 Mon, 19 Jul 2021 20:01:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUl5TK/NKZEW2fP0IshixsTlBo2v1PrigJIgZaSVSi3WcNYCKJr4XfBHEiXGuUzxfCjpRxRw==
X-Received: by 2002:a05:6808:2105:: with SMTP id
 r5mr23883407oiw.57.1626750105900; 
 Mon, 19 Jul 2021 20:01:45 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id m83sm22797oig.25.2021.07.19.20.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 20:01:44 -0700 (PDT)
Date: Mon, 19 Jul 2021 21:01:43 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC 12/19] vfio-user: probe remote device's BARs
Message-ID: <20210719210143.7bc9c3ab.alex.williamson@redhat.com>
In-Reply-To: <9D721628-1C4A-4710-B2AE-1F4C8E616233@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <e3db340f0300db92604f6c9611897df4d2ab901e.1626675354.git.elena.ufimtseva@oracle.com>
 <20210719165959.23439f39.alex.williamson@redhat.com>
 <9D721628-1C4A-4710-B2AE-1F4C8E616233@oracle.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 01:39:21 +0000
John Johnson <john.g.johnson@oracle.com> wrote:

> > On Jul 19, 2021, at 3:59 PM, Alex Williamson <alex.williamson@redhat.com> wrote:
> > 
> > On Sun, 18 Jul 2021 23:27:51 -0700
> > Elena Ufimtseva <elena.ufimtseva@oracle.com> wrote:  
> >> @@ -3442,6 +3448,22 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
> >>     /* QEMU can also add or extend BARs */
> >>     memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
> >> 
> >> +    /*
> >> +     * Local QEMU overrides aren't allowed
> >> +     * They must be done in the device process
> >> +     */
> >> +    if (pdev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
> >> +        error_setg(errp, "Multi-function must be specified by device process");
> >> +        goto error;
> >> +    }
> >> +    if (pdev->romfile) {
> >> +        error_setg(errp, "Romfile must be specified by device process");
> >> +        goto error;
> >> +    }  
> > 
> > For what reason?  PCI functions can operate completely independently,
> > there could be different servers for different functions, a QEMU user
> > may wish to apply a different option ROM image than provided by the
> > server.  This all creates unnecessary incompatibilities.  Thanks,
> >   
> 
> 	The idea is to have all the device options specified on the remote
> server, and have the vfio client just be a pass-through device.  I thought
> having them specified in 2 places would cause more confusion.

IMO, the server has no business making such configuration restrictions.
It's the client's decision if it wants to create multi-function
topologies or override the option rom.  Same for whether it wants to
override or virtualize capabilities.  All of this should just work
as-is; it's actually additional code required and knowledge through the
management stack to prevent it.  Thanks,

Alex


