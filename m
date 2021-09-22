Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B814414C24
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 16:36:10 +0200 (CEST)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT3M0-0003R9-WF
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 10:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT3Jd-0002e8-6s
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT3JZ-0002AK-IT
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632321215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y5uKLxlgs+dCIM2BKihrv7jIDqje5Rvqt+R3AP1p5CA=;
 b=TqBS3fYY3GLu+3TsxEdgqJIpj2Qk5eND9lNCKOU041l8GlRESVDY+JWAvgUXEx4k5q+Naf
 Qp/JyeddlX+kPpNKflYNgOQpN0s31i10OO2Xa0Mx3LVWV13IFpwW3nSZgDDLvh6wRGCTlt
 VjbM9mOFTIXpJIY8LvXBnFPGxDO5hPo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-1-wF2CSbNzqFKYqelCz1Pg-1; Wed, 22 Sep 2021 10:33:35 -0400
X-MC-Unique: 1-wF2CSbNzqFKYqelCz1Pg-1
Received: by mail-qv1-f70.google.com with SMTP id
 r18-20020a056214069200b0037a291a6081so11750223qvz.18
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 07:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y5uKLxlgs+dCIM2BKihrv7jIDqje5Rvqt+R3AP1p5CA=;
 b=Z1vYkpnJxTyaxCjl9woXrG+HJzhXDPUC49Ij3YfTXSOY9GFdOepF4WRxMagce3CC82
 +iaPiGcx7Z8HCew9d9MYhXZFsSt8KLBVTAJD6u71aYM4FIXDg1ZUToQbXNZWaQdWYT1b
 kfPptGF3Q3SE+GyrCcZEltTJSXd4kD5VQOl/kNV52H4/VL/z5c2S4B3q798xE2SSp0ZQ
 PJcmQUifu9plv20l4uRGAIr/5/nYSADa5IBqt+j5IMgyb0FTJOdjQXyZkZ7SdMreZyAo
 hoLQzmResgYx1nSnI6YeHxZ9J5Izrv45doYpyXVlN1WMPx6FtZN34AfGWjxd4qUbTOwu
 aVAg==
X-Gm-Message-State: AOAM530bQFjIwYVl6ItKSO/DUD8TTjmi8/E1V0qRRCFNF60zAUA3Cjw8
 ovsZcqKtKgDHtV9lJ+Wl2189mEQRZVJ4ZuLgQEluHaPl5CqxCadU5cxs3FuoPPb3F97qJ0LlkPV
 sfkTIIna1d6v8aXyThB0n5fUQZws3p/53G/EfPikasGw5DJEig9fyNHCYso3GAy6h
X-Received: by 2002:a37:aa46:: with SMTP id t67mr114334qke.346.1632321213974; 
 Wed, 22 Sep 2021 07:33:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXtBkeswAHXqzdSw8pOcxO/mDVv0aOoYkXq+e6XCC2XQVYkZDYF0WUt0IOarCEcRA9PeOrGg==
X-Received: by 2002:a37:aa46:: with SMTP id t67mr114307qke.346.1632321213700; 
 Wed, 22 Sep 2021 07:33:33 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id c4sm1909418qkf.122.2021.09.22.07.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:33:33 -0700 (PDT)
Date: Wed, 22 Sep 2021 10:33:31 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/3] dump-guest-memory: Add blocker for migration
Message-ID: <YUs+uxw03rpMeZ46@t490s>
References: <20210826185813.248441-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210826185813.248441-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 02:58:10PM -0400, Peter Xu wrote:
> v2:
> - One more patch: "migration: Make migration blocker work for snapshots too"
> - Move register of migration blocker to be before dump_init [Marc-Andre]
> - Collected r-bs
> 
> Both dump-guest-memory and live migration have vm state cached internally.
> Allowing them to happen together means the vm state can be messed up.  Simply
> block live migration for dump-guest-memory.
> 
> One trivial thing to mention is we should still allow dump-guest-memory even if
> -only-migratable is specified, because that flag should majorly be used to
> guarantee not adding devices that will block migration by accident.  Dump guest
> memory is not like that - it'll only block for the seconds when it's dumping.

Ping?

-- 
Peter Xu


