Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A81F5365DF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:22:08 +0200 (CEST)
Received: from localhost ([::1]:44992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucj1-0006vi-BP
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nucCW-0002zm-MC
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:48:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nucCU-0004gE-Pl
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653666501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ptFKN07WzaZSkB75ssKmvz0ncxq0DmC4gK9vbQcWX08=;
 b=A2AEQwF7hl0GlvmeKvM3N2G7Oe/te4rIHTQl/YLiXO1x6SgYKx1jCOquXKqkGQ4feftLMO
 ldFD13QnOB+9rjbxNba+txsNoql1DERoVU2Qz6LLSj8wG9R6ZGQn9TtJ6NafMq8ZGnId1m
 cs1g/vTcddhUziXNsOHLzj8kdHD4EJY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-5JfnatFlN7OYXP6x7dxRCw-1; Fri, 27 May 2022 11:48:14 -0400
X-MC-Unique: 5JfnatFlN7OYXP6x7dxRCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED4CB85A5BC;
 Fri, 27 May 2022 15:48:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D4F48287E;
 Fri, 27 May 2022 15:48:10 +0000 (UTC)
Date: Fri, 27 May 2022 17:48:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 0/8] Support exporting BDSs via VDUSE
Message-ID: <YpDyt/ige24pu7T9@redhat.com>
References: <20220523084611.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523084611.91-1-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.05.2022 um 10:46 hat Xie Yongji geschrieben:
> Hi all,
> 
> Last few months ago, VDUSE (vDPA Device in Userspace) [1] has
> been merged into Linux kernel as a framework that make it
> possible to emulate a vDPA device in userspace. This series
> aimed at implementing a VDUSE block backend based on the
> qemu-storage-daemon infrastructure.
> 
> To support that, we firstly introduce a VDUSE library as a
> subproject (like what libvhost-user does) to help implementing
> VDUSE backends in QEMU. Then a VDUSE block export is implemented
> based on this library. At last, we add resize and reconnect support
> to the VDUSE block export and VDUSE library.
> 
> Now this series is based on Stefan's patch [2]. And since we don't
> support vdpa-blk in QEMU currently, the VM case is tested with my
> previous patchset [3].
> 
> [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> [2] https://lore.kernel.org/all/20220518130945.2657905-1-stefanha@redhat.com/
> [3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html

Thanks, applied to the block branch.

Kevin


