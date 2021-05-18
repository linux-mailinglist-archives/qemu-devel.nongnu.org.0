Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDF0388074
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:22:23 +0200 (CEST)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5IM-0001aY-Bq
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj5HH-0000DC-7k
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:21:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj5HB-00007t-09
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:21:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621365668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOmVy9rblRhWI2XfvHAAwk2P5BsP2diKVZvKt6dJ/iY=;
 b=H0e0dLDFRrDExkcKUfBtno3ZOAZUxeyPjep6SMV7UAs4/II0vn00wFi6bhqKOMFJnsxK9P
 Cq0RtPHpgF5efl8Oao1o/c1mCCRB9HEQwa90w4kfE6/qF2td7embI1dv6wNTjmUBQkMWqO
 5WcCZtXji5c+egFpOqe13l2z4eNKav8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-HcsXq8-2MOGZ_hFQCvmrGA-1; Tue, 18 May 2021 15:21:05 -0400
X-MC-Unique: HcsXq8-2MOGZ_hFQCvmrGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1458EC1A4;
 Tue, 18 May 2021 19:21:03 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95F0F100F49F;
 Tue, 18 May 2021 19:21:02 +0000 (UTC)
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
To: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <YIkpzdUkgHs4vYCe@stefanha-x1.localdomain>
 <1fea2e39-c1c7-215f-843e-fc593ff7f47c@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <82bd2b1a-c658-bfb0-cdd2-14085efd02cd@redhat.com>
Date: Tue, 18 May 2021 15:21:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1fea2e39-c1c7-215f-843e-fc593ff7f47c@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 5:32 AM, Thomas Huth wrote:
> On 28/04/2021 11.24, Stefan Hajnoczi wrote:
>> On Fri, Apr 16, 2021 at 02:52:56PM +0200, Thomas Huth wrote:
>>> @@ -158,7 +166,11 @@ static void pci_piix_ide_realize(PCIDevice *dev, 
>>> Error **errp)
>>>       vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
>>> -    pci_piix_init_ports(d);
>>> +    rc = pci_piix_init_ports(d);
>>> +    if (rc) {
>>> +        error_setg_errno(errp, -rc, "Failed to realize %s",
>>> +                         object_get_typename(OBJECT(dev)));
>>> +    }
>>
>> Is there an error message explaining the reason for the failure
>> somewhere. I can't see one in the patch and imagine users will be
>> puzzled/frustrated by a generic "Failed to realize" error message. Can
>> you make it more meaningful?
> 
> Do you have a suggestion for a better message?
> 
>   Thomas
> 

All of the rest of this thread looks like longer term fixes. I've kept 
this patch staged and will send a PR soonish, after I collate all of the 
other hanging IDE/FDC fixes that are awaiting my attention.

--js


