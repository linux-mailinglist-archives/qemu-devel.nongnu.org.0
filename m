Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBEC507667
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 19:21:15 +0200 (CEST)
Received: from localhost ([::1]:36328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngrXO-0003LU-DQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 13:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngrVN-0002VJ-5l
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngrVK-0006CW-2f
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650388745;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdPO76rSvF1eRhkX/WKqkXxCiQQ2oHMtIlEpvuXLm7k=;
 b=b8/ZbIn+8EWq7ivhgFXFDkJa2DP0HAXmKIde9Q9baT7gS0iCSe2I008pwTjC1dgbqpLMPp
 46Qh4D6rVL2b5Uc0QlQhbnCujomr1BMPNxKBReychhlTv5w2qql/Pn3Edvx2lGu+a7FB1g
 5aUvzQMM30jACwo1PObw7vwgHoYKUpY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-pKyL-YcpNHGhl7fYbPvnkg-1; Tue, 19 Apr 2022 13:19:04 -0400
X-MC-Unique: pKyL-YcpNHGhl7fYbPvnkg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39E908041AD;
 Tue, 19 Apr 2022 17:18:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09C93455048;
 Tue, 19 Apr 2022 17:18:55 +0000 (UTC)
Date: Tue, 19 Apr 2022 18:18:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [RFC PATCH] python: add qmp-send program to send raw qmp
 commands to qemu
Message-ID: <Yl7u/ZnK2aJxiHVp@redhat.com>
References: <20220316095455.6473-1-damien.hedde@greensocs.com>
 <YjG68xzV/qrMnhEW@redhat.com> <878rskccjv.fsf@pond.sub.org>
 <86b617c6-2cec-8570-5947-7e584fb1214b@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <86b617c6-2cec-8570-5947-7e584fb1214b@greensocs.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 05, 2022 at 02:45:14PM +0200, Damien Hedde wrote:
> 
> 
> On 4/5/22 07:41, Markus Armbruster wrote:
> > Daniel P. Berrangé <berrange@redhat.com> writes:
> > 
> > > On Wed, Mar 16, 2022 at 10:54:55AM +0100, Damien Hedde wrote:
> > > > It takes an input file containing raw qmp commands (concatenated json
> > > > dicts) and send all commands one by one to a qmp server. When one
> > > > command fails, it exits.
> > > > 
> > > > As a convenience, it can also wrap the qemu process to avoid having
> > > > to start qemu in background. When wrapping qemu, the program returns
> > > > only when the qemu process terminates.
> > > > 
> > > > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > 
> > [...]
> > 
> > > > I name that qmp-send as Daniel proposed, maybe qmp-test matches better
> > > > what I'm doing there ?
> > > 
> > > 'qmp-test' is a use case specific name. I think it is better to
> > > name it based on functionality provided rather than anticipated
> > > use case, since use cases evolve over time, hence 'qmp-send'.
> > 
> > Well, it doesn't just send, it also receives.
> > 
> > qmpcat, like netcat and socat?
> > 
> 
> anyone against qmpcat ?

Fine with me[1], though I would have slight preference for 'qmp-cat'
to have a common tab-completion prefix with existing qmp-shell command.

With regards,
Daniel

[1] Especially if it displays a pretty ascii art cat when you pass
    the --help flag ;-P
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


