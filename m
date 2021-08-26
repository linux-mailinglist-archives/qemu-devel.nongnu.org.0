Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7713F868A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 13:30:42 +0200 (CEST)
Received: from localhost ([::1]:47154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJDaj-0004Vk-HB
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 07:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJDZd-0003pb-FS
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 07:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJDZb-0005Jq-Kn
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 07:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629977370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RKC3j/AevBxySj6l8WQ6EwwIzbrDobzJVhame37QOV8=;
 b=CChGYU9zLnB7nnwNXWdIBzo+6pK/5DcbeFoHf6oZ2+7ZO22LHCeVB4KZLnDDaCiWMI32uj
 lZGMo/nG6AM5M0sNVcbFAXqegQnoGFF5CFuATobnJREnB/JGOvBnnrktLJPDy68GwRjusU
 6vb2sIq/FN7dZ7hJeGT4rV/P5sDIWs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-QuHF8fJMN-imAwK3qWfTTQ-1; Thu, 26 Aug 2021 07:29:29 -0400
X-MC-Unique: QuHF8fJMN-imAwK3qWfTTQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73A3F193F560;
 Thu, 26 Aug 2021 11:29:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01131604CC;
 Thu, 26 Aug 2021 11:29:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 44C6018003AA; Thu, 26 Aug 2021 13:29:20 +0200 (CEST)
Date: Thu, 26 Aug 2021 13:29:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 21/44] i386/tdx: Create the TD HOB list upon
 machine init done
Message-ID: <20210826112920.yyisifif22uz6fek@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <f2e723916bb2875ae701510d22a8d9896ba15f51.1625704981.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2e723916bb2875ae701510d22a8d9896ba15f51.1625704981.git.isaku.yamahata@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 xiaoyao.li@intel.com, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>, mtosatti@redhat.com,
 erdemaktas@google.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +static void tdvf_hob_add_memory_resources(TdvfHob *hob)
> +{

> +    /* Copy and sort the e820 tables to add them to the HOB. */
> +    memcpy(e820_entries, e820_table,
> +           nr_e820_entries * sizeof(struct e820_entry));
> +    qsort(e820_entries, nr_e820_entries, sizeof(struct e820_entry),
> +          &tdvf_e820_compare);

I guess patch #19 should make sure the e820 entries stay sorted instead
of sorting them here.

take care,
  Gerd


