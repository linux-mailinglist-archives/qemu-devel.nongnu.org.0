Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197E12B1B4B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 13:44:38 +0100 (CET)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYRQ-0007OP-Ss
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 07:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdYQ9-0006nA-Tz
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:43:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdYQ5-0006lP-K1
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605271392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B40SS7v0FVWLpsPhvAJwTjbt2kFWGBqEkJ1Lk9Fur1Q=;
 b=dl+v3jVbTpsrHbcgN6FEgMfdhWFt+vrAhZjoJwCbJTJUVYB7NGx3nbc8LbVMr/tPymSWLT
 A+/f5ADwiV66CM5UUg0ajoGLlTnaY7FeamBXu3IZ9LmJTX6nwfUiNhsIoBiobmhcMIzYEk
 S93xp7/mU/3FFiBNycFPylnVqj0gTXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-5zMZPoSpOeW81WPWUx3mYw-1; Fri, 13 Nov 2020 07:43:10 -0500
X-MC-Unique: 5zMZPoSpOeW81WPWUx3mYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D332F1899423;
 Fri, 13 Nov 2020 12:43:08 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EDDF5C1C2;
 Fri, 13 Nov 2020 12:43:07 +0000 (UTC)
Date: Fri, 13 Nov 2020 13:43:05 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-5.2 0/3] hmp: Fix arg evaluation crash (regression)
Message-ID: <20201113124305.GD5834@merkur.fritz.box>
References: <20201113114326.97663-1-kwolf@redhat.com>
 <20201113121311.GI3251@work-vm>
MIME-Version: 1.0
In-Reply-To: <20201113121311.GI3251@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: thuth@redhat.com, lichun@ruijie.com.cn, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.11.2020 um 13:13 hat Dr. David Alan Gilbert geschrieben:
> * Kevin Wolf (kwolf@redhat.com) wrote:
> > When I restricted the section where the current monitor is set to only
> > the command handler, I missed that monitor_parse_arguments() can use it
> > indirectly, too, when evaluating register variables. These cases get
> > NULL now and crash (easy to reproduce with "x $pc").
> > 
> > This series passes the right monitor object down instead of using
> > monitor_cur(), which fixes the crash.
> 
> Why didn't the test-hmp.c find this?  It has a 'p $pc + 8'

Good question, a manual 'p $pc + 8' crashes for me on master.

Aha, it doesn't use a real HMP monitor, but QMP human-monitor-command.
Then it would just get the wrong monitor (the QMP one instead of the
temporary HMP monitor) and not NULL. The accessed CPU is even the same
because neither QMP nor the temporary HMP monitor have a current CPU
set, so even if the test case did check the result, it wouldn't catch
this.

Only if the test case were using multiple CPUs and cpu-index had been
set for human-monitor-command (to something other than the default), we
would get a wrong result. But of course, it still wouldn't crash.

Kevin


