Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9DC1FF4D6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 16:36:56 +0200 (CEST)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlvev-0008KF-Hu
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 10:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jlvdY-0007U5-OA; Thu, 18 Jun 2020 10:35:28 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:49740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jlvdX-0003KN-1L; Thu, 18 Jun 2020 10:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=0JleBibg3VwqJ2i+Ye5PRyHf7hLoM+n2RPyZUvHf45g=; 
 b=pFz+xgft4LkCKncoIp5wMp6bKZ5n5vaTjvD1xEkni+yEylmcrNDOT4Br2sSncmOCjMJvUrfNjNljUxRoYSN2vUDs+1LxQTqfhNK8csQDDBm7uewX8QF49np5peQ1+nInmM7XS+HFj9VCmxjjjq0Zv4drIPgp3kfO8xhpSM5AHAKOoZvvIlB2u8687878c/UAV4zVGQO90jPBGEMNi27ucLS9rF5gkPNxKDq9bYOzRfYka0erbzODhvU6Lv/Wg/S+NnF1XIB3dTicJJiYusLwa/7y5H1FB8MQT6DzkASFJKOoXf6H28A9xZegg021MgZwDDd3YuRzRcYgkqp27kSyJA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jlvdN-0004Rd-4L; Thu, 18 Jun 2020 16:35:17 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jlvdM-00041k-QK; Thu, 18 Jun 2020 16:35:16 +0200
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v3 08/17] block/io: support int64_t bytes in
 bdrv_aligned_preadv()
In-Reply-To: <9143ff10-cba2-bcc2-c48c-eac73446b159@redhat.com>
References: <20200430111033.29980-1-vsementsov@virtuozzo.com>
 <20200430111033.29980-9-vsementsov@virtuozzo.com>
 <9143ff10-cba2-bcc2-c48c-eac73446b159@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 18 Jun 2020 16:35:16 +0200
Message-ID: <w51lfkktpaz.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 10:29:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, fam@euphon.net, integration@gluster.org,
 sheepdog@lists.wpkg.org, pavel.dovgaluk@ispras.ru, dillaman@redhat.com,
 qemu-devel@nongnu.org, sw@weilnetz.de, pl@kamp.de, ronniesahlberg@gmail.com,
 mreitz@redhat.com, den@openvz.org, stefanha@redhat.com, namei.unix@gmail.com,
 pbonzini@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 22 May 2020 05:14:36 PM CEST, Eric Blake wrote:
>>   static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
>> -    BdrvTrackedRequest *req, int64_t offset, unsigned int bytes,
>> +    BdrvTrackedRequest *req, int64_t offset, int64_t bytes,
>>       int64_t align, QEMUIOVector *qiov, size_t qiov_offset, int flags)
 [...]
>>       BlockDriverState *bs = child->bs;
>>       int64_t total_bytes, max_bytes;
>>       int ret = 0;
>> -    uint64_t bytes_remaining = bytes;
>> +    int64_t bytes_remaining = bytes;
>>       int max_transfer;
>>   
>>       assert(is_power_of_2(align));
>> +    assert(offset >= 0 && bytes >= 0);
>
> Use within the function:
>
> the new assertion added here does not check for whether offset+bytes is 
> positive; I would suggest we strengthen it to instead be:
> assert(offset >= 0 && (uint64_t) bytes <= INT64_MAX - offset);

But here you would be making 'bytes' unsigned without asserting that
it's not negative.

Berto

