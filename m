Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8812B2C89D6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 17:46:47 +0100 (CET)
Received: from localhost ([::1]:53910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmK6-0000H8-0r
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 11:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kjmGc-0007WW-MP
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:43:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kjmGY-0003c3-DD
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606754583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9Y0cK1HKCxjIFbcfntXXAJWTz65qEXjogtT+NCNZPo=;
 b=awO0gTOio+x73NYWoZFRmgj2ukkfIzd05JRQ3XHEptC7V4F1kg1nQ8Mxoh9rLeMjnWIOLf
 t9+IECjC4g8N8NU+CCnYhDW/Dnfn35715LvM/txA/npk/NCCzM4EskUp/zwPIO1FqUk/LP
 94ATF3QegeCp2HK4X6HI1rFA4PEQVO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-NyNh0YU0PDO5bM2Z11uQ5A-1; Mon, 30 Nov 2020 11:43:00 -0500
X-MC-Unique: NyNh0YU0PDO5bM2Z11uQ5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D15C8558E0;
 Mon, 30 Nov 2020 16:42:59 +0000 (UTC)
Received: from [10.3.113.230] (ovpn-113-230.phx2.redhat.com [10.3.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACEDA5C1C5;
 Mon, 30 Nov 2020 16:42:58 +0000 (UTC)
Subject: Re: [PATCH v2 0/6] migration: Multi-thread compression method support
To: Zeyu Jin <jinzeyu@huawei.com>, quintela@redhat.com, dgilbert@redhat.com
References: <20201127093639.2815-1-jinzeyu@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2ec8cee7-5330-0e87-f593-464ba789688e@redhat.com>
Date: Mon, 30 Nov 2020 10:42:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127093639.2815-1-jinzeyu@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 3:36 AM, Zeyu Jin wrote:

Meta-comment: you appear to be having problems threading your series;
I've now seen three separate cover letters (RFC v1, v2 with no subject,
v2 with subject) and two series where each patch was a separate thread.
It is difficult to follow which messages are related when reading in a
mail client that sorts by most-recently-active thread first.  You may
want to investigate why your threading is not working, although I'd wait
to send v3 until you have actual changes to incorporate.

> Currently we have both multi-thread compression and multifd to optimize
> live migration in Qemu. Mulit-thread compression deals with the situation
> where network bandwith is limited but cpu resource adequate. Multifd instead

Not that typos in the cover letter matter, but this should be 'bandwidth'

> aims to take full advantage of network bandwith. Moreover it supports both
> zlib and zstd compression on each channel.
> 
> In this patch series, we did some code refactoring on multi-thread compression
> live migration and bring zstd compression method support for it.
> 
> Below is the test result of multi-thread compression live migration
> with different compress methods. Test result shows that zstd outperforms
> zlib by about 70%.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


