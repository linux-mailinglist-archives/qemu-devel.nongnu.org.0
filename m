Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF09310915
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:31:34 +0100 (CET)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yOk-0004gP-23
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7yMM-0003gx-DV
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:29:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7yMI-0005cP-JK
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612520940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O5YFFsCbTzkG/E9DkGgKIKl5uxvikkrzrtXZFMa9hY4=;
 b=Z/kLXFL8jzi3AesMIYsEHGsXubZ48oIG2RrE/z6LXPE7Fm5zPZ7Ayh79pn3wHM8aBNFq44
 mPv7PPtPJhgkeVDw1R+Ed13jFz70OywnlS4W4Zjy4atTt4nncdnVPJqWUp2YFlinsTp7ph
 lJDpn7+Hj2D9ykh1ue5C1qygmYkMiR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-R09qnk2XPyiTzRUjSDWMbQ-1; Fri, 05 Feb 2021 05:28:07 -0500
X-MC-Unique: R09qnk2XPyiTzRUjSDWMbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 569ED1005501;
 Fri,  5 Feb 2021 10:28:06 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB54D722F3;
 Fri,  5 Feb 2021 10:28:05 +0000 (UTC)
Date: Fri, 5 Feb 2021 10:28:05 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
Message-ID: <20210205102805.GA30079@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210204190708.1306296-2-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 berrange@redhat.com, qemu-block@nongnu.org, tao3.xu@intel.com,
 qemu-devel@nongnu.org, armbru@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 01:07:06PM -0600, Eric Blake wrote:
> We have multiple clients of qemu_strtosz (qemu-io, the opts visitor,
> the keyval visitor), and it gets annoying that edge-case testing is
> impacted by implicit rounding to 53 bits of precision due to parsing
> with strtod().  As an example posted by Rich Jones:
>  $ nbdkit memory $(( 2**63 - 2**30 )) --run \
>    'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" '
>  write failed: Input/output error
> 
> because 9223372035781033472 got rounded to 0x7fffffffc0000000 which is
> out of bounds.
> 
> It is also worth noting that our existing parser, by virtue of using
> strtod(), accepts decimal AND hex numbers, even though test-cutils
> previously lacked any coverage of the latter.  We do have existing
> clients that expect a hex parse to work (for example, iotest 33 using
> qemu-io -c "write -P 0xa 0x200 0x400"), but strtod() parses "08" as 8
> rather than as an invalid octal number, so we know there are no
> clients that depend on octal.  Our use of strtod() also means that
> "0x1.8k" would actually parse as 1536 (the fraction is 8/16), rather
> than 1843 (if the fraction were 8/10); but as this was not covered in
> the testsuite, I have no qualms forbidding hex fractions as invalid,
> so this patch declares that the use of fractions is only supported
> with decimal input, and enhances the testsuite to document that.
> 
> Our previous use of strtod() meant that -1 parsed as a negative; now
> that we parse with strtoull(), negative values can wrap around module

^^ modulo

The patch looked fine to me although Vladimir found some problems
which I didn't spot.  I have a question: What happens with leading or
trailing whitespace?  Is that ignored, rejected or impossible?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


