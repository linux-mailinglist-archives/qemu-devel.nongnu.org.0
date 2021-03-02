Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1E32966C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:35:49 +0100 (CET)
Received: from localhost ([::1]:43282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGydI-0002gI-Gs
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGybY-000272-Uv
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:34:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGybU-0000lU-Qn
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614666835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bSdHrBM9btsosNJ9OOMzn2BJfSGWVztz+uplvxYk5/U=;
 b=iaUKPWMAclgV7IqkIbBdRDr/hamp2+X37HCd/fWlwbAZayKAvd7AcwiWIj/pvomSRFPWFH
 N8ywBZ+U+ejJDE+D7XoR7DzNjiu7OHikIDMtpAbErWl1Lio43L7M9HAc8lSoWuI0vUxULO
 ap6OMoyQJjg3rVxiTeOLcm9p5fQFRFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-SBJLV3t1PIy96Bt_C52WSQ-1; Tue, 02 Mar 2021 01:33:52 -0500
X-MC-Unique: SBJLV3t1PIy96Bt_C52WSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5487801965;
 Tue,  2 Mar 2021 06:33:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B5BA10013C1;
 Tue,  2 Mar 2021 06:33:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0CC8D113860F; Tue,  2 Mar 2021 07:33:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 1/2] storage-daemon: report unexpected arguments on
 the fly
References: <20210301152844.291799-1-pbonzini@redhat.com>
 <20210301152844.291799-2-pbonzini@redhat.com>
 <b7b29e6a-4fe6-ab6a-87d9-e2e794b2b5d0@redhat.com>
Date: Tue, 02 Mar 2021 07:33:49 +0100
In-Reply-To: <b7b29e6a-4fe6-ab6a-87d9-e2e794b2b5d0@redhat.com> (Eric Blake's
 message of "Mon, 1 Mar 2021 09:38:11 -0600")
Message-ID: <87k0qqm5de.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/1/21 9:28 AM, Paolo Bonzini wrote:
>> If the first character of optstring is '-', then each nonoption argv
>> element is handled as if it were the argument of an option with character
>> code 1.  This removes the reordering of the argv array, and enables usage
>> of loc_set_cmdline to provide better error messages.
>> 
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  storage-daemon/qemu-storage-daemon.c | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> Nice.  The man page for 'getopt_long' is unclear whether setting
> POSIXLY_CORRECT in the environment would break this (that is, setting
> POSIXLY_CORRECT has the same effect as a leading '+'; but you can't have
> both leading '+' and leading '-' and when both are set, it is not clear
> which one wins).  But that's a corner case that I don't think will ever
> bite us in real life.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

I'd consider environment overruling the programmer's express intent a
bug.

GLibc's _getopt_initialize():

  /* Determine how to handle the ordering of options and nonoptions.  */
  if (optstring[0] == '-')
    {
      d->__ordering = RETURN_IN_ORDER;
      ++optstring;
    }
  else if (optstring[0] == '+')
    {
      d->__ordering = REQUIRE_ORDER;
      ++optstring;
    }
  else if (posixly_correct || !!getenv ("POSIXLY_CORRECT"))
    d->__ordering = REQUIRE_ORDER;
  else
    d->__ordering = PERMUTE;

No surprises here.


