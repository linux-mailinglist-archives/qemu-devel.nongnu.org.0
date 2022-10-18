Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085C86029BC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:58:44 +0200 (CEST)
Received: from localhost ([::1]:47128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okkJ0-000416-Ss
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okkES-0001Dl-Vc
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okkEO-0000ii-Kg
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666090435;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4OqHKKnFnbhCPNqNxMQMrMvIuApPI0zl/WGM1OEt30=;
 b=AoyaI4fObXzq4bsEyT7IPOQyk5hkUKebNWxnS9ZVpRlDGCfkAlgUBkGujCQg43MyLssU/F
 c2twPbgTdjiqQokXLiXDcrv/OYYwFFCXFOyKXD6j7EVg7ZsuFRjjQNQsEsaVUAsw15d1wI
 qq4ol2IxBiYKDrJcn4a92Tkjy23QXtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-MIwO0XeHP6W39HSmDPoUtw-1; Tue, 18 Oct 2022 06:53:52 -0400
X-MC-Unique: MIwO0XeHP6W39HSmDPoUtw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D79FE858282;
 Tue, 18 Oct 2022 10:53:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5D374113E4;
 Tue, 18 Oct 2022 10:53:50 +0000 (UTC)
Date: Tue, 18 Oct 2022 11:53:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v2 05/11] io: Add support for seekable channels
Message-ID: <Y06FvDeZPq0kibRn@redhat.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
 <20221010133408.3214433-6-nborisov@suse.com>
 <Y058a4c549dx50d+@redhat.com>
 <c89d961a-569f-e836-1513-2c20d732102f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c89d961a-569f-e836-1513-2c20d732102f@suse.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 18, 2022 at 01:46:45PM +0300, Nikolay Borisov wrote:
> 
> 
> On 18.10.22 г. 13:14 ч., Daniel P. Berrangé wrote:
> > On Mon, Oct 10, 2022 at 04:34:02PM +0300, Nikolay Borisov wrote:
> > >   Add a bunch of auxiliarry methods and a feature flag to work with
> > >   SEEKABLE channels. Currently the only channel considered seekable is
> > >   QIOChannelFile. Also add a bunch of helper functions to QEMUFile that
> > >   can make use of this channel feature. All of this is in prepration for
> > >   supporting 'fixed-ram' migration stream feature.
> > 
> > QIOChannelBuffer/Null are also seekable.
> 
> Right, however I think for seek we also want to rely on the feature of
> filesystem that when you seek beyond EOF you won't actually allocate/use up
> the space from (eof, CUR_SEEK), with ChannelBuffer we'd have to actually
> allocate the space or add this support on top.

I'm fine with not implementing this for ChannelBuffer. Mostly making
the point that the APIs should be in QIOChannel base class, so that
someone could implement it in any subclass in future where it makes
sense.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


