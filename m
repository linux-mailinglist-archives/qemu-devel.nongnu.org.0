Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2498A4BEFAA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 03:52:55 +0100 (CET)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMLIL-0001pH-VJ
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 21:52:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMLGl-000157-KS
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 21:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMLGh-0004Ta-Nc
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 21:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645498270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ZiD9ZVkag8On0/5Sk358Cgkystgw34N3Es+Wf8LPEc=;
 b=dn2kHvpci0TApoP1T7S2oIbQDGZL8biH0NoMU8bnGp+HT6bW8haqrBlcrqoc8wdP4fDW23
 l8nd7n88YLDjda3J1XlgXsARwIR8wbCaHSiPMiJKcnZStSWGha44jneCmzzxNWIePxWtx7
 aNcrnm2slS1m+dvCnnuT4aW2SMFRtkQ=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-h8EZrh6xONWwvZoDBbRbcA-1; Mon, 21 Feb 2022 21:51:06 -0500
X-MC-Unique: h8EZrh6xONWwvZoDBbRbcA-1
Received: by mail-pf1-f198.google.com with SMTP id
 y127-20020a626485000000b004f1027d72a7so4025925pfb.6
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 18:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0ZiD9ZVkag8On0/5Sk358Cgkystgw34N3Es+Wf8LPEc=;
 b=Hiv2x7VYZg6S4Jh/QpQLkOstRZ3Zb9+79zXhJ4gkcr8Lx3o92s/bwVRCymCTFQv3Om
 S6J5Y57TVytvdpSO8jhtGcenHVM3r4H5Q33d8CaUNhrCukn+R0J+r3gJFZeu2k97CqAe
 cK4QYDVd+QTM8fNyf00yjKeXJqu+bH+lo6XGL3iYiLzQaRxjwYzt7DiaJw+QSoflrLpE
 EfplLns8o3OA/G5CdG5iMsdk/Q1mf24lYa7cebdbTV/K4rh2YAisrtbC4MMbKth7fT9h
 8clv4UvZdoPQDTOf1x7PeFEfCHbdTMdPEyDCE1DhR2Ec84grmWPjW66YQgz+wkIVCJYz
 oWHg==
X-Gm-Message-State: AOAM530/OXTi66HaVmz26ehazWzZtyKY6OBTJqKy0JqSbL7aCgtDgqJD
 qe6Z5i3lY9Eow7b+whaFdNKrMcHdtfSopItlY1wChVIo4vRW3MyQoUE19A/9No5gmr+LKagcWlp
 uuxbPXo9y3oKHRno=
X-Received: by 2002:a63:7781:0:b0:372:ba7b:c894 with SMTP id
 s123-20020a637781000000b00372ba7bc894mr18227466pgc.458.1645498265805; 
 Mon, 21 Feb 2022 18:51:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUP+ZL8bEX0hAoxFDYZ4wSm8TYpQ4+wBM0Ecc2v6eGPxa7TcL2TwsLjuFSLpKw28nqgpw1ew==
X-Received: by 2002:a63:7781:0:b0:372:ba7b:c894 with SMTP id
 s123-20020a637781000000b00372ba7bc894mr18227453pgc.458.1645498265557; 
 Mon, 21 Feb 2022 18:51:05 -0800 (PST)
Received: from xz-m1.local ([94.177.118.96]) by smtp.gmail.com with ESMTPSA id
 r4-20020a17090a438400b001bc6d52de70sm541453pjg.24.2022.02.21.18.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 18:51:05 -0800 (PST)
Date: Tue, 22 Feb 2022 10:51:00 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 15/20] migration: Allow migrate-recover to run multiple
 times
Message-ID: <YhRPlGKebn/JaZAk@xz-m1.local>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-16-peterx@redhat.com>
 <YhPF3PS260va9sC9@work-vm>
MIME-Version: 1.0
In-Reply-To: <YhPF3PS260va9sC9@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21, 2022 at 05:03:24PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Previously migration didn't have an easy way to cleanup the listening
> > transport, migrate recovery only allows to execute once.  That's done with a
> > trick flag in postcopy_recover_triggered.
> > 
> > Now the facility is already there.
> > 
> > Drop postcopy_recover_triggered and instead allows a new migrate-recover to
> > release the previous listener transport.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> OK, was that the only reason you couldn't recover twice?

We could recover twice, but we couldn't specify the listening port twice
because AFAIU previously we don't have a good way to clean the existing
listener.

IOW we could always run pause->recover->pause->recover sequence even before
this patch[set], but we can never run continuous recover->recover because
the 2nd one will fail telling that we've already setup a recovery port.

> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks!

-- 
Peter Xu


