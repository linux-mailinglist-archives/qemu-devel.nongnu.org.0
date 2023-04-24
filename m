Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F46EC7F3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 10:37:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqrgf-0005zN-0I; Mon, 24 Apr 2023 04:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pqrga-0005yv-T1
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 04:36:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pqrgP-00083r-Hu
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 04:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682325383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBKiTsFXDrCXrVOKJzVykK/IoKzADTpXiLl+FMmml1M=;
 b=CNvrTNKz/aKuPqCgLWQX9uSnY7ZIUKf3BZnCpywUA9bVOQGLLviLEcMaZcIbyiSZLIxFi9
 I4UPT5ciKA4m+0gWGanmdMtz5zKcITvg0KFlNJo9eVwn9QJUwMGXO5uGtTkxaLd8LuD6Ue
 6vVcQQoImp5KlS1T7mQORPEHPXDPEHQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628--PLX7M0EOhOMZif5W3aerQ-1; Mon, 24 Apr 2023 04:36:22 -0400
X-MC-Unique: -PLX7M0EOhOMZif5W3aerQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-5ef5e31f3f5so26052736d6.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 01:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682325381; x=1684917381;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DBKiTsFXDrCXrVOKJzVykK/IoKzADTpXiLl+FMmml1M=;
 b=NNbOgc/5Tf5gHW/ciVC+3waYc3ZsE0lrhpn+heULEoRSY9+C2sB91/vk8QfpZd/RBz
 m5j4GHplCho7qionRWyYSc9GTUPnZ56k7F+Yt5Z3ySs8aohUHOeGIl+4T6yoLMUnOOZY
 Ti1u62wGEl+xltMwYQUE7DWEcahkb7PV9t2h+H3sPy+ARISHwXswy5RTRGPsaLqBfJmd
 d+x4TgPQ/Z8YC9vpYp6Fdx7qNu3LM11Sgd/PlR0G2j2x7tbmkbJYwDxj+2pbTCiVSmdF
 e680wZnRQy6iU15hELoF1a0XrZ3sbDVlQTS8xPkWGdOs+eM0xQa9L1zj9ZdqdCyXe/G+
 jBxQ==
X-Gm-Message-State: AAQBX9cnoOmLi7GumJiwwsbCw7wq26AzdyRCy1p2UuAdMV1My6MJCxQD
 IDf9TNxe2Ntx8blPqy9+rGJh9fmD/JSkQOduh8v0kik1JB16ZbwNYzIt5gOMOWxm3BAveXLFp+9
 I3CE7sgHR+rgYCl4=
X-Received: by 2002:a05:6214:1d28:b0:5d5:fd1d:6ef5 with SMTP id
 f8-20020a0562141d2800b005d5fd1d6ef5mr25999990qvd.12.1682325381808; 
 Mon, 24 Apr 2023 01:36:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350aIH/khe2/FAVP8r0o1SYPTC227AiYKW171PtTnGx3j9FO9FxMdX1DYp1vpIZERzwsBJ8zN9A==
X-Received: by 2002:a05:6214:1d28:b0:5d5:fd1d:6ef5 with SMTP id
 f8-20020a0562141d2800b005d5fd1d6ef5mr25999966qvd.12.1682325381496; 
 Mon, 24 Apr 2023 01:36:21 -0700 (PDT)
Received: from [192.168.149.117]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a0cb24f000000b0060530c942f4sm2475898qve.46.2023.04.24.01.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 01:36:20 -0700 (PDT)
Message-ID: <3f6c1572-61e4-610a-1d1e-47b100cefb6c@redhat.com>
Date: Mon, 24 Apr 2023 10:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] block/monitor/block-hmp-cmds.c: Fix crash when execute
 hmp_commit
Content-Language: de-CH
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: wangliangzz@126.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, Wang Liang <wangliangzz@inspur.com>
References: <20230423110254.35672-1-wangliangzz@126.com>
 <e56994f3-d906-89e3-3387-df65fb2c4b36@redhat.com>
In-Reply-To: <e56994f3-d906-89e3-3387-df65fb2c4b36@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 24/04/2023 um 10:15 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 23/04/2023 um 13:02 schrieb wangliangzz@126.com:
>> From: Wang Liang <wangliangzz@inspur.com>
>>
>> We need to get the aio_context before calling the blk_is_available.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1615
>> Signed-off-by: Wang Liang <wangliangzz@inspur.com>
>>
> 
> 
> Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 

Sorry I forgot, if you need to resend can you add the cause of this
issue in the commit message?
Something along the lines of:
"hmp_commit() calls blk_is_available() from a non-coroutine context (and
in the main loop). Since this is a co_wrapper_mixed_bdrv_rdlock
function, in this case it calls AIO_WAIT_WHILE(), which crashes if the
aio_context lock is not taken before"

Thank you,
Emanuele


