Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA7C6BE0B7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 06:44:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd2rm-0007tJ-9Z; Fri, 17 Mar 2023 01:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pd2ri-0007rf-GE
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 01:42:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pd2rd-0003kd-Qi
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 01:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679031771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8gNOFGUVHIOyg0YDBURKBxJn73WVEpaPwkanwPkatvg=;
 b=LD7fBkW+1Bx+oeMxziFX9pxW3aME/bSiA1b+/+owh8sWMeypCiuCrMgC74ey5Esyttf5Az
 REPPi72BAdnoW8CPZmMQIxIvGuCso9UBvoyNkrhw8dpigdLelp/+oKJA/u3xrl2ukGhpeQ
 8QH1r4H0mBZUUTPP9l5pVR3jkX1Jkm8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-AfadZAACMGaGGw6ZrTkvIA-1; Fri, 17 Mar 2023 01:42:47 -0400
X-MC-Unique: AfadZAACMGaGGw6ZrTkvIA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42B5138173D3;
 Fri, 17 Mar 2023 05:42:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D5EB492B00;
 Fri, 17 Mar 2023 05:42:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F1A321E6806; Fri, 17 Mar 2023 06:42:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,
 marcandre.lureau@redhat.com,  berrange@redhat.com,  jsnow@redhat.com
Subject: Re: [PATCH 06/14] qapi: Simplify code a bit after previous commit
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-7-armbru@redhat.com>
 <20230317005556.oy5shte5zm7zrvjq@redhat.com>
Date: Fri, 17 Mar 2023 06:42:46 +0100
In-Reply-To: <20230317005556.oy5shte5zm7zrvjq@redhat.com> (Eric Blake's
 message of "Thu, 16 Mar 2023 19:55:56 -0500")
Message-ID: <87y1nwndbd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Eric Blake <eblake@redhat.com> writes:

> On Thu, Mar 16, 2023 at 08:13:17AM +0100, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Looks like 'previous commit' in the subject line actually means 4/14
> (two commits ago); a victim of rebasing, I'm sure.

Hmm, actually both commits matter.

The first hunk simplifies check_type_name() by contracting its two
conditionals.  It is enabled by the previous commit, which removed the
code between the two conditionals.

The second hunk simplifies check_type_name_or_array() the same way, but
that one has had nothing in between since PATCH 04.

I'll change the title to "after previous commits".

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


