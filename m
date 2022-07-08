Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E9056B53B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 11:21:49 +0200 (CEST)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9kBI-0006JJ-Is
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 05:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9k9Q-0005MC-02
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9k9N-0004z5-3U
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657271987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6gHxB4Z5l0G9wzWZbiq5sWdDhLNloZA4BBwNAg3wrU0=;
 b=RYHpRwdH0OQFmHIQWyCvL6+nv+rvcfOGrcJDycMFrsaYPhNA/84Zb81xNvDSYaSQMCFMtD
 tPY5xNYquS3Pfl4l1VCl0z9T6c86wJmFeon3+Un6QyaFsnH+8v/F8SLWDUDVK+oME1v8TL
 IUSJpChaL3+JIQVvlI31gsTbdxG9+1I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-1DYWj-96N5aoANUzmByKFw-1; Fri, 08 Jul 2022 05:19:46 -0400
X-MC-Unique: 1DYWj-96N5aoANUzmByKFw-1
Received: by mail-wm1-f72.google.com with SMTP id
 2-20020a1c0202000000b003a2cfab44eeso730990wmc.6
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 02:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6gHxB4Z5l0G9wzWZbiq5sWdDhLNloZA4BBwNAg3wrU0=;
 b=GD8mffxpsuLol79snWe32pfal7VX8E0Zaevm2PVvV7dtdUkbcdjJGuM8lfANEJoqpY
 gLHOWFnjdJPT6HM70mvXHZ0sc81lYJaxzASf4rP5B5aP9gleP2S4oMTHHR3/LoNDOCtj
 vYlJb7zsuJvZemSQAYqe6c3UqkXvS7YRpTOt0cRhwab03GQ6ildrUBJPZgoYnTPkfMdI
 4HSfcQR4jzjO6uHLSknSN/rjSxxmAgmElZvBzIjvnoePLt2tP0jLbsP/H0ouDmWwYrck
 oSmKkATAmC6EVCcRlHXo/myHmJdL4Ol3cY0AJ3VI7BpQu1dJYUqdReNTtWGeiqISWqwB
 CePw==
X-Gm-Message-State: AJIora/Yyq9/ojSVoL3DjZ/5tVS/0DUt36zEY6dXan4OighZpLIgwlea
 N81YBRc5YwYACTxvDiBmrEM7BNb/+pytsEb7Zm+NyCzhOH1AQvdeT0S9qQTErghSTuXanEmAwF6
 1+2wVsPOr2FJD6Qw=
X-Received: by 2002:a5d:5919:0:b0:21d:60cf:cbf4 with SMTP id
 v25-20020a5d5919000000b0021d60cfcbf4mr2192240wrd.188.1657271985131; 
 Fri, 08 Jul 2022 02:19:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tKgxCnflRwOnOedK0ZDVr+qE/dGOg52lP0jyh9qhavP7iwUJL4tXG4AH+OUE3/j16iZOg5+A==
X-Received: by 2002:a5d:5919:0:b0:21d:60cf:cbf4 with SMTP id
 v25-20020a5d5919000000b0021d60cfcbf4mr2192218wrd.188.1657271984909; 
 Fri, 08 Jul 2022 02:19:44 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adfef43000000b0021bab0ba755sm42110507wrp.106.2022.07.08.02.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 02:19:44 -0700 (PDT)
Message-ID: <ab3f6227-20c2-1c3a-4bae-814f06670bd0@redhat.com>
Date: Fri, 8 Jul 2022 11:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/8] virtio-blk: mark IO_CODE functions
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-7-eesposit@redhat.com>
 <YsRNC0tj6YP2pgMi@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YsRNC0tj6YP2pgMi@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 05/07/2022 um 16:39 schrieb Stefan Hajnoczi:
> On Thu, Jun 09, 2022 at 10:37:25AM -0400, Emanuele Giuseppe Esposito wrote:
>> Just as done in the block API, mark functions in virtio-blk
>> that are called also from iothread(s).
>>
>> We know such functions are IO because many are blk_* callbacks,
>> running always in the device iothread, and remaining are propagated
>> from the leaf IO functions (if a function calls a IO_CODE function,
>> itself is categorized as IO_CODE too).
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  hw/block/dataplane/virtio-blk.c |  4 ++++
>>  hw/block/virtio-blk.c           | 35 +++++++++++++++++++++++++++++++++
>>  2 files changed, 39 insertions(+)
> 
> The definition of IO_CODE() is:
> 
>   I/O API functions. These functions are thread-safe, and therefore
>   can run in any thread as long as the thread has called
>   aio_context_acquire/release().
> 
> I'm not sure it matches with the exact semantics you have in mind. Are
> they really allowed to be called from any thread and even from multiple
> threads? Or maybe just from the BlockBackend's AioContext thread?

I think it is just from the BlockBackend's AioContext thread. But I
classified blk_* functions as IO_CODE.

What is your opinion on that?

> 
> We need to be very careful to define these terms precisely and avoid
> applying them in cases that are similar but different as that will cause
> problems in the future.
> 
> Otherwise:
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 


