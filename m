Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1EF36809D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:38:11 +0200 (CEST)
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYaw-0004lR-7O
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lZYVg-000173-Ul
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lZYVd-0006Im-4t
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619094760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HyOInNNwnYTVWb5Y7WWupuaTItGNMV9xtv0H41Kgn3M=;
 b=PFqE60SGGXMboiWNmMRGqtrZ3V+kt4QdUV6M/Ks3uV/AGgFrlqTOwYAxXQA0GiBBlzo7JY
 LpVI34PrMM8T+t9eX4PFk2YsLLQTKBSoW80YNxe6pfDmRa9Vb3lndIXKvP0UDlRcQd9lOJ
 v93prr9Cq7nCcJ0KIgWOzF9/k/y2Kig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-u5AZXSnoP4eiV9tDm0F8sA-1; Thu, 22 Apr 2021 08:32:36 -0400
X-MC-Unique: u5AZXSnoP4eiV9tDm0F8sA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 004EE343AA;
 Thu, 22 Apr 2021 12:32:35 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-187.ams2.redhat.com
 [10.36.113.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91A7E19C71;
 Thu, 22 Apr 2021 12:32:33 +0000 (UTC)
Subject: Re: [PATCH v4 0/2] Fix segfault in qemu_rbd_parse_filename
To: Connor Kuehl <ckuehl@redhat.com>, qemu-block@nongnu.org
References: <20210421212343.85524-1-ckuehl@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b64f5b49-72b6-de56-3dfa-851ef5c8e5df@redhat.com>
Date: Thu, 22 Apr 2021 14:32:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421212343.85524-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.04.21 23:23, Connor Kuehl wrote:
> Connor Kuehl (2):
>    iotests/231: Update expected deprecation message
>    block/rbd: Add an escape-aware strchr helper
> 
>   block/rbd.c                | 32 +++++++++++++++++++++-----------
>   tests/qemu-iotests/231     |  4 ++++
>   tests/qemu-iotests/231.out |  7 ++++---
>   3 files changed, 29 insertions(+), 14 deletions(-)

Thanks, applied to my block-next branch (for 6.1):

https://git.xanclic.moe/XanClic/qemu/commits/branch/block-next

Max


