Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE23333033
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:46:47 +0100 (CET)
Received: from localhost ([::1]:36010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjFe-0006gH-I9
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJiqF-0001vi-Ev
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:20:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJiq9-0005eo-DR
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615321223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jNoTaO8IwTLLqlNpYf97onAhxJLakhKOrwP3uyRLs+M=;
 b=U7vdHx5CzEW8xklksdO/SsSyBEHMhSzHCr0rGKWC2tM6OS6jc7Fr/IjD6eZJ5zqlkE3V7C
 Pr7nsbzsrY6PceKJAByhekfvakJxejMmcu3oXrEXROj/gS/7qWlDi0KfWEB98kDumrH7Ag
 y06KZ8lBLyy/2joMSHlvOV3B3uKLC2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-cYDjAjlMPjm3hPfmUQn8_g-1; Tue, 09 Mar 2021 15:20:20 -0500
X-MC-Unique: cYDjAjlMPjm3hPfmUQn8_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A58B080364C;
 Tue,  9 Mar 2021 20:20:19 +0000 (UTC)
Received: from [10.3.112.36] (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 226015D6D7;
 Tue,  9 Mar 2021 20:20:19 +0000 (UTC)
Subject: Re: [PATCH] stream: Don't crash when node permission is denied
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210309173451.45152-1-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a38de2f5-0725-7632-289e-f924ac45a8d7@redhat.com>
Date: Tue, 9 Mar 2021 14:20:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309173451.45152-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: ngu@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 11:34 AM, Kevin Wolf wrote:
> The image streaming block job restricts shared permissions of the nodes
> it accesses. This can obviously fail when other users already got these
> permissions. &error_abort is therefore wrong and can crash. Handle these
> errors gracefully and just fail starting the block job.
> 
> Reported-by: Nini Gu <ngu@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
> Based-on: 20210309121814.31078-1-kwolf@redhat.com
> ('storage-daemon: Call job_cancel_sync_all() on shutdown')
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


