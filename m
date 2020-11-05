Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669BD2A763E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 04:53:52 +0100 (CET)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaWLP-0001JW-Gn
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 22:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kaWKY-0000d6-5l
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 22:52:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kaWKU-00054s-G7
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 22:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604548373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QApoYfdr8YxcG9YN5jqlTDHHgRHdX4I5KemwSOkwzTo=;
 b=UqBKSrpbx2c0zmOtq0preSqnfJdhSQIRUOCntW0Lci2BLk7YlpXqsuLfyu4r0sJZnlj39C
 5b1/0jU+0EjT9zzyNvhwNwbrw+7v9DwWNqF3eG9mdzilcf/d5air18yVImEfDrxHXHentt
 6c18iHX2ioPScdh5st8l2RyWRl6gFHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-uEO6l5SfPySHgPLPkQgnOg-1; Wed, 04 Nov 2020 22:52:51 -0500
X-MC-Unique: uEO6l5SfPySHgPLPkQgnOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FB8C8049CB;
 Thu,  5 Nov 2020 03:52:50 +0000 (UTC)
Received: from [10.72.13.154] (ovpn-13-154.pek2.redhat.com [10.72.13.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4A655C3E0;
 Thu,  5 Nov 2020 03:52:45 +0000 (UTC)
Subject: Re: [RFC PATCH 0/6] eBPF RSS support for virtio-net
From: Jason Wang <jasowang@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201102185115.7425-1-andrew@daynix.com>
 <0164a42f-4542-6f3e-bd71-3319dfaae190@redhat.com>
 <CAOEp5Oe3btwgPcOA6v=kK9s2to=x2Hg6Qw2iCFXOOWZs49s=-Q@mail.gmail.com>
 <caa38709-88f1-bd6d-3ff9-61e64c3aa51f@redhat.com>
 <20201104093155.GB565323@redhat.com>
 <cc53c09c-9b3c-63e1-6df3-b5fc949e626c@redhat.com>
Message-ID: <4bc0321a-773a-8aae-d94a-ef488f7ff646@redhat.com>
Date: Thu, 5 Nov 2020 11:52:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cc53c09c-9b3c-63e1-6df3-b5fc949e626c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 21:09:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/5 上午11:46, Jason Wang wrote:
>>
>> It's probably ok if we treat the bytecode as a kind of firmware.
> That is explicitly *not* OK for inclusion in Fedora. They require that
> BPF is compiled from source, and rejected my suggestion that it could
> be considered a kind of firmware and thus have an exception from building
> from source. 


Actually, there's another advantages. If we treat it as firmware, 
(actually it is). It allows us to upgrade it independently with qemu.

Thanks


