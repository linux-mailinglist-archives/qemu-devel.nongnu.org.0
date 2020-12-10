Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB5F2D60A5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 16:58:36 +0100 (CET)
Received: from localhost ([::1]:37640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOKx-0007iB-1x
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 10:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knOJr-0007Fm-FJ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knOJq-0004cg-1J
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607615843;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2itmWxIxVo1nmzYv1fa9MGN25ZzOAaP72AKsqT1FbKc=;
 b=Y8u+OmqxU6A6u6dmZglYkD9fFo1E5xAgyU4RPMpAevzk0Jm82fNJTKzxkDJjud+UmNJrXK
 Ht3TPZKV4zX1WTiLYzQThq3RTN8PHg6kWBikyEqCT2GPrngVYJvHUTLXQbkaPnUuGffxzf
 EDwm6aYfoNzUsg98XwWi+B9pPIhVGKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-oqa3t5MFNv-pxwoN4yKgeA-1; Thu, 10 Dec 2020 10:57:13 -0500
X-MC-Unique: oqa3t5MFNv-pxwoN4yKgeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D760D80F04A;
 Thu, 10 Dec 2020 15:56:48 +0000 (UTC)
Received: from redhat.com (ovpn-115-31.ams2.redhat.com [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCFCC60C04;
 Thu, 10 Dec 2020 15:56:46 +0000 (UTC)
Date: Thu, 10 Dec 2020 15:56:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Feng Li <lifeng1519@gmail.com>
Subject: Re: [PATCH] file-posix: detect the lock using the real file
Message-ID: <20201210155643.GM24855@redhat.com>
References: <1607432377-87084-1-git-send-email-fengli@smartx.com>
 <20201208143822.GA6392@merkur.fritz.box>
 <20201209093326.GD3214234@redhat.com>
 <20201209174338.GB6660@merkur.fritz.box>
 <CAHckoCxunkqV6=-KKwbcB9_hbY0HUV7k+syHnHvwKnqXx6FDtw@mail.gmail.com>
 <20201210152730.GK24855@redhat.com>
 <CAEK8JBCOqMBFz2GfGwfwxSkVJ9RZq0o565vb2gfiN5sJR1j6hQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEK8JBCOqMBFz2GfGwfwxSkVJ9RZq0o565vb2gfiN5sJR1j6hQ@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Li Feng <fengli@smartx.com>,
 Kyle Zhang <kyle@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 11:53:09PM +0800, Feng Li wrote:
> My mistake, you are not on the receiver list of my v2.
> I use the get_maintainer.sh to generate the cc list.
> I will resend it to you.

No, need. I've seen 2, but didn't think you were referring to that
as it still has most of the flaws I pointed out in v1


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


