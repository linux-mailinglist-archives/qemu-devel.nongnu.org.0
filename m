Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904EC36C924
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 18:19:27 +0200 (CEST)
Received: from localhost ([::1]:49300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQQo-00029m-7F
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 12:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbQP5-0001a7-Dt
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:17:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbQP2-0004Al-F2
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619540255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hPHV6JwwzqvZQS+Oj68p4fzEHbk8VRoyq+VeA6+5S1I=;
 b=CsxXYkT64RcNyXe7N4qzORPTDnM9Cuv3HDq5TT/hX22BWFQGQb1zg7gTv1n0FftUYi7/xv
 /xsTeyYTDRlugTyvymUdYivX81f/ecwc4wtGsNs02gadtfe+YJKfeSjozqHEFVVJw+otZW
 J7DuKhL9wK+SXq5fuKFYToXB9/JD0y8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-Jv3xMWtcNGuI8I8pPc7jWQ-1; Tue, 27 Apr 2021 12:17:33 -0400
X-MC-Unique: Jv3xMWtcNGuI8I8pPc7jWQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 s20-20020a0564025214b029038752a2d8f3so5961559edd.2
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 09:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hPHV6JwwzqvZQS+Oj68p4fzEHbk8VRoyq+VeA6+5S1I=;
 b=iQSq1MD3fO0b3s6J/nKNOa1YCBOUQeYYZ7HOiIAzmL3IgGBHPDLQKPG6gfUAADm+GH
 M7UB2I6Ys0GI0cggj9Xolt0FGNEIvpxVHuIUN4HDwJPRRSBzTfAZlROqyM4c6QnYcnSx
 67AIVXqi6rVYQq1e2APBg0L/csOJp5ngrc71gRzJ57zYNP46JB8M3MW9KIWByyp6I2L5
 d9rklzE0g/jXdtKtVLBORrOYLJxgPEM3L8m+VTeaDjlXHDnqvBMXKMWVybwvuyDUmmZp
 t+IbOViD2EwAdFjUf6y3jnT+gZgBlkWn25OG5TIqIH1MEpeeVqsJPHXcuiqIPtDLtam6
 GsTw==
X-Gm-Message-State: AOAM531SdwtCIzIFGd/2eT3sFbGkVPr1SKyEh1WK9zpLkYRm234Ft91/
 e63mcqrWn1z2HOLpIzcB3LIVunV8JSNatdarrABD2Xjeb9Dufg1+/nyqX6nZiymMNKRu9DyIU7C
 iwRX/QJa2KinziEQ=
X-Received: by 2002:a17:906:2b05:: with SMTP id
 a5mr24381956ejg.446.1619540252576; 
 Tue, 27 Apr 2021 09:17:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydLjHzUB3Jc7h0IbPuOBj35UMkEWby5AwX6PD/T5gZRdZzqYB65OvnWYobjnKNEHs3ix9p8A==
X-Received: by 2002:a17:906:2b05:: with SMTP id
 a5mr24381939ejg.446.1619540252387; 
 Tue, 27 Apr 2021 09:17:32 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id ch30sm2748215edb.92.2021.04.27.09.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 09:17:31 -0700 (PDT)
Date: Tue, 27 Apr 2021 18:17:30 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
Message-ID: <20210427161730.iag4a4usqtiy3bgs@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
 <20210427095458.3hbckyqbmfztcmge@gator.home>
 <CAFEAcA82VJqgD+B4gCr1M0n5oV869rBdoTzNS6xSs0f2f8iFvw@mail.gmail.com>
 <20210427144819.fiecdpdgre7tznvq@gator.home>
 <CAFEAcA_hvxAmodWKdEUQH4as4vMuaDVGDK7C6KeZ3-TBbPxEFA@mail.gmail.com>
 <CAFEAcA9CoW7JSdF6mT3gJOterYDAFQrYd5Czt0rZOpogTewNNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CoW7JSdF6mT3gJOterYDAFQrYd5Czt0rZOpogTewNNg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 04:01:10PM +0100, Peter Maydell wrote:
> On Tue, 27 Apr 2021 at 15:58, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 27 Apr 2021 at 15:48, Andrew Jones <drjones@redhat.com> wrote:
> >
> > > Since these types of features seem to blur the line between being a CPU
> > > and board property, then I think I'd prefer we call them CPU properties,
> > > as they come from the CPU manual.
> >
> > Conversely, I prefer to call them board properties, because that's
> > the way it works in hardware: the hardware board has the necessary
> > support for the system-level feature, and part of that is that it
> > has an SoC or CPU which has been configured to have the properties
> > that are needed for the board to support the feature. Having a CPU
> > that nominally supports a feature is useless if the system as a whole
> > doesn't handle it.
> 
> ...this also means that we're consistent between boards: some board
> models unconditionally have support for a feature (and always set it
> on the CPU, GIC, etc), some don't ever support the feature (and always
> disable it), and a few offer the user the choice. Having the user
> use CPU properties suggests that they can, for instance, plug a
> has-el3 CPU into any board model, which in general won't work.
>

I feel like this can be looked at both ways. A board can have a supporting
CPU or a CPU can have a supporting board. While a CPU is physically
mounted in a board, giving it a natural "physical member of" relationship
to the board, a board's design is driven by the features of the CPU, which
leads to the board having a "implements dependencies of" relationship to
the CPU.

I think the way we look at it depends on what we consider our top level
requirements to be. If it's a board specification that we're implementing,
then we clearly look at it from the board perspective. However, for mach-
virt, we don't have much of a board specification. We want it to be a
minimal board that supports VIRTIO and CPU features.

Maybe this is a place where our perspective and interface should diverge
between mach-virt and the emulated board models?

All that said, if we'd rather start thinking about system features, then
should we rework 'pmu' and perhaps other CPU features, which might better
be considered system features? Also, is the '-M virt,\?' type of probing
sufficient? Don't we need some sort of probing that considers both the
board support and the CPU support? 'virt' might support a system feature
that '-M virt -cpu xyz' does not support, right? How do users (libvirt)
know if they need to probe both the board and the CPU for feature support?
How do we probe the CPU's support for the feature if we don't want to
expose the feature as a CPU property? And, if we do expose the feature
as a CPU property, then what should be the response to enabling it without
the board property? Error out or imply its enablement when it's available?

I think we need some sort of system feature document to explain what a
system feature is and how it combines board properties together with CPU
features (which may or may not be exposed as properties). We'll need
to document how to properly do the probing and we'll also need tests to
check all our {board-property, cpu-type, cpu-property} misconfiguration
possibilities for proper error handling.

Thanks,
drew


