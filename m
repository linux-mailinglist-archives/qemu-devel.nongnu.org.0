Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96B763AB07
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:31:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozf7S-0007wX-UM; Mon, 28 Nov 2022 09:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozf7C-0007s8-F9
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:28:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozf75-0007mZ-Er
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669645682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IUAXmZy8CYYvlogPmz/Pr8IVW4rnD5i12LB7vcQGPgU=;
 b=Sy3hbYC2FK2SurFlA0Fe2pkQlYF3uWENk2SxNtW0O1HJC9KESQreCBTWiPZsohGtwFL5HK
 K7xCm/jk34+gv8Yf+dvRUaKWXYXp1YNUjjfnJ1xKk17lBKzzz2TC2sF9zo2xczUOakSa1P
 7akl4+Oy98cGsnLxf/CW729wXUUw3N4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-urydpRkmMQCIjran5v1QTg-1; Mon, 28 Nov 2022 09:28:01 -0500
X-MC-Unique: urydpRkmMQCIjran5v1QTg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso8673175wms.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 06:28:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IUAXmZy8CYYvlogPmz/Pr8IVW4rnD5i12LB7vcQGPgU=;
 b=mJW1GZca56PgR0NCg6UJyQWJPyMOWCKm0fQPYBLorQ9iyCbB4p9ohZ0TO9lHmJUdI3
 jgqe7hyxbQtRyEkQNAHHbzw39NWVZxBX8K4sIGa1GldLx5c2qm7eVBmw0HVLtpn9jDwB
 swHAZRFZwpVeD0CFibTmmLC0OHB6Qg+agV4ZfWt8joRIitR2XV9PRKATBA11IEW/Zx8c
 9CV6j72rlumWTSPV5oA6E21eblP7VZV4PJo6VYrb7KrYaI/9Dgl/zd1Gy/fyG9qal3pX
 Kf42F4SuPJ1eoM939R5tQs5l9i0jvMfU6fm6Na54XWgy5HnihWzt9By+I/tVu25lfCjw
 /+Qw==
X-Gm-Message-State: ANoB5pls64Wn8fruq85EEgOMfnHRIduTxk/5GXZnW3EewOPiwY3i2GCT
 axC5nT244eWqkilCrknumlpOyHcU8hMA0KDqHgIxVaXPFZ8n4pRUODVbyOc1sTiS1E4VdR8V5sd
 8ZQvueDuboOuGXAo=
X-Received: by 2002:a7b:cd18:0:b0:3cf:a359:de90 with SMTP id
 f24-20020a7bcd18000000b003cfa359de90mr27875453wmj.122.1669645679506; 
 Mon, 28 Nov 2022 06:27:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6EAuftMCxnM3/aUQCvFjlxWYsvsUEgXHbfb30MRis12ojFXhZr79SR/4nXdL2Z5VtutWWTaA==
X-Received: by 2002:a7b:cd18:0:b0:3cf:a359:de90 with SMTP id
 f24-20020a7bcd18000000b003cfa359de90mr27875434wmj.122.1669645679274; 
 Mon, 28 Nov 2022 06:27:59 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b003cfaae07f68sm16748375wmo.17.2022.11.28.06.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 06:27:58 -0800 (PST)
Date: Mon, 28 Nov 2022 14:27:56 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com
Subject: Re: [PATCH 05/12] pci: Build hw/pci/pci-hmp-cmds.c only when
 CONFIG_PCI
Message-ID: <Y4TFbE7xRickK8Ri@work-vm>
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-6-armbru@redhat.com>
 <Y4Sol9q0NI52iTmE@work-vm> <87sfi3p5b1.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sfi3p5b1.fsf@pond.sub.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Markus Armbruster (armbru@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> 
> > * Markus Armbruster (armbru@redhat.com) wrote:
> >> We compile pci-hmp-cmds.c always, but pci-qmp-cmds.c only when
> >> CONFIG_PCI.  hw/pci/pci-stub.c keeps the linker happy when
> >> !CONFIG_PCI.  Build pci-hmp-cmds.c that way, too.
> >> 
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >
> > Had you considered wrapping the hmp-commands-info.hx entry
> > with a #if defined instead?
> 
> No.  Would you prefer that?

It seemed a bit simpler to me, but I'm not too fussed.
I kind of preferred the idea of the command giving an error if there's
no PCI built in.

> Code containing #ifdef CONFIG_PCI is target-dependent.  Looks like the
> affected monitor code already is, so no new headaches.

> Aside: splitting off its target-independent parts could be nice.  Not
> today.

Yeh.

Dave
> [...]
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


