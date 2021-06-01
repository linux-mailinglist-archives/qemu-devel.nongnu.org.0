Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE639746F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:36:53 +0200 (CEST)
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4Zg-00083m-BH
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo4XH-00055u-4q
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo4XE-0004iE-Ew
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622554458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s5BnUVJUREQAF3ygqKJiUIsj3UNH9ZT21LBJhvMbwvA=;
 b=e8z5nPVp6LFX8TGhIv/EK0T/HjntazGcDtTZ8TyJjVleLMi5UCnC0VqrbWRIJZsGzbumIJ
 hau8JfKEvyUJInRz9UB74i5fermlniv8CP/dwywQU+8EA5PAwgr9TDYJMdDu6a4cwhlYr9
 xK+AeeWOYCJPzw/c/UqNeWsaFb6wpIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-DRyoV5llNzGHklLRVGwNXw-1; Tue, 01 Jun 2021 09:34:16 -0400
X-MC-Unique: DRyoV5llNzGHklLRVGwNXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15B23BBEE8;
 Tue,  1 Jun 2021 13:34:15 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEB875D9CD;
 Tue,  1 Jun 2021 13:34:14 +0000 (UTC)
Date: Tue, 1 Jun 2021 09:34:14 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [PATCH v3] target/i386/sev: add support to query the attestation
 report
Message-ID: <20210601133414.rmwt725cv3ipejmk@habkost.net>
References: <20210429170728.24322-1-brijesh.singh@amd.com>
 <20210531200116.phfr6vo3penynb4f@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210531200116.phfr6vo3penynb4f@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Tom Lendacky <Thomas.Lendacky@amd.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, James Bottomley <jejb@linux.ibm.com>,
 dgilbert@redhat.com, armbru@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 31, 2021 at 04:01:16PM -0400, Eduardo Habkost wrote:
> On Thu, Apr 29, 2021 at 12:07:28PM -0500, Brijesh Singh wrote:
> > The SEV FW >= 0.23 added a new command that can be used to query the
> > attestation report containing the SHA-256 digest of the guest memory
> > and VMSA encrypted with the LAUNCH_UPDATE and sign it with the PEK.
> > 
> > Note, we already have a command (LAUNCH_MEASURE) that can be used to
> > query the SHA-256 digest of the guest memory encrypted through the
> > LAUNCH_UPDATE. The main difference between previous and this command
> > is that the report is signed with the PEK and unlike the LAUNCH_MEASURE
> > command the ATTESATION_REPORT command can be called while the guest
> > is running.
> > 
> > Add a QMP interface "query-sev-attestation-report" that can be used
> > to get the report encoded in base64.
> > 
> > Cc: James Bottomley <jejb@linux.ibm.com>
> > Cc: Tom Lendacky <Thomas.Lendacky@amd.com>
> > Cc: Eric Blake <eblake@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: kvm@vger.kernel.org
> > Reviewed-by: James Bottomley <jejb@linux.ibm.com>
> > Tested-by: James Bottomley <jejb@linux.ibm.com>
> > Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> > ---
> [...]
> > +    gsize len;
> [...]
> > +    /* verify the input mnonce length */
> > +    if (len != sizeof(input.mnonce)) {
> > +        error_setg(errp, "SEV: mnonce must be %ld bytes (got %ld)",
> > +                sizeof(input.mnonce), len);
> 
> This breaks the build on i386.  Failed CI job:
> https://gitlab.com/ehabkost/qemu/-/jobs/1300032082
> 
> I'm applying the following fixup.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 12899a31736..0e135d56e53 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -517,7 +517,7 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>  
>      /* verify the input mnonce length */
>      if (len != sizeof(input.mnonce)) {
> -        error_setg(errp, "SEV: mnonce must be %ld bytes (got %ld)",
> +        error_setg(errp, "SEV: mnonce must be %ld bytes (got %" G_GSIZE_FORMAT ")",
>                  sizeof(input.mnonce), len);
>          g_free(buf);
>          return NULL;

The fix was incomplete, additional fixup was required.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
diff --git a/0e135d56e53 b/target/i386/sev.c
index 0e135d56e53..1a88f127035 100644
--- a/0e135d56e53
+++ b/target/i386/sev.c
@@ -517,7 +517,7 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
 
     /* verify the input mnonce length */
     if (len != sizeof(input.mnonce)) {
-        error_setg(errp, "SEV: mnonce must be %ld bytes (got %" G_GSIZE_FORMAT ")",
+        error_setg(errp, "SEV: mnonce must be %zu bytes (got %" G_GSIZE_FORMAT ")",
                 sizeof(input.mnonce), len);
         g_free(buf);
         return NULL;

-- 
Eduardo


