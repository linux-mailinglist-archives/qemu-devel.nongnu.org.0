Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40531C03D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 18:14:43 +0100 (CET)
Received: from localhost ([::1]:39212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBhSM-0004s2-Nb
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 12:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lBhJa-0004Xw-3V
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:05:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lBhJX-0006KV-BE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:05:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613408734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3A1wTkHPoYmtu9csjQsl22wInSxklSpLTwWWHd7OE8=;
 b=N0PoiNWkk+sXFb7UQiNRgWje6JAqjWsz5JJQsn1zwGEQalzBfdK29UhJsBSmgDNC8aKBbt
 LIpbPCXbmKbsFMBz2AL8br/ZslemONfIO3WsmwkveHCX0sLXetQzOWNKPgcPCnYkHzP7ZA
 5i9auBBrCb2tnxtFCBMgxE869EUDauI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-k6FBD4BhO3Ol4l30XC7dQw-1; Mon, 15 Feb 2021 12:05:30 -0500
X-MC-Unique: k6FBD4BhO3Ol4l30XC7dQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E984980196E
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 17:05:29 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D9B562461;
 Mon, 15 Feb 2021 17:05:27 +0000 (UTC)
Date: Mon, 15 Feb 2021 18:05:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
Message-ID: <20210215180526.1fa327f2@redhat.com>
In-Reply-To: <20210215165502.64e1e629@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com>
 <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com>
 <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <87h7mhl33o.fsf@vitty.brq.redhat.com>
 <20210212170527.0e93e6b2@redhat.com>
 <87blcllnf0.fsf@vitty.brq.redhat.com>
 <20210215165502.64e1e629@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Feb 2021 16:55:02 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Mon, 15 Feb 2021 09:56:19 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> 
> > Igor Mammedov <imammedo@redhat.com> writes:
> >   
> > > On Fri, 12 Feb 2021 16:26:03 +0100
> > > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> > >    
> > >> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
> > >>     
> > >> > Igor Mammedov <imammedo@redhat.com> writes:
> > >> >      
[...]
> >(I think ppc  does similar hing also)

well scratch that off, I can't find PPC part anymore. Maybe
I've confused that with something else.

[...]


