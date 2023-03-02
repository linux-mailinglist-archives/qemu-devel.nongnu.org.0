Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322FF6A7CEB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeS3-0003x7-QL; Thu, 02 Mar 2023 03:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeRq-0003sf-OL
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:37:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeRp-0005K0-02
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677746276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R+LsMKf3J6JW+CXjMCjhQ0ncInztW5Rj8qrmRwpKvP4=;
 b=gNbMzIMq2zaSD7LWpyixR0N3+o+4AfoG1+tDGBExdxUhY6D1AZIr1CKdAYZkzNqNVTuM3V
 S/qrGV6JKLDKbPSZhEl7YXGs25KtAxV5K+bWAskrUDI+9gWiGwfR5eUsSwOHoeke9Sr8hS
 62recbP+NTWyqSJARCzitobF3lPvTrA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-uvHOAlOvMgSPlYSBvxnv5g-1; Thu, 02 Mar 2023 03:37:50 -0500
X-MC-Unique: uvHOAlOvMgSPlYSBvxnv5g-1
Received: by mail-wm1-f71.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so934323wma.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677746269;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+LsMKf3J6JW+CXjMCjhQ0ncInztW5Rj8qrmRwpKvP4=;
 b=41olR2W789VWdnZTcYnqHyuFgHv+IDM8y72hyoVXsIboFqEQhkxN7r7zVLEayYhwWR
 +GdAVee67V11nSI91FsE9OW0q8yhJX+NKGMp6+Fn6bpHifoVk6M/62fgEJEhOVvDg6mu
 p/1XM2gF01z8Ozb/6JOov7it80kCfqLCKPkkm/offyur4QKQkSdczO0aukfrjT0yTcVP
 ZSjCf7Uu++K5wg23yhj0ge/Y1i3ZFpCt7pwadqRlaHkvebimZpJ3OhgGuBzXCffDQmGU
 M9SvQU4Sf11//sgwZsI+ngQqqUeFkEN/RLiZ3goxQVO8imCkqDdA12S5mWMdbvBtrP78
 luog==
X-Gm-Message-State: AO0yUKXI41OSavnWXTWpfpETBNApJOfv8j4u3t9nG10E8A2YL+HxgJ/U
 GtycDPJxkuOvH9/0aG6hvLW7IfgfUc47uO53+cnxEWWV8sZ3sJ2FkHajdI5thMeVtQ5izdFAfmR
 m2UIFSbFu/gwPqEM=
X-Received: by 2002:adf:ee85:0:b0:2c7:1a86:aecd with SMTP id
 b5-20020adfee85000000b002c71a86aecdmr6967321wro.2.1677746269668; 
 Thu, 02 Mar 2023 00:37:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+R7kNSdNDA4Rhg8ASaGldQquB1eCCvZIwgEXe+Ug7bWAbvS39oHRG/AJRO0aRP5b/ad3m0QQ==
X-Received: by 2002:adf:ee85:0:b0:2c7:1a86:aecd with SMTP id
 b5-20020adfee85000000b002c71a86aecdmr6967300wro.2.1677746269371; 
 Thu, 02 Mar 2023 00:37:49 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b003db0ad636d1sm2328609wms.28.2023.03.02.00.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:37:48 -0800 (PST)
Date: Thu, 2 Mar 2023 03:37:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: Re: [PATCH v5 13/18] pci: introduce pci_find_the_only_child()
Message-ID: <20230302033437-mutt-send-email-mst@kernel.org>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
 <20230216180356.156832-14-vsementsov@yandex-team.ru>
 <20230301160855-mutt-send-email-mst@kernel.org>
 <ab95ffbd-98c4-70f0-c547-55436118f7a2@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab95ffbd-98c4-70f0-c547-55436118f7a2@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Mar 02, 2023 at 11:28:44AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 02.03.23 00:09, Michael S. Tsirkin wrote:
> > On Thu, Feb 16, 2023 at 09:03:51PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > To be used in further patch to identify the device hot-plugged into
> > > pcie-root-port.
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
> > > Reviewed-by: Anton Kuchin<antonkuchin@yandex-team.ru>
> > Wait a second does this work for multifunction devices correctly?
> > 
> 
> I thought about that and I'm just lost:)
> 
> Could several (multifunction?) devices be plugged into one pcie-root-port device?

One device per port but one multifunction device is represented as multiple PCIDevice structures.

> Same question for SHPC slots. For example, shpc_free_devices_in_slot() looks like we can have several devices in one slot..
> On the other hand, in shpc_reset() we have construction shpc->sec_bus->devices[PCI_DEVFN(SHPC_IDX_TO_PCI(i), 0)] to access the device in slot. The only one device.
> 
> -- 
> Best regards,
> Vladimir

Same thing.

... and let's not get started about sriov and ari ...

-- 
MST


