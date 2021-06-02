Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AB73994D0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 22:48:43 +0200 (CEST)
Received: from localhost ([::1]:44112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loXn8-0005A1-Gv
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 16:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1loXku-00033H-6Y
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 16:46:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1loXkr-0003UH-Kn
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 16:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622666781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D8fWrgOG9Hk0hqlNjfFvw8chC1CGhtL7stGkspHEUqA=;
 b=RIxIPmydU5JzA7w3Yhpz8Bqb0gihIhvPQhPewP2oF/CalPjA3XIBTC0The8fZHxLhouI+V
 s+wTVLDPBvgC1fJOhGZhLwAefxi0mK1UWyOW6tbuHi0lOD68WpeSFAoHJi8UqXxTDmSZnB
 //zYFGVDP9XSbYAy0LnrWdqV9Zoxl1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-eBIpqtchNV6_iFBoQ3F1-g-1; Wed, 02 Jun 2021 16:46:08 -0400
X-MC-Unique: eBIpqtchNV6_iFBoQ3F1-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 774D71020C36;
 Wed,  2 Jun 2021 20:46:07 +0000 (UTC)
Received: from localhost (ovpn-119-154.rdu2.redhat.com [10.10.119.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F2835E272;
 Wed,  2 Jun 2021 20:46:05 +0000 (UTC)
Date: Wed, 2 Jun 2021 10:22:12 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] target/i386/sev: Ensure sev_fw_errlist is sync with
 update-linux-headers
Message-ID: <20210602142212.siv7c33hsxiik36y@habkost.net>
References: <20210219180131.2061072-1-philmd@redhat.com>
 <665ebe97-fbe2-2273-0a02-1a94351c1e1c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <665ebe97-fbe2-2273-0a02-1a94351c1e1c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIMWL_WL_HIGH=-0.371, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 02, 2021 at 12:48:18PM +0200, Philippe Mathieu-Daudé wrote:
> This patch was supposed to go via Eduardo's tree but he
> missed it, can it go via qemu-trivial instead?

My apologies, again.  I'm still behind on my qemu-devel backlog,
and this was still buried in my inbox.

> 
> On 2/19/21 7:01 PM, Philippe Mathieu-Daudé wrote:
> > Ensure sev_fw_errlist[] is updated after running
> > the update-linux-headers.sh script.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> > Based-on: <20210218151633.215374-1-ckuehl@redhat.com>
> > ---
> >  target/i386/sev.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/target/i386/sev.c b/target/i386/sev.c
> > index 37690ae809c..92c69a23769 100644
> > --- a/target/i386/sev.c
> > +++ b/target/i386/sev.c
> > @@ -87,7 +87,7 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
> >  static SevGuestState *sev_guest;
> >  static Error *sev_mig_blocker;
> >  
> > -static const char *const sev_fw_errlist[] = {
> > +static const char *const sev_fw_errlist[SEV_RET_MAX] = {
> >      [SEV_RET_SUCCESS]                = "",
> >      [SEV_RET_INVALID_PLATFORM_STATE] = "Platform state is invalid",
> >      [SEV_RET_INVALID_GUEST_STATE]    = "Guest state is invalid",
> > @@ -114,6 +114,8 @@ static const char *const sev_fw_errlist[] = {
> >      [SEV_RET_RESOURCE_LIMIT]         = "Required firmware resource depleted",
> >      [SEV_RET_SECURE_DATA_INVALID]    = "Part-specific integrity check failure",
> >  };
> > +/* Ensure sev_fw_errlist[] is updated after running update-linux-headers.sh */
> > +QEMU_BUILD_BUG_ON(SEV_RET_SECURE_DATA_INVALID + 1 != SEV_RET_MAX);

A mechanism to notify us when sev_fw_errlist needs to be updated
would be useful, but I'm not sure I agree with this change.
I expect update-linux-headers patches always consist of 100%
automated changes.  This patch would require a manual update of
target/i386/sev.c to be included in the same commit as
the header update.


> >  
> >  #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
> >  
> > @@ -160,6 +162,7 @@ fw_error_to_str(int code)
> >      if (code < 0 || code >= SEV_FW_MAX_ERROR) {
> >          return "unknown error";
> >      }
> > +    assert(sev_fw_errlist[code]);
> >  
> >      return sev_fw_errlist[code];
> >  }
> > 
> 

-- 
Eduardo


