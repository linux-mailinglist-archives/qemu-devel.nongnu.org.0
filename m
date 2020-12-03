Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B742CD9B8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 15:59:41 +0100 (CET)
Received: from localhost ([::1]:35548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkq55-0002fb-Jl
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 09:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkq3t-0002AW-4d
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 09:58:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkq3q-0000c7-EE
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 09:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607007501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zh/ukTLWYiKSYnFYRgp0Vxrr55d0g+qn1L3m/wQgck=;
 b=dwr4mtgfaSOhi2O9OsR5NvYzQIeSIQ+T9I6KZysZMhnhHs7nqmntHcnFTx1DIvbH9R+3uc
 yZdiipcdwsUJTBCOL0zyY/v4hMXZK+cPun/uIF+uZ6pC4v7umcDQjeFLMa77CMx85CbtPt
 KLY2SsHPThd3UQntgsKfc/D7SC+S8vs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-mqlaumnIPjqo3gpstKOIBQ-1; Thu, 03 Dec 2020 09:58:17 -0500
X-MC-Unique: mqlaumnIPjqo3gpstKOIBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9938101274D;
 Thu,  3 Dec 2020 14:58:15 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2840960C15;
 Thu,  3 Dec 2020 14:58:14 +0000 (UTC)
Date: Thu, 3 Dec 2020 09:58:14 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201203145814.GK3836@habkost.net>
References: <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net>
 <20201202151713.GE16765@merkur.fritz.box>
 <20201202160554.GG3836@habkost.net>
 <20201202173506.GH16765@merkur.fritz.box>
 <20201203064629.qbhbzzizuyebdbgd@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20201203064629.qbhbzzizuyebdbgd@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 07:46:29AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > It would be much nicer to do the wrapper the other way round, i.e.
> > setting properties before the device is realized would update a
> > configuration struct and realize would then call .create() with that
> > struct. To me, this sounds much harder, though also a more useful state.
> 
> Well, in some places we already have separate config structs.  We have
> NICConf for example, which is typically used like this:
> 
> 	struct USBNetState {
> 	   USBDevice dev;
> 	   [ ... ]
> 	   NICConf conf;
> 	   [ ... ]
> 	};
> 
> and
> 
> 	static Property net_properties[] = {
> 	    DEFINE_NIC_PROPERTIES(USBNetState, conf),
> 	    DEFINE_PROP_END_OF_LIST(),
> 	};
> 
> So I think we could:
> 
>   (1) move *all* properties into structs.
>   (2) generate those structs from qapi schemas.
>   (3) generate Property lists (or functions with
>       object_class_property_add_*() calls) from qapi
>       schema.
> 
> We could then convert devices one-by-one without breaking anything
> or needing two code paths essentially doing the same thing in two
> different ways.

Sounds great to me.

This can also work the other way around for devices that weren't
converted yet: we should be able to generate a QAPI schema from
the property lists.

-- 
Eduardo


