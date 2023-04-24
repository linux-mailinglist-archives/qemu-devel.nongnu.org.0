Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7396ECAB7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 12:53:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqtnm-0000fo-Lu; Mon, 24 Apr 2023 06:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pqtnk-0000cZ-RW
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 06:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pqtnT-0006MA-Pg
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 06:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682333505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=la9yr++JR6/5SOMjX01BNDOe/74IlMy+ZNLYr8flNAw=;
 b=WR3Ggh4IsUXvGNO2AAC9B+rQzQNTRn0Lv3ZA3y1hrp25A+QIvlbs93YiucgqcypgRKuYkK
 mvfW61UROLDBAD7QcbVR1T4W9UT+DtZuARq1FmrYUBBLFBBCgsOdWnxccRUGGrqYA1vOwk
 egWr/d24B1XJzjlRC7PFL7I7T6khZo8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-ibJgIm88MdyDCdiT0vIg7w-1; Mon, 24 Apr 2023 06:51:44 -0400
X-MC-Unique: ibJgIm88MdyDCdiT0vIg7w-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f8b5e23d23so2430935f8f.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 03:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682333503; x=1684925503;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=la9yr++JR6/5SOMjX01BNDOe/74IlMy+ZNLYr8flNAw=;
 b=cXC8grgEcoKXldKtph9xcBohv02cRJ5mpJPXfroaQ1RKg6HOyqo9JkBStrPA9zfdWB
 bskI0H1qcZuDMcgVCJiJ5FtnUPDeJ9iTrOzbn1XBDIKNfLqeJQEMci9vGe76cL4QXn9T
 jlWB8VtYcEsDfbTbYQM3fUgnqdbuvlo0SZIQdb9xKmqVbkIURgrw2+5KF+UraWMAsBrq
 WITq1HYCv29pw7jI4DDrlTjM7QYePWUZOmC5ts9zqIbDmZxi4IqRQKB9xOhCmq849e/k
 748e8uAIg6pBFJw1IgjWndibwWrLM/sP9EMx5hGMIRVvJLUP1I5DdcVAUgQ5uF4qnSSO
 HMcQ==
X-Gm-Message-State: AAQBX9d/0YgI3cM0sBlWzfo9pvDoAPwRm/tEoCWRi3lOHCadyYHPTEJm
 /jlD06NrmyyZyMhmxiakC/EcYNKrkQQ3JRlxtvQD/3kQBnPE29fWStFKde1+9BlIse/OenNC95l
 fXXCnKrFaolEZhV8=
X-Received: by 2002:adf:ed07:0:b0:2f5:7079:599e with SMTP id
 a7-20020adfed07000000b002f57079599emr9177122wro.12.1682333502909; 
 Mon, 24 Apr 2023 03:51:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350brVfaUAsudy2/sZbay1fwu79fWCaMwwLvLCwZ1G5YHOUVe98dRV1mS/bqc0/vPlAGIXUQX9g==
X-Received: by 2002:adf:ed07:0:b0:2f5:7079:599e with SMTP id
 a7-20020adfed07000000b002f57079599emr9177107wro.12.1682333502623; 
 Mon, 24 Apr 2023 03:51:42 -0700 (PDT)
Received: from [192.168.149.117]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 n16-20020adfe350000000b002c71b4d476asm10487201wrj.106.2023.04.24.03.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 03:51:42 -0700 (PDT)
Message-ID: <83d606e2-8e50-88e0-1bde-e1e7cd4e1732@redhat.com>
Date: Mon, 24 Apr 2023 12:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] block/monitor/block-hmp-cmds.c: Fix crash when execute
 hmp_commit
Content-Language: de-CH
To: wangliangzz@126.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 qemu-stable@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, Wang Liang <wangliangzz@inspur.com>
References: <20230424103902.45265-1-wangliangzz@126.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20230424103902.45265-1-wangliangzz@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.143, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



Am 24/04/2023 um 12:39 schrieb wangliangzz@126.com:
> From: Wang Liang <wangliangzz@inspur.com>
>
> hmp_commit() calls blk_is_available() from a non-coroutine context (and in
> the main loop). blk_is_available() is a co_wrapper_mixed_bdrv_rdlock
> function, and in the non-coroutine context it calls AIO_WAIT_WHILE(),
> which crashes if the aio_context lock is not taken before.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1615
> Signed-off-by: Wang Liang <wangliangzz@inspur.com>
>

Thanks!
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


