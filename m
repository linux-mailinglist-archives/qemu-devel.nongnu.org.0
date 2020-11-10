Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA12E2ADD58
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:49:14 +0100 (CET)
Received: from localhost ([::1]:56270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXlZ-0008MA-Pm
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcXjL-0007BO-32
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:46:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcXjI-0004f5-8l
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605030411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fXWAuqmU+5IZEejpkx1doNugfKTQwXSxavz7Gq3dT/k=;
 b=YCDLSNNQIsNSBmm8IGvSuIIif1Fspc4JShazGYvboLnAjPiw8P95gsf+Jou/Lyv1kLUCyt
 WcGm4kYjgo/8DU3nPNH0JovY/EyEHJEL9vtBNPAA5dWSLkpWz5kK3tHUyKXTKiKs3IboZn
 cxrx7sFQrY6XxY31odBBWRxk+FV1U3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-soRXrQ17NIGQoKu3cYl1Tw-1; Tue, 10 Nov 2020 12:46:49 -0500
X-MC-Unique: soRXrQ17NIGQoKu3cYl1Tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 048F1803F60;
 Tue, 10 Nov 2020 17:46:48 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4CC8610F3;
 Tue, 10 Nov 2020 17:46:47 +0000 (UTC)
Date: Tue, 10 Nov 2020 12:46:46 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: QOM address space handling
Message-ID: <20201110174646.GH5733@habkost.net>
References: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
 <20201110150333.GE5733@habkost.net>
 <eec01576-51b4-e52b-f511-b127c6182da3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <eec01576-51b4-e52b-f511-b127c6182da3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 10, 2020 at 04:08:16PM +0100, Paolo Bonzini wrote:
> On 10/11/20 16:03, Eduardo Habkost wrote:
> > > Does anyone have any arguments for which solution is preferred?
> > I'd say (2) is preferred, as we don't expect object_new(T) to
> > have any side effects outside the object instance state.
> 
> Since there are no listeners, the side effects of address_space_init() are
> relatively limited.  So doing it in instance_init is not a big deal.
> 
> > Most
> > address_space_init() calls in the code today seem to be in
> > realize functions.
> > 
> > However, I wonder if we could make this simpler (and mistakes
> > less fatal) if we make AddressSpace a QOM child of the device.
> > Paolo, would it be too much overhead to make AddressSpace a QOM
> > object?
> 
> No, it wouldn't.  AddressSpace is already quite heavyweight.

I thought this was going to be an easy job, but call_rcu()
requires rcu_head to be the first struct field.  I assume it is
acceptable to use call_rcu1() + container_of() manually in this
case.

-- 
Eduardo


