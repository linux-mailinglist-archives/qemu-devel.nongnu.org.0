Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD0C59542D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 09:55:46 +0200 (CEST)
Received: from localhost ([::1]:50820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNrQP-0005Cu-E4
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 03:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNrMH-00021T-Dp
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNrMC-00074i-9H
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660636282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wi92EZY9jg9rh2q80Y16v0X7KsXx8Mbl76/YZQ+a/So=;
 b=U89jgydIX5zuRLoJl5KuKT4/6unurGEzZkronpdtE0Z17DtM0Rq6rzEf9hD65gGm3ABHcj
 CN9cl+OKPfJe9SSfDQF0K2yNU5G7q5HFPASQ6Dsi+R3Gt+FSqKPsHVLYIpBL+51LDII4Fm
 vU30+0bT19dc5N4XMmHhVO7g5JMf+yw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-uxite054Ogmggdvwjd_VFw-1; Tue, 16 Aug 2022 03:51:21 -0400
X-MC-Unique: uxite054Ogmggdvwjd_VFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB81B805B9A
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 07:51:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 592294010D29;
 Tue, 16 Aug 2022 07:51:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8F02D18003A8; Tue, 16 Aug 2022 09:51:17 +0200 (CEST)
Date: Tue, 16 Aug 2022 09:51:17 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] RFC: char: deprecate usage of bidirectional pipe
Message-ID: <20220816075117.5h4aep7pslbieujd@sirius.home.kraxel.org>
References: <20220726083232.2567756-1-marcandre.lureau@redhat.com>
 <Yt+pabvylcNdh0wL@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yt+pabvylcNdh0wL@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 26, 2022 at 09:44:25AM +0100, Daniel P. Berrang� wrote:
> On Tue, Jul 26, 2022 at 12:32:32PM +0400, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr� Lureau <marcandre.lureau@redhat.com>
> > 
> > As Ed Swierk explained back in 2006:
> > https://lists.nongnu.org/archive/html/qemu-devel/2006-12/msg00160.html
> > 
> > "When qemu writes into the pipe, it immediately reads back what it just
> > wrote and treats it as a monitor command, endlessly breathing its own
> > exhaust."
> > 
> > This is similarly confusing when using the chardev with a serial device,
> > as reported in https://bugzilla.redhat.com/show_bug.cgi?id=2106975.
> > 
> > It seems we have kept the support for bidirectional pipes for historical
> > reasons and odd systems, however it's not documented in qemu -chardev
> > options. I suggest to stop supporting it, for portability reasons.
> 
> Hmm, I always assumed that in this scenario the pipe was operating
> in output-only mode. Obviously not the case with the code as it
> exists, but perhaps this would be useful ?  eg its good as a serial
> console logging mechanism at least.

Well, using ${file}.in and ${file}.out has the advantage that it works
fine with all qemu versions.  So adding a warning suggesting to use that
makes sense to me, especially as 7.1 fix.

When looking at longer-term improvements it is probably better to add
support for explicit in/out pipe names, i.e. input= and output=
parameters as suggested later in the thread.  Avoids needing to know
qemu internals (pipe naming convention) and allows to make the input
pipe optional for the logging use case.  That probably is something we
don't want rush into 7.1 though ...

take care,
  Gerd


