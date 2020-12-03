Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC192CD541
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 13:15:07 +0100 (CET)
Received: from localhost ([::1]:52376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kknVq-0001cW-FS
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 07:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kknUo-00012E-71
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:14:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kknUm-0003w9-JG
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606997639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=au7n4XjK6JOXj3moPd6ZMb7IU1v+gLyxStw7J7DCYKM=;
 b=VvDBDtzxvRKlVKtcgSa5NH7VmDc2DGAOqfVb8E1uPKmvs/tRND3fJ4Cde9gG9WrcrzpvgM
 9jMyjIy2FBNNzA54s0OpY09zUsyBzCr6H4P2N3CN5XOwkBjbxSZf7e6itFSPZXfQh5Dicx
 NLTGaf9xl2LSRNAv6MAJvLyZuzWj+/g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-RvozHe4yPx2v9TF7AqFkcQ-1; Thu, 03 Dec 2020 07:13:58 -0500
X-MC-Unique: RvozHe4yPx2v9TF7AqFkcQ-1
Received: by mail-wm1-f72.google.com with SMTP id z12so1394562wmf.9
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 04:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=52boGBh4VCoOBRTENKoxmqfB9ZTOOIZ+7Vc7QQSJo14=;
 b=K8eJe7sFOH79Dqgb35strItQz902NhxwxGpTwrY5SQaRWo6EEDB8hYkI9tuMzx0Dzx
 WdJ+6jOGenPSRogMvtuBFQmUI958VT0MgzrKdVc6hjbt3GQ3dso4dkTliFwQofnWyago
 NA7pucT8Uygmd4+xfT/g2sOKCaPCHuyXXlXiQw/e8YQVHcz99Tm/pfiAd6ma6mjuO0U3
 JBLI5mobqzEiqtktZgXwE2QH/sJOrPjOWqia/NrfypOYQR/6rTKJjruWhZE11xbJf0lF
 NyvEQBdG6iqcXhTONb5NQl/nqPPs+JW6uq1MtguKq3Gjw0WrwyoWGBq7THO9oIAcYUOb
 8tSw==
X-Gm-Message-State: AOAM533MHKcOsinVpUumXttteD998rfUCEQLBd1YMLjfktOmerVrQ8nt
 MIgk16sbTZYvH2u2ai3ORMPcKhTkpjC9WTdO1enxBjtNkZrASxzQf1+GQL6DRLMawAmq+P4Ac2Z
 XQ8orQoIQsEdUXEM=
X-Received: by 2002:a5d:4c4a:: with SMTP id n10mr3427320wrt.54.1606997637187; 
 Thu, 03 Dec 2020 04:13:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxM+HED1d9BYN313RfS/+QEi7ZZQjGmNmLIJdK6qBkqfjMJzgtk10qDUM21CWzQOWyti7BE2A==
X-Received: by 2002:a5d:4c4a:: with SMTP id n10mr3427291wrt.54.1606997636961; 
 Thu, 03 Dec 2020 04:13:56 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d13sm1827028wrb.39.2020.12.03.04.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 04:13:56 -0800 (PST)
Date: Thu, 3 Dec 2020 07:13:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201203071148-mutt-send-email-mst@kernel.org>
References: <20201202061641-mutt-send-email-mst@kernel.org>
 <20201202112639.GE2360260@redhat.com>
 <20201202063656-mutt-send-email-mst@kernel.org>
 <20201202120121.GF2360260@redhat.com>
 <20201203061907-mutt-send-email-mst@kernel.org>
 <20201203113253.GD2952498@redhat.com>
 <20201203063452-mutt-send-email-mst@kernel.org>
 <20201203114512.GE2952498@redhat.com>
 <20201203070023-mutt-send-email-mst@kernel.org>
 <20201203120614.GF2952498@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203120614.GF2952498@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 12:06:14PM +0000, Daniel P. Berrangé wrote:
> > > It isn't really about the admin.  It is about countless existing mgmt apps
> > > that expect migration will always succeed if the VM is paused. The mgmt
> > > apps triggering the migraiton is not neccessarily the same as the app
> > > which introduced the use of NIC failover in the config.
> > > 
> > > eg in OpenStack Nova provides the VM config, but there are completely
> > > separate apps that are built todo automation on top of Nova which 
> > > this is liable to break. There's no human admin there to diagnose
> > > this and re-try with unpause, as all the logic is in the apps.
> > > 
> > > 
> > > Regards,
> > > Daniel
> > 
> > So let's say pause fails. Won't this break these theoretical apps?
> 
> Yes, they are broken in a way that can now actually be seen, as opposed
> to just hanging forever in migration.

Right but there are countless apps out there, and they are all broken,
maybe not too hard to debug if one knows where to look, but still ...

And again only true for pause then migrate, migrate then pause is still
broken, and if we fix it by failing pause then no one knows whether apps
are prepared to handle a failure in the pause command, previously if
used correctly it would never fail I think ...

-- 
MST


