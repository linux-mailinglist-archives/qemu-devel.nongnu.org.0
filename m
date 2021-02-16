Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED9E31CA1F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:49:49 +0100 (CET)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByrU-0007jB-US
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBypZ-0006dC-Bz
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:47:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBypX-0007u1-Fm
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613476066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ux/Ox0yyKthUs5DGPzYQGQ74/SPXCecMFmAo1ebodCE=;
 b=jHG3Ul1vAZ821qwZwFwrOrojE0dHwy76w3BUiPP8hRWqW75F6b+K/bmCWzbbWQzODSz7vJ
 Vxb6k+1TvVJ5zxu/VHAakilJwxE1U9lRWPZapMa1ra0FjWkNYVAVF1mW9JwEuBwUYLMYu2
 mPPIcJTI/eQ138skeyKnb4wIb9c2SQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-_EBqhOAPMheA7mAnPvkDrQ-1; Tue, 16 Feb 2021 06:47:44 -0500
X-MC-Unique: _EBqhOAPMheA7mAnPvkDrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5524F107ACE6;
 Tue, 16 Feb 2021 11:47:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE11D5D765;
 Tue, 16 Feb 2021 11:47:41 +0000 (UTC)
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210216110056.1228582-1-thuth@redhat.com>
 <CAFEAcA_R9vgujvdBhcMTVeB9yktp81Yxz-F8fPMniTHDZEnHLw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7f61d07e-3e59-8fbe-de91-c2bd9dd22d56@redhat.com>
Date: Tue, 16 Feb 2021 12:47:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_R9vgujvdBhcMTVeB9yktp81Yxz-F8fPMniTHDZEnHLw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2021 12.43, Peter Maydell wrote:
> On Tue, 16 Feb 2021 at 11:01, Thomas Huth <thuth@redhat.com> wrote:
>> According to the virtio specification, a memory barrier should be
>> used before incrementing the idx field in the "available" ring.
>> So far, we did not do this in the s390-ccw bios yet, but recently
>> Peter Maydell saw problems with the s390-ccw bios when running
>> the qtests on an aarch64 host (the bios panic'ed with the message:
>> "SCSI cannot report LUNs: response VS RESP=09"), which could
>> maybe be related to the missing memory barriers. Thus let's add
>> those barriers now. Since we've only seen the problem on TCG so far,
>> a "bcr 14,0" should be sufficient here to trigger the tcg_gen_mb()
>> in the TCG translate code.
>>
>> (Note: The virtio spec also talks about using a memory barrier
>> *after* incrementing the idx field, but if I understood correctly
>> this is only required when using notification suppression - which
>> we don't use in the s390-ccw bios here)
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> This noticeably increases the reliability of the test for me:
> it goes from failing one time in 2 or 3 to failing about one time
> in 5 or 6. However it does still hit the virtio_scsi_parse_req()
> check on "out_size && in_size" eventually. So my guess is that this
> is not a sufficient supply of barriers. I'm firmly not a virtio expert
> but my reading of the spec suggested that some of the way the
> s390-ccw code is doing things might be in the wrong order and
> need restructuring beyond merely "add barriers to existing code".

I've had a look at the virtio 1.0 spec and looked for "barrier" there, and 
these two spots were the only ones that I identified that were definitely 
missing. The other spots in the spec that talk about memory barriers rather 
seem to be related to notification suppression, which we are not doing here, 
if I've got that right. So no clue what else could be going wrong here on 
your aarch64 host...

  Thomas


