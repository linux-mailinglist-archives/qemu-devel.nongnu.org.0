Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86782937E7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 11:20:57 +0200 (CEST)
Received: from localhost ([::1]:50990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUnpA-0008AF-T4
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 05:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUnoI-0007Qr-PK
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 05:20:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUnoG-0000VI-Uz
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 05:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603185599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iTDxXjmmV9SBNQKIIY6Zo0fewLiMnTymBrXdAn8UZNc=;
 b=DF5bqZOQvO1IDa/NyAsdX/3PvugPYDS+0h2mX+xmI+GMjGefiZRHvHu/FGkhS+h0Y6oOPo
 /4VW2gIrXSl1YQMn9x/Fu9NoTZQATVDfLZSKQ6CwRskbM9DzUw5K5VGmB5LNoa2VBwulDK
 2bzfQF5cXzJLqDkMMrZqP6BvDZ1/kzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-SylAEMSWPw2kby1QamkCUw-1; Tue, 20 Oct 2020 05:19:56 -0400
X-MC-Unique: SylAEMSWPw2kby1QamkCUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE7A418BE163;
 Tue, 20 Oct 2020 09:19:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C0D25D9F3;
 Tue, 20 Oct 2020 09:19:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ED5571132A08; Tue, 20 Oct 2020 11:19:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH] trace/simple: Enable tracing on startup only if the
 user specifies a trace option
References: <20200816174610.20253-1-josh@joshdubois.com>
 <20200911100805.GB81586@stefanha-x1.localdomain>
 <87lfgt3u0i.fsf@dusky.pond.sub.org>
Date: Tue, 20 Oct 2020 11:19:52 +0200
In-Reply-To: <87lfgt3u0i.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 29 Sep 2020 09:46:21 +0200")
Message-ID: <87blgxfe4n.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, duboisj@gmail.com, qemu-devel@nongnu.org,
 Josh DuBois <josh@joshdubois.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
>> On Sun, Aug 16, 2020 at 12:46:10PM -0500, duboisj@gmail.com wrote:
>>> From: Josh DuBois <josh@joshdubois.com>
>>> 
>>> Tracing can be enabled at the command line or via the
>>> monitor. Command-line trace options are recorded during
>>> trace_opt_parse(), but tracing is not enabled until the various
>>> front-ends later call trace_init_file(). If the user passes a trace
>>> option on the command-line, remember that and enable tracing during
>>> trace_init_file().  Otherwise, trace_init_file() should record the
>>> trace file specified by the frontend and avoid enabling traces
>>> until the user requests them via the monitor.
>>> 
>>> This fixes 1b7157be3a8c4300fc8044d40f4b2e64a152a1b4 and also
>>> db25d56c014aa1a96319c663e0a60346a223b31e, by allowing the user
>>> to enable traces on the command line and also avoiding
>>> unwanted trace-<pid> files when the user has not asked for them.
>>> 
>>> Fixes: 1b7157be3a8c4300fc8044d40f4b2e64a152a1b4
>>> Signed-off-by: Josh DuBois <josh@joshdubois.com>
>>> ---
>>>  trace/control.c | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> Thanks, applied to my tracing-next tree:
>> https://github.com/stefanha/qemu/commits/tracing-next
>>
>> Stefan
>
> Pull request?

Pretty-please?


