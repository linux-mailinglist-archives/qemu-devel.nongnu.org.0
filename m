Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010942D5845
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 11:33:42 +0100 (CET)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knJGW-00056w-Uh
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 05:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knJDP-0003fw-Db
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 05:30:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knJDN-0005C7-VJ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 05:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607596225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nUeCT5Ra0ceMJwLPEq6FMWmWiRSqMo0k5a66ZhHYFBU=;
 b=ZijFfP7+QJXi4ljVBnkuaXCI+xlLNU9x8eWpisk9AzRrRGWRAN9C4TgVXCgDD+dbjevcpl
 WmZi+ZavF4edisJ3dxM18uvSAAAPUvcrAQTUY6rkZ/Qmj2Ly6B+D9TYzZQ8zaZAl0zElDh
 7Z78A+jVs7/0hwFdkq/V39LONHy8GMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-Bybz-UJ8OEaSES3Griridw-1; Thu, 10 Dec 2020 05:30:23 -0500
X-MC-Unique: Bybz-UJ8OEaSES3Griridw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F31C8107ACE6;
 Thu, 10 Dec 2020 10:30:21 +0000 (UTC)
Received: from gondolin (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E52F6E41C;
 Thu, 10 Dec 2020 10:30:09 +0000 (UTC)
Date: Thu, 10 Dec 2020 11:30:06 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [RFC 3/8] s390x/pci: fix pcistb length
Message-ID: <20201210113006.666ce143.cohuck@redhat.com>
In-Reply-To: <1607546066-2240-4-git-send-email-mjrosato@linux.ibm.com>
References: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
 <1607546066-2240-4-git-send-email-mjrosato@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 schnelle@linux.ibm.com, richard.henderson@linaro.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  9 Dec 2020 15:34:21 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> In pcistb_service_call, we are grabbing 8 bits from a guest register to
> indicate the length of the store operation -- but per the architecture
> the length is actually defined by 13 bits of the guest register.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  hw/s390x/s390-pci-inst.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 70bfd91..db86f12 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -750,7 +750,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>      int i;
>      uint32_t fh;
>      uint8_t pcias;
> -    uint8_t len;
> +    uint16_t len;
>      uint8_t buffer[128];
>  
>      if (env->psw.mask & PSW_MASK_PSTATE) {
> @@ -760,7 +760,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>  
>      fh = env->regs[r1] >> 32;
>      pcias = (env->regs[r1] >> 16) & 0xf;
> -    len = env->regs[r1] & 0xff;
> +    len = env->regs[r1] & 0x1fff;
>      offset = env->regs[r3];
>  
>      if (!(fh & FH_MASK_ENABLE)) {

Is that a general problem that we just did not notice before?

If yes, this probably deserves a Fixes: tag and can be queued
independently of the rest of the series.


