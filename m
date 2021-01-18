Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632852FA761
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:22:20 +0100 (CET)
Received: from localhost ([::1]:48408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YEN-0005b9-Bn
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1XaI-0001dH-0Z
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:40:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1XaF-0003EJ-OU
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610988050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppl5eQHipHGmb+2/GnsrH76MMwVmafYhBl8UOcc9Gsg=;
 b=XkoZYBmM/TnnvsGaPikst7HDzTpIDHOVTOjdZ/PdvSCHwjLIHVozL+8MBWleSOCdadAlds
 Y+HuwpIyxvltO6+McLD00ujS8MmKVY9fZxuPBKMR2L96oh4tr0g6cC36e60wy+vYaYhk2K
 XDDi6b8vPRJVXHO0CZ1SxuRSYNxOMAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-lCyCYBvmPaq2pahjGjeQgQ-1; Mon, 18 Jan 2021 11:40:46 -0500
X-MC-Unique: lCyCYBvmPaq2pahjGjeQgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D82A87950C;
 Mon, 18 Jan 2021 16:40:45 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F2FD5D9CD;
 Mon, 18 Jan 2021 16:40:43 +0000 (UTC)
Subject: Re: [PATCH v5] block: report errno when flock fcntl fails
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210113164447.2545785-1-david.edmondson@oracle.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <28fa9a24-bd2a-4ad8-c731-733e6de9040e@redhat.com>
Date: Mon, 18 Jan 2021 17:40:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113164447.2545785-1-david.edmondson@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.01.21 17:44, David Edmondson wrote:
> When a call to fcntl(2) for the purpose of adding file locks fails
> with an error other than EAGAIN or EACCES, report the error returned
> by fcntl.
> 
> EAGAIN or EACCES are elided as they are considered to be common
> failures, indicating that a conflicting lock is held by another
> process.
> 
> No errors are elided when removing file locks.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
> v3:
> - Remove the now unnecessary updates to the test framework (Max).
> - Elide the error detail for EAGAIN or EACCES when locking (Kevin,
>     sort-of Max).
> - Philippe and Vladimir sent Reviewed-by, but things have changed
>     noticeably, so I didn't add them (dme).
> 
> v4:
> - Really, really remove the unnecessary updates to the test framework.
> 
> v5:
> - Use a macro to avoid duplicating the EAGAIN/EACCES suppression
>    (Vladimir).
> - Fix "lock" -> "unlock" (Vladimir).
> - Comment on not eliding errors for the unlock case (Vladimir).

Thanks!  I’ve applied this patch to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


