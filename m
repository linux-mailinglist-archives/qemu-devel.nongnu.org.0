Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D50F521178
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 11:53:02 +0200 (CEST)
Received: from localhost ([::1]:56020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMY9-0005D5-9j
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 05:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noM0b-0000n7-Ku
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:18:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noM0Y-0007la-5p
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652174297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVI5LlfklN69Vdy6O9YmXO9S5M2NC980BJVJ6hpa2YM=;
 b=NU57HlMPBlBgOhuOKWY9pL8SnBDUedcPztLJ+jvD2ro8E5oQoNKIodILCw/S0dWtakrFcB
 WmSc8zbMcDp0BV/AWKuRM74X9HAUMm007XMCksPXVMBi5qz4GaBtq9GgptbxXzhi2SzUiV
 9DSzXCen4ZNBWD+HNYVDAQ+wnYrbLRY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-i0OFzXNOMhydZiw5XzPUAA-1; Tue, 10 May 2022 05:18:16 -0400
X-MC-Unique: i0OFzXNOMhydZiw5XzPUAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66B3E29324B3
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 09:18:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB3F8111E411;
 Tue, 10 May 2022 09:17:49 +0000 (UTC)
Date: Tue, 10 May 2022 10:17:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <Ynotu3ivXbZldduB@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <20220510090604.ovqqybzyo6cebev7@tapioca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510090604.ovqqybzyo6cebev7@tapioca>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 10, 2022 at 11:06:39AM +0200, Victor Toso wrote:
> Hi,
> 
> On Tue, May 10, 2022 at 09:53:05AM +0100, Daniel P. Berrangé wrote:
> > > > * License
> > > >
> > > > While the generator (golang.py in this series) is GPL v2, the
> > > 
> > > I'd make it v2+, just to express my displeasure with the decision to
> > > make the initial QAPI generator v2 only for no good reason at all.
> > 
> > Our policy is that all new code should be v2+ anyway, unless it
> > was clearly derived from some pre-existing v2-only code. Upto
> > Victor to say whether the golang.py is considered clean, or was
> > copy+paste in any parts from existin v2-only code
> 
> Should be fine to consider it v2+, the generator.
> 
> > > > generated code needs to be compatible with other Golang projects,
> > > > such as the ones mentioned above. My intention is to keep a Go
> > > > module with a MIT license.
> > >
> > > Meh.  Can't be helped, I guess.
> > 
> > This does make me wonder though whether the license of the QAPI
> > input files has a bearing on the Go (or other $LANGUAGE) ouput
> > files. eg is the Go code to be considered a derived work of the
> > QAPI JSON files.
> 
> GPL does not enforce that the generated code to be GPL [0] unless
> the generator copies GPL code to the output. My only concern has
> been the fact that I am copying the documentation of QAPI
> specification to the Go package in order to have data structures,
> commands, etc. with the information provided by the
> specification.
> 
> [0] https://www.gnu.org/licenses/old-licenses/gpl-2.0-faq.html#GPLOutput
>
> > I'm not finding a clearly articulated POV on this question so
> > far.
> 
> I don't find it trivial either but I've accepted that the Go data
> structures are fine based on [0] and the documentation can be
> split from the Go module (sadly!) if someone finds it to be a
> legal issue.

Ah well that link above is actually reasonably clear:

  "More generally, when a program translates its input into 
   some other form, the copyright status of the output inherits
   that of the input it was generated from. "

In our case the input is the QAPI JSON, and we're translating that
into  Golang. That could be read as meaning our Golang code has to
be GPLv2+ licensed just as with the QAPI, not merely the docs.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


