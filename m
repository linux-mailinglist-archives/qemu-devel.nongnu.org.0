Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68231C94EF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 17:23:54 +0200 (CEST)
Received: from localhost ([::1]:48666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWiNN-00063y-Mb
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 11:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWiM8-0004iq-OG
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:22:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21241
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWiM7-0006YO-7x
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588864953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjsElYeA98Mk6wvP5XkghHrqQzIOv4gcR4sNpY8jjnk=;
 b=PqEgOpiHx8P8NaCYnyWIAUF5A5/6R3DyUHbchrG16/mQzmebXA+c5R62QHMjP3XMqdCjUL
 YWm6Dr+kzpQxKlvCd4gYQgx54sRt20ponm/e7/VSNnwoURel8ZJgp6jEss4uAHDPH9ky5H
 GXULVh4yDx6sOxAt/aFM9Fh7NGHqR00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-hievSRiBOxO8S9jM8VeCLw-1; Thu, 07 May 2020 11:22:31 -0400
X-MC-Unique: hievSRiBOxO8S9jM8VeCLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6A96473;
 Thu,  7 May 2020 15:22:29 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 862D462A98;
 Thu,  7 May 2020 15:22:26 +0000 (UTC)
Subject: Re: [PATCH v2 10/9] qed: Simplify backing reads
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
References: <20200507084800.20596-1-vsementsov@virtuozzo.com>
 <20200507144513.348470-1-eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <afd569f7-48e5-8984-70aa-678292fd25b5@redhat.com>
Date: Thu, 7 May 2020 10:22:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507144513.348470-1-eblake@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:15:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, stefanha@redhat.com,
 "open list:qed" <qemu-block@nongnu.org>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/20 9:45 AM, Eric Blake wrote:
> The other four drivers that support backing files (qcow, qcow2,
> parallels, vmdk) all rely on the block layer to populate zeroes when
> reading beyond EOF of a short backing file.  We can simplify the qed
> code by doing likewise.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> I noticed this during my audit that v1 of Vladimir's series was correct.
> 
> No change in iotests results (test 274 is currently failing for qed,
> but for other reasons:
> +Traceback (most recent call last):
> +  File "274", line 24, in <module>
> +    iotests.verify_image_format(supported_fmts=['qcow2'])
> +AttributeError: module 'iotests' has no attribute 'verify_image_format'
> )

That iotest failure was due to a stale branch on my end; after updating 
to latest git master plus Kevin's latest 'block' branch, 274 is now 
skipped on qed.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


