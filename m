Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E460545621
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:06:08 +0200 (CEST)
Received: from localhost ([::1]:59982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPLz-000130-6e
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nzPIc-0006if-Cf
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nzPIa-0005IA-6C
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654808554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gbd1rKmmfE1Je9q1WTiAIe9P3w4qSHPNBvf6k2a2b3A=;
 b=gLTGnFKU9FVJsq2oflaxFBNu2KJWERPTM/9WJWQlYbfMEysx3fwIWbPJ/1JfdTDLkj5s8p
 84BovxX7Mmcp+QtdWS3HBU3FUl+mjnnNF1iOyHQrmaKKEPcDs5AkA9AvifFESZ0WIEGNg5
 I+BOjHX690ysMtrjB/mLoXJSx8aU6gQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-L1RpM3o0Ng6h_pQrcpKhAQ-1; Thu, 09 Jun 2022 17:02:33 -0400
X-MC-Unique: L1RpM3o0Ng6h_pQrcpKhAQ-1
Received: by mail-il1-f197.google.com with SMTP id
 g8-20020a92cda8000000b002d15f63967eso18355438ild.21
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 14:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gbd1rKmmfE1Je9q1WTiAIe9P3w4qSHPNBvf6k2a2b3A=;
 b=KaHh5iRFffAUYzeJ7QakGq5HQ69yiabS684ZL0Ahjo0cEqmY904drfcYHGlX67x3Vo
 N2NAZP3kKKq3FRTL3fu8OkAEoFJeWE26DvL6iYgh5F01UFegi68zstMerADy2q8+oz38
 53muttq/V2pZGjgpri8gb7agiON1V6trdHfx7dQWDYBq0sGSDUWg0sfbOufnNYVKQ3lP
 Otrp2TxVs9OyE21XSzB1A+eGz0JHNVCgnwCuetsYRPjR5OxaHbKgIfH4W2u/Sdbvz/Lt
 rhjAnEjRpgJpGg9oIu72MFzwjTMvgoWz3lVGUvbH3wb2hHM9ywMNd7veTn85AWkHDQGN
 nk/w==
X-Gm-Message-State: AOAM531ifA3ucRsJ4YdxWG2zSxE+9+3KsS2Yt6z09hzLT+2tcQTcPQer
 OIstI2UESts7glbHKQAY40C8VG+h/srIDjEFhmImN07wyRsbyBx8p6Re8X7oNX2I0Ild+1NSZ/H
 Hty0qtf4O1VWN0as=
X-Received: by 2002:a05:6e02:1d06:b0:2d1:a247:650a with SMTP id
 i6-20020a056e021d0600b002d1a247650amr22966446ila.27.1654808552176; 
 Thu, 09 Jun 2022 14:02:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN9OghyzAfA0r3vkdMM1hMpbulYocH6dku+cLygYL4YZvnL94CYyShjVd49KFkzzbyLd/3qQ==
X-Received: by 2002:a05:6e02:1d06:b0:2d1:a247:650a with SMTP id
 i6-20020a056e021d0600b002d1a247650amr22966437ila.27.1654808551972; 
 Thu, 09 Jun 2022 14:02:31 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a92200e000000b002d191911e59sm10865496ile.52.2022.06.09.14.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:02:31 -0700 (PDT)
Date: Thu, 9 Jun 2022 17:02:29 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH RFC 4/5] cpu: Allow cpu_synchronize_all_post_init() to
 take an errp
Message-ID: <YqJf5WlSyK2o2xJg@xz-m1.local>
References: <20220607230645.53950-1-peterx@redhat.com>
 <20220607230645.53950-5-peterx@redhat.com>
 <YqDW2AZDb3buF9YQ@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YqDW2AZDb3buF9YQ@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 08, 2022 at 06:05:28PM +0100, Dr. David Alan Gilbert wrote:
> > @@ -2005,7 +2005,17 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
> >      /* TODO we should move all of this lot into postcopy_ram.c or a shared code
> >       * in migration.c
> >       */
> > -    cpu_synchronize_all_post_init();
> > +    cpu_synchronize_all_post_init(&local_err);
> > +    if (local_err) {
> > +        /*
> > +         * TODO: a better way to do this is to tell the src that we cannot
> > +         * run the VM here so hopefully we can keep the VM running on src
> > +         * and immediately halt the switch-over.  But that needs work.
> 
> Yes, I think it is possible; unlike some of the later errors in the same
> function, in this case we know no disks/network/etc have been touched,
> so we should be able to recover.
> I wonder if we can move the postcopy_state_set(POSTCOPY_INCOMING_RUNNING)
> out of loadvm_postcopy_handle_run to after this point.
> 
> We've already got the return path, so we should be able to signal the
> failure unless we're very unlucky.

Right.  It's just that for the new ACK we may need to modify the return
path protocol for sure, because none of the existing ones can notify such
an information.

One idea is to reuse MIG_RP_MSG_RESUME_ACK, it was only used for postcopy
recovery before to do the final handshake with offload=1 only (which is
defined as MIGRATION_RESUME_ACK_VALUE).  We could try to fill in the
payload with some !1 value, to tell the source that we NACK the migration
then src fails the migration as long as possible?

That seems to be even compatibile with one old qemu migrating to a new qemu
scenario, because when the old qemu notices the MIG_RP_MSG_RESUME_ACK
message with !1 payload, it'll mark the rp bad:

  if (migrate_handle_rp_resume_ack(ms, tmp32)) {
      mark_source_rp_bad(ms);
      goto out;
  }

  static int migrate_handle_rp_resume_ack(MigrationState *s, uint32_t value)
  {
      trace_source_return_path_thread_resume_ack(value);
  
      if (value != MIGRATION_RESUME_ACK_VALUE) {
          error_report("%s: illegal resume_ack value %"PRIu32,
                       __func__, value);
          return -1;
      }
      ...
  }

If it looks generally good, I can try with such a change in v2.

Thanks,

-- 
Peter Xu


