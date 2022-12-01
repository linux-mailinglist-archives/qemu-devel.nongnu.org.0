Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7AC63F220
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 14:59:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0k5R-0005NA-3j; Thu, 01 Dec 2022 08:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p0k5P-0005Mz-Th
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 08:58:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p0k5O-0003Px-Dz
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 08:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669903123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WAt9clXoCL5XZM40T7b5eMGSGajIqmwLhXV2m6sBhLM=;
 b=cpvoallM6yHLONiu95GD1wzIqMKP4pV0ZLI2MgfEEUDfczMTUqKPS9bFs2He0RF0cQ7z1v
 KaII52kelQQPxiFLDjs76K+hJbsCjPavxQDQU7x8kLzBgWGyiLa8ygYdpInp+eZLfzJm3S
 6UCr9hk0PK/szuM7cef4PmpDV/mJZ20=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-Q_RGYKvtOWGH1494QAdX9w-1; Thu, 01 Dec 2022 08:58:39 -0500
X-MC-Unique: Q_RGYKvtOWGH1494QAdX9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5317E1C1A844;
 Thu,  1 Dec 2022 13:58:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9968220290A5;
 Thu,  1 Dec 2022 13:58:35 +0000 (UTC)
Date: Thu, 1 Dec 2022 14:58:32 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v7 00/14] Still more coroutine and various fixes in block
 layer
Message-ID: <Y4izCNz4DL+49HK9@redhat.com>
References: <20221128142337.657646-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128142337.657646-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 28.11.2022 um 15:23 hat Emanuele Giuseppe Esposito geschrieben:
> This is a dump of all minor coroutine-related fixes found while looking
> around and testing various things in the QEMU block layer.
> 
> Patches aim to:
> - add missing coroutine_fn annotation to the functions
> - simplify to avoid the typical "if in coroutine: fn()
>   // else create_coroutine(fn)" already present in generated_co_wraper
>   functions.
> - make sure that if a BlockDriver callback is defined as coroutine_fn, then
>   it is always running in a coroutine.
> 
> This serie is based on Kevin Wolf's series "block: Simplify drain".
> 
> Based-on: <20221108123738.530873-1-kwolf@redhat.com>
> 
> Emanuele

Thanks, applied to block-next.

Kevin


