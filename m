Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDB8420946
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:21:28 +0200 (CEST)
Received: from localhost ([::1]:42748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXL67-0006Aa-GR
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mXKku-0006Z9-37
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mXKks-0000Ut-GL
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633341569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y3Lrx++NMqiTtH7swrKlBsXj5VZXmlOsy35teo6fpfM=;
 b=IhJvNbfcbxVFZhMcxmu5uAsRrmKLLO9jjJsi8/xRm4I1mHGIni/FfsOUNBio0S0RsTN5OY
 A6T/OkFJgrwTYxLXxy/68j79fPqFkIPCvRzCPGnxQw40EFqAglQQ4tDwCEsGTRmnMTwECM
 gjo7f0UY96BIbc2E+d1DASQ7AXjkQYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-IjsoYyLVPOyUPCMMxk1x4A-1; Mon, 04 Oct 2021 05:59:18 -0400
X-MC-Unique: IjsoYyLVPOyUPCMMxk1x4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C3B1802E3D;
 Mon,  4 Oct 2021 09:59:18 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C60960871;
 Mon,  4 Oct 2021 09:59:13 +0000 (UTC)
Date: Mon, 4 Oct 2021 10:59:12 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <20211004095912.GP7596@redhat.com>
References: <cover.1632900578.git.mprivozn@redhat.com>
 <20210929092044.GE3361@redhat.com> <YVQy9yiU1RPxCcM8@redhat.com>
 <20210929095719.GH3361@redhat.com> <YVQ7my3BHi1On/JK@redhat.com>
 <20210929103400.GJ3361@redhat.com>
 <20210930073348.GL7596@redhat.com> <YVV5hZmEs2NmbiiI@redhat.com>
 <20210930091620.GX3361@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930091620.GX3361@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
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
Cc: libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>,
 qemu-devel@nongnu.org, armbru@redhat.com, acatan@amazon.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It turns out that changing the qemu implementation is painful,
particularly if we wish to maintain backwards compatibility of the
command line and live migration.

Instead I opted to document comprehensively what all the
different hypervisors do:

  https://github.com/libguestfs/virt-v2v/blob/master/docs/vm-generation-id-across-hypervisors.txt

On Thu, Sep 30, 2021 at 10:16:20AM +0100, Richard W.M. Jones wrote:
> I was going to suggest something like:
> 
>   <genid type="guid">aa-bb-cc..</genid>
> or
>   <genid type="binary">aabbcc..</genid>

After thinking about this some more, the real implementation on
Windows guest and host is two 64 bit little-endian integers[1].  How
about implementing this exactly the same way as Hyper-V (and VMware):

  <genid type="pair">
    <low>0x8877665544332211</low>
    <high>0x00ffeeddccbbaa99</high>
  </genid>

This would have to be mapped to the following qemu command line:

  qemu -device vmgenid,guid=44332211-6655-8877-99aa-bbccddeeff00

which would unmangle to the following in guest physical memory:

  11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff 00

The equivalent back-compat option would be:

  <genid type="qemu">44332211-6655-8877-99aa-bbccddeeff00</genid>

Rich.

[1] No one has ever thought what to do about big-endian guests.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


