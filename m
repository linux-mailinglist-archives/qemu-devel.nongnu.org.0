Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EF633F7D8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:09:13 +0100 (CET)
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMabY-00064z-9k
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMaBa-0000Yi-3K
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMaBV-0007Mw-Ko
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616002936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+lFAfnP3jh6pBzw/ckjbJYVgoh3z1u+qpzr01AaWYs=;
 b=BIaYTGsT+W/qfIzChWdyq/eyifIm6rxK0qQFx4gt+SUMHV7cwg69uROBvCijMC8OhbuJGu
 lXH+uvdQUdBzq5KKSZXpV6Wz7UKq8QQSIFuQXZAKpv5RenhiYFXI3Za7cTg2eHSMvxYFeg
 IQf/H47iYy6hXS2SKjL6SjOXedpSMNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-QTJNyg_EMBG8RukgqpqScg-1; Wed, 17 Mar 2021 13:42:14 -0400
X-MC-Unique: QTJNyg_EMBG8RukgqpqScg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F105A8189D6;
 Wed, 17 Mar 2021 17:42:12 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D08A6C32F;
 Wed, 17 Mar 2021 17:42:09 +0000 (UTC)
Subject: Re: [PATCH v3 00/36] block: update graph permissions update
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <161599451628.29996.16299734673859684875@c9d4d6fbb2f1>
 <dba437c7-dea7-5675-9b88-b72ecca561ee@virtuozzo.com>
 <80051665-bcbc-1d6e-a0fc-02da172f6a21@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1af25391-d5ea-bc87-886e-ac83327d9295@redhat.com>
Date: Wed, 17 Mar 2021 12:42:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <80051665-bcbc-1d6e-a0fc-02da172f6a21@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 12:33 PM, Eric Blake wrote:
> On 3/17/21 10:38 AM, Vladimir Sementsov-Ogievskiy wrote:
> 
>>> 6/36 Checking commit 5780b805277e (block: drop ctx argument from
>>> bdrv_root_attach_child)
>>> 7/36 Checking commit 68189c099a3a (block: make bdrv_reopen_{prepare,
>>> commit, abort} private)
>>> ERROR: Author email address is mangled by the mailing list
>>> #2:
>>> Author: Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>
>>>
>>
>> Who know what is it? Commit message, subject and "From:" header are
>> clean in the email..
> 
> The list mangles mails for setups where DKIM/SCP setups are strict

Sorry, acronym soup got me confused.  I meant DKIM/ SPF, and DMARC.

> enough that the mail would be rejected by various recipients otherwise.
> But I have no idea why the mailing list rewrote the headers for that one
> mail, but not the rest of your series - usually, DKIM setups are
> persistent enough that it will be an all-or-none conversion to the
> entire series.
> 
> At any rate, a maintainer can manually fix it for one patch, or you can
> resend (if the mailing list keeps mangling headers, you can add a 'From:
> ' line in the body of your email that will override the mangled header;
> but since the list doesn't usually mangle your headers, you may not need
> to resort to that).
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


