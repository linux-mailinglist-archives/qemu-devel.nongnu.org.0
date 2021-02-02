Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23F830C62B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:41:39 +0100 (CET)
Received: from localhost ([::1]:60908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ykE-00071p-M8
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6yNv-0004LZ-Dp
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:18:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6yNt-0004GD-24
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612282708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4tzAZXTxDJIqehk6Iob9pCex412JgZaq0iH6jlGfj4=;
 b=iQ2oIuSwZAL1BbeTrgJwqPUYAy+SSVGPID0WhIypSJxC1CXDDNDeSMQVFf4gtOiMsCeugQ
 WavysjIXUDa852n3OxEMbRjVrOFEAqz88m8FfekCncZCUq+vRIryfwsDdnXnT2YRqB2sI1
 FFhOAdspUb1XGE95AW6NaXC4/zWkYVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-x71uF2VmOCmkqfXYvtgBzg-1; Tue, 02 Feb 2021 11:18:26 -0500
X-MC-Unique: x71uF2VmOCmkqfXYvtgBzg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B06E7107ACE4;
 Tue,  2 Feb 2021 16:18:25 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4729819C71;
 Tue,  2 Feb 2021 16:18:25 +0000 (UTC)
Subject: Re: [PATCH] block: Fix VM size column width in bdrv_snapshot_dump()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210202155911.179865-1-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <fdc60cf3-dc7d-d1d7-7cb1-975bcf9ca089@redhat.com>
Date: Tue, 2 Feb 2021 10:18:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202155911.179865-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 9:59 AM, Kevin Wolf wrote:
> size_to_str() can return a size like "4.24 MiB", with a single digit
> integer part and two fractional digits. This is eight characters, but
> commit b39847a5 changed the format string to only reserve seven
> characters for the column.
> 
> This can result in unaligned columns, which in turn changes the output of
> iotests case 267 because exceeding the column size defeats the attempt
> to filter the size out of the output (observed with the ppc64 emulator).
> The resulting change is only a whitespace change, but since commit
> f203080b this is enough for iotests to consider the test failed.
> 
> Taking a character away from the tag name column and adding it to the VM
> size column doesn't change anything in the common case (the tag name is
> left justified, the VM size is right justified), but fixes this case.
> 
> Fixes: b39847a50553b7679d6d7fefbe6a108a17aacf8d
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/qapi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


