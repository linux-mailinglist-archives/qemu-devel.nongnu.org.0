Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5757230C7D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 16:33:25 +0200 (CEST)
Received: from localhost ([::1]:43084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0QfT-0005Tp-6b
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 10:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k0QdR-0002we-Mu
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 10:31:17 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33624
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k0QdO-0001iQ-KV
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 10:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595946673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CjHJG/ECf1n3Mxn4cuFbc95VKla+EWw2jzs1p1KqLzc=;
 b=ZlsYGMxyDA5QBgR816Y9RI/7RS4Qn2iEDy6XbgSdHJ5LDRk9lzfKiKwOeW6k2cRpjklZoD
 ALWQCIfCloIatJWpnMyFHNpImFILXspA5Tco/J7h74zPvUVO69KCB9SF0eUHj/646Zk1YF
 xAufW+vHqwzg74qhVWdV6oTaqOBT6TA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-q0h3u4vIPJScTsXOGSfcTA-1; Tue, 28 Jul 2020 10:31:11 -0400
X-MC-Unique: q0h3u4vIPJScTsXOGSfcTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A170193F56C;
 Tue, 28 Jul 2020 14:31:10 +0000 (UTC)
Received: from [10.10.118.248] (ovpn-118-248.rdu2.redhat.com [10.10.118.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D72190E84;
 Tue, 28 Jul 2020 14:30:58 +0000 (UTC)
Subject: Re: [PATCH v2 1/4] block: nbd: Fix convert qcow2 compressed to nbd
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Nir Soffer <nirsof@gmail.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20200727215846.395443-1-nsoffer@redhat.com>
 <20200727215846.395443-2-nsoffer@redhat.com>
 <627189f3-7cc3-a316-9b06-7e39179f69a8@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6037c80a-03ec-67bc-6cd4-38b799b86ffe@redhat.com>
Date: Tue, 28 Jul 2020 09:30:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <627189f3-7cc3-a316-9b06-7e39179f69a8@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/20 8:15 AM, Vladimir Sementsov-Ogievskiy wrote:
> 28.07.2020 00:58, Nir Soffer wrote:
>> When converting to qcow2 compressed format, the last step is a special
>> zero length compressed write, ending in call to bdrv_co_truncate(). This
>> call always fails for the nbd driver since it does not implement
>> bdrv_co_truncate().
>>

>> +static int coroutine_fn nbd_co_truncate(BlockDriverState *bs, int64_t 
>> offset,
>> +                                        bool exact, PreallocMode 
>> prealloc,
>> +                                        BdrvRequestFlags flags, Error 
>> **errp)
>> +{
>> +    BDRVNBDState *s = bs->opaque;
>> +
>> +    if (offset != s->info.size && exact) {
>> +        error_setg(errp, "Cannot resize NBD nodes");
>> +        return -ENOTSUP;
>> +    }
>> +
>> +    if (offset > s->info.size) {
>> +        error_setg(errp, "Cannot grow NBD nodes");
>> +        return -EINVAL;
>> +    }
> 
> I think that ENOTSUP actually is valid error code for both cases.. NBD 
> protocol has experimental extension NBD_CMD_RESIZE, so one day we'll 
> implement this. So, I think, it's not invalid, but just not supported 
> yet. Still, not a big deal, so with ENOTSUP or EINVAL:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Indeed, if we ever get around to fully specifying how NBD_CMD_RESIZE 
should even work, we'll be revisiting this code to implement that.

> 
> Also, may be better to manage it in generic layer:
> If driver doesn't implement bdrv_co_truncate handler (or return 
> ENOTSUP), and we are truncating to the same size, or to smaller size 
> with exact=false, we just report success? Then we'll drop same code from 
> file-posix.c

That was also my question on v1; but given the closeness to the release, 
this is a minimal change appropriate for -rc2, while changing the 
generic layer may have unintended consequences.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


