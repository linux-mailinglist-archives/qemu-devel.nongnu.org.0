Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279EF2B81DA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:27:46 +0100 (CET)
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQJ7-0003sy-5w
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfQF3-0000qZ-68
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:23:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfQF0-0002ZY-VK
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605716610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O/8Q4jrXYPbTy4IElZIH3lAlpoPFmFSaFhLWacN2bDM=;
 b=FXe3GTSRn1621vtxr3vEMq1pSYKJX3K5cai9zJzcmBb62Big6FZliZYoK7fR8HIs/IeX2i
 7SNqXlfGLaOOTcVAKwQnBQXbcX9SqY3EhmMAhf7kZ+Q1AWI+IghYX7IKuMulqWmJrbHBsO
 AFNAF2pgzftDH1xbsxK/1+zvHLsOsRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-Dn0l1-P_M_ScuMgWE9TTBg-1; Wed, 18 Nov 2020 11:23:22 -0500
X-MC-Unique: Dn0l1-P_M_ScuMgWE9TTBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B433800138;
 Wed, 18 Nov 2020 16:23:21 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12F715D9CD;
 Wed, 18 Nov 2020 16:23:20 +0000 (UTC)
Date: Wed, 18 Nov 2020 11:23:19 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
Message-ID: <20201118162319.GK1509407@habkost.net>
References: <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net>
 <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local>
 <87ft57oycu.fsf@dusky.pond.sub.org>
 <20201118112845.GA11988@merkur.fritz.box>
 <20201118115612.GD229461@redhat.com>
 <87blfukbzd.fsf@dusky.pond.sub.org>
 <20201118154507.GI1509407@habkost.net>
 <c411d2ac-fafe-872b-cc34-9c7b5901120d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c411d2ac-fafe-872b-cc34-9c7b5901120d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 09:56:28AM -0600, Eric Blake wrote:
> On 11/18/20 9:45 AM, Eduardo Habkost wrote:
> > On Wed, Nov 18, 2020 at 02:53:26PM +0100, Markus Armbruster wrote:
> > [...]
> >> Another way to skin this cat:
> >>
> >>       {"available": {"kvm": { extra properties... },
> >>                      "tcg": ...,
> >>                      "xen": ...},
> >>        "active": "kvm"}
> > 
> > How would this structure be represented in the QAPI schema?
> > 
> > In other words, how do I say "Dict[str, AccelInfo]" in QAPIese?
> 
> {'type':'AvailAccel', 'data': {
>   '*kvm': 'KvmExtraProps',
>   '*tcg': 'TcgExtraProps',
>   '*xen': 'XenExtraProps',
>   '*hax': 'HaxExtraProps' } }
> {'command':'query-accel', 'returns': {
>    'available': 'AvailAccel', 'active': 'strOrEnum' } }
> 
> where adding a new accelerator then adds a new optional member to
> AvailAccel as well as possibly a new enum member if 'active' is driving
> by an enum instead of 'str'.

Is it possible to represent this if we don't enumerate all
possible dictionary keys in advance?  (I'm not suggesting we
should/shouldn't do that, just wondering if it's possible)

-- 
Eduardo


