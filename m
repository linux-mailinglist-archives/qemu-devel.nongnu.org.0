Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015C6ED688
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 23:07:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr3Ox-0002zY-Vp; Mon, 24 Apr 2023 17:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pr3Os-0002zM-WE
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 17:07:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pr3Oq-0001NP-Jb
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 17:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682370422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=afykeHma1TwgJhP56gWhU/Hwlvl4YyiI2XqtYPf1AIM=;
 b=i5KiTFca4vuwRNxxJe3jbNys+ngOFXZ0GbkK+Lwql5C+c+e3i8KLX+N5mFlyvswcQ8ya3l
 gqQ5bG3sAQrVNe6zCw/8x7cEm0k8vi3spwjN+GeS3Ai3w/zavx4k0tqOOZbYmT+zHVtqJh
 K3rXfoRqDlzXiLMnHEzfs79Dee7ws5I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-0Ppx0-UqMWW4HDal7bhHxA-1; Mon, 24 Apr 2023 17:07:00 -0400
X-MC-Unique: 0Ppx0-UqMWW4HDal7bhHxA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb303so1741860f8f.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 14:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682370419; x=1684962419;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afykeHma1TwgJhP56gWhU/Hwlvl4YyiI2XqtYPf1AIM=;
 b=fqb4rrCOx+I++Udgj5qb5sx6gdvEWf3LZkAfOaysAosVpMFudBKU2uq7GgVKXfNaC6
 Wgsa3b0iCK2SW4+XpkzygSrPf7FrLSWPnAIJlmUoGbOpCGCwZPvP0Gfh5g8gmiPlyxIW
 Qzh1W79UsOb3vHs4w6Hw4f8cN8B4ALu5W9KxilOEgH97ZA2RFrpNhTGMNz2gHoBrQafz
 EKHfBtlrKaSx7hScbNaUsBOgdPkk6YSqFo2lCWIDwUOQq+WFwj1ukq+yod60REIV/nFT
 aOrOoLvllIUUNHqv3+fRGlQFO+M2kbDWOr09qH1b7jtRHzXDKu41m4tXrSXcbcoluDOH
 QaXA==
X-Gm-Message-State: AAQBX9cz4bErZNYf5lShm4EuSNYzi+vJWD53mAfJygpL4b1/xWhhRQX4
 0BOXTmaap/8C++dqtTsQ/LWZ+KaEqGMeNWYcF1CGNxKi0pgtugLWu+RWl2iwdSGrZTLtYx4mXbQ
 K34Q/LmU+r7AKiJI=
X-Received: by 2002:a05:6000:118e:b0:2ff:4b8a:6453 with SMTP id
 g14-20020a056000118e00b002ff4b8a6453mr10172513wrx.5.1682370419343; 
 Mon, 24 Apr 2023 14:06:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350b6jtCd5ZVBaxgtCg2Kwz0fg35lLRRcTSL/VYxvuWQTGqV78DEaEeCBuOjj9SdEZIHMBx4dzQ==
X-Received: by 2002:a05:6000:118e:b0:2ff:4b8a:6453 with SMTP id
 g14-20020a056000118e00b002ff4b8a6453mr10172504wrx.5.1682370419007; 
 Mon, 24 Apr 2023 14:06:59 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 f4-20020a0560001b0400b002ffbf2213d4sm11571590wrz.75.2023.04.24.14.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 14:06:58 -0700 (PDT)
Date: Mon, 24 Apr 2023 17:06:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 den-plotnikov@yandex-team.ru
Subject: Re: [PATCH] pci: make ROM memory resizable
Message-ID: <20230424170630-mutt-send-email-mst@kernel.org>
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <20230424164105-mutt-send-email-mst@kernel.org>
 <20230424164222-mutt-send-email-mst@kernel.org>
 <241d3c11-17bd-4db1-04de-6268031b57df@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <241d3c11-17bd-4db1-04de-6268031b57df@yandex-team.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 25, 2023 at 12:02:49AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 24.04.23 23:45, Michael S. Tsirkin wrote:
> > On Mon, Apr 24, 2023 at 04:42:00PM -0400, Michael S. Tsirkin wrote:
> > > On Mon, Apr 24, 2023 at 11:36:47PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > On migration, on target we load local ROM file. But actual ROM content
> > > > migrates through migration channel. Original ROM content from local
> > > > file doesn't matter. But when size mismatch - we have an error like
> > > > 
> > > >   Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
> > > > 
> > > > Let's just allow resizing of ROM memory. This way migration is not
> > > > relate on local ROM file on target node which is loaded by default but
> > > > is not actually needed.
> > > > 
> > > > Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
> > Also isn't ROM size reflected in config space etc?
> > I don't remember code that would update that on migration.
> > 
> > 
> 
> Thanks a lot for fast answers!
> 
> Hmm. I'm a newbie in these things.
> 
> But yes, I noted, that my patch helps, if, for example jump from 200K to 500K zero-filled ROM file. But if jump to 600K, migration fails with
> 
> (qemu) qemu: get_pci_config_device: Bad config data: i=0x32 read: b8 device: 0 cmask: ff wmask: f0 w1cmask:0
> qemu: Failed to load PCIDevice:config
> qemu: Failed to load virtio-net:virtio
> qemu: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-net'
> qemu: load of migration failed: Invalid argument
> 
> 
> I thought, that, maybe, romfile for this device just mustn't be more than 512K where config starts. But now I think that it's exactly the problem you are saying about.
> 
> 
> I know also, that there were another step around this problem: 08b1df8ff463e72b087 "pci: add romsize property".. But it doesn't help when you already have a running instance with small ROM and want to migrate it to the node where you have corresponding local ROM file updated to new package with bigger size.
> 

set romsize on destination?

> Hmm. So, simply reuse "resizable" memory blocks doesn't help. And I need more precise reinitialization of device on load of incoming migration..
> 
> -- 
> Best regards,
> Vladimir


