Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90752CC1D4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 17:16:07 +0100 (CET)
Received: from localhost ([::1]:46308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkUnW-000844-P3
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 11:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kkUkF-0007Lb-1x; Wed, 02 Dec 2020 11:12:43 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:33497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kkUkB-0002dF-EK; Wed, 02 Dec 2020 11:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=J7NhDjgk/KN/QjpvaUmArFEhdSpQgR5c3o8PZpm1L8A=; 
 b=Bgq5uhecBgCydzVf/fva2kh8l6iKBHH7cpi5u8LEz/2a2SIQ7tDw3NlA682nYF228QkYFLTHYot7dumSIEoFiovSMBEow+UNTZVjtTZcdmF/ObRPPdo0Vu9XS/V+K/wiF462WDmmMP+lt5doqdzYLySrTVvVwZ8m2hoo0FYxZLw6R6TwnoOO6W3KIstjUsrHi078KdjQqAOQo+lqurHsuDCs5KygA+mvJS1Py6p4UlN1ZBSP6eFK4ayX9i50koyuy4iECm2Nfj7eEGBiRGOsCQGTo/Y6QlKXuOJgnLmnO6oJU6FqaPx7cOUnGO7/J7YuXxA1i0hBehoAqMqiSzxwqA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kkUjh-00025q-5g; Wed, 02 Dec 2020 17:12:09 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kkUjg-0005ln-Sj; Wed, 02 Dec 2020 17:12:08 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: Plans to bring QMP 'x-blockdev-reopen' out of experimental?
In-Reply-To: <20201020082333.GB4452@merkur.fritz.box>
References: <20201006091001.GA64583@paraplu>
 <w51mu0ifbuf.fsf@maestria.local.igalia.com>
 <w51k0vmf9k3.fsf@maestria.local.igalia.com>
 <20201020082333.GB4452@merkur.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 02 Dec 2020 17:12:08 +0100
Message-ID: <w51blfctcfb.fsf@maestria.local.igalia.com>
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
Cc: mreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 20 Oct 2020 10:23:33 AM CEST, Kevin Wolf wrote:
>> I forgot to add, we still don't support changing bs->file with this
>> command, so I guess that would be one blocker?
>> 
>> There's no other way of inserting filter nodes, or is there?
>
> Not that I'm aware of.
>
> So yes, changing bs->file is the one thing I had in mind for
> implementing before we mark it stable.
>
> I'm not entirely sure if we should make some restrictions or allow
> arbitrary changes. If it's only about filters, we could check that the
> node returned by bdrv_skip_filters() stays the same. This would be
> almost certainly safe (if the chain is not frozen, of course).
>
> If people want to dynamically insert non-filters (maybe quorum?), it
> might be more restrictive than necessary, though.
>
> Other cases like inserting a qcow2 file in the chain where the old
> child becomes the backing file of the newly inserted node should in
> theory already be covered by blockdev-snapshot.

Hi,

I have been working a bit on this and I have doubts about the
following situation: let's say we have a normal qcow2 image with two
BDS for format (node-name "hd0") and protocol ("hd0-file"):

   hd0 -> hd0-file

{ "execute": "blockdev-add", "arguments":
   {'driver': 'file', 'node-name': 'hd0-file', 'filename':  'hd0.qcow2 }}
{ "execute": "blockdev-add", "arguments":
   {'driver': 'qcow2', 'node-name': 'hd0', 'file': 'hd0-file'}}

Now we want to use x-blockdev-reopen to insert a throttle filter
between them, so the result would be:

   hd0 -> throttle -> hd0-file

First we add the filter:

{ "execute": "object-add", "arguments":
   { 'qom-type': 'throttle-group', 'id': 'group0',
     'props': { 'limits': { 'iops-total': 1000 } } } }
{ "execute": "blockdev-add", "arguments":
   { 'driver': 'throttle', 'node-name': 'throttle0',
     'throttle-group': 'group0', 'file': "hd0-file" } }

And then we insert it:

{ "execute": "x-blockdev-reopen", "arguments":
   {'driver': 'qcow2', 'node-name': 'hd0', 'file': 'throttle0'}}

So x-blockdev-reopen sees that we want to replace the current bs->file
("hd0-file") with a new one ("throttle0"). The problem here is that
throttle0 has hd0-file as its child, so when we check the permissions on
throttle0 (and its children) we get that hd0-file refuses because it's
already being used (although in in the process of being replaced) by
hd0:

"Conflicts with use by hd0 as 'file', which does not allow 'write, resize' on hd0-file"

And we would get a similar problem with the reverse operation (removing
the filter).

Berto

