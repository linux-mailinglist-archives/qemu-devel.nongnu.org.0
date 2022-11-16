Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172E462C3F5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 17:21:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovL9q-0003pt-8o; Wed, 16 Nov 2022 11:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ovL9n-0003nI-Rw
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:20:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ovL9m-0003Hq-0j
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:20:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668615657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQD6ltUcwdbuTg1ouwIr2CLcftaelVO4K9oAXRGoZcs=;
 b=CEJOsUu30olsKJiGaCX9gxhQIDcAfkdMlUM2JuH6J79hjCMjJIysoxJi/Doy3Ll/c1/DUA
 V8ZRcfRSP/LGX9pSKIX4O+l2pm+t3A2tMAqkjGztmoA9+Kw2VgzNmuT38LFDwRZXA0XHN2
 MvHxdY0inUAyn6s+zXnEBuhi8VH53OY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-nYRZKfZ4Obi0Au9hLk0qgg-1; Wed, 16 Nov 2022 11:20:53 -0500
X-MC-Unique: nYRZKfZ4Obi0Au9hLk0qgg-1
Received: by mail-wm1-f72.google.com with SMTP id
 h188-20020a1c21c5000000b003cfe4cc64eeso1383387wmh.6
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 08:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eQD6ltUcwdbuTg1ouwIr2CLcftaelVO4K9oAXRGoZcs=;
 b=kF5Xv/gJlrVc5J11bZ7XvdVSh2JiQfk+OrOxcaH+hJM4Rg2l64fjKS7MWEjlwycidq
 8HNpdDkynLd5q7hS5ZymjEUPmOEYAysTcKbJMnKYuAOcriLSDQVBstxOVgvPVweffGeV
 LAHnEctxXMmsNjfVz8Kg+2R7S0lkiW1gdKsp6vfgUAtbB3cQQiGT0MinqT+MUM0lcwW/
 NxVnPlM4dBsKN3la1K2r1jzFzUTWYUEjvKtIb8UaElXXdlmGR6CFJ5+oQG1Ur0Gd3jNi
 VpaMipIpCDmrkUxXbVH2+PlyH96RV9rGcsr3gNycc6fmr/t3eUXMWKyjMc3jvpsVlVzE
 odTA==
X-Gm-Message-State: ANoB5pmyFL7rUNcxZHGFaZH3R92/BldAfhemm/1WEcgcDB3LEGlXqUI/
 n4DFx7BvHKrCHSfQfYzasVfNH9mNj7uMHy0uRcV6PXj+OrRjjHHalVUUysmnXACOur8D9m122Zq
 Lwx/KB9TeN1q/90w=
X-Received: by 2002:a5d:4531:0:b0:22d:6ad5:bc0f with SMTP id
 j17-20020a5d4531000000b0022d6ad5bc0fmr14788296wra.115.1668615652318; 
 Wed, 16 Nov 2022 08:20:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf64xlDvGBsEmpT1m33R9DEVYtxdSm3z5Pa/hJCwGzTG2yRu1nh38sPiiiFafVJzFBdUqmc8FQ==
X-Received: by 2002:a5d:4531:0:b0:22d:6ad5:bc0f with SMTP id
 j17-20020a5d4531000000b0022d6ad5bc0fmr14788289wra.115.1668615652060; 
 Wed, 16 Nov 2022 08:20:52 -0800 (PST)
Received: from redhat.com ([2.52.131.207]) by smtp.gmail.com with ESMTPSA id
 j18-20020a05600c191200b003c83465ccbfsm3103581wmq.35.2022.11.16.08.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 08:20:51 -0800 (PST)
Date: Wed, 16 Nov 2022 11:20:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, eduardo@habkost.net, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 den-plotnikov@yandex-team.ru
Subject: Re: [PATCH RFC 0/2] add SHPC hotplug event
Message-ID: <20221116112033-mutt-send-email-mst@kernel.org>
References: <20221116161234.44206-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116161234.44206-1-vsementsov@yandex-team.ru>
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

On Wed, Nov 16, 2022 at 07:12:32PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Hi all! Please look at 02 for the details.


I got 2 copies donnu which to reply to.

> Vladimir Sementsov-Ogievskiy (2):
>   hw/pci/shpc: introduce FOR_EACH_DEVICE_IN_SLOT
>   qapi: introduce DEVICE_POWER_ON for SHPC hotplug
> 
>  hw/pci/shpc.c  | 53 +++++++++++++++++++++++++++++++++++++++++---------
>  qapi/qdev.json | 23 ++++++++++++++++++++++
>  2 files changed, 67 insertions(+), 9 deletions(-)
> 
> -- 
> 2.34.1


