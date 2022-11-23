Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C8636050
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 14:47:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxq4i-0000C6-2g; Wed, 23 Nov 2022 08:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxq4c-00007j-Hk
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:46:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxq4a-0003i7-Bs
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669211155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjfJY1h7U9rUFmtVfGRVY7UH3IshZc9BlOKMgDIpZHs=;
 b=JFKIP39S+xHjri/JobgGz7inAY0xng7KHIEPOPj/cLEmmxZ6ufkN5EUQSNTcWe3w4wmafL
 dBSBYvpeE7tKmzm517athQd3LbJhT+WEow8pRGlpIrFKPWA6I56+DeetuRkzI6hdVgox8J
 IJHA3bNxHoWcPGUr02JsafT6plHxtL0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-Re3HaRsDP8Ch2vBWU_1aFA-1; Wed, 23 Nov 2022 08:45:51 -0500
X-MC-Unique: Re3HaRsDP8Ch2vBWU_1aFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2D703C0E466;
 Wed, 23 Nov 2022 13:45:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 122791121320;
 Wed, 23 Nov 2022 13:45:45 +0000 (UTC)
Date: Wed, 23 Nov 2022 14:45:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Peter Lieven <pl@kamp.de>, Eric Blake <eblake@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Alberto Garcia <berto@igalia.com>, Ilya Dryomov <idryomov@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, integration@gluster.org
Subject: Re: [PATCH 00/15] Protect the block layer with a rwlock: part 3
Message-ID: <Y34kBsj1NEV+kmJQ@redhat.com>
References: <20221116140730.3056048-1-eesposit@redhat.com>
 <e218aa44-6c49-d53f-d377-58a90a84db46@redhat.com>
 <4a16c6dd-7806-429a-f62d-afd13bebc52c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a16c6dd-7806-429a-f62d-afd13bebc52c@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 23.11.2022 um 12:45 hat Emanuele Giuseppe Esposito geschrieben:
> 
> 
> Am 18/11/2022 um 11:57 schrieb Paolo Bonzini:
> > On 11/16/22 15:07, Emanuele Giuseppe Esposito wrote:
> >> Here we introduce generated_co_wrapper_simple, a simplification of
> >> g_c_w that
> >> only considers the case where the caller is not in a coroutine.
> >> This simplifies and clarifies a lot when the caller is a coroutine or
> >> not, and
> >> in the future will hopefully replace g_c_w.
> > 
> > This is a good idea!
> > 
> > Just one thing, though it belongs more in the two series which
> > introduced generated_co_wrapper_simple and generated_co_wrapper_blk - I
> > would make this the "official" wrapper.  So perhaps:
> > 
> > - generated_co_wrapper_simple -> coroutine_wrapper
> > - generated_co_wrapper_blk -> coroutine_wrapper_mixed
> > - generated_co_wrapper -> coroutine_wrapper_mixed_bdrv
> 
> Ah damn I forgot about this, and of course I just sent v5 for "Still
> more coroutine and various fixes in block layer".
> 
> To me it sounds good, but before I do a massive edit and then someone
> asks to revert it, @Kevin and the others do you agree?

Makes sense to me in general. I think I originally suggested that the
"basic" version should be the one that doesn't take the graph lock, and
the special version with the longer name is the one that takes it.

This proposal contains the same thought, but extends it to make
generated_co_wrapper_simple the basic thing. This is good, because
eventually we want to get rid of the mixed functions, so they are indeed
the special thing.

I think this means that if we clean up everything, in the end we'll have
coroutine_wrapper and coroutine_wrapper_bdrv (the fourth version not in
the above list, but that Paolo mentioned we may want to have).

The only thing I'm unsure about is whether coroutine_wrapper_bdrv is
descriptive enough as a name or whether it should be something more
explicit like coroutine_wrapper_bdrv_graph_locked.

Kevin


