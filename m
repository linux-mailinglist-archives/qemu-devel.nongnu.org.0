Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529265EF91E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:37:08 +0200 (CEST)
Received: from localhost ([::1]:32840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvb1-0006Lm-3J
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1oduEz-00075k-27
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1oduEu-00026T-R0
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664460612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SdWzqYXGU+pRxMDw6LYobZ1W6fe/bVEoDIFEWXSqzBw=;
 b=UePXrSjC88l4ruAvE66jNf6ZvJJ1ghecIicIUMwjHWhzCRX4kWE5jLXE3Gh4BvscblcZB7
 Se/j8gIH04Wk0uAxd3n2DMe1TpSoYnrGEu5mN3/wVgm85jyAzibsfopPiJVBLGuWOpZoLC
 yLLWVVpZdUJsOCY34kYWg5b2AFKzNo8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-szppYweAMAy6ge1t5I9A3Q-1; Thu, 29 Sep 2022 10:10:06 -0400
X-MC-Unique: szppYweAMAy6ge1t5I9A3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 776CB862FDC;
 Thu, 29 Sep 2022 14:10:06 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.9.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34B3F205FA83;
 Thu, 29 Sep 2022 14:10:06 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
 id C34B04B004; Thu, 29 Sep 2022 10:10:05 -0400 (EDT)
Date: Thu, 29 Sep 2022 10:10:05 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Colin Walters <walters@verbum.org>
Cc: Sergio Lopez <slp@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Virtio-fs] virtiofsd: Any reason why there's not an "openat2"
 sandbox mode?
Message-ID: <YzWnPZ5Y6ivS8e1v@redhat.com>
References: <4362261a-c762-4666-84e2-03c9daa6c4d9@www.fastmail.com>
 <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
 <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
 <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
 <YzNZnPiUqySu6sGh@fedora>
 <20220928083340.eyizwu6mm3cc3bxu@mhamilton>
 <YzSgeDdpHOw1hTM0@redhat.com>
 <b963f623-aa85-4285-9bfa-5fcb4744c354@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b963f623-aa85-4285-9bfa-5fcb4744c354@app.fastmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, Sep 29, 2022 at 10:04:36AM -0400, Colin Walters wrote:
> On Wed, Sep 28, 2022, at 3:28 PM, Vivek Goyal wrote:
> 
> > Sounds reasonable. In fact, we could probably do someting similar
> > for "landlock" as well. 
> 
> Thanks for the discussion all!  Can someone (vaguely) commit to look into this in say the next few months?  It's not *urgent*, we can live with the 9p flakes and problems short term, just trying to figure out if this needs to be on our medium-term radar or not.  Thanks!

Hi Colin,

What's your use case. How do you plan to use virtiofs.

Thanks
Vivek


