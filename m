Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587652C12FB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 19:22:21 +0100 (CET)
Received: from localhost ([::1]:56582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khGTk-00015t-DH
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 13:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1khGS1-0008Tf-QM; Mon, 23 Nov 2020 13:20:35 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1khGRy-0002ii-10; Mon, 23 Nov 2020 13:20:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Ym7add4HBz9vgeG14LlLemJlHe1nO30B3rY4JOdrsKc=; 
 b=cA2rBNpdMcUEyH/augUdOXKVav8jhinYyRECfqr77DzVwOBkJ7d77PnQjN2Oac1uWtuB5Jk0tX0oqFBSuQWZn1lUe5KJBWAMXjq7ph0sc5KFgz/3YNMq9Rg5IDPxEXzGeMhG0083UldBUP9XraznC55DrMp7SPNYniU2qCLObJrXYYPDMkA9ZTxOLAdf2plP5+ZvGlFa2VbPMvM/bwgAoYe3Me4HoQv9MXpFY+Z1bOMN2FBcU22vckxs5qJKrjBkL++SpUruxVbMd+dnDbluimZ2Y+b5WKC+luMX0WTynpr1cvJL/+sIaZxnfpECSx6Kgx6cI1FR1c4LvAuelusnFA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1khGRV-0000K9-65; Mon, 23 Nov 2020 19:20:01 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1khGRU-0008I5-Se; Mon, 23 Nov 2020 19:20:00 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 1/1] Fix qcow2 corruption on discard
In-Reply-To: <20201123160941.GD5317@merkur.fritz.box>
References: <20201123154929.330338-1-mlevitsk@redhat.com>
 <20201123154929.330338-2-mlevitsk@redhat.com>
 <20201123160941.GD5317@merkur.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 23 Nov 2020 19:20:00 +0100
Message-ID: <w51mtz8541b.fsf@maestria.local.igalia.com>
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

On Mon 23 Nov 2020 05:09:41 PM CET, Kevin Wolf wrote:
>> Commit 205fa50750 ("qcow2: Add subcluster support to zero_in_l2_slice()")
>> introduced a subtle change to code in zero_in_l2_slice:
>> 
>> It swapped the order of
>> 
>> 1. qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
>> 2. set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
>> 3. qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
>> 
>> To
>> 
>> 1. qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
>> 2. qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
>> 3. set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);

Ouch :( Good catch!

>> -        qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
>>          if (unmap) {
>>              qcow2_free_any_cluster(bs, old_l2_entry, QCOW2_DISCARD_REQUEST);
>>          }
>>          set_l2_entry(s, l2_slice, l2_index + i, new_l2_entry);
>> +        qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
>
> Good catch, but I think your order is wrong, too. We need the original
> order from before 205fa50750:
>
> 1. qcow2_cache_entry_mark_dirty()
>    set_l2_entry() + set_l2_bitmap()
>
> 2. qcow2_free_any_cluster()

I agree with Kevin on this.

Berto

