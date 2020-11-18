Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED902B7C16
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 12:08:09 +0100 (CET)
Received: from localhost ([::1]:58142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfLJo-00060B-PP
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 06:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfLIe-00059B-RA
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:06:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfLIb-0001fy-Sp
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605697610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ocbmMgUErOljnpr+aZtkz5tEripJGCTr2+mc4Hm6SJs=;
 b=FBC7ny8Bz54vqcysAi2+sZKb91mityr5b6SdOBXMPr5Q//U5J4Y1jZwcJfx5vjk3xsi3p/
 xzcfYdypAKWedxka4h9SI0OwF5yX/7s8U2rZxyWUqinvRlxF2HU07dU7OU8Mp+3Y6tFI+G
 rX5fgjKiVLRzS92IH48jMDUKIPLVkTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-Xq8HbTgUOlykL4LPbo9CNQ-1; Wed, 18 Nov 2020 06:06:49 -0500
X-MC-Unique: Xq8HbTgUOlykL4LPbo9CNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39D7E8A8F00;
 Wed, 18 Nov 2020 11:06:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-139.ams2.redhat.com [10.36.113.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E563B60C05;
 Wed, 18 Nov 2020 11:06:38 +0000 (UTC)
Subject: Re: [PATCH for-5.2 v3] s390x/pci: fix endianness issues
To: Cornelia Huck <cohuck@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20201118104202.1301363-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <31996515-8f5b-8d45-b5ce-9682d17e86fc@redhat.com>
Date: Wed, 18 Nov 2020 12:06:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201118104202.1301363-1-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Pierre Morel <pmorel@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2020 11.42, Cornelia Huck wrote:
> The zPCI group and function structures are big endian. However, we do
> not consistently store them as big endian locally, and are missing some
> conversions.
> 
> Let's just store the structures as host endian instead and convert to
> big endian when actually handling the instructions retrieving the data.
> 
> Also fix the layout of ClpReqQueryPciGrp: g is actually only 8 bit. This
> also fixes accesses on little endian hosts, and makes accesses on big
> endian hosts consistent.
> 
> Fixes: 28dc86a07299 ("s390x/pci: use a PCI Group structure")
> Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
> Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> v2->v3: added missing zpci_fn.flags copy, removed forgotten memcopy
> v1->v2: switched to keeping the internal structures as host-endian
> 
> Again, tested on x86 and s390x (tcg/kvm) with virtio-pci devices;
> testing vfio-pci devices would be good.

Looks good to me now!

Reviewed-by: Thomas Huth <thuth@redhat.com>

... and also my Fedora 28 TCG guest can now use the virtio-net-pci device
again, so also a light:

Tested-by: Thomas Huth <thuth@redhat.com>


