Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C3D31CC05
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:36:42 +0100 (CET)
Received: from localhost ([::1]:42974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1Sz-0003w7-IP
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lC1Ry-0003Ms-3f
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:35:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lC1Rw-0002xS-Io
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613486135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IF38vp59+SGHeI8wvEFWqxNNJpGAFKyJw/wXhDVY1w=;
 b=Gff89EVQwOBVPa3CXTkFuSTpzfzeEiVl4YliItHF+do8nvcHSbUzC4FmjuRC1A7wwAIvBg
 PeNMsfvEFbY6w3YqyhWphTbRS7+JUKiNULew3MpeMLlKmb0p0zSQvxIR45EM2QGTbwfu8r
 NM/cZ313WacFpV7fLjWPyNZLcw3HgiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-PP___l43PyCvd2lINPDAxQ-1; Tue, 16 Feb 2021 09:35:33 -0500
X-MC-Unique: PP___l43PyCvd2lINPDAxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DB7ECC620;
 Tue, 16 Feb 2021 14:35:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FCF35C26D;
 Tue, 16 Feb 2021 14:35:31 +0000 (UTC)
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
To: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216124757.4eb664e9.cohuck@redhat.com>
 <a561530e-d800-67e0-ee2b-fea6efb4638c@redhat.com>
 <20210216153003.16b05725.cohuck@redhat.com>
 <CAFEAcA-B1pXNs8X+mha3x9Ynt83dkmC9sL_XGtextCD3qDXeAQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5765bde0-f222-4b07-25d4-430b101ef8ff@redhat.com>
Date: Tue, 16 Feb 2021 15:35:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-B1pXNs8X+mha3x9Ynt83dkmC9sL_XGtextCD3qDXeAQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2021 15.32, Peter Maydell wrote:
> On Tue, 16 Feb 2021 at 14:30, Cornelia Huck <cohuck@redhat.com> wrote:
>> Step 4 in "2.7.13 Supplying Buffers to The Device":
>>
>> "The driver performs a suitable memory barrier to ensure the device
>> sees the updated descriptor table and available ring before the next
>> step."
> 
> I thought that my first time through the spec as well, but
> I think the whole of section 2.7 is dealing with "packed virtqueues",
> which have to be explicitly negotiated and which I don't think
> the s390-ccw code is doing.

Right. I think the s390-ccw code is still based on virtio v1.0, that's why I 
also only looked at that version of the spec.

  Thomas


