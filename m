Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3228875B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 12:56:12 +0200 (CEST)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQq4J-0007eX-Mx
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 06:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kQq2b-0007B5-HF
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kQq2V-0006CI-GA
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602240858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfUFjLKWmN3RUQmEbSIjpCLVxhLYAyziDiVSdthP/tw=;
 b=aYjMsCrvOKru8tBUP/HxixZ2MayOowakU9IKkxp2RRweDnLJYdU0wwiFnYSGPm59goqYWv
 b3U2pZ7lGmiUHoTFqk7mN0PHZiOUQeIhTCsiQwsfmdTVB1vVk3aBAZgkTA01RhZlAJ6D3i
 sESUawLIK7yi3wHjHfuuGgiYU3xsunk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-TVqV_hQTORK67XsAG63rVA-1; Fri, 09 Oct 2020 06:54:13 -0400
X-MC-Unique: TVqV_hQTORK67XsAG63rVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B66A78030C8;
 Fri,  9 Oct 2020 10:54:11 +0000 (UTC)
Received: from gondolin (ovpn-113-40.ams2.redhat.com [10.36.113.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A72815D9E8;
 Fri,  9 Oct 2020 10:54:00 +0000 (UTC)
Date: Fri, 9 Oct 2020 12:53:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v3 06/10] s390x/pci: use a PCI Group structure
Message-ID: <20201009125357.5da021cf.cohuck@redhat.com>
In-Reply-To: <1602097455-15658-7-git-send-email-mjrosato@linux.ibm.com>
References: <1602097455-15658-1-git-send-email-mjrosato@linux.ibm.com>
 <1602097455-15658-7-git-send-email-mjrosato@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: thuth@redhat.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 david@redhat.com, schnelle@linux.ibm.com, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  7 Oct 2020 15:04:11 -0400
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> From: Pierre Morel <pmorel@linux.ibm.com>
> 
> We use a S390PCIGroup structure to hold the information related to a
> zPCI Function group.
> 
> This allows us to be ready to support multiple groups and to retrieve
> the group information from the host.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  hw/s390x/s390-pci-bus.c         | 42 +++++++++++++++++++++++++++++++++++++++++
>  hw/s390x/s390-pci-inst.c        | 23 +++++++++++++---------
>  include/hw/s390x/s390-pci-bus.h | 10 ++++++++++
>  3 files changed, 66 insertions(+), 9 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


