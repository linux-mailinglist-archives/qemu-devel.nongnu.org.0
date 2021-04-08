Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF9F35809B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:28:49 +0200 (CEST)
Received: from localhost ([::1]:45184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURu4-0007tW-63
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lURt4-0007C7-AB
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:27:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lURt0-0008HB-Av
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617877659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=giOGbbQZE2vk2OM99MrIexW9pQvFEOVKaAtrbIjJ3mc=;
 b=fJ4xjf/g5OuXCfzrZlnn640+KTpy4HKNUlg8LQCy217R3ok8m36jTkpkIhItXBg2MRJGEo
 bilRsuON9097LeGH8fX0RV3dt6mZtnxJXukL85zDBAV1J6aQOh+WoT64U7OGr+B8/bhiaJ
 kXffNqeamQ6+v1PMsyAScxmaQhrk9Hk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-wFfHSrGBMem6oYsRKa9sGA-1; Thu, 08 Apr 2021 06:27:36 -0400
X-MC-Unique: wFfHSrGBMem6oYsRKa9sGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20F49800D53;
 Thu,  8 Apr 2021 10:27:35 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-19.ams2.redhat.com [10.36.115.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ACFE10013D7;
 Thu,  8 Apr 2021 10:27:30 +0000 (UTC)
Date: Thu, 8 Apr 2021 12:27:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
Message-ID: <YG7akVvfY30Q7Cj1@merkur.fritz.box>
References: <20210322154024.15011-1-s.reiter@proxmox.com>
 <YG2xUD5M7RCuIe+X@merkur.fritz.box>
 <87lf9tces9.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87lf9tces9.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>,
 qemu-devel@nongnu.org, Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.04.2021 um 11:21 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 22.03.2021 um 16:40 hat Stefan Reiter geschrieben:
> >> The QMP dispatcher coroutine holds the qmp_queue_lock over a yield
> >> point, where it expects to be rescheduled from the main context. If a
> >> CHR_EVENT_CLOSED event is received just then, it can race and block the
> >> main thread on the mutex in monitor_qmp_cleanup_queue_and_resume.
> >> 
> >> monitor_resume does not need to be called from main context, so we can
> >> call it immediately after popping a request from the queue, which allows
> >> us to drop the qmp_queue_lock mutex before yielding.
> >> 
> >> Suggested-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
> >> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> >> ---
> >> v2:
> >> * different approach: move everything that needs the qmp_queue_lock mutex before
> >>   the yield point, instead of moving the event handling to a different context
> >
> > The interesting new case here seems to be that new requests could be
> > queued and the dispatcher coroutine could be kicked before yielding.
> > This is safe because &qmp_dispatcher_co_busy is accessed with atomics
> > on both sides.
> >
> > The important part is just that the first (conditional) yield stays
> > first, so that the aio_co_wake() in handle_qmp_command() won't reenter
> > the coroutine while it is expecting to be reentered from somewhere else.
> > This is still the case after the patch.
> >
> > Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> 
> Thanks for saving me from an ugly review headache.
> 
> Should this go into 6.0?

This is something that the responsible maintainer needs to decide.

If it helps you with the decision, and if I understand correctly, it is
a regression from 5.1, but was already broken in 5.2.

Kevin


