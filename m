Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2D2B1BE9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:32:29 +0100 (CET)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdZBk-0008Gv-Iw
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdZ9i-0007Yd-9O
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:30:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdZ9f-0006Yb-CF
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605274217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sEraulBVwAnrLxLylR7BTied3gEo7TyH4zqHrg8ruo0=;
 b=IoX65Dy7FpI6IxnYRHOGcixFqvsG45MrHQmowGU3W6XTZXaxCequZ/Q5GPMARt8TsVU/hL
 xuXRRE2813gFkYOM8dkfyYzvH/fJ9gNinWLlAqAoyPnmutayx5Um3sv8DQkg98HIxRKuaa
 Cgp9ayxm9a1DO4ZanFpgYwAr7ehffYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-vSlBsJSROMqYBom2N13YCQ-1; Fri, 13 Nov 2020 08:30:15 -0500
X-MC-Unique: vSlBsJSROMqYBom2N13YCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4E5211CC7E2;
 Fri, 13 Nov 2020 13:30:14 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B02816EF48;
 Fri, 13 Nov 2020 13:30:13 +0000 (UTC)
Subject: Re: [PATCH 03/10] block: Improve some block-commit, block-stream
 error messages
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201113082626.2725812-1-armbru@redhat.com>
 <20201113082626.2725812-4-armbru@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a25004cd-6d72-c902-7587-7ba4d2f16ba1@redhat.com>
Date: Fri, 13 Nov 2020 14:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113082626.2725812-4-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.11.20 09:26, Markus Armbruster wrote:
> block-commit defaults @base-node to the deepest backing image.  When
> there is none, it fails with "Base 'NULL' not found".  Improve to
> "There is no backing image".
> 
> block-commit and block-stream reject a @base argument that doesn't
> resolve with "Base 'BASE' not found".  Commit 6b33f3ae8b "qemu-img:
> Improve commit invalid base message" improved this message in
> qemu-img.  Improve it here, too: "Can't find '%s' in the backing
> chain".
> 
> QERR_BASE_NOT_FOUND is now unused.  Drop.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: qemu-block@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/qapi/qmp/qerror.h |  2 --
>   blockdev.c                | 15 +++++++++------
>   tests/qemu-iotests/040    | 12 ++++++------
>   3 files changed, 15 insertions(+), 14 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


