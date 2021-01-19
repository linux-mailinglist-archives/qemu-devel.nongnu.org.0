Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B094A2FB5C2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:47:34 +0100 (CET)
Received: from localhost ([::1]:46854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1pTx-0004Vx-PK
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:47:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l1pT9-00042p-Fd; Tue, 19 Jan 2021 06:46:43 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:42604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l1pT4-0001dK-9F; Tue, 19 Jan 2021 06:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=9afYoKOMwbkVbABp5rjwwi9lY4aYcR9LFT5DTSU5b18=; 
 b=CczVlMAGz0HalxBNVQxPFMoKsRqrYx2daLcQMLfXjU6jN/o4v6m5GCIk9dMIM9hg+a1H6BJ5iRFCeQ/jYwgs9jonTLGELs9IhvjZbYVUTa9mJWV8MWDFDOe++P5a0awMu9MtgbsAQIU7CXwwT6DZjZKchu/rZ2/Y31OXU05nsXs7o2hg+8gI5CkZl4NLwMdApagYf0MGI8azufGxTcKwAhIERAZ6QUS0NN1MYQuhCH69pGYkwEZh7AMTGHRz93X5Iurrwr939vbFsxMAjyPDAMTZwafTtrB5AnsPTU08dNlwIosEjf1g7iAaoiTpUwxkGKdvMTRsB3q9IsM5Gir+/w==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1l1pSh-0007b0-03; Tue, 19 Jan 2021 12:46:15 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1l1pSg-0007KB-N8; Tue, 19 Jan 2021 12:46:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 1/2] block: Allow changing bs->file on reopen
In-Reply-To: <53852b77-1b29-0c27-0083-ac6e263b560e@virtuozzo.com>
References: <cover.1610715661.git.berto@igalia.com>
 <1a9b457d93c0732e8e4785a0cc4b5f3b935f2cf6.1610715661.git.berto@igalia.com>
 <53852b77-1b29-0c27-0083-ac6e263b560e@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 19 Jan 2021 12:46:14 +0100
Message-ID: <w51im7tw3nd.fsf@maestria.local.igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 18 Jan 2021 11:15:17 AM CET, Vladimir Sementsov-Ogievskiy wrote:
>> +static int bdrv_reopen_parse_file(BDRVReopenState *reopen_state,
>> +                                  GSList **tran,
>> +                                  Error **errp)
>> +{
>> +    BlockDriverState *bs = reopen_state->bs;
>> +    BlockDriverState *new_file_bs;
>> +    QObject *value;
>> +    const char *str;
>> +
>> +    value = qdict_get(reopen_state->options, "file");
>> +    if (value == NULL) {
>> +        return 0;
>> +    }
>> +
>> +    /* The 'file' option only allows strings */
>> +    assert(qobject_type(value) == QTYPE_QSTRING);
>> +
>> +    str = qobject_get_try_str(value);
>> +    new_file_bs = bdrv_lookup_bs(NULL, str, errp);
>> +    if (new_file_bs == NULL) {
>> +        return -EINVAL;
>> +    } else if (bdrv_recurse_has_child(new_file_bs, bs)) {
>> +        error_setg(errp, "Making '%s' a file of '%s' "
>> +                   "would create a cycle", str, bs->node_name);
>> +        return -EINVAL;
>> +    }
>> +
>> +    assert(bs->file && bs->file->bs);
>
> why are we sure at this point? Probably, we should just return an
> error..

Unlike 'backing', 'file' is a BlockdevRef and it is not optional, so
block devices that accept that parameter must have it set.

>> +    /* At the moment only backing links are frozen */
>> +    assert(!bs->file->frozen);
>
> I think it can: file-child based filters can be a part of frozen
> backing chain currently.

You're right, since 7b99a26600e bdrv_freeze_backing_chain() uses
bdrv_filter_or_cow_child().

Berto

