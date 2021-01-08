Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320972EF487
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:08:13 +0100 (CET)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtN6-0000Ps-8R
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:08:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kxtLp-0007iu-CJ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:06:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kxtLi-0000kS-Gb
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610118405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wBwsG56Bsxex18dbtXK0XZybqGGh77JwLxho0q30kU=;
 b=NfacZtIF5cqrM+IzHHTRwlPVvWYprLJDJzUqxCkk4na0PHHFvX3ZLSjhc/j3QPjj6WvOE9
 lTbrO90ZeugGPyupY09CjfiWGk19S0n0HWOzpdyxOexRT6b67peUdMNj8MvFTQUVVfllvo
 uHaLVuBM+7+m9Y7isZnDAq7Wj9I+1Qo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-IJA4fxp4MQS_lwafcy0fEQ-1; Fri, 08 Jan 2021 10:06:43 -0500
X-MC-Unique: IJA4fxp4MQS_lwafcy0fEQ-1
Received: by mail-wr1-f69.google.com with SMTP id m20so4281951wrh.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7wBwsG56Bsxex18dbtXK0XZybqGGh77JwLxho0q30kU=;
 b=sw1h+huo9FqjTglAU+TF+RiZm1elscZ/jr5DbJhWJ86Q9w1yd9bq0DmNupLZyjHbkd
 6FAMndV2yTRNbEq7I7NGaGOpkLW2dOyNQYyEnsIiTAHTGrZ9PNzZmpJ94KOwE7Apo/Lr
 pKCCipoT8HBPjajR+CPLMK7k7jW9lDcYbamjTTHllJGFRCsurB7g02fbR1A03ne5kSIA
 WbgHx/DJyNc/xTIEwAcE/U3QPDA4iL1Q1S65hOA7ysVpAXW8D/jXSipc7jSYq/hEnAUD
 jOIsJ9HEQ1R92U+DDdtgUkP4m2+SVyGOR6yo0iTnq/EInsIMJa1AoeQWXxEaybIpq7tO
 z5yg==
X-Gm-Message-State: AOAM53163zb01nlAwHXsvFPZBHFQpqlp3nNiRxwjPP+cPpHPrcFBE1gE
 7+LhqL8lYUfDKo4mrquIu4ETJibIkIFOh+GV4lSZ4rSsJ64HLI3qPtLJ7vj25MngOV4B3Hq0sbg
 JNKDJg6wNOoXhF3U=
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr3398859wmj.69.1610118401865; 
 Fri, 08 Jan 2021 07:06:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUeWRJX1r0y9VjEADh5VGcoDvFcBVgX8mTsN/VfcHJXXgT7mVhg/KHuM/q/z1NS7z292Kv+Q==
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr3398842wmj.69.1610118401685; 
 Fri, 08 Jan 2021 07:06:41 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id a62sm12347646wmf.7.2021.01.08.07.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:06:40 -0800 (PST)
Date: Fri, 8 Jan 2021 16:06:38 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/virtio-pci: Replace error_report() by
 qemu_log_mask(GUEST_ERROR)
Message-ID: <20210108150638.pzc4mu5knw37ejsv@steredhat>
References: <20201210172834.178052-1-philmd@redhat.com>
 <20210108120243.zgajoyust5n56l5m@steredhat>
 <990898ff-a225-0548-690a-f7bab039ca08@redhat.com>
MIME-Version: 1.0
In-Reply-To: <990898ff-a225-0548-690a-f7bab039ca08@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 08, 2021 at 04:00:21PM +0100, Philippe Mathieu-Daudé wrote:
>On 1/8/21 1:02 PM, Stefano Garzarella wrote:
>> On Thu, Dec 10, 2020 at 06:28:34PM +0100, Philippe Mathieu-DaudÃƒÂ© wrote:
>>> Replace I/O write error reported with error_report() by
>>> qemu_log_mask(GUEST_ERROR) which allow filtering.
>>>
>>> Signed-off-by: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
>>> ---
>>> hw/virtio/virtio-pci.c | 6 ++++--
>>> 1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>>> index f863f69ede4..094c36aa3ea 100644
>>> --- a/hw/virtio/virtio-pci.c
>>> +++ b/hw/virtio/virtio-pci.c
>>> @@ -27,6 +27,7 @@
>>> #include "hw/qdev-properties.h"
>>> #include "qapi/error.h"
>>> #include "qemu/error-report.h"
>>             ^
>> Just a little thing, could we remove this inclusion since we are not
>> using error_report() anymore in this file?
>
>We can't because virtio_pci_device_plugged() calls
>warn_report() twice :/

Of course you are right :-)

Stefano

>
>> Anyway the patch LGTM:
>>
>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>
>Thanks!
>
>Phil.
>


