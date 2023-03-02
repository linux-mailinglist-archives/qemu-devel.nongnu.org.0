Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32986A7E01
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:40:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfPh-0006Ca-Co; Thu, 02 Mar 2023 04:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXfPe-0006C9-8l
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:39:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXfPc-0001MW-PF
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677749983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K6dHkgjidZH7+Xo9T2/h9rGWHkWEPyJ9zp4EV90sjCU=;
 b=CJUWJ87h60e1/w3DvYQq5k9iF3LagGJ+Wx0pGAOQ83Spu5h3/Q9772vzLpP85LY64tX4ss
 w8O7ttwdFIS7KS7VL9opK494bB452XYufa9XkRglR0AvBdwu9M4j1elQ3dvBYC+fVLo77j
 XruQrsiJ1unAHNN9RTn+Ejupjo8odqY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-462-8wnBI-HgM0--fB9HOlEy1A-1; Thu, 02 Mar 2023 04:39:42 -0500
X-MC-Unique: 8wnBI-HgM0--fB9HOlEy1A-1
Received: by mail-wm1-f70.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so1020581wms.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 01:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677749981;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K6dHkgjidZH7+Xo9T2/h9rGWHkWEPyJ9zp4EV90sjCU=;
 b=uTJ7/Wgk1v4p4CqsA3RXmzsCqYkFo0yI8HZi2il/wgiEYUeSn17/+n8ZIiCk3MEqvE
 YiKFyKruROBsdeoaOxdxdHObGNV3PUhOsMjueAN/zsp/W8rhmWSUWfSRdhG17M17Wdni
 USSJ3RcdqhIOu0MFR9wfJvREjftxucKmsgPi2jUyE/6Jx6A7YMLodBpsdvlkii//e6CB
 qJlua642FJpVK72XATn5vp92mPQeqMcxrawY0E+GN6y5o33C7hwkJKHNZfGjg8RVK7G7
 OSgZbEi1tKIi6F6V5+yygvk4n/MLZZ0VCJ/DE6/XQsc+ncpWzGdaHq7iq+dnFRfzlayK
 5e+g==
X-Gm-Message-State: AO0yUKVRYaqRafArqWVTUQCFXdBWlONHxSD2vg59c8MX89Nc0ZB8yjKn
 PKLTUlK+YyC8zqGDXH3s6OC8VYsYqaZKFbbbPddvd16any5BErsrTyjEqnREKS3YrZOxEPf5hCh
 fE4LNsEh3JH94zhI=
X-Received: by 2002:a5d:5229:0:b0:2c9:8b81:bd06 with SMTP id
 i9-20020a5d5229000000b002c98b81bd06mr6915587wra.56.1677749980941; 
 Thu, 02 Mar 2023 01:39:40 -0800 (PST)
X-Google-Smtp-Source: AK7set8PebgmF5pjU20TJEF6iaP1CeXa8jGNekpoJbnRVzV5413+oEHaxznU6NE/hu1XMSlfGcR5ag==
X-Received: by 2002:a5d:5229:0:b0:2c9:8b81:bd06 with SMTP id
 i9-20020a5d5229000000b002c98b81bd06mr6915575wra.56.1677749980611; 
 Thu, 02 Mar 2023 01:39:40 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 e29-20020a5d595d000000b002cde25fba30sm1380312wri.1.2023.03.02.01.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:39:40 -0800 (PST)
Date: Thu, 2 Mar 2023 04:39:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: Re: [PATCH v5 13/18] pci: introduce pci_find_the_only_child()
Message-ID: <20230302043819-mutt-send-email-mst@kernel.org>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
 <20230216180356.156832-14-vsementsov@yandex-team.ru>
 <20230301160855-mutt-send-email-mst@kernel.org>
 <ab95ffbd-98c4-70f0-c547-55436118f7a2@yandex-team.ru>
 <20230302033437-mutt-send-email-mst@kernel.org>
 <9ca5a8be-5add-ce57-d613-e09dee08ab6a@yandex-team.ru>
 <20230302035048-mutt-send-email-mst@kernel.org>
 <7458129e-3c23-be27-dcfa-41dca6c731a4@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7458129e-3c23-be27-dcfa-41dca6c731a4@yandex-team.ru>
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

On Thu, Mar 02, 2023 at 12:35:54PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 02.03.23 11:53, Michael S. Tsirkin wrote:
> > On Thu, Mar 02, 2023 at 11:45:00AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > On 02.03.23 11:37, Michael S. Tsirkin wrote:
> > > > On Thu, Mar 02, 2023 at 11:28:44AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > > On 02.03.23 00:09, Michael S. Tsirkin wrote:
> > > > > > On Thu, Feb 16, 2023 at 09:03:51PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > > > > To be used in further patch to identify the device hot-plugged into
> > > > > > > pcie-root-port.
> > > > > > > 
> > > > > > > Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
> > > > > > > Reviewed-by: Anton Kuchin<antonkuchin@yandex-team.ru>
> > > > > > Wait a second does this work for multifunction devices correctly?
> > > > > > 
> > > > > 
> > > > > I thought about that and I'm just lost:)
> > > > > 
> > > > > Could several (multifunction?) devices be plugged into one pcie-root-port device?
> > > > 
> > > > One device per port but one multifunction device is represented as multiple PCIDevice structures.
> > > 
> > > So, it should be OK to send _one_ event for that multifunction device, and the code is shpc_reset() is OK, but reporting "Several child devices found" is bad idea?
> > 
> > I don't know about your new event, we are discussing it separately.
> > yes all functions are removed together normally on real hardware.
> > 
> > > So, if I change the logic from pci_find_the_only_child() to pci_find_first_child() is it OK?
> > 
> > Yes though I don't like this name either - need to make it clear that
> > multifunction is ok, multiple unrelated devices aren't.
> 
> Could we check it somehow that all plugged devices represent the one multifunction device?

You can write a function like this, sure.
But really just return a bus+slot pair.

> > 
> > 
> > > > 
> > > > > Same question for SHPC slots. For example, shpc_free_devices_in_slot() looks like we can have several devices in one slot..
> > > > > On the other hand, in shpc_reset() we have construction shpc->sec_bus->devices[PCI_DEVFN(SHPC_IDX_TO_PCI(i), 0)] to access the device in slot. The only one device.
> > > > > 
> > > > > -- 
> > > > > Best regards,
> > > > > Vladimir
> > > > 
> > > > Same thing.
> > > > 
> > > > ... and let's not get started about sriov and ari ...
> > > > 
> > > 
> > > -- 
> > > Best regards,
> > > Vladimir
> > 
> 
> -- 
> Best regards,
> Vladimir


