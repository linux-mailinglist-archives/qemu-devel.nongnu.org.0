Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9529445B27
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 21:34:45 +0100 (CET)
Received: from localhost ([::1]:38884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mijRc-0008Kf-Gt
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 16:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mijQD-0007bT-9i
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 16:33:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mijQ5-0000Jk-81
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 16:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636057987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5GfMwxxMB+RLNDcNnx6npKC6AEdZBgPHuffSa//Eayw=;
 b=VTc8q9e56loP5LyPG7T6br/lgxtiKG9vU4Vyb6z9Z3l/uP80uU2paN0SIV0TdnWD/UY7af
 wQPDDL96fE0oWX0HDFAsW8yWFiXh2sGIPrxZAyd06A26Cy9t3TpL5DJwAE5Jskth8DPOM1
 qgChzG8jw/tRrsuHBLIvQAXbM/Y5sa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-yimJWum2O9W7c3s73EZFHw-1; Thu, 04 Nov 2021 16:32:54 -0400
X-MC-Unique: yimJWum2O9W7c3s73EZFHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B14178799E0;
 Thu,  4 Nov 2021 20:32:52 +0000 (UTC)
Received: from redhat.com (ovpn-112-104.phx2.redhat.com [10.3.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BA991017E37;
 Thu,  4 Nov 2021 20:32:31 +0000 (UTC)
Date: Thu, 4 Nov 2021 15:32:30 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 07/22] docs/devel: document expectations for QAPI data
 modelling for QMP
Message-ID: <20211104203230.nv5z2fktxyg2cj37@redhat.com>
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-8-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028155457.967291-8-berrange@redhat.com>
User-Agent: NeoMutt/20211029-10-fe244a
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 04:54:42PM +0100, Daniel P. Berrangé wrote:
> Traditionally we have required that newly added QMP commands will model
> any returned data using fine grained QAPI types. This is good for
> commands that are intended to be consumed by machines, where clear data
> representation is very important. Commands that don't satisfy this have
> generally been added to HMP only.
> 

> The poster child example for this would be the 'info registers' HMP
> command which returns printf formatted data representing CPU state.
> This information varies enourmously across target architectures and

enormously

> changes relatively frequently as new CPU features are implemented.
> It is there as debugging data for human operators, and any machine
> usage would treat it as an opaque blob. It is thus reasonable to
> expose this in QMP as 'x-query-registers' returning a 'str' field.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


