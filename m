Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD972B0FD2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:10:53 +0100 (CET)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdJro-0004eH-MF
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdJqX-00047x-56
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdJqU-0007C0-5F
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605215369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Qe5F+lX0SIswJ5lwfbhC1cL2d9ZEW8aoJirjFcQsKM=;
 b=hxLcAqz/1L51vk4vNnc4Mrj08+Y5YqVs4vXOV5ugtGuQzskkyr6mXuA9XV1OeysIea1yy5
 85UK4dKbF92Fpj3vn5GGyLHljaQ01oeeuyeaiCkLm6OERBJCjtxh80mhKLUYhVKfHeUzSE
 GbuljXWKFG5BEuT/LQ2U6iGKa+FbHjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-s1RWSkEJMLWrP4gZnlm7XQ-1; Thu, 12 Nov 2020 16:09:23 -0500
X-MC-Unique: s1RWSkEJMLWrP4gZnlm7XQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B43A46D583;
 Thu, 12 Nov 2020 21:09:22 +0000 (UTC)
Received: from [10.3.113.51] (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 548EB60C0F;
 Thu, 12 Nov 2020 21:09:22 +0000 (UTC)
Subject: Re: [PATCH for-5.2?] nbd: Silence Coverity false positive
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201111163510.713855-1-eblake@redhat.com>
 <da36e556-bc7e-70f3-73c8-3dc0ea7c48e4@linaro.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f7d1ebf0-0a7b-3546-d07d-57fda470a59e@redhat.com>
Date: Thu, 12 Nov 2020 15:09:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <da36e556-bc7e-70f3-73c8-3dc0ea7c48e4@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 3:04 PM, Richard Henderson wrote:
> On 11/11/20 8:35 AM, Eric Blake wrote:
>> -    if (!full) {
>> -        /* last non dirty extent */
>> -        nbd_extent_array_add(es, end - start, 0);
>> +    if (!full && nbd_extent_array_add(es, end - start, 0) < 0) {
>> +        /* last non dirty extent, nothing to do if array was already full */
>>      }
> 
> Casting to (void) is another way to get rid of the warning.
> 
> I dunno which makes more sense here.  Definitely the comment is helpful.

As in:

if (!full) {
    /* last non dirty extent, nothing to do if array is now full */
    (void) nbd_extent_array_add(es, end - start, 0);
}

Yeah, that looks a little better.  Should I post that as v2, or wait for
further comments on this?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


