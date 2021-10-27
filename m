Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE89D43C280
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:01:41 +0200 (CEST)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfc0L-0000hy-0y
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfbyB-0008Jw-Mq
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:59:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfby9-0003iY-Vq
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635314365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YqIG7OT4x5FAgX+vBdO0B/jKBn7EiB0zpJ5LEwRqUaA=;
 b=erJ31RhDHHtN6418kKkv2QNhvFMFhspKVgaylopR8Ntp7WVNw5cy3q33yP+StjS75X7hNT
 GOnw+A/xx6x4KsSfQsPWBzc7VWRQPX+TC7SK5zzgjeN2HLu6+FXt5lZo3SaIV8QQdC5e3m
 Y6bpVP50Qn8qUwyWM/rbiCMS6a14FBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-PeOG9t9BP8WfXjkGsP2BRA-1; Wed, 27 Oct 2021 01:59:21 -0400
X-MC-Unique: PeOG9t9BP8WfXjkGsP2BRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 828461B18BC0;
 Wed, 27 Oct 2021 05:59:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B39660862;
 Wed, 27 Oct 2021 05:59:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2DDD911380A7; Wed, 27 Oct 2021 07:59:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 9/9] qapi: Extend -compat to set policy for unstable
 interfaces
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-10-armbru@redhat.com>
 <YXhMzNHguAyUlRVR@work-vm>
Date: Wed, 27 Oct 2021 07:59:08 +0200
In-Reply-To: <YXhMzNHguAyUlRVR@work-vm> (David Alan Gilbert's message of "Tue, 
 26 Oct 2021 19:45:32 +0100")
Message-ID: <878ryfc8k3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> New option parameters unstable-input and unstable-output set policy
>> for unstable interfaces just like deprecated-input and
>> deprecated-output set policy for deprecated interfaces (see commit
>> 6dd75472d5 "qemu-options: New -compat to set policy for deprecated
>> interfaces").  This is intended for testing users of the management
>> interfaces.  It is experimental.
>
> So is there no way to mark the option as unstable?

The closest we have to marking command line options as unstable is
putting them under "Debug/Expert options" in -help.

For option *parameters*, we sometimes use the x- convention.

QAPIfication will give us better tools.


