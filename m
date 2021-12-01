Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B094643B8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 01:02:22 +0100 (CET)
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msD4n-00032P-93
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 19:02:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1msD3C-0002KP-Et
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 19:00:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1msD39-0007gn-FG
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 19:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638316838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kRIPhMy22Ov1Iec/rGFPwMvh0STo+p3D4/U8/eDJMhs=;
 b=coVnOUhhlUhiLeKS9ZEgumdJwHHM5PyHUMO5vvpQ9SSPtiI5SYDz1QCGy/S31M7uAq1m8m
 GKtXwpV970qXehycEOy9TkElhXNpFrHEcE1Euyiz2qrIzL71M7xFDU7ykXHZ/m8wCF7ExN
 q6RSwyRuUjq+DN8SnoVcoa4qyEw/hR8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-GZZievqeOPmAYdaLDc2opA-1; Tue, 30 Nov 2021 19:00:35 -0500
X-MC-Unique: GZZievqeOPmAYdaLDc2opA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so12810729wmd.9
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 16:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kRIPhMy22Ov1Iec/rGFPwMvh0STo+p3D4/U8/eDJMhs=;
 b=E7/yp5zXY1nZj1udADaoB2ZGZ1TKhvZ3/KQx7e+OUU9DCq9sJUSzJUAHCt1/hxK324
 5IgTbNQY3LPiOYzP2tMs/xtl1XhYE1d3u/NM9VZd/20NKCUxMWlheVZxUJ26gHoYlij5
 oFPh0QkgzsLKt7ig4z+Pl5n+OKoeUZroMVoghvAKWaeEqU2Z9G8yq8MFjAvXTNK8t86M
 IGihApS8wkBIyE7cLHc9OVSVrUfifNrvxTfleUU3ssxisfM8YdPndOPl8PVIZZXu5u2y
 LlXWhWEcpWkr5+AedQFJo4hiFPPkyw8DlalgkFJ0AUXSaxTRCfGxvzwdyjKhmtiQTMIR
 C4nA==
X-Gm-Message-State: AOAM533W8uyK9XMhY//dvW4I7rTphweRFnMTecQ0zUbDLTNLVFG2YhgU
 IsqbK8So098mmRh7TCmcCU9FKLTLm5rxLPhV38I8L25/ynSw5Y9Nil77scsm7WVumgstI84XSwy
 LScefxLNN1+fLw7E=
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr2501114wmq.50.1638316834068; 
 Tue, 30 Nov 2021 16:00:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuA3Uuh1zdPHzUGO9ivXb7G12Ae7AkL9Fb0PvcHoMXPRRYlBLDvhim0Ba53bqQP0F59mjsIw==
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr2501081wmq.50.1638316833805; 
 Tue, 30 Nov 2021 16:00:33 -0800 (PST)
Received: from redhat.com ([2.53.15.215])
 by smtp.gmail.com with ESMTPSA id h27sm3954122wmc.43.2021.11.30.16.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 16:00:33 -0800 (PST)
Date: Tue, 30 Nov 2021 19:00:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: why is iommu_platform set to off by default?
Message-ID: <20211130185825-mutt-send-email-mst@kernel.org>
References: <CAFEAcA-Fb15x7hAe-g8hP8HL1xB14iGnYi5=ZJM=0G0_hbBjTw@mail.gmail.com>
 <YaZTc6WmGnkC0KRD@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YaZTc6WmGnkC0KRD@stefanha-x1.localdomain>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 30, 2021 at 04:38:11PM +0000, Stefan Hajnoczi wrote:
> On Tue, Nov 30, 2021 at 02:32:49PM +0000, Peter Maydell wrote:
> > I've just spent a day or so trying to track down why PCI passthrough
> > of a virtio-blk-pci device wasn't working. The problem turns out to be
> > that by default virtio pci devices don't use the IOMMU, even when the
> > machine model has created an IOMMU and arranged for the PCI bus to
> > be underneath it. So when the L2 guest tries to program the virtio device,
> > the virtio device treats the IPAs it writes as if they were PAs and
> > of course the data structures it's looking for aren't there.
> > 
> > Why do we default this to 'off'? It seems pretty unhelpful not to
> > honour the existence of the IOMMU, and the failure mode is pretty
> > opaque (L2 guest just hangs)...
> 
> Historically VIRTIO used guest physical addresses instead of bus
> addresses (IOVA). I think when IOMMU support was added, a QEMU -device
> virtio-* parameter was added and it's simply off by default:
> 
>   iommu_platform=<bool>  - on/off (default: false)
> 
> Maybe this behavior is for backwards compatibility? Existing guests with
> IOMMUs shouldn't change behavior, although this could be fixed with
> machine type compat properties.
> 
> Stefan

Unfortunately iommu is special. Bypassing it makes the config
insecure for nested virt, so it's important that we do not
allow guest driver to disable the iommu through the
feature bit.
This means normal compat machinery (make feature on by default
but disable for legacy drivers) does not work here.

-- 
MST


