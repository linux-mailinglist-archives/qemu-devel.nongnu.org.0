Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3252C5DA0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 22:50:01 +0100 (CET)
Received: from localhost ([::1]:55480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiP9M-0001Cu-Ra
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 16:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiP7y-0000LE-0G
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 16:48:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiP7u-00056A-10
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 16:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606427307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ILR0ZaTx5mpfsZHHqwJA193TbRWATvjIepa9NXwM4x4=;
 b=YiTTrp1yyLox4uBDr1SzBmVLn/qIZJYCDhhaePpYqTKTxkVV8XGISkCRowSAqu/AHKYyzt
 ZIoNIR11rfwE7E8XaZnAzhDDoX7VvSrOjQPA2tYYAYb/WskmeKJ7A+37rdAKc3/B7L0xd+
 gB+6ahV25yT8pEAhar81eTb1mklQ0fQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-sH2MNn6qN3S_Cv9zNi7i4A-1; Thu, 26 Nov 2020 16:48:26 -0500
X-MC-Unique: sH2MNn6qN3S_Cv9zNi7i4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B24DE10073AB;
 Thu, 26 Nov 2020 21:48:24 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 416B65D752;
 Thu, 26 Nov 2020 21:48:11 +0000 (UTC)
Date: Thu, 26 Nov 2020 16:48:10 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2 2/6] accel: accel_available() function
Message-ID: <20201126214810.GR2271382@habkost.net>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-3-ehabkost@redhat.com>
 <12f82771-9db9-8fcd-ea25-736428d2650a@suse.de>
 <20201126133645.GG2271382@habkost.net>
 <8d90d611-6545-a478-1316-542dc5424b92@suse.de>
 <f4f64154-9fbb-36fa-d9cb-e49c8ed06537@redhat.com>
 <7df7713c-5125-9e41-3572-a476cad2946b@suse.de>
MIME-Version: 1.0
In-Reply-To: <7df7713c-5125-9e41-3572-a476cad2946b@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 10:06:03PM +0100, Claudio Fontana wrote:
> On 11/26/20 3:25 PM, Paolo Bonzini wrote:
> > On 26/11/20 15:13, Claudio Fontana wrote:
> >> One option I see is simply to document the behavior where
> >> accel_available() is declared in accel.h (ie do not use in fast
> >> path), as well as in accel_find() actually, so that both accel_find()
> >> and accel_available() are avoided in fast path and avoid being called
> >> frequently at runtime.
> >>
> >> Another option could be to remove the allocation completely, and use
> >> for example accel_find(ACCEL_CLASS_NAME("tcg")), or another option
> >> again would be to remove the allocation and use either a fixed buffer
> >> + snprintf, or alloca -like builtin code to use the stack, ...
> >>
> >> Not a big deal, but with a general utility and short name like
> >> accel_available(name) it might be tempting to use this more in the
> >> future?
> > 
> > I think it's just that the usecase is not that common.  "Is this 
> > accelerator compiled in the binary" is not something you need after 
> > startup (or if querying the monitor).
> > 
> > Paolo
> > 
> > 
> 
> A script that repeatedly uses the QMP interface to query for
> the status could generate fragmentation this way I think.

Is this a problem?  Today, execution of a "query-kvm" command
calls g_malloc() 37 times.

-- 
Eduardo


