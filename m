Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9D92EBB71
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 09:57:43 +0100 (CET)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx4dS-0004ii-1l
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 03:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kx4cT-0004HC-8K
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 03:56:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kx4cP-0005fj-2Q
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 03:56:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609923395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4j/JapZccwgy7tkN7G0/cM1z3iZ1gjp0fl7lWQpagQ=;
 b=ErYkHJn7PEEMWSSjbVo23/GIkKFyG6iLuLwBEddvRhMoygDONqASi02i1y+b6ALt0TeMH2
 amhvMIoogpNFnvsRBy5tOJcYT4xDdnskMuXzi3nLZioZnqSzuc/qW2tae2iiqQE5SY/MvJ
 yvNWgoAXCLWUK/3mJJ8nAhV2Cc9BLgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-bSS2iyy1OO2h20Yja25dTw-1; Wed, 06 Jan 2021 03:56:33 -0500
X-MC-Unique: bSS2iyy1OO2h20Yja25dTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B27F7107ACE3
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 08:56:32 +0000 (UTC)
Received: from [10.36.113.101] (ovpn-113-101.ams2.redhat.com [10.36.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C011D6E71A;
 Wed,  6 Jan 2021 08:56:25 +0000 (UTC)
Subject: Re: [PATCH 2/2] tracetool: fix "PRI" macro decoding
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210105191721.120463-1-lvivier@redhat.com>
 <20210105191721.120463-3-lvivier@redhat.com>
 <05a63a0f-dee5-68b6-5bba-7c74b55ddc99@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <37510a77-c59f-c713-6a65-0e534b7db5a8@redhat.com>
Date: Wed, 6 Jan 2021 09:56:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <05a63a0f-dee5-68b6-5bba-7c74b55ddc99@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2021 20:44, Philippe Mathieu-Daudé wrote:
> On 1/5/21 8:17 PM, Laurent Vivier wrote:
>> macro is not reset after use, so the format decoded is always the
>> one of the first "PRI" in the format string.
>>
>> For instance:
>>
>>   vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, \
>>                         uint32_t flags) "dev: %p offset: %"PRIu32" \
>>                         size: %"PRIu32" flags: 0x%"PRIx32
>>
>> generates:
>>
>>   printf("%d@%d vhost_vdpa_set_config dev: %p offset: %u size: %u \
>>           flags: 0x%u\n", pid(), gettimeofday_ns(), dev, offset, \
>>           size, flags)
>>
>> for the "flags" parameter, we can see a "0x%u" rather than a "0x%x"
>> because the first macro was "PRIu32" (for offset).
>>
>> In the loop, macro becomes "PRIu32PRIu32PRIx32", and c_macro_to_format()
>> returns always macro[3] ('u' in this case). This patch resets macro after
>> the format has been decoded.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>  scripts/tracetool/format/log_stap.py | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/format/log_stap.py
>> index b486beb67239..3e1186ae9cc2 100644
>> --- a/scripts/tracetool/format/log_stap.py
>> +++ b/scripts/tracetool/format/log_stap.py
>> @@ -54,6 +54,7 @@ def c_fmt_to_stap(fmt):
>>              else:
>>                  if state == STATE_MACRO:
>>                      bits.append(c_macro_to_format(macro))
>> +                    macro = ""
>>                  state = STATE_LITERAL
>>          elif fmt[i] == ' ' or fmt[i] == '\t':
>>              if state == STATE_MACRO:
> 
> What about the 'else' case?
> 

It already has the 'macro = ""', so no need to fix it.

Thanks,
Laurent


