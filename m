Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896F7319F72
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 14:09:58 +0100 (CET)
Received: from localhost ([::1]:45194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAYCr-00019B-LF
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 08:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAYBT-0000R7-VU
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:08:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAYBR-0003AG-8h
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613135308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYF/0dpOCgKf8ywcMG7MrKAfQdJG/hH89Ej1XxHwL+A=;
 b=YARBOd8J/J1Ck41QWRVjwBW2OQMgN8JpBdILHHOzQYTDdFx9DLLPFbGMDM0K0edWAf+awF
 B3GiiYWnvhROpUDZAPAJSiIN42Py35x19E18jwXcUdpFY+DdnE+h7t6CkV2UZLPNYJ1QmI
 mpnce9rEYAfI/QZuLuoUI9kbiySpmfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-eMQnmXDgOGGu5P0eawu6Eg-1; Fri, 12 Feb 2021 08:08:25 -0500
X-MC-Unique: eMQnmXDgOGGu5P0eawu6Eg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C04FD195D561;
 Fri, 12 Feb 2021 13:08:23 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DE1A60657;
 Fri, 12 Feb 2021 13:08:23 +0000 (UTC)
Subject: Re: [PATCH] io: error_prepend() in qio_channel_readv_full_all()
 causes segfault
To: Jag Raman <jag.raman@oracle.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1613128220.git.jag.raman@oracle.com>
 <be476bcdb99e820fec0fa09fe8f04c9dd3e62473.1613128220.git.jag.raman@oracle.com>
 <20210212111658.GF1340027@redhat.com>
 <0418D7C5-AF8F-446A-910D-3196124300AE@oracle.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <47fdd0f2-1de3-18f7-70fe-0f6882873baf@redhat.com>
Date: Fri, 12 Feb 2021 07:08:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0418D7C5-AF8F-446A-910D-3196124300AE@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "stefanha@gmail.com" <stefanha@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 5:41 AM, Jag Raman wrote:
> 
> 
>> On Feb 12, 2021, at 6:16 AM, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Fri, Feb 12, 2021 at 06:16:07AM -0500, Jagannathan Raman wrote:
>>> Using error_prepend() in qio_channel_readv_full_all() causes a segfault
>>> as errp is not set when ret is 0. This results in the failure of iotest
>>> 83. Replacing with error_setg() fixes the problem.
>>>
>>> Additionally, removes a full stop at the end of error message
>>>
>>> Reported-by: Max Reitz <mreitz@redhat.com>
>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>>> ---
>>> io/channel.c | 3 +--
>>> 1 file changed, 1 insertion(+), 2 deletions(-)

>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Thank you for reviewing, Daniel! I recall that you warned about
> error_prepend() during the review, somehow slipped through.
> 
> Hi Peter,
> 
>     Could we send a PULL request for this patch?

I'm bundling up a pull request for my NBD tree, and will include this one.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


