Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E5739BAA0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 16:07:53 +0200 (CEST)
Received: from localhost ([::1]:47586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpAUJ-0007pf-Ov
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 10:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpATT-00078T-Jf
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 10:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpATR-0001wb-R8
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 10:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622815616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bAQx3drSo/aaHUi7HQXqJBHHCrkrrlqn72OVCZXBmxc=;
 b=eUYJBli9/pUv7O4XANEeTG9T1puiCwwJG8rHjY+5L/y9BWVckxYqJ0UU6e+4tpW+IN/axS
 MK4sekVDs/dabA4b4J3merGh/MJdeYz52APnXJvYMdt4GuIPlRxyPbiM/c5Bc4+DSdd8rk
 /E9Zm0GBclBMV3KRs90ll9m+elcjbqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-mYXHlTVLPhSSMiFyxA-ojQ-1; Fri, 04 Jun 2021 10:06:54 -0400
X-MC-Unique: mYXHlTVLPhSSMiFyxA-ojQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F84B805F03
 for <qemu-devel@nongnu.org>; Fri,  4 Jun 2021 14:06:53 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 029CE5C1C5;
 Fri,  4 Jun 2021 14:06:52 +0000 (UTC)
Date: Fri, 4 Jun 2021 09:06:51 -0500
From: Eric Blake <eblake@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v7 8/9] i386: Hyper-V SynIC requires
 POST_MESSAGES/SIGNAL_EVENTS priviliges
Message-ID: <20210604140651.oq47qrda5uc6hrpq@redhat.com>
References: <20210603114835.847451-1-vkuznets@redhat.com>
 <20210603114835.847451-9-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210603114835.847451-9-vkuznets@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 01:48:34PM +0200, Vitaly Kuznetsov wrote:

In the subject, s/priviliges/privileges/

> When Hyper-V SynIC is enabled, we may need to allow Windows guests to make
> hypercalls (POST_MESSAGES/SIGNAL_EVENTS). No issue is currently observed
> because KVM is very permissive, allowing these hypercalls regarding of
> guest visible CPUid bits.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


