Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F98E2DE203
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:31:52 +0100 (CET)
Received: from localhost ([::1]:47326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDzD-0003gA-4k
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1kqDun-0006pc-7V
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1kqDuk-00034j-PX
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608290833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A8UQVKVG4s/lEfgsKO40k1cDI7FO3s/NhLml3dpAt5w=;
 b=cFsgZ1TgkiCKLG1Bvt4Soiuf8vZDTlSL2O0hGSdPukLHbYDYntbDxt6HAZrZwNrocjQD5G
 58dRfDzQt/xF0TFJwVWGLDPMms57MKBZo7aF2eixooa/EVf/Sf7LWHy6v/P7LyqZcaFCHj
 RNIdFtOvG4bNPmVjI17MGqzPPk1lXaM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-hqPSBwZKOyWXzQQon0u53w-1; Fri, 18 Dec 2020 06:26:01 -0500
X-MC-Unique: hqPSBwZKOyWXzQQon0u53w-1
Received: by mail-ed1-f70.google.com with SMTP id n18so980456eds.2
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version;
 bh=A8UQVKVG4s/lEfgsKO40k1cDI7FO3s/NhLml3dpAt5w=;
 b=NRJ7y1SIQqt4FuikGaUBCNXg8duFhYaMCjU7JJPj6HVnhMeFon4EVgzAdRyMSbJAft
 urpKvjKw/jd8FqNGOQJqnlOhNG64iLzHJzZlS3Ec/NlKL7t3/xhxTlXcwLkUWVghAOsc
 JkgUvYEz+hMbpFpForAf1P3t06PRyOC7xi+okanWqQCTGsGQxwvSfUdtG5lIjnJD3eKd
 CNsiUvVtSn+r0OiFhBt+WWwqhiKpmSPEsSAWn+6MgnKIDLLBAdXAuY0gGZvC2NsiAt7s
 9htsIjuc/tsZcw7MAZG6+0oQlJZtkFc9AmVukZxTVC/q8fSZDuJbdT34GYSfLKJRBkIx
 4SjA==
X-Gm-Message-State: AOAM530BYBJ3GrTapuP9OdmyGUuwjfq5H9LK1BQ60jeHVrkHfuf1xNzF
 uYp16hTS0FFefgFPFrlp4nnPsF3RRmZF6AkNmLhtvW833aVchZZ7P3/V8wDfA9Ak6Jz0+zBQNMp
 hH7QRboU4pj/ibXs1JBj58g3WymEQuzYJgnXF5SWdpSjb8iJb5rNr5ndFqitEBTS1soc=
X-Received: by 2002:aa7:cf8f:: with SMTP id z15mr3918834edx.17.1608290759464; 
 Fri, 18 Dec 2020 03:25:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO6RexpLG6kDG7tpk6aNsC/C6vcr0tWIOupt2T5aRClPNPz4ws72T25f8jYEtvEUI3OjhKBA==
X-Received: by 2002:aa7:cf8f:: with SMTP id z15mr3918819edx.17.1608290759226; 
 Fri, 18 Dec 2020 03:25:59 -0800 (PST)
Received: from finch (cst-prg-98-217.cust.vodafone.cz. [46.135.98.217])
 by smtp.gmail.com with ESMTPSA id o10sm5390840eju.89.2020.12.18.03.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:25:58 -0800 (PST)
From: Milan Zamazal <mzamazal@redhat.com>
To: Veselina Radeva <vessy@st6.io>
Subject: Re: Question about migration of a VM between hosts having slight
 difference in TSC Frequency
References: <CAHNOXOQREiONA5aurW4B0aW4MJjmamqp6ZXpauCY4O88A1sSAw@mail.gmail.com>
Date: Fri, 18 Dec 2020 12:25:56 +0100
In-Reply-To: <CAHNOXOQREiONA5aurW4B0aW4MJjmamqp6ZXpauCY4O88A1sSAw@mail.gmail.com>
 (Veselina Radeva's message of "Thu, 17 Dec 2020 13:54:22 +0200")
Message-ID: <878s9v5pa3.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mzamazal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mzamazal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Veselina Radeva <vessy@st6.io> writes:

> Hi,
>
> I'm trying to migrate a VM from one host to another where there is a 1KHz
> difference in the TSC frequency between hosts. This results in errors
> caused by this warning
> <https://github.com/qemu/qemu/blob/b785d25e91718a660546a6550f64b3c543af7754/target/i386/kvm.c#L777>,
> so migration fails. On the other hand, I can see few lines before that
> <https://github.com/qemu/qemu/blob/b785d25e91718a660546a6550f64b3c543af7754/target/i386/kvm.c#L761>
> that
> there is a try to allow TSC frequency difference between host and VM if it
> falls within the specified bounds. It seems like `KVM_SET_TSC_KHZ`succeeds
> only when TSC Scaling is available
> <https://github.com/qemu/qemu/blob/2c6605389c1f76973d92b69b85d40d94b8f1092c/linux-headers/linux/kvm.h#L1361>.
> Practically this means that migration between hosts having difference in
> TSC frequency, even when it falls within bounds, is possible only when TSC
> scaling is available.

Hi,

it should be possible to migrate within the 250 ppm frequency difference
tolerance even when TSC scaling is not available.  But sufficiently new
QEMU and kernel are needed, I think QEMU >= 5.1 and Linux >= 5.8.

> On the other hand, in libvirt,
> <https://github.com/libvirt/libvirt/commit/d8e5b4560006590668d4669f54a46b08ec14c1a2>
> migration is allowed if TSC frequency difference falls within bounds, no
> matter if TSC scaling is enabled or not.
>
> So, I was wondering is it intended not to allow migration between hosts
> having differences in TSC frequency if TSC scaling is not available? Or is
> it a bug?

If you have the right kernel, QEMU and libvirt (if you use it) versions
and it doesn't work then it looks like a bug to me.

Regards,
Milan

> Thanks in advance,
> Veselina Radeva
> https://st6.io/


