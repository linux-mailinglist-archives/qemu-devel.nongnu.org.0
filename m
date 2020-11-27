Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A298E2C62DB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 11:15:35 +0100 (CET)
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiams-000850-6D
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 05:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiald-0007UP-W6
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kialb-0005R1-8B
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606472054;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/ECF9uH1M9dAxQlGu6VGIpUGqxZZNgdBGkYVbVdzHaI=;
 b=AYvnUZPaaYs5A7o9Epu4XM6t3UQIWhT3nFFjjP1xszfU2CAr1Kn2tR8u4aZ0T4O/936SjF
 6tsWFVfoyz3pg6PzRn9anE8aACMsz4R8YBh7NrpjvQzNQ93R+b9VHJ83zTD3C8SH6rAfOf
 iFdXfA7wDIp0dsLyzJ3FGYz5s49aqYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-M0A0IdikPhiz2lmeUd2YbA-1; Fri, 27 Nov 2020 05:14:11 -0500
X-MC-Unique: M0A0IdikPhiz2lmeUd2YbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75C0980EF81;
 Fri, 27 Nov 2020 10:14:10 +0000 (UTC)
Received: from redhat.com (ovpn-113-125.ams2.redhat.com [10.36.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB4BA5D9CC;
 Fri, 27 Nov 2020 10:14:08 +0000 (UTC)
Date: Fri, 27 Nov 2020 10:14:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: ImageInfo oddities regarding compression
Message-ID: <20201127101405.GA1596141@redhat.com>
References: <87r1ofru4z.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87r1ofru4z.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Kevin Wolf <kwolf@redhat.com>, Denis Plotnikov <dplotnikov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 11:06:36AM +0100, Markus Armbruster wrote:
> ImageInfo has an optional member @compressed:
> 
>     ##
>     # @ImageInfo:
>     [...]
>     # @compressed: true if the image is compressed (Since 1.7)
> 
> Doc bug: neglects to specify the default.  I guess it's false.
> 
> The only user appears to be vmdk_get_extent_info().  Goes back to
> v1.7.0's commits
> 
>     f4c129a38a vmdk: Implment bdrv_get_specific_info
>     cbe82d7fb3 qapi: Add optional field 'compressed' to ImageInfo
> 
> ImageInfo also has an optional member @format-specific.
> 
> Doc bug: neglects to specify when it's present.  I assume it's always
> present when member @format has a value that has a non-empty variant in
> @format-specific's type ImageInfoSpecific.
> 
> Format qcow2's variant is ImageInfoSpecificQCow2.  It has a mandatory
> member @compression-type.
> 
>    ##
>    # @Qcow2CompressionType:
>    #
>    # Compression type used in qcow2 image file
>    #
>    # @zlib: zlib compression, see <http://zlib.net/>
>    # @zstd: zstd compression, see <http://github.com/facebook/zstd>
>    #
>    # Since: 5.1
>    ##
>    { 'enum': 'Qcow2CompressionType',
>      'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
> 
> Apparently, you can't have a qcow2 image without compression.  Correct?
> 
> Can you imagine a use case for "without compression"?

Yes & no. An image always has a compression type, either implicitly
zlib as the historical default, or explicitly as a type recorded in
the header.  This doesn't mean compression is used.

There may be zero or more clusters actually using compression.
Typically compression will never be used, but there's still an
associated compression type regardless.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


