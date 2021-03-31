Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA973508C3
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 23:08:30 +0200 (CEST)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRi4i-0001Pf-Kr
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 17:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lRi3m-0000w3-64
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 17:07:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lRi3i-0004o8-EE
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 17:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617224844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWCW+SoQzAX1EVjD8pcus3OOmye9qUMtTbchs7WfvhU=;
 b=LvInqiuP3hNmsSjEj29arI7DubyoctxpFAYCjmijKrsFQ4asj0fFFbCbTjzE8KRC0ib8CA
 zxemgOa5AHS1JtPdjyu/dCMtBvia2z2aWvPfdRc6OfgvSjmk3FvkkeG5ZiVUFqSGAFy+qd
 zjTAUlxsOP7xhgDaZliIW17MHkSGTAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-qQQPDZSxNEKLOs3d6HimTw-1; Wed, 31 Mar 2021 17:07:20 -0400
X-MC-Unique: qQQPDZSxNEKLOs3d6HimTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 114E488CE3A;
 Wed, 31 Mar 2021 21:07:20 +0000 (UTC)
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B63F55C1B4;
 Wed, 31 Mar 2021 21:07:19 +0000 (UTC)
Subject: Re: Bug: object-add qmp command that used to work fails now
To: Lukas Straub <lukasstraub2@web.de>
References: <20210331215844.43914a75@gecko.fritz.box>
 <3929e394-ef6b-273b-4a07-53295d18fc25@redhat.com>
 <20210331222610.22392dcf@gecko.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <89125fe1-02f7-0fcf-3713-ded2046d4757@redhat.com>
Date: Wed, 31 Mar 2021 16:07:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210331222610.22392dcf@gecko.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 3:26 PM, Lukas Straub wrote:

>> Per docs/system/removed-features.rst, the change was intentional:
>>
>>> ``object-add`` option ``props`` (removed in 6.0)
>>> ''''''''''''''''''''''''''''''''''''''''''''''''
>>>
>>> Specify the properties for the object as top-level arguments instead.  
>>
>> although it is unfortunate that you didn't notice the change during the
>> deprecation cycle.
>>
> 
> Yeah, no big deal. I wasn't sure if this is intentional as the change isn't
> documented on https://wiki.qemu.org/ChangeLog/6.0 

I'll try and update the top "Incompatible changes" with that and
anything else I see in the removed-features.rst file.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


