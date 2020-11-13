Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4929F2B24E4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 20:47:05 +0100 (CET)
Received: from localhost ([::1]:56838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdf2G-0008Fd-BU
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 14:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdf0F-0007Fv-Ih
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 14:44:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdf0D-0004cx-R5
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 14:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605296696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jxy1tddtDNHUq8R5Yx3cbTk5es0o7ZvRzosc+HKuPzA=;
 b=EzQ8vy2zcXfc8rVW0NBBKGJ5a5wU2+4qupmTQc1tRzd4V0O8wSQrLlHMXNjLDX52WdJHPB
 8lC9Iok+G4H8jBHulGgrPd+/zHc9lUHloygFDaMd559AskS/hUx2u+HLbifmzWed2NaLZg
 wrZSwJmfAgskp6m1mKWyjWQcPbl7qBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-ncp-a0B2Oo6tC_riBEnjng-1; Fri, 13 Nov 2020 14:44:51 -0500
X-MC-Unique: ncp-a0B2Oo6tC_riBEnjng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79922800597;
 Fri, 13 Nov 2020 19:44:50 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A6595D9F1;
 Fri, 13 Nov 2020 19:44:48 +0000 (UTC)
Subject: Re: [PATCH v4 0/2] quorum: Implement bdrv_co_block_status()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1605286097.git.berto@igalia.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d201408b-75f7-ac79-f456-1ae5baedb7f7@redhat.com>
Date: Fri, 13 Nov 2020 20:44:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1605286097.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 13.11.20 17:52, Alberto Garcia wrote:
> Following Max's suggestion, this version sets supported_zero_flags.
> 
> Berto
> 
> v4:
> - Set supported_zero_flags in quorum [Max]
> - Update test to verify the data written before doing 'write -z' [Max]
> 
> v3: https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00371.html
> - Fall back to BDRV_BLOCK_DATA if a child returns an error.
> 
> v2: https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00259.html
> - Implement bdrv_co_pwrite_zeroes() for quorum
> 
> v1: https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00163.html
> 
> 
> Alberto Garcia (2):
>    quorum: Implement bdrv_co_block_status()
>    quorum: Implement bdrv_co_pwrite_zeroes()

Thanks, applied to my block-next branch (for 6.0):

https://git.xanclic.moe/XanClic/qemu/commits/branch/block-next

Max


