Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3D73BA2D4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:36:51 +0200 (CEST)
Received: from localhost ([::1]:48848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzLDl-00036d-V6
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzLC8-0001bi-Bx
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzLC6-0007Lr-Mx
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625240103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=97Bwo/sGr1Jy8W8Qy8GawlvgvAgb8lAVmr8zfLEocuI=;
 b=fi8iJWry7nkd5jWnCAzrGMPc8Q6TVwQVMzD0XdMYi/FHjCCozqEhIYhQKOluGNQh14Gzkk
 KLqpCgr3ahVkKBMdj6aMT1BAWwNW81y4Hqz/o5L1xfZ5hqZmDOgy9hVoNMSNg17KPPn9Vp
 NtlzI4HhUiXYMwgKo7uIPjbu3lX8jqM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-JlFS-Ui3O_usbr3q3m9O-Q-1; Fri, 02 Jul 2021 11:35:02 -0400
X-MC-Unique: JlFS-Ui3O_usbr3q3m9O-Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 z4-20020a1ce2040000b02901ee8d8e151eso6403926wmg.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 08:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=97Bwo/sGr1Jy8W8Qy8GawlvgvAgb8lAVmr8zfLEocuI=;
 b=m26P3RNeNWpmX2+49lRDwjXPVcfns7TuKocYA4dsPZTCYVLamT/irIHl6A+2napQZs
 DXyYeceGb30OFZ//aQf6ptkXRK3UFNtd4+N7O9bOF7IobsOgyKN99Nx8C9kkFRWlSo9I
 cP2hBd6KNsqYLBPlSHYeAYzZuHtjuRzFyxcqT7jYzygHgzafbRzr5k+OnJkxEU8XHrl0
 v+jS3veIHOsHXNCizk/4CcPIH1xnoNek+BKOwX9b3C5sJf7sgQSpIU9lS2HSfLdaRAgY
 Di6syZ3BEopDkbix/hDFoVfQ4rXoz4CpfchW4o7SXm9GoWfmic2yMzjuHpMR9fb0GxNV
 jWyg==
X-Gm-Message-State: AOAM5330gjj/6ZhIqDDvkufdfRD3Oxp/ufPhn4uAXGHUa0hQWVLvmlxo
 70cfkDOfTgkWEZqD171Ul1m9hgAct4OKcYSPMvVWuDn9a3eX2aQA56JgWBTV1QcHZqaIQIiiCl7
 r3Z7qDXUJ0/pcjp0=
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr229097wry.299.1625240100977; 
 Fri, 02 Jul 2021 08:35:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0wL8sBbqhs0gV6AqGgCA2PCyLu2I4l+UUhDKHEjvnt74jWSkOf2mk5d9PrUkKAd2UqSWrVQ==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr229075wry.299.1625240100809; 
 Fri, 02 Jul 2021 08:35:00 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id z12sm944093wrs.39.2021.07.02.08.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 08:34:59 -0700 (PDT)
Date: Fri, 2 Jul 2021 11:34:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v5 3/7] hw/acpi/ich9: Enable ACPI PCI hot-plug
Message-ID: <20210702113323-mutt-send-email-mst@kernel.org>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-4-jusual@redhat.com>
 <YN1Iq6WDTqCzgmNA@yekko>
 <CAMDeoFXZyOt+O90xrRpTD8k7f0M60GVpg3XWfG2+yOAukOFgeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMDeoFXZyOt+O90xrRpTD8k7f0M60GVpg3XWfG2+yOAukOFgeA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 02, 2021 at 04:55:47PM +0200, Julia Suvorova wrote:
> > Doesn't this need to be protected by if (pm->use_acpi_hotplug_bridge)
> > ? Otherwise pm->acpi_pci_hotplug won't be initialized.
> 
> Yes, you're right. Although it doesn't affect anything now, it should
> be fixed. I'll send a patch on top.

This is all in my tree pci branch. Pls base your patchset on that.
Thanks!

-- 
MST


