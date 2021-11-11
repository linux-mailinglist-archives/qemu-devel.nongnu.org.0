Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5615D44D9A3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:56:28 +0100 (CET)
Received: from localhost ([::1]:52642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCR9-0008DU-4p
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:56:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlCBM-00086F-Qs
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:40:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlCBK-0004q8-RA
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636645205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VYuZiQapjSKLaJumoZdZKaYeUFIYbGjigcsN1jhAypY=;
 b=YHEgBYkhWnHUQjK9cXSwJiaNT2GjvoKK94LfqMYM/4c6FPhwN+hJTPM8WSkLVfjLS2ZeKQ
 Hi/upLT/2BftdGXZWU1ZHafQMxqZrufWGZE0x7GAZJ9dXmSwwPmefEcvGEqQ1BYzlK82+C
 RwzxSBRPQKY12khN4oxpNjrfDieIu2Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-Gjm2cbg1M9ikPFp3FwKxmQ-1; Thu, 11 Nov 2021 10:40:04 -0500
X-MC-Unique: Gjm2cbg1M9ikPFp3FwKxmQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 i22-20020a05640242d600b003e28aecc0afso5763879edc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 07:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VYuZiQapjSKLaJumoZdZKaYeUFIYbGjigcsN1jhAypY=;
 b=zTylVWHh2To5QiwC2weCB7uTb6VH7+yRhBNMwp6ezfSpVVRiOJH6/oL6e6A/tj/AhM
 5im5WSIKOzZHvGzkMJEv4nkBbGAsf9qMqGxYOI2wYaUlhOOnyYIANMup0AL2CAfro+JL
 vRmyYKmx9fqkgt1WzaV0pee5rgP5ujRPGE8rIXbllKTKp3Zeg2l3CsitZj3DOfUAn5n3
 rDHKGlFhbbueDmSnOfS3mvJY1i1ussZ+ag20UHabz2rs0HsTkWj/PaN0Pv+P1dOjYx6Z
 P22E3bU1yErrgowyPAq4VPQyLE8Gt2TYnzsEay0EgqfJ43mukeu3+qMYW/bUuQMRFmPe
 Nqlg==
X-Gm-Message-State: AOAM530tiJ3jzi69E4SqzpTLO/zl4l4BaJKikce9n+cCXvMHqO3jb0Yo
 MbdXkfctE8bRU3xNNNlt3a6daRvk5Ha836ia9TGlAYBUFZO1X3o2nRWg/5V1D/HoUyLj0ZmdQmH
 bzk/RyOwEaSqRr94=
X-Received: by 2002:a17:906:11ce:: with SMTP id
 o14mr10783785eja.457.1636645203508; 
 Thu, 11 Nov 2021 07:40:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz27NImHr0EGwbc8q2ZC5s7nBtJILvcJGVQ/QWLsrfY4QgiOeuGSCKSzzz6Tijx3BtWhjmxQw==
X-Received: by 2002:a17:906:11ce:: with SMTP id
 o14mr10783758eja.457.1636645203317; 
 Thu, 11 Nov 2021 07:40:03 -0800 (PST)
Received: from redhat.com ([2.55.135.246])
 by smtp.gmail.com with ESMTPSA id t6sm1812005edj.27.2021.11.11.07.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 07:40:02 -0800 (PST)
Date: Thu, 11 Nov 2021 10:39:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211111103354-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
 <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
 <20211111031646-mutt-send-email-mst@kernel.org>
 <20211111093425.6x2a37npcnnewdis@sirius.home.kraxel.org>
 <20211111120905.ozy5iucoqjhhoc72@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211111120905.ozy5iucoqjhhoc72@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 01:09:05PM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > When the acpihp driver is used the linux kernel will just call the aml
> > methods and I suspect the pci device will stay invisible then because
> > nobody flips the slot power control bit (with native-hotplug=on, for
> > native-hotplug=off this isn't a problem of course).
> 
> Hmm, on a quick smoke test with both patch series (mine + igors) applied
> everything seems to work fine on a quick glance.  Dunno why.  Maybe the
> pcieport driver turns on slot power even in case pciehp is not active.

Well power and hotplug capabilities are mostly unrelated, right?

> I still feel a bit nervous about trying the new "both pcie + acpi
> hotplug enabled" approach that close to the release date ...
> 
> take care,
>   Gerd

I feel switching to native so late would be inappropriate, looks more
like a feature than a bugfix. Given that - we need Igor's patches.
Given that - would you say I should apply yours? I'm inclined to
do so but if you prefer waiting until after the release I'll
defer to your judgement.

-- 
MST


