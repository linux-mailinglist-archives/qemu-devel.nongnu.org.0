Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DC25BF6BF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 08:53:22 +0200 (CEST)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oatbl-00006a-1Z
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 02:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangliangzz@126.com>)
 id 1oatCx-0004UC-G1; Wed, 21 Sep 2022 02:27:43 -0400
Received: from m15111.mail.126.com ([220.181.15.111]:56996)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangliangzz@126.com>)
 id 1oatCq-0003H2-GA; Wed, 21 Sep 2022 02:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Message-ID:Subject:From:Date:Mime-Version; bh=K6dzT
 LxaZIqmjb07KtS8nX2K471T/oEhAROOhvTkG0g=; b=M/rjE1eZyeYLNM5+5KZvQ
 x4z17RBJCniw6va3HFIBjyqZ73l2Rr5QlZrnpTwv6duyWHVhAkS/mtVeFwWcavFY
 m0+n0NAu1ENadGwsDumxF3hz4wRwf6ErIy57BRSBxKXoXM9YfHLQqZ5qnuUbgCYn
 AA8ZwpPRyWU0MMueWRuS6w=
Received: from localhost.localdomain (unknown [117.160.246.157])
 by smtp1 (Coremail) with SMTP id C8mowADnC6COripjrpINCA--.10119S3;
 Wed, 21 Sep 2022 14:26:26 +0800 (CST)
Message-ID: <3c8c6cfa21481cedbd825599b414111bcebbd284.camel@126.com>
Subject: Re: [PATCH] ratelimit: restrict the delay time to a non-negative value
From: Wang Liang <wangliangzz@126.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org, 
 qemu-block@nongnu.org, pbonzini@redhat.com, stefanha@redhat.com, 
 silbe@linux.vnet.ibm.com, Wang Liang <wangliangzz@inspur.com>
Date: Wed, 21 Sep 2022 14:26:22 +0800
In-Reply-To: <87edw5gwfl.fsf@pond.sub.org>
References: <20220920123350.205391-1-wangliangzz@126.com>
 <w51h712i3pd.fsf@igalia.com>
 <f4b8e638285a7cfd2bd2e94c0bf9a1176cca0cb7.camel@126.com>
 <87edw5gwfl.fsf@pond.sub.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: C8mowADnC6COripjrpINCA--.10119S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4DAFyUGF4DtFWxCw47XFb_yoW8XF4fpr
 W3XFyagF15AF12kF42y3ZxC3WY9r1UGr1kGr1kGF1rZrn0kr93KF17JrWDC34Sya4xCayf
 Xr48Xa90kr1Fk3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRyEEUUUUUU=
X-Originating-IP: [117.160.246.157]
X-CM-SenderInfo: pzdqwzpldqw6b26rjloofrz/1tbiLRKD1lpD-lAIQwAAsW
Received-SPF: pass client-ip=220.181.15.111; envelope-from=wangliangzz@126.com;
 helo=m15111.mail.126.com
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

On Wed, 2022-09-21 at 06:53 +0200, Markus Armbruster wrote:
> Wang Liang <wangliangzz@126.com> writes:
> 
> > On Tue, 2022-09-20 at 13:18 +0000, Alberto Garcia wrote:
> > > On Tue 20 Sep 2022 08:33:50 PM +08, wangliangzz@126.com wrote:
> > > > From: Wang Liang <wangliangzz@inspur.com>
> > > > 
> > > > The delay time should never be a negative value.
> > > > 
> > > > -    return limit->slice_end_time - now;
> > > > +    return MAX(limit->slice_end_time - now, 0);
> > > 
> > > How can this be negative? slice_end_time is guaranteed to be
> > > larger
> > > than
> > > now:
> > > 
> > >     if (limit->slice_end_time < now) {
> > >         /* Previous, possibly extended, time slice finished;
> > > reset
> > > the
> > >          * accounting. */
> > >         limit->slice_start_time = now;
> > >         limit->slice_end_time = now + limit->slice_ns;
> > >         limit->dispatched = 0;
> > >     }
> > > 
> > This is just a guarantee. 
> 
> Smells like an invariant to me.
> 
> > If slice_end_time is assigned later by
> >     limit->slice_end_time = limit->slice_start_time +
> >         (uint64_t)(delay_slices * limit->slice_ns);
> > There may be precision issues at that time.
> 
> What are the issues exactly?  What misbehavior are you observing?
> 
> Your commit message should show how delay time can become negative,
> and
> why that's bad.

It was observed in a production environment based on qemu v2.12.1.

The block-stream job delayed a very long time and do not get any
progress since ratelimit_calculate_delay returns a negative value.

Sorry, I don't have an environment to reproduce it in the mainline
version now.



