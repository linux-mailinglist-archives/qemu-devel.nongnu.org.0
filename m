Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE933713A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:27:40 +0100 (CET)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJTf-0003VM-Ed
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lKJR5-0002Ul-HM
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:24:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lKJR1-0004Tz-W1
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615461895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xB/w/yQjxmCEbo7JSueDmKzA5KADNFQdkdtKd0QX2Sw=;
 b=Y2E8NLbBSL/fUi8og/pUMzsZ7/keTRLfM8+q1MiTVec22QPc9OkZI0tMHdBhifV0jXcLWl
 y5T4CMRTfIu9wZvlbrEBWO/mXTZEU72z15g0WtT6A4FJjVWEjdBv91qYNCvziYCwj2LD2x
 AUaKH0TsEZlraG6YlnPNeEFgpZD6kos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-trutu1E1NKCyK_Q179K2zg-1; Thu, 11 Mar 2021 06:24:52 -0500
X-MC-Unique: trutu1E1NKCyK_Q179K2zg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8815B57;
 Thu, 11 Mar 2021 11:24:51 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32FD5226E2;
 Thu, 11 Mar 2021 11:24:42 +0000 (UTC)
Date: Thu, 11 Mar 2021 12:24:39 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
Message-ID: <YEn997A568x3i743@angien.pipo.sk>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box>
 <YEnK9rgRRz+0qyGh@angien.pipo.sk>
 <20210311083711.GA9008@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210311083711.GA9008@merkur.fritz.box>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 09:37:11 +0100, Kevin Wolf wrote:
> Am 11.03.2021 um 08:47 hat Peter Krempa geschrieben:
> > On Wed, Mar 10, 2021 at 18:30:44 +0100, Kevin Wolf wrote:
> > > Am 10.03.2021 um 15:31 hat Paolo Bonzini geschrieben:
> > > > On 10/03/21 15:22, Peter Krempa wrote:

[...]

> > -object memory-backend-ram,id=ram-node2,size=24578621440,host-nodes=1-2,host-nodes=5,host-nodes=7,policy=bind
> 
> Oh, we have ranges, too... That makes the compatibility code even
> nastier to write. I doubt that we can implement this in the keyval
> parser alone without touching the visitor. :-/
> 
> > If any of the above is to be deprecated we'll need to adjust our
> > JSON->commandline generator accordignly.
> > 
> > Luckily the 'host-nodes' is storeable as a bitmap and the generator is
> > actually modular to allow plugging an array interpretor which actually
> > does the above conversion from a JSON array.
> > 
> > So, what is the preferred syntax here? Additionally we might need a
> > witness property to detect when to use the new syntax if basing it on
> > the object-add qapification will not be enough.
> 
> The list syntax supported by the keyval parser is the one you know from
> -blockdev: host-nodes.0=3,host-nodes.1=7, ...

I think that should be easy enough to convert to. Is it safe to do right
away (with the old parser?). Otherwise we need to agree on something
which will let us detect when it's safe to change.


