Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB25BF31B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 03:50:53 +0200 (CEST)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaot1-0005xL-Vg
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 21:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangliangzz@126.com>)
 id 1oaoqV-0003iL-CF; Tue, 20 Sep 2022 21:48:15 -0400
Received: from m15113.mail.126.com ([220.181.15.113]:59061)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangliangzz@126.com>)
 id 1oaoqP-00017L-L4; Tue, 20 Sep 2022 21:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Message-ID:Subject:From:Date:Mime-Version; bh=VSH0r
 cQJ215pBWJMglHGZwR4ynf5Zp/OT1mXKgo0htM=; b=SiVvkwYLoMJRtEFwp8IRC
 u19rjdJ1AiQeK56LiDX+GSvSWMBnEgj29mA7FUUMiGF4R0AjJ2U7FpvGurngbLSo
 CrJL5NK9yciXGeJVK8iDJz6yJCifslkKsbRjFHUtvG8TRKmDbrXn3hqOp46Zdnk+
 TVwAP/47sdavlsgfPi6FVA=
Received: from localhost.localdomain (unknown [117.160.246.157])
 by smtp3 (Coremail) with SMTP id DcmowAAnfMgzbSpjdiHeBw--.2145S3;
 Wed, 21 Sep 2022 09:47:35 +0800 (CST)
Message-ID: <f4b8e638285a7cfd2bd2e94c0bf9a1176cca0cb7.camel@126.com>
Subject: Re: [PATCH] ratelimit: restrict the delay time to a non-negative value
From: Wang Liang <wangliangzz@126.com>
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org, 
 qemu-block@nongnu.org
Cc: pbonzini@redhat.com, stefanha@redhat.com, silbe@linux.vnet.ibm.com, Wang
 Liang <wangliangzz@inspur.com>
Date: Wed, 21 Sep 2022 09:47:32 +0800
In-Reply-To: <w51h712i3pd.fsf@igalia.com>
References: <20220920123350.205391-1-wangliangzz@126.com>
 <w51h712i3pd.fsf@igalia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: DcmowAAnfMgzbSpjdiHeBw--.2145S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFy3tF4DXFWDtw17Aw1UJrb_yoWfGFg_GF
 yaq3s5AryjvFn7Cr42y3WIyrn3Jr1rXw48Jr48JrZrJFy8JaykAF1UWw12qFWavF4I9FW5
 Gr4Y9397ArWjgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRiYL95UUUUU==
X-Originating-IP: [117.160.246.157]
X-CM-SenderInfo: pzdqwzpldqw6b26rjloofrz/1tbiuQ2C1lpD+m1VZAABse
Received-SPF: pass client-ip=220.181.15.113; envelope-from=wangliangzz@126.com;
 helo=m15113.mail.126.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 2022-09-20 at 13:18 +0000, Alberto Garcia wrote:
> On Tue 20 Sep 2022 08:33:50 PM +08, wangliangzz@126.com wrote:
> > From: Wang Liang <wangliangzz@inspur.com>
> > 
> > The delay time should never be a negative value.
> > 
> > -    return limit->slice_end_time - now;
> > +    return MAX(limit->slice_end_time - now, 0);
> 
> How can this be negative? slice_end_time is guaranteed to be larger
> than
> now:
> 
>     if (limit->slice_end_time < now) {
>         /* Previous, possibly extended, time slice finished; reset
> the
>          * accounting. */
>         limit->slice_start_time = now;
>         limit->slice_end_time = now + limit->slice_ns;
>         limit->dispatched = 0;
>     }
> 
This is just a guarantee. 

If slice_end_time is assigned later by
    limit->slice_end_time = limit->slice_start_time +
        (uint64_t)(delay_slices * limit->slice_ns);
There may be precision issues at that time.

> Berto


