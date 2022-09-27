Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520475EBECD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:39:50 +0200 (CEST)
Received: from localhost ([::1]:41710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od749-0001yV-Aw
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od615-0006j3-8v
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od611-0002Pv-NA
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664267550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rRnimB01fkjB1gcy7qs2bqVlQaW7rt82H474bXpTsZc=;
 b=EupxqWTkdAkeg6FWON8ufPDXD8Sruo2LgEqO0vO5FO2BSPt49JVyBseZhK6mH1FRx3hGO0
 HABcABiavQAwwZZVhxk1BGHcUXAAYaloR4Fe9XA9FnVhs/uiTYeaA7hZ+aH/MVShYZvyxl
 UUjEewL5D6KmZmNnE6wZIRvHQUL5+hI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-l6i_uI7TM2KhMbxXkVa9Dg-1; Tue, 27 Sep 2022 04:32:27 -0400
X-MC-Unique: l6i_uI7TM2KhMbxXkVa9Dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B07D7382C96B;
 Tue, 27 Sep 2022 08:32:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B4E91120AC2;
 Tue, 27 Sep 2022 08:32:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 24CD51800622; Tue, 27 Sep 2022 10:32:25 +0200 (CEST)
Date: Tue, 27 Sep 2022 10:32:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Antonio Caggiano <antonio.caggiano@collabora.com>,
 qemu-devel@nongnu.org, gert.wollny@collabora.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/4] virtio-gpu: Don't require udmabuf when blob
 support is enabled
Message-ID: <20220927083225.gdgo6tkv4ssw73yd@sirius.home.kraxel.org>
References: <20220913105022.81953-1-antonio.caggiano@collabora.com>
 <20220913105022.81953-5-antonio.caggiano@collabora.com>
 <20220923123219.ofn2ygm4knljo6w2@sirius.home.kraxel.org>
 <6fe0d770-1a95-3d8f-6a75-a596f26aad54@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fe0d770-1a95-3d8f-6a75-a596f26aad54@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 26, 2022 at 09:32:40PM +0300, Dmitry Osipenko wrote:
> On 9/23/22 15:32, Gerd Hoffmann wrote:
> > On Tue, Sep 13, 2022 at 12:50:22PM +0200, Antonio Caggiano wrote:
> >> From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>
> >> Host blobs don't need udmabuf, it's only needed by guest blobs. The host
> >> blobs are utilized by the Mesa virgl driver when persistent memory mapping
> >> is needed by a GL buffer, otherwise virgl driver doesn't use blobs.
> >> Persistent mapping support bumps GL version from 4.3 to 4.5 in guest.
> >> Relax the udmabuf requirement.
> > 
> > What about blob=on,virgl=off?
> > 
> > In that case qemu manages the resources and continued to require
> > udmabuf.
> 
> The udmabuf is used only by the blob resource-creation command in Qemu.
> I couldn't find when we could hit that udmabuf code path in Qemu because
> BLOB_MEM_GUEST resource type is used only by crosvm+Venus when crosvm
> uses a dedicated render-server for virglrenderer.

Recent enough linux guest driver will use BLOB_MEM_GUEST resources
with blob=on + virgl=off

>   - /dev/udmabuf isn't accessible by normal user
>   - udmabuf driver isn't shipped by all of the popular Linux distros,
> for example Debian doesn't ship it

That's why blob resources are off by default.

> Because of all of the above, I don't think it makes sense to
> hard-require udmabuf at the start of Qemu. It's much better to fail
> resource creation dynamically.

Disagree.  When virgl/venus is enabled, then yes, qemu would let
virglrenderer manage resources and I'm ok with whatever requirements
virglrenderer has.  When qemu manages resources by itself udmabuf is
a hard requirement for blob support though.

take care,
  Gerd


