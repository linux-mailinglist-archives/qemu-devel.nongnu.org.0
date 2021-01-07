Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42F2ED01E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 13:45:58 +0100 (CET)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxUft-00042J-57
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 07:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxUeK-0003LT-FU
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:44:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxUeG-0005vN-Qy
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610023455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wuOjL+KKQIjB+n9Viw49SSCnoS7WOrynSrnphYdVE/M=;
 b=CWFnDoeB4p63YAf7dsqqrQ68vfPhNgUoRy/6yhyQUXh55Pb9ZFkv92TF1FgQChQVNJI48Y
 tGt60VXeAoD+PzGy2bCcDLV4JNH5C1fhGAZBrNpjhWemYM4oTzY9Rqh3gyK3oqdNnW/+SE
 51boKEyjub6SOx+hQjaECgIMpDYnh2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-ukjUUr6uNzyA4b4zlwsTFg-1; Thu, 07 Jan 2021 07:44:13 -0500
X-MC-Unique: ukjUUr6uNzyA4b4zlwsTFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E7AD800D53;
 Thu,  7 Jan 2021 12:44:12 +0000 (UTC)
Received: from starship (unknown [10.35.206.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E21560BF1;
 Thu,  7 Jan 2021 12:44:09 +0000 (UTC)
Message-ID: <7e5f14fb335132d8b6f060993a66cd42912b166b.camel@redhat.com>
Subject: Re: [PATCH 1/2] file-posix: allow -EBUSY errors during write zeros
 on raw block devices
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Date: Thu, 07 Jan 2021 14:44:08 +0200
In-Reply-To: <20201116144847.GB18526@merkur.fritz.box>
References: <20201111153913.41840-1-mlevitsk@redhat.com>
 <20201111153913.41840-2-mlevitsk@redhat.com>
 <20201116144847.GB18526@merkur.fritz.box>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jan Kara <jack@suse.cz>, qemu-block@nongnu.org,
 "Darrick J . Wong" <darrick.wong@oracle.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-11-16 at 15:48 +0100, Kevin Wolf wrote:
> Am 11.11.2020 um 16:39 hat Maxim Levitsky geschrieben:
> > On Linux, fallocate(fd, FALLOC_FL_PUNCH_HOLE) when it is used on a block device,
> > without O_DIRECT can return -EBUSY if it races with another write to the same page.
> > 
> > Since this is rare and discard is not a critical operation, ignore this error
> > 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> 
> I'm applying this one for 5.2, it certainly shouldn't hurt and makes
> things work at least, even if possibly not in the optimal way.
> 
> Patch 2 seems to be a bit less obvious and discussion is ongoing, so
> that's probably more 6.0 material.
> 
> Kevin

Any feedback on patch 2?

Best regards,
	Maxim Levitsky


