Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F5A2B1FA1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:09:29 +0100 (CET)
Received: from localhost ([::1]:34040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbdg-0008T5-Oy
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kdbcW-0007kK-5y; Fri, 13 Nov 2020 11:08:16 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:45256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kdbcT-0004eU-6l; Fri, 13 Nov 2020 11:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=so2na1U3AMv8NwmsGByQuKWu4tlqRufg7RdNPMnNRsg=; 
 b=ncGXfmRrEl6yw/lFaIRl0TaMQ0hV1rFgw99sgQohf+haNqdk6KyKU3vs3WOrE4PKG7nSea36wZhajBw61eU5sPt5nJ+vqODA4JNpmuTQzb2P2kK/LqY5gc/5zNSItP0/XoJ/B9VJAB0l5ocka5mFeqUYcgIaaVQ8FYxRiXnLlS4MB5FhfvxtnWEuJAb2N/SWRxj9EPS3FUEK7J8drweaMIfm5ryHfZ3MvinEALNAbVyru8gc4qMoSiEgmcn2E7WCVH0cNpNYTSBcTyyK8iptOqLbAlj79TjOlRfkrX2BWjEOu8f2LeDADWDlpGr7MA91OCLn/QXzEB33zWqlixFpug==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kdbc3-0003z0-8X; Fri, 13 Nov 2020 17:07:47 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kdbc2-0001Mf-VO; Fri, 13 Nov 2020 17:07:46 +0100
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/2] quorum: Implement bdrv_co_pwrite_zeroes()
In-Reply-To: <5b5e73f3-a045-268d-e82a-f652668a8f02@redhat.com>
References: <cover.1605111801.git.berto@igalia.com>
 <2faad461e6bffc4a50547547b8c20c39e0f544e8.1605111801.git.berto@igalia.com>
 <5b5e73f3-a045-268d-e82a-f652668a8f02@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 13 Nov 2020 17:07:46 +0100
Message-ID: <w51a6vlfdf1.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 11:07:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tao Xu <tao3.xu@intel.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 13 Nov 2020 12:49:04 PM CET, Max Reitz wrote:
> On 11.11.20 17:53, Alberto Garcia wrote:
>> This simply calls bdrv_co_pwrite_zeroes() in all children
>>=20
>> Signed-off-by: Alberto Garcia <berto@igalia.com>
>> ---
>>   block/quorum.c             | 18 ++++++++++++++++--
>>   tests/qemu-iotests/312     |  7 +++++++
>>   tests/qemu-iotests/312.out |  4 ++++
>>   3 files changed, 27 insertions(+), 2 deletions(-)
>
> Should we set supported_zero_flags to something?  I think we can at=20
> least set BDRV_REQ_NO_FALLBACK.  We could also try BDRV_REQ_FUA.

We could set all supported_zero_flags as long as all children support
them, right?=20

>> +    if (acb->flags & BDRV_REQ_ZERO_WRITE) {
>> +        sacb->ret =3D bdrv_co_pwrite_zeroes(s->children[i], acb->offset,
>> +                                          acb->bytes, acb->flags);
>> +    } else {
>> +        sacb->ret =3D bdrv_co_pwritev(s->children[i], acb->offset, acb-=
>bytes,
>> +                                    acb->qiov, acb->flags);
>> +    }
>
> Seems unnecessary (bdrv_co_pwritev() can handle BDRV_REQ_ZERO_WRITE),=20
> but perhaps it=E2=80=99s good to be explicit.

pwrite_zeroes() does this additionaly:

    if (!(child->bs->open_flags & BDRV_O_UNMAP)) {
        flags &=3D ~BDRV_REQ_MAY_UNMAP;
    }

Berto

