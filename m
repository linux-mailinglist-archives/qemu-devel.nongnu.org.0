Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD64277324
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 15:52:22 +0200 (CEST)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLRfZ-0006ZI-JT
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 09:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kLReF-00065Q-MF
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 09:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kLRe9-00075m-OZ
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 09:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600955452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9jcHJts4kOj1bGB+IU+TMsvX+B0dRWdDWzKUAcDA5g=;
 b=PXBqw4R518QXyaYt9E9LJQm7SvSdNXpDR/B8O4/hrm4v/5JcN30mq3VlKlHCOsVpoHpaZP
 8tZnuztBKHpDWuPeaapsLckkQytqZrQ2oU5VucL7DMyGb+iZpSVEUZRp0ElWXX6nfDoUT7
 l8jx3DO9JvnWqfcmY0vSvyY95kRZbBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-nJtm0u6hPo6ns3Rw_6_2nw-1; Thu, 24 Sep 2020 09:50:48 -0400
X-MC-Unique: nJtm0u6hPo6ns3Rw_6_2nw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CC5E1084C8A;
 Thu, 24 Sep 2020 13:50:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-113.ams2.redhat.com [10.36.113.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42E8355771;
 Thu, 24 Sep 2020 13:50:44 +0000 (UTC)
Subject: Re: qtest with multiple driver instances
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <4696583.mNQJtTt8NE@silver>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7ae8f0cc-021e-d982-4d1d-a46afc37bf28@redhat.com>
Date: Thu, 24 Sep 2020 15:50:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4696583.mNQJtTt8NE@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.214, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/09/2020 13.57, Christian Schoenebeck wrote:
> Hi,
> 
> I'm currently puzzled with what looks like a limitation of the qtest 
> infrastructure: am I right that it's not possible to use multiple instances of 
> the same driver with qtests?
> 
> Purpose: I need to add test cases for the 9p 'local' fs driver. So far we only 
> have 9p qtests using the 'synth' fs driver. The problem is, both driver 
> instances would pop up with the same QEMU driver name ("virtio-9p-pci"), and 
> AFAICS qtests in general reference their driver instance by driver name only, 
> which must be a) a unique driver name and b) must match the official QEMU 
> driver name and c) all qtest driver instances are in a global space for all 
> qtests.
> 
> Is there any workaround or something that I didn't see? Like letting qtests 
> reference a driver instance by PCI address or something?
> 
> Right now the only option that I see is a hack: forcing one driver instance to 
> use a different bus system like e.g. -> "virtio-9p-ccw" vs. "virtio-9p-pci".
> 
> Any hint appreciated!

I assume you are referring to the "qos" framework within the qtests? I
hope Laurent, Paolo or Emanuele can help with that question (now all on
CC:)...

 Thomas


