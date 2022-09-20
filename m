Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8F95BECB5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:20:13 +0200 (CEST)
Received: from localhost ([::1]:45890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahqt-00020W-4a
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oadnB-0003Ll-AM
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:00:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oadn6-0000yD-Gw
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663682400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/dJ1RkA4+wpdunwUxvxfjJfpRsPVL8KliFUpOWYWLYI=;
 b=b36O0ckIXpmZYohCAk6ST+uPZ3tAsail5+wHn1CYUxirEJvA33CCMTPtuc21Ypy6FsTapH
 j9d150Mac2EhB1sJD4Gm6Fgp7w8KIPlIG+DyhAMvL7ng+vCFK8cdg6XbYIV3LdNX1ojeHF
 MiwTAIDF9D1rACSg7qMHOynojJOAFBw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-fCPHjR2GNPGs8AHtL2lQcw-1; Tue, 20 Sep 2022 09:59:58 -0400
X-MC-Unique: fCPHjR2GNPGs8AHtL2lQcw-1
Received: by mail-qt1-f197.google.com with SMTP id
 v9-20020a05622a188900b0035cc030ca25so1889313qtc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 06:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=/dJ1RkA4+wpdunwUxvxfjJfpRsPVL8KliFUpOWYWLYI=;
 b=SP4dsD3jryFV7xKq2ydU3AWArdTgG/IAmmyIGFqERGsUPIoklQ4eyBjIOtNAeO4VRd
 +qBj3DvPmp2yh5RmoHxo62/zlkm7z65wnQ24xMs6/gzDCqr1ZmIEHCNgG3loyTRKFvsa
 4QwaeBTmtgJu2BBxx88D4oszmEeVBdrZPft6Oc8dX+9gEQXM7eu9NL4I8mR44KGxKc82
 1ip+/An/A7ueXnQ7mA7cwnZnHOyXsRvnzqhIdEoAdmrw+R9ENFFiwR6d2qaiNKA2g4L2
 Ca2l9vPNOoQLza+Zf0F+gy9eHEeTjBR/B4WlKMMqO/IsY3ooOFPi8NrKPPNk7ptIR7MO
 1A6A==
X-Gm-Message-State: ACrzQf053DY0yTdWDNx0XcuzhpnoXCX4rOW579Ba9zfuatyPonvyeKf3
 yCtJxoTOd6vZZa5ZrcPCyZPblQ00ohYBhnUW816Z3sUgbAIP+pfq5DbfoA9GnYadQjTCzdUH3ZH
 mM0Ue8PrUcVB6UX0=
X-Received: by 2002:ac8:588c:0:b0:35b:b351:f470 with SMTP id
 t12-20020ac8588c000000b0035bb351f470mr19759484qta.42.1663682398173; 
 Tue, 20 Sep 2022 06:59:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4egJn61ykqKpdQpxGx75VbGWe44zXl2b3l1RIQcKOJIhbCCzaCsIPzjxQQpuilO9BStm1FIQ==
X-Received: by 2002:ac8:588c:0:b0:35b:b351:f470 with SMTP id
 t12-20020ac8588c000000b0035bb351f470mr19759468qta.42.1663682397977; 
 Tue, 20 Sep 2022 06:59:57 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 l16-20020ac87250000000b0035bb6298526sm26371qtp.17.2022.09.20.06.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 06:59:57 -0700 (PDT)
Date: Tue, 20 Sep 2022 09:59:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH v6 2/2] i386: Add notify VM exit support
Message-ID: <YynHXI+Vtrf9J/Ae@xz-m1.local>
References: <20220915092839.5518-1-chenyi.qiang@intel.com>
 <20220915092839.5518-3-chenyi.qiang@intel.com>
 <YyTxL7kstA20tB5a@xz-m1.local>
 <5beb9f1c-a419-94f7-a1b9-4aeb281baa41@intel.com>
 <YyiQeD9QmJ9/eS9F@xz-m1.local>
 <ee855874-bb8b-3f43-cffe-425700b26918@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee855874-bb8b-3f43-cffe-425700b26918@intel.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 20, 2022 at 01:55:20PM +0800, Chenyi Qiang wrote:
> > > @@ -5213,6 +5213,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run
> > > *run)
> > >           break;
> > >       case KVM_EXIT_NOTIFY:
> > >           ret = 0;
> > > +        warn_report_once("KVM: notify window was exceeded in guest");
> > 
> > Is there more informative way to dump this?  If it's 99% that the guest was
> > doing something weird and needs attention, maybe worthwhile to point that
> > out directly to the admin?
> > 
> 
> Do you mean to use other method to dump the info? i.e. printing a message is
> not so clear. Or the output message ("KVM: notify window was exceeded in
> guest") is not obvious and we need other wording.

I meant something like:

  KVM received notify exit.  It means there can be possible misbehaves in
  the guest, please have a look.

Or something similar.  What I'm worried is the admin may not understand
what's "notify window" and that message got simply ignored.

Though I am not even sure whether that's accurate in the wordings.

> 
> > >           if (run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID) {
> > >               warn_report("KVM: invalid context due to notify vmexit");
> > >               if (has_triple_fault_event) {
> > 
> > Adding a warning looks good to me, with that (or in any better form of
> > wording):
> > 
> If no objection, I'll follow Xiaoyao's suggestion to form the wording like:

No objection here.  Thanks.

-- 
Peter Xu


