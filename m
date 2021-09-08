Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA9F403EDC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 20:06:55 +0200 (CEST)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO1yI-00006W-7y
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 14:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mO1x2-0007rD-Ie
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 14:05:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mO1wz-0002FR-Cv
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 14:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631124331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWdtrISBEuzsMczxvfV5zszd48BFTtyg/H0Vk7PimRM=;
 b=e0EotzEv2b0q1k7Jec6VEIW3nwHDy60MxHz7QxyJvgas19mRwwCBtecNDlRJSMmD6wrTy6
 SSzlQDOJ4IEYe3O/+OLGX4C3PvD58mVSax6WtE4FxAOjif4s6PYIceCQotW3SiDUaSh7yJ
 FlQZSKJ5G71OsFv8Tru3V+rg9HU23ss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-n6xbrW-hPsG2pyCPJaJ6Qw-1; Wed, 08 Sep 2021 14:05:30 -0400
X-MC-Unique: n6xbrW-hPsG2pyCPJaJ6Qw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 471A310B7464;
 Wed,  8 Sep 2021 18:05:29 +0000 (UTC)
Received: from redhat.com (ovpn-113-24.phx2.redhat.com [10.3.113.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DDBD60C82;
 Wed,  8 Sep 2021 18:05:15 +0000 (UTC)
Date: Wed, 8 Sep 2021 13:05:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 3/5] target/i386: convert to use format_state instead of
 dump_state
Message-ID: <20210908180513.6pvaonrzmq2gchfa@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-4-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908103711.683940-4-berrange@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 11:37:09AM +0100, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/i386/cpu-dump.c | 325 ++++++++++++++++++++++-------------------
>  target/i386/cpu.c      |   2 +-
>  target/i386/cpu.h      |   2 +-
>  3 files changed, 174 insertions(+), 155 deletions(-)
> 
> diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
> index 02b635a52c..8e19485a20 100644
> --- a/target/i386/cpu-dump.c
> +++ b/target/i386/cpu-dump.c
> @@ -94,41 +94,45 @@ static const char *cc_op_str[CC_OP_NB] = {
>  };
>  
>  static void
> -cpu_x86_dump_seg_cache(CPUX86State *env, FILE *f,
> +cpu_x86_dump_seg_cache(CPUX86State *env, GString *buf,
>                         const char *name, struct SegmentCache *sc)
>  {
>  #ifdef TARGET_X86_64
>      if (env->hflags & HF_CS64_MASK) {
> -        qemu_fprintf(f, "%-3s=%04x %016" PRIx64 " %08x %08x", name,
> -                     sc->selector, sc->base, sc->limit,
> -                     sc->flags & 0x00ffff00);
> +        g_string_append_printf(buf, "%-3s=%04x %016" PRIx64 " %08x %08x", name,
> +                               sc->selector, sc->base, sc->limit,
> +                               sc->flags & 0x00ffff00);

Did you consider using open_memstream() to get a FILE* that can then
be passed into these callbacks unchanged, rather than rewriting all
the callbacks to a new signature?

Then again, I like the GString signature better than FILE*, even if it
makes for longer lines.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


