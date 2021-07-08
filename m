Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF323C1A10
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:46:56 +0200 (CEST)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Zz5-0003JJ-Vn
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1ZSD-0001RW-Md
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1ZSB-0006AH-Up
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625771575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v1jXSorm0UjujIuz7AUwE8P0aBQAlAf0AG0OSR/uZjQ=;
 b=as0xz+4lqKdiDpXPSHbeUUc9JYrpZVs3cGRS5H0BTxS4/u4HG9omFPCgtLHUiQF+3LCZ8B
 4BAzv6HJYiBcNgl929bfHZbnJxpIyNmJoB1kFCf/OK8EGIM8sFBM+e+cha5RME53JwYtEI
 16knPujxDXWoU6eN749ZCaU7gCwwMs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-kw6uz13bOmudKwI294Y2Rw-1; Thu, 08 Jul 2021 15:12:53 -0400
X-MC-Unique: kw6uz13bOmudKwI294Y2Rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1A6ABBEE0;
 Thu,  8 Jul 2021 19:12:52 +0000 (UTC)
Received: from [10.10.115.15] (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F93960C13;
 Thu,  8 Jul 2021 19:12:52 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
Subject: configure --without-default-features confusion
To: qemu-devel <qemu-devel@nongnu.org>
Message-ID: <d7cb1c8f-036d-1be8-e259-cd71ce8a1649@redhat.com>
Date: Thu, 8 Jul 2021 15:12:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

I'm a bit confused about the intended scope of ./configure
--without-default-features. When I try it here there's still lots of
stuff enabled:

$ ./configure --without-default-features
    ...
    VNC support                  : YES
    VNC SASL support             : YES
    VNC JPEG support             : YES
    VNC PNG support              : YES
    brlapi support               : YES
    vde support                  : NO
    netmap support               : NO
    Linux AIO support            : NO
    Linux io_uring support       : YES
    ATTR/XATTR support           : YES
    RDMA support                 : NO
    PVRDMA support               : NO
    ...

So rdma/pvrdma, which I have libs for, are disabled, but brlapi, which I
have libs for, is auto enabled. VNC is not dependent on any external
libraries, but it's still enabled. Etc.

...okay now that I poke at this a bit, the brlapi bit and most (but not
all) other features are disabled if I fix this:

> diff --git a/configure b/configure
> index 650d9c0735..a71ebe10ff 100755
> --- a/configure
> +++ b/configure
> @@ -5189,7 +5189,7 @@ if test "$skip_meson" = no; then
>          -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>          -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
>          -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
> -        $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
> +        $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
>         -Dtcg_interpreter=$tcg_interpreter \
>          $cross_arg \
>          "$PWD" "$source_path"

But there's still a handful of things that are left enabled, for example
 VNC, xen, vhost-vdpa, ...

Is the intention for this knob to be a 'disable everything'? If so maybe
it should be renamed to --disable-everything to make it less ambiguous,
and make it trigger every single --disable-XXX knob. That would be
useful for Fedora + RHEL qemu building where we enumerate every
--disable-XXX knob already, then build the configure invocation back up
with everything we explicitly want to --enable.

There would need to be some extra work done like adding --enable-XXX
counterparts for things that lack them, like --enable-blobs. Also it's
unclear if we would want it to trigger stuff like --disable-strip,
--disable-werror, etc

Thanks,
Cole


