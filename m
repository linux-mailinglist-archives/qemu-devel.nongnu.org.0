Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42962C45E4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 17:50:52 +0100 (CET)
Received: from localhost ([::1]:45128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khy0J-0007Sp-Dr
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 11:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1khxzH-0006rV-O7; Wed, 25 Nov 2020 11:49:47 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:47670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1khxzE-0008J6-6W; Wed, 25 Nov 2020 11:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=FavAWdeXdR03W4hQkzKQfySWFucYhQcu47VH40NTxeM=; 
 b=bOuYzXX9TpENHaWPJZazPh221+VLXoA7Y/R6lfeWKCSH9RwWrkDmVdS2pBjq7hANs39QA/4/L7oLrEN2+3git9DL3l35QlWkTEeIvTOyQDfU82TrmY0xtvfhqcZ+NQMKnKIqqvKNfLGsuB84hpYFEgDBjvKSo+Kwm2stQ3xYwI1nIzJffZEfzpD9I9zPtRpSYsVWiBsOwhDfT6vpvKxDSoZPbMxRxKUqx/KOuqWI8mnRfsVmARzcTOmjo3BIddT6Oq1HlsGiZhSBkj5GBfc9asf4qtsbxxZNjL+ERllFTj4b7h8CR0PcwLjJN8PprHS7bs7awc4Ct3LFi9SQrgzDeg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1khxz1-0006j8-RP; Wed, 25 Nov 2020 17:49:31 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1khxz1-0005YP-HX; Wed, 25 Nov 2020 17:49:31 +0100
From: Alberto Garcia <berto@igalia.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/1] Fix qcow2 corruption on discard
In-Reply-To: <35b073136cba9987a6cbfc59549dbe8633e0e803.camel@redhat.com>
References: <20201123154929.330338-1-mlevitsk@redhat.com>
 <20201123154929.330338-2-mlevitsk@redhat.com>
 <20201123173853.GE5317@merkur.fritz.box>
 <776008a350e47a33adbe659aa4ba106b6a2daf5f.camel@redhat.com>
 <20201124091723.GA22385@merkur.fritz.box>
 <w51lfeqzimf.fsf@maestria.local.igalia.com>
 <f6df1eedb9785b907807e0581be12c790112d939.camel@redhat.com>
 <35b073136cba9987a6cbfc59549dbe8633e0e803.camel@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 25 Nov 2020 17:49:31 +0100
Message-ID: <w51v9dtz8is.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, zhang_youjia@126.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 andrey.shinkevich@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 24 Nov 2020 08:44:00 PM CET, Maxim Levitsky wrote:
> On Tue, 2020-11-24 at 20:59 +0200, Maxim Levitsky wrote:
>> On Tue, 2020-11-24 at 19:59 +0100, Alberto Garcia wrote:
>> > On Tue 24 Nov 2020 10:17:23 AM CET, Kevin Wolf wrote:
>> > > We can then continue work to find a minimal reproducer and merge the
>> > > test case in the early 6.0 cycle.
>> > 
>> > I haven't been able to reproduce the problem yet, do you have any
>> > findings?
>> > 
>> > Berto
>> > 
>> 
>> I have a working reproducer script. I'll send it in a hour or so.
>> Best regards,
>> 	Maxim Levitsky
>
> I have attached a minimal reproducer for this issue.
> I can convert this to an iotest if you think that this is worth it.

I think it would be a good idea to have an iotest, I can also prepare if
you don't have time.

Thanks for the script!

Berto

