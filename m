Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADE92B206B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:28:04 +0100 (CET)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbvf-0005AH-75
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kdbu2-0003TW-62; Fri, 13 Nov 2020 11:26:25 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:46049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kdbtn-0002fi-36; Fri, 13 Nov 2020 11:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=CyqSwkXkA4xVviSBXyJwgmC2n6pV+w401CNxJYNWXBU=; 
 b=KeDJqFB7qPm/ZA3c0f/z68G/b91Oj74G49qXKdH6fteq/eH3hsW0aMp6sCrHz1hPJk7renMKZq21ZU8y6mr57FweQccPw0mfWnrsfW1QCjBYh8FIwd+UmZQ4P+stqsQTOi0rYVNZUNBsZPlxl+TxOGTIaIniMtczm3/3gnjOh1FK4Z9szC5wWx4Fw93TcfqGOfxJclC1vPV5WHUznCecSMywcvHzj9VrPhdL4TC+VtLl2TvNwcsSv57uisGuvgSJRFY7LON3PaPTmY1DLVTpry7FMzUC5zLI+3NdpjFru7UL3ZKIiE6rYddHiOfREinWMwzXN4JF1qKRxsVk2/UY8w==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kdbti-0005dx-Cm; Fri, 13 Nov 2020 17:26:02 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kdbti-0002jV-3S; Fri, 13 Nov 2020 17:26:02 +0100
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/2] quorum: Implement bdrv_co_pwrite_zeroes()
In-Reply-To: <552f29f1-5b6a-82d3-a55f-100b460bcc6a@redhat.com>
References: <cover.1605111801.git.berto@igalia.com>
 <2faad461e6bffc4a50547547b8c20c39e0f544e8.1605111801.git.berto@igalia.com>
 <5b5e73f3-a045-268d-e82a-f652668a8f02@redhat.com>
 <w51a6vlfdf1.fsf@maestria.local.igalia.com>
 <552f29f1-5b6a-82d3-a55f-100b460bcc6a@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 13 Nov 2020 17:26:02 +0100
Message-ID: <w517dqpfckl.fsf@maestria.local.igalia.com>
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

On Fri 13 Nov 2020 05:11:20 PM CET, Max Reitz wrote:

>> We could set all supported_zero_flags as long as all children support
>> them, right?
>
> Sure, I was just thinking that we could set these regardless of
> whether the children support them, because (on zero-writes) the block
> layer will figure out for us whether the child nodes support them. O:)

But it can happen that one child supports e.g. BDRV_REQ_NO_FALLBACK but
the rest don't. In this case I think the block layer should return
-ENOTSUP earlier without writing to the child(ren) that do support that
flag.

So Quorum's supported_zero_flags would be the logical and of all of its
children's flags, right?

I'm unsure about BDRV_REQ_WRITE_UNCHANGED, many filters set that on top
of the other flags, but when would a BDS not support this flag?

>> pwrite_zeroes() does this additionaly:
>>=20
>>      if (!(child->bs->open_flags & BDRV_O_UNMAP)) {
>>          flags &=3D ~BDRV_REQ_MAY_UNMAP;
>>      }
>
> Interesting.  Technically, Quorum doesn=E2=80=99t support that flag (in
> supported_zero_flags O:))), so it shouldn=E2=80=99t appear, but, er, well
> then.

It would with the change that I'm proposing above.

Berto

