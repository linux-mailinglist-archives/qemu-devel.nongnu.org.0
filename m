Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0463F5386
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 00:53:52 +0200 (CEST)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIIpD-0006oW-0o
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 18:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIInH-0005Sd-VX
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIInE-0007ta-OH
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629759106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Od1YG8/+KUdrW2zrDnIdMxTUsMVe3wckct/LBBVt8Sk=;
 b=Yshd+bRyzdtvvhnIJM+h3/2pG9Kz9wWlBIkXshFXJBc9zQ2JQyW3iP2QUhctO52MS96FpK
 +FYbgT8hdYjyMmyL8V5HBk4bxsS9xm90z9onnAZx30827QNWtY+Z7jUu5O9frbggKTatKw
 AWMGbof1P9fpgZ/OAz6fAtcVoHlcr30=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-B5bSq4sxNfSlZsPN84QpkA-1; Mon, 23 Aug 2021 18:51:45 -0400
X-MC-Unique: B5bSq4sxNfSlZsPN84QpkA-1
Received: by mail-qk1-f198.google.com with SMTP id
 62-20020a3706410000b02903d2cdd9acf0so12853899qkg.21
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 15:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Od1YG8/+KUdrW2zrDnIdMxTUsMVe3wckct/LBBVt8Sk=;
 b=PRDDTVNfkQscIV9jetaE7wUHuEaFbHLx8/tsqSIQ5lLcA8wugajJtyJiHDM63HMPJ/
 Qi5SuraUsNyxgRcRFoNbg35ARaMYliFh23fOhOQToLhY6oFw6LhwqVvYbMgf3tYN77Xq
 DTMBlubziQAtGrSB0V7tXRC91VGd9SXA6PXcDHZCz9+rR8hwIYRPCbMMzMff/fRknu+/
 7T1xtrM+tqUBHx0eQ1SrSHsvAyDdyxvEGB5Lxf81d99UMS8WizPytW2DUqxKckpTyg8Z
 0W7dm0p2Tp/snLke77YoBjHmBz+21EHPfKdbBuO5HP382wgRVXy/XWHhqtfWQ3XzwqPw
 z+4w==
X-Gm-Message-State: AOAM5310Eg7pt27i3voSZp3/JxdADe/xpHtAga/WFEq7KTEKKw1UNeQO
 hsYVQ7TzvfzooOi+M5whfVcSr23awGdUjSOhqcn3xpX75jV1I57ZrQqE/puAaCZUuzRZfB2OC40
 KypXjHs8G3ibkYfo=
X-Received: by 2002:ac8:110e:: with SMTP id c14mr32257301qtj.76.1629759104588; 
 Mon, 23 Aug 2021 15:51:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrmUbl4yaFF/PjDSw8RWij/UnJkONG8vwiQbZr3ANOZiSF4fKT7SjijqxqoJ2xnlyjcNCUyQ==
X-Received: by 2002:ac8:110e:: with SMTP id c14mr32257278qtj.76.1629759104313; 
 Mon, 23 Aug 2021 15:51:44 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id q7sm9529148qkm.68.2021.08.23.15.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 15:51:43 -0700 (PDT)
Date: Mon, 23 Aug 2021 18:51:42 -0400
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YSQmfkEP28eyu3Pa@t490s>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
 <20210823210703.cikdkhvyeqqypaqa@habkost.net>
 <YSQTwth0elaz4T8W@t490s>
 <20210823175247-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210823175247-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 05:54:44PM -0400, Michael S. Tsirkin wrote:
> > I can use a custom sort to replace qsort() to guarantee that.
> You don't have to do that. Simply use the device position on the command
> line for comparisons when priority is the same.

Indeed. :) Thanks,

-- 
Peter Xu


