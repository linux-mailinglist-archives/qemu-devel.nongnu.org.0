Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2608690E81
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:40:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9x6-0002MY-Pk; Thu, 09 Feb 2023 11:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ9x2-0002Jw-Mt
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:39:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ9wy-0007bV-Oi
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675960747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tGUOMOSOfeVCgEu0M+cJ21poC7iPWYooxeJpxksf0e0=;
 b=I5IDv25/S6D4MDpy5hPKLeAoNz/H8q6bpGy6EhkpxzuQmMORPayYCjz9tXS2Is52T2tyMr
 dTgPzAoaVU4GroVhdOzLAufIzelFtVzn0shHVbxlqi6bnOzvQySFvZ3t17FFdPVXW628uf
 1h0StpEEmu3SfM/ZlrTYagmM3QvTbMs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-jImsmSRnP8SB_JvP1j3t6A-1; Thu, 09 Feb 2023 11:39:02 -0500
X-MC-Unique: jImsmSRnP8SB_JvP1j3t6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DB381C08973;
 Thu,  9 Feb 2023 16:39:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F4718EC1;
 Thu,  9 Feb 2023 16:39:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EDDCA21E6A1F; Thu,  9 Feb 2023 17:39:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Michael Roth
 <michael.roth@amd.com>
Subject: Re: [PATCH V2 0/4] string list functions
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <878rh76to0.fsf@pond.sub.org>
 <1e8000c0-a8b0-ec5d-9bb0-f1f00a03d597@oracle.com>
Date: Thu, 09 Feb 2023 17:39:00 +0100
In-Reply-To: <1e8000c0-a8b0-ec5d-9bb0-f1f00a03d597@oracle.com> (Steven
 Sistare's message of "Thu, 9 Feb 2023 09:42:08 -0500")
Message-ID: <87cz6i23q3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Steven Sistare <steven.sistare@oracle.com> writes:

> On 2/9/2023 5:05 AM, Markus Armbruster wrote:
>> Steve Sistare <steven.sistare@oracle.com> writes:
>> 
>>> Add some handy string list functions, for general use now, and for
>>> eventual use in the cpr/live update patches.
>> 
>> Submit them together with uses, please.
>
> Are you OK with me describing my intended uses in the commit message?  Or are you 
> suggesting I go back to submitting these in the larger live update series?

The patches will be merged only together with actual uses.  Posting them
separately may make sense or not; use your judgement.  If you elect to
post separately, have the cover letters point to each other, please.


