Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A123C17F621
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 12:21:21 +0100 (CET)
Received: from localhost ([::1]:58114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBcwq-00056B-Ne
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 07:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jBcvY-0003hc-8B
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:20:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jBcvW-0002dd-3z
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:19:59 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:49897)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jBcvV-0001rv-GK; Tue, 10 Mar 2020 07:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=l6EY8+4IaXGWc6VMu08isNrywFWUxkPsXfVAEEDf51E=; 
 b=JHYaqB8joGdI+RmrqyoDeulAbvS1/oi9r1/tyP/QmeQLddBlUOBXvgxP7PeMAOWOihkgNek026BXGH1ROVWu7nEcf+OQfcF6FBtx//CftgfVqBFWz1qGkx29DXFM8f4gV97jmbjz3iGPU9kPQzmNnB2JaxGjsVsxU8WX4D2p4vzlIHKSPaSDzUJ5E7Gl5YSbHZxZzMYHFKrVJ8vcwHXvZ/q3L1PvzF/t4z5BjOwfyMxultm1wTPZ5RpiC80iLHu7GVfeG06RBBFVonUQzVl4Dhe3oc7BzigOodBPQvdYaEhS8puOeFRBpgeVUqp4M7Red3vN8v8a0CeGbQMBlF3KbQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jBcv8-0007DD-CM; Tue, 10 Mar 2020 12:19:34 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1jBcv8-0008F0-2P; Tue, 10 Mar 2020 12:19:34 +0100
From: Alberto Garcia <berto@igalia.com>
To: John Snow <jsnow@redhat.com>, Yi Li <yili@winhong.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] qcow2: remove QCowL2Meta parameter from handle_copied
In-Reply-To: <73e26cf3-1ead-4902-98e0-d80825f0a812@redhat.com>
References: <20200309163553.39106-1-yili@winhong.com>
 <73e26cf3-1ead-4902-98e0-d80825f0a812@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 10 Mar 2020 12:19:34 +0100
Message-ID: <w5136agihix.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 10 Mar 2020 03:04:47 AM CET, John Snow wrote:
>>  static int handle_copied(BlockDriverState *bs, uint64_t guest_offset,
>> -    uint64_t *host_offset, uint64_t *bytes, QCowL2Meta **m)
>> +    uint64_t *host_offset, uint64_t *bytes)
>>  {
>>      BDRVQcow2State *s = bs->opaque;
>>      int l2_index;
>> @@ -1567,7 +1567,7 @@ again:
>>          /*
>>           * 2. Count contiguous COPIED clusters.
>>           */
>> -        ret = handle_copied(bs, start, &cluster_offset, &cur_bytes, m);
>> +        ret = handle_copied(bs, start, &cluster_offset, &cur_bytes);
>>          if (ret < 0) {
>>              return ret;
>>          } else if (ret) {
>> 
>
> Seems OK to me -- it is definitely unused.
> (Is _that_ a problem?  For qcow2 maintainers to know.)

It is unused now, but I'm using it in my subcluster allocation patches:

   https://lists.gnu.org/archive/html/qemu-block/2019-12/msg00588.html

(I expect to send v4 soon, probably this week)

Berto

