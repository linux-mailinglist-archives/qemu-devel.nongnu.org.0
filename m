Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A182FBCB5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:41:58 +0100 (CET)
Received: from localhost ([::1]:46634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1u4r-0002lS-KN
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l1tyi-0006UD-PH
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:35:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l1tyb-0007EI-2a
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611074126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LoLfCE8UIL21AAj4EJFWj2eSX7MQNf4JhIZv/BiyYxo=;
 b=beCR8YkFJR63SGCbeHY+WUZjr0TXJe8NS0EavAAzaoEkygan8AHI40OYkjdlwP/BoS1xVZ
 vEepbaAsVuGJA+jwOImWbui9FWHDw8dIjHbIqK5M+kkKcDDq8Wmtb53o5rqJQ0rxhdjJVz
 3i/H2gWfhgTiMtl2+u3sEUpqgJXv35w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-rPF0v8LANtOgOg2dhXbtzg-1; Tue, 19 Jan 2021 11:35:24 -0500
X-MC-Unique: rPF0v8LANtOgOg2dhXbtzg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C178107ACF6;
 Tue, 19 Jan 2021 16:35:23 +0000 (UTC)
Received: from localhost (ovpn-118-239.rdu2.redhat.com [10.10.118.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F0CC5D9F8;
 Tue, 19 Jan 2021 16:35:19 +0000 (UTC)
Date: Tue, 19 Jan 2021 11:35:18 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 0/2] x86 CPU feature +/- fiddling and +kvm-no-defaults
Message-ID: <20210119163518.GH1227584@habkost.net>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119162826.GL2335568@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210119162826.GL2335568@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 04:28:26PM +0000, Daniel P. Berrangé wrote:
> On Tue, Jan 19, 2021 at 02:22:05PM +0000, David Edmondson wrote:
> > Currently "-cpu -feature,+feature" will disable -feature, which seems
> > contrary to the intention of the user. Fix this such that the later
> > flag wins. There are no changes to the interaction of +/- and =on/=off.
> 
> The -feature/+feature syntax is the legacy  way of configuring
> features, with feature=on|off being the preferred, since that matches
> the general QEMU standard for boolean properties.
> 
> Your proposed change in ordering of + vs - makes conceptual sense, but
> it is none the less a semantic change in behaviour that may well cause
> breakage for existing deployed VMs. This impacts guest ABI so could
> particularly cause live migration problems.
> 
> IOW, we should have implemented it the way you propose in the first
> place, but I don't think it is safe to change it now, unless you can
> tie that new semantic to a machine type version.
> 
> Before we consider that though, Paolo has just deprecated many of the
> legacy approaches for boolean properties in this:
> 
>   https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg04341.html
> 
> I'm inclined to say that we just follow on from that and finally
> deprecate the +feature/-feature CPU syntax which we're already considering
> legacy. This would remove the need to care about changing its behaviour

I believe we had multiple proposal in the past do deprecate
+feature/-feature, but there were objections.  I couldn't find
the original threads, though.

In either case, I thought we had already deprecated the weird
ordering rules of "-feature,+feature".

-- 
Eduardo


