Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A0139AE00
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 00:28:52 +0200 (CEST)
Received: from localhost ([::1]:39884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovpb-0006C7-0C
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 18:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lovoq-0005Xe-SP
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 18:28:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lovoo-0005yL-RU
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 18:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622759281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MD2CkL1j6q9aeF4rXo9093xzeIYR8qI6iXcdvr+wKIo=;
 b=VkVXzQExOWtmQfac3uh4DbPUfQ7/pQrkTp9LFPIDaQKMcF3M+ue30RMmEdB8LZwWX/qYfc
 Wrmh/PXVGBqzthz/9AIHQl0u09gyuXIwPa7XG9nEWFfMsT/WIH7cQuFGPwyyTwKurRoJj0
 T5nYg2vxWvCQTF3iBftGHsSUOvd4UDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-LYdN-H8DNuihTkzSr0esjQ-1; Thu, 03 Jun 2021 18:27:59 -0400
X-MC-Unique: LYdN-H8DNuihTkzSr0esjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0D58501E0
 for <qemu-devel@nongnu.org>; Thu,  3 Jun 2021 22:27:58 +0000 (UTC)
Received: from localhost (ovpn-120-94.rdu2.redhat.com [10.10.120.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88749500DB;
 Thu,  3 Jun 2021 22:27:58 +0000 (UTC)
Date: Thu, 3 Jun 2021 18:27:57 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v7 1/9] i386: avoid hardcoding '12' as 'hyperv_vendor_id'
 length
Message-ID: <20210603222757.w3r5vhgc3pro6p2i@habkost.net>
References: <20210603114835.847451-1-vkuznets@redhat.com>
 <20210603114835.847451-2-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210603114835.847451-2-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 01:48:27PM +0200, Vitaly Kuznetsov wrote:
> While this is very unlikely to change, let's avoid hardcoding '12' as
> 'hyperv_vendor_id' length.
> 
> No functional change intended.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


