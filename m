Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4BD406C89
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:55:33 +0200 (CEST)
Received: from localhost ([::1]:58270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOg44-0006rE-Oa
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOfvy-0006e5-PT
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:47:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOfvw-00070b-6z
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631278027;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+yvsMBm+onPevTFHQMyBNn2F1gMnjnBfGqPcoeUVyzY=;
 b=UsEnTLQVwP6xKhWBfoI2zpqJ4uysaui/4+PVqj1MAngLPup5chGC3vJW12YttdoDbp3ein
 XNRkHT7mI6MTZdjzC6LgCICg6HbBFDOvaR7fmvZpgeJQ5kMm/pBxOcLBEUyPJeYwpW9PF9
 tTKslvg/gkg7AupUV3ruQ+iWfAOJcwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-qiEApkVPPZ2aMgZUc-Aj1g-1; Fri, 10 Sep 2021 08:47:03 -0400
X-MC-Unique: qiEApkVPPZ2aMgZUc-Aj1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3CA5835DEE;
 Fri, 10 Sep 2021 12:47:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C53A5C1A1;
 Fri, 10 Sep 2021 12:47:01 +0000 (UTC)
Date: Fri, 10 Sep 2021 13:46:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/5] docs/devel: document expectations for QAPI data
 modelling for QMP
Message-ID: <YTtTwwXjG9/u653o@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-2-berrange@redhat.com>
 <87tuium6u7.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87tuium6u7.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 11:33:20AM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > Traditionally we have required that newly added QMP commands will model
> > any returned data using fine grained QAPI types. This is good for
> > commands that are intended to be consumed by machines, where clear data
> > representation is very important. Commands that don't satisfy this have
> > generally been added to HMP only.
> >
> > In effect the decision of whether to add a new command to QMP vs HMP has
> > been used as a proxy for the decision of whether the cost of designing a
> > fine grained QAPI type is justified by the potential benefits.
> >
> > As a result the commands present in QMP and HMP are non-overlapping
> > sets, although HMP comamnds can be accessed indirectly via the QMP
> > command 'human-monitor-command'.
> >
> > One of the downsides of 'human-monitor-command' is that the QEMU monitor
> > APIs remain tied into various internal parts of the QEMU code. For
> > example any exclusively HMP command will need to use 'monitor_printf'
> > to get data out. It would be desirable to be able to fully isolate the
> > monitor implementation from QEMU internals, however, this is only
> > possible if all commands are exclusively based on QAPI with direct
> > QMP exposure.
> >
> > The way to achieve this desired end goal is to finese the requirements
> > for QMP command design. For cases where the output of a command is only
> > intended for human consumption, it is reasonable to want to simplify
> > the implementation by returning a plain string containing formatted
> > data instead of designing a fine grained QAPI data type. This can be
> > permitted if-and-only-if the command is exposed under the 'x-' name
> > prefix. This indicates that the command data format is liable to
> > future change and that it is not following QAPI design best practice.
> >
> > The poster child example for this would be the 'info registers' HMP
> > command which returns printf formatted data representing CPU state.
> > This information varies enourmously across target architectures and
> > changes relatively frequently as new CPU features are implemented.
> > It is there as debugging data for human operators, and any machine
> > usage would treat it as an opaque blob. It is thus reasonable to
> > expose this in QMP as 'x-query-registers' returning a 'str' field.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  docs/devel/writing-qmp-commands.rst | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)


> > +QAPI types. As a general guide, a caller of the QMP command should never need
> > +to parse individual returned data fields. If a field appears to need parsing,
> > +them it should be split into separate fields corresponding to each distinct
> > +data item. This should be the common case for any new QMP command that is
> > +intended to be used by machines, as opposed to exclusively human operators.
> > +
> > +Some QMP commands, however, are only intended as adhoc debugging aids for human
> > +operators. While they may return large amounts of formatted data, it is not
> > +expected that machines will need to parse the result. The overhead of defining
> > +a fine grained QAPI type for the data may not be justified by the potential
> > +benefit. In such cases, it is permitted to have a command return a simple string
> 
> There are many existing long lines in this file, so I'm not flagging
> yours, except for this one, because it increases the maximum.

This line is at exactly 80 characters so checkstyle is happy with it.
We don't have any requirement for a differenet line limit for docs
afair ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


