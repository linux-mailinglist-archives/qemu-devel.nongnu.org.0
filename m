Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A5E5BF946
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 10:31:11 +0200 (CEST)
Received: from localhost ([::1]:48568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oav8Q-0004cY-0u
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 04:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1oauvU-0006N6-JC; Wed, 21 Sep 2022 04:17:48 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:39496
 helo=fanzine2.igalia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1oauvR-000529-0q; Wed, 21 Sep 2022 04:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Date:References:
 In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dAzh8scQptASFOfjVEy1wYUkMCILJ7L+7RP7e5IoN0Y=; b=hy44E21QkxTTNj0rkJn4znQPUf
 knMW1RAk/ZnF9KOU5HD7pBPQpVQuSokWC/Ff1PIsjF0QTeqamcsMX6lupun38HjULrqoFFZE6WY6U
 Qhb6Gh0ykuydeQ+lrJKfz++pYcUadxzYHreC5B9wgdDOBKU7wAOrysXZDTqrItlrPrqKQScdxU910
 lQ/RnWWqeRHsxPU91fjVVO5wEHw0axlA9YNXGfK2l3JjJcXJRctX5wzjnf/7U/Ago6jfc+OO/vC7W
 3bwW0waqt887MxK3AebxWCJmvJbGikWnuHgI/HSiuAVAkif+6x5UN6lrs6uOE1ybef0wL5JD1bi+v
 3aK+xfTw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oauvH-00G5nq-8X; Wed, 21 Sep 2022 10:17:34 +0200
Received: from gate.service.igalia.com ([192.168.21.52])
 by mail.igalia.com with esmtp (Exim)
 id 1oauvE-00Gvop-Q2; Wed, 21 Sep 2022 10:17:34 +0200
Received: from berto by gate.service.igalia.com with local (Exim 4.94.2)
 (envelope-from <berto@igalia.com>)
 id 1oauvE-000yYa-6v; Wed, 21 Sep 2022 08:17:32 +0000
From: Alberto Garcia <berto@igalia.com>
To: Wang Liang <wangliangzz@126.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Cc: pbonzini@redhat.com, stefanha@redhat.com, silbe@linux.vnet.ibm.com, Wang
 Liang <wangliangzz@inspur.com>
Subject: Re: [PATCH] ratelimit: restrict the delay time to a non-negative value
In-Reply-To: <f4b8e638285a7cfd2bd2e94c0bf9a1176cca0cb7.camel@126.com>
References: <20220920123350.205391-1-wangliangzz@126.com>
 <w51h712i3pd.fsf@igalia.com>
 <f4b8e638285a7cfd2bd2e94c0bf9a1176cca0cb7.camel@126.com>
Date: Wed, 21 Sep 2022 08:17:32 +0000
Message-ID: <w511qs5w38j.fsf@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine2.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Wed 21 Sep 2022 09:47:32 AM +08, Wang Liang wrote:
>> > -    return limit->slice_end_time - now;
>> > +    return MAX(limit->slice_end_time - now, 0);
>> 
>> How can this be negative? slice_end_time is guaranteed to be larger
>> than
>> now:
>> 
>>     if (limit->slice_end_time < now) {
>>         /* Previous, possibly extended, time slice finished; reset
>> the
>>          * accounting. */
>>         limit->slice_start_time = now;
>>         limit->slice_end_time = now + limit->slice_ns;
>>         limit->dispatched = 0;
>>     }
>> 
> This is just a guarantee. 
>
> If slice_end_time is assigned later by
>     limit->slice_end_time = limit->slice_start_time +
>         (uint64_t)(delay_slices * limit->slice_ns);

Ok, on a closer look, if at the start of the function

   limit->slice_start_time < now, and
   limit->slice_end_time >= now

it seems that in principle what you say can happen.

If it's so, it would be good to know under what conditions this happens,
because this hasn't changed in years.

Berto

