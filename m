Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAFF2F6BB3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 21:01:57 +0100 (CET)
Received: from localhost ([::1]:43094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08oe-0006kP-RJ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 15:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l08kW-0004sS-1D
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:57:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l08kU-0005qx-FB
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610654257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6oRolqzcaNJ+ypdOEHc79QMKm/OoUuVzWZ07iJhsFn8=;
 b=iAAPFsp++oBFLOqqixF6rIiix1JhrpOr83A810qR62K8OjRBB7ChFvRz6iwyaWP7R8rgI3
 K1aLMAiJNHa1MOuIc3GfBdpdOw+UCDTzVd2HviHBvgtFfHsegur+iCG2MnQls3e8nO5mwQ
 YKT327eyB8XcIWoEB+V1x5jdGfDigMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-qpiZV4yMM-yc_DKS2vHfKg-1; Thu, 14 Jan 2021 14:57:35 -0500
X-MC-Unique: qpiZV4yMM-yc_DKS2vHfKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BACF8190B2A2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 19:57:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-152.ams2.redhat.com [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 673C857;
 Thu, 14 Jan 2021 19:57:27 +0000 (UTC)
Subject: Re: [qemu-web PATCH v2] Add virtio-blk and virtio-scsi configuration
 post
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210105104907.33587-1-stefanha@redhat.com>
 <1284dc6b-0ce0-3d6e-ba54-067e91ca5dc8@redhat.com>
 <20210114160505.GF292902@stefanha-x1.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d3b7952a-284a-9588-afb2-fa080f2fd98c@redhat.com>
Date: Thu, 14 Jan 2021 20:57:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210114160505.GF292902@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/01/2021 17.05, Stefan Hajnoczi wrote:
> On Wed, Jan 06, 2021 at 03:04:20PM +0100, Thomas Huth wrote:
>> On 05/01/2021 11.49, Stefan Hajnoczi wrote:
[...]
>>> +Applications that send SCSI commands are better served by the virtio-scsi
>>> +device, which has full SCSI support. SCSI passthrough was removed from the
>>> +Linux virtio-blk driver in v5.6 in favor of using virtio-scsi.
>>
>> Since "passthrough" sounds like a passthrough of real hardware devices, I'd
>> maybe rather say something like: The original virtio-blk devices also
>> included the possibility to handle SCSI commands, but this features was
>> removed from the Linux driver in v5.6 in favor of using virtio-scsi (and is
>> also not available for modern virtio-1.0 devices anymore).
> 
> Guest SCSI commands were passed through to the physical LUN but what you
> described sounds more like emulating SCSI commands, which is not what
> the feature did.

Ok, I likely just understood that feature in the wrong way. Looking at the 
virtio spec, it just talks about the possibility to send SCSI commands to 
the virtio-blk device, but looking at the implementation in QEMU, it seems 
more like the way you described, so never mind my comment.

  Thomas


