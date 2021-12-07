Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0F46C771
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 23:27:33 +0100 (CET)
Received: from localhost ([::1]:37702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muivs-0001KM-Dt
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 17:27:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1muiuO-0000dw-7R
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 17:26:00 -0500
Received: from [2607:f8b0:4864:20::532] (port=45055
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1muiuM-0000mW-7J
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 17:25:59 -0500
Received: by mail-pg1-x532.google.com with SMTP id m15so316848pgu.11
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 14:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RQXmYAMR/sXSk9XmD70R29tOokpsn7xvqpKh45eus90=;
 b=AMfTYoLJN06fTTFwC2yJfyu6lGNUXEC17ykoxSfV2PycL8DftRMG5kABvLZCTOLPVr
 QxmNF6xTxHHmBsIitPiVNlFPBvlQ2GQup9roZL0McwoO4oc6HxCW08h2vPM+9XFPV6uf
 LhTN07hZOShLzPQ7h98ZzyALDfBbRequfAqum8odfrXdawrKzylOhwBOaSpvyGKaag6J
 XmSyJd4WL2Iarw0fv4BZjwZ4Awa5ku6jjqod9Wme2S9jL3vSqZXIWAuvf05VjC9HKSTN
 Rez6A+32yWy2XGfr8y8SkgUOkxHbej1lPRMVt6wTzLnHSs+2t0Uf5oKKp6OrQiUsLWuv
 +vtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RQXmYAMR/sXSk9XmD70R29tOokpsn7xvqpKh45eus90=;
 b=dQGqWOIXOLWA1+o9eDX6w67YqbCItm4cwNNzzlmjC9vqcMsSZ50fyczp1OcmlkQ/6a
 o0pMg1eAsRSXcKYd7F0alTY5dFJcE/chaGeMr4ev2b9ISMGGO1awvs8GuUByJY9q4FDZ
 1caFS7VCLy2sMtYA+mblU5NYu/xhdsjyqNQkM+jUzOeq8lq1CfWdWf4UunG5LuVneOYG
 5BUuvXBOIhI+x9RcxV0ZJja+yzNpijWh4som9fjpOoXMaRORa3P6bhD4omlvXCHt/alB
 OVPWW/uL15ICzF1yN265ayJ3qEcP5KmqYJLaSnPL6xLScUGwclAz9whpWb/3+YJrq67/
 F2vg==
X-Gm-Message-State: AOAM531ImURFFoxNtitkEnkvxB2C6LFtf5TTSVGBoB+ZV5060OZCYO47
 9sB4bR0GZwKh6MMmDvj/TKDlOg==
X-Google-Smtp-Source: ABdhPJxQlLRiK0ua2RsOrTNvNVPEqsBLOWGVBdtjDau8f/z0OimiB1Zz37Y3lgjb700ozB120/xmQg==
X-Received: by 2002:a05:6a00:a23:b0:4a4:e9f5:d890 with SMTP id
 p35-20020a056a000a2300b004a4e9f5d890mr2050692pfh.82.1638915955458; 
 Tue, 07 Dec 2021 14:25:55 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id on5sm526932pjb.23.2021.12.07.14.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 14:25:55 -0800 (PST)
Date: Tue, 7 Dec 2021 22:25:51 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chris Murphy <lists@colorremedies.com>
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org
Subject: Re: dozens of qemu/kvm VMs getting into stuck states since kernel
 ~5.13
Message-ID: <Ya/fb2Lc6OoHw7CP@google.com>
References: <CAJCQCtSx_OFkN1csWGQ2-pP1jLgziwr0oXoMMb4q8Y=UYPGqAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJCQCtSx_OFkN1csWGQ2-pP1jLgziwr0oXoMMb4q8Y=UYPGqAg@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=seanjc@google.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Tue, Dec 07, 2021, Chris Murphy wrote:
> cc: qemu-devel
> 
> Hi,
> 
> I'm trying to help progress a very troublesome and so far elusive bug
> we're seeing in Fedora infrastructure. When running dozens of qemu-kvm
> VMs simultaneously, eventually they become unresponsive, as well as
> new processes as we try to extract information from the host about
> what's gone wrong.

Have you tried bisecting?  IIUC, the issues showed up between v5.11 and v5.12.12,
bisecting should be relatively straightforward.

> Systems (Fedora openQA worker hosts) on kernel 5.12.12+ wind up in a
> state where forking does not work correctly, breaking most things
> https://bugzilla.redhat.com/show_bug.cgi?id=2009585
> 
> In subsequent testing, we used newer kernels with lockdep and other
> debug stuff enabled, and managed to capture a hung task with a bunch
> of locks listed, including kvm and qemu processes. But I can't parse
> it.
> 
> 5.15-rc7
> https://bugzilla-attachments.redhat.com/attachment.cgi?id=1840941
> 5.15+
> https://bugzilla-attachments.redhat.com/attachment.cgi?id=1840939
> 
> If anyone can take a glance at those kernel messages, and/or give
> hints how we can extract more information for debugging, it'd be
> appreciated. Maybe all of that is normal and the actual problem isn't
> in any of these traces.

All the instances of

  (&vcpu->mutex){+.+.}-{3:3}, at: kvm_vcpu_ioctl+0x77/0x720 [kvm]

are uninteresting and expected, that's just each vCPU task taking its associated
vcpu->mutex, likely for KVM_RUN.

At a glance, the XFS stuff looks far more interesting/suspect.

