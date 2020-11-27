Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7C62C6282
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 11:08:00 +0100 (CET)
Received: from localhost ([::1]:42152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiafW-0004wP-Pp
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 05:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kiaeO-0004Q6-Tp
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:06:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kiaeK-0002fG-Ne
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606471603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=OeiOePxDH8XgJODFzYqYQRc7X41EcvLOnxyuX1Qlquc=;
 b=KqdUidqyYFukhM9uT61+lVNdc6oL57fjEHNSKXXwryWMsS1K7s2dYTURKJJvG7HFERqdrD
 WpPEt+Yept7TvqsETtuh8wC/R3rbF9qkesV02rWHWRJzvT3yxe+L6Fa+KhEELFl2QvFYP8
 P7xoLioF5MJcJRPbklc9mDG23eAwv9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-g5yzwLwrPwGWYX4iBj57zA-1; Fri, 27 Nov 2020 05:06:39 -0500
X-MC-Unique: g5yzwLwrPwGWYX4iBj57zA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84CEE18C89DA;
 Fri, 27 Nov 2020 10:06:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55FC76085D;
 Fri, 27 Nov 2020 10:06:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E197F113864E; Fri, 27 Nov 2020 11:06:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, Denis
 Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: ImageInfo oddities regarding compression
Date: Fri, 27 Nov 2020 11:06:36 +0100
Message-ID: <87r1ofru4z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ImageInfo has an optional member @compressed:

    ##
    # @ImageInfo:
    [...]
    # @compressed: true if the image is compressed (Since 1.7)

Doc bug: neglects to specify the default.  I guess it's false.

The only user appears to be vmdk_get_extent_info().  Goes back to
v1.7.0's commits

    f4c129a38a vmdk: Implment bdrv_get_specific_info
    cbe82d7fb3 qapi: Add optional field 'compressed' to ImageInfo

ImageInfo also has an optional member @format-specific.

Doc bug: neglects to specify when it's present.  I assume it's always
present when member @format has a value that has a non-empty variant in
@format-specific's type ImageInfoSpecific.

Format qcow2's variant is ImageInfoSpecificQCow2.  It has a mandatory
member @compression-type.

   ##
   # @Qcow2CompressionType:
   #
   # Compression type used in qcow2 image file
   #
   # @zlib: zlib compression, see <http://zlib.net/>
   # @zstd: zstd compression, see <http://github.com/facebook/zstd>
   #
   # Since: 5.1
   ##
   { 'enum': 'Qcow2CompressionType',
     'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }

Apparently, you can't have a qcow2 image without compression.  Correct?

Can you imagine a use case for "without compression"?

I fell down this (thankfully shallow) rabbit hole because we also have

    { 'enum': 'MultiFDCompression',
      'data': [ 'none', 'zlib',
                { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }

I wonder whether we could merge them into a common type.


