Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB1636C236
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:56:22 +0200 (CEST)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKS5-0004em-3z
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKQt-00040E-Ur
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKQq-0001uV-FJ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619517303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9wLZIdtJh0JSaP+OKGTPxmslcacRHG1/lfRLscjC014=;
 b=X0mEIZJUmAFCti1YkRuxGIZwMW8FZ4r5oZjtK6ythXLWfh7tjb9vW55Q1yEfY5kD+0vz0i
 gGkyhr3xv81lFxp0YBDrZRU6zyNCV7NWE9KGkCnxDFQ5RId5u3jni7FjJHTmCLTPdA93vo
 9Qo/bO8zFJfKrhmEaiZH0zwkL2AxfC4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-HejY7yAQPR-CKlAZ55zsLQ-1; Tue, 27 Apr 2021 05:55:02 -0400
X-MC-Unique: HejY7yAQPR-CKlAZ55zsLQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 x21-20020a1709064bd5b029037c44cb861cso11030063ejv.4
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 02:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9wLZIdtJh0JSaP+OKGTPxmslcacRHG1/lfRLscjC014=;
 b=Gv1nNSVtTnhERvywo5endKrlRlZ0OJz+zNoL5WbUllYRP8pSNeIH+BMsaAre0NjB5q
 8vv7Voz0o7VTvYWIF+Od098/lVjdCpqiVkNrnYUKVOgZa7mf0OgOAsjhRb0Gd3RVqiuW
 S83PV3Ezv4tjogoyuzS/oP7ldmZGFrQH4sk9xzjoc9bBnENQ4YC/3eh4ddxScYRAgPlW
 DDeUC1Ys9RFBVPiXgLxG3UmUHrMQuWgOqsOOAOPGZvay+919oyVbxOEoMhZP6LOq9ywM
 Olv35RmVJkRBoO/D1OV47Y+KqhxZpl1Y0GC9Igx6rDmdFWCfaZEayLTxUBX7mfTvWwex
 /Ilg==
X-Gm-Message-State: AOAM531srJ6eSbi7k7lMHDiHeEvKnlvn4Fs/ZRhvWOSHMX4eT0X2yKQY
 +T4c3h14TKPyOpNL16l+9AebJ9QLBP3YFgjo837fgVMHvCUtKo8g2DOND6iLefM66SDSNL/KD89
 B85wz9vM95zHE3EQ=
X-Received: by 2002:a17:906:4d42:: with SMTP id
 b2mr23077461ejv.270.1619517300992; 
 Tue, 27 Apr 2021 02:55:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo+7zKKGBej1coBUfcFjJlzcJyvjLAl8vbmxO8CMbnIGnOfbM6hXxZ4LFH/1Rj+qX+OBaYPg==
X-Received: by 2002:a17:906:4d42:: with SMTP id
 b2mr23077444ejv.270.1619517300774; 
 Tue, 27 Apr 2021 02:55:00 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id gw19sm3925534ejb.56.2021.04.27.02.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:55:00 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:54:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
Message-ID: <20210427095458.3hbckyqbmfztcmge@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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

On Tue, Apr 27, 2021 at 10:42:18AM +0100, Peter Maydell wrote:
> On Thu, 1 Apr 2021 at 13:55, Haibo Xu <haibo.xu@linaro.org> wrote:
> > This series add support for ARMv8.3/8.4 nested virtualization support
> > in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and
> > has been tested on a FVP model to run a L2 guest with Qemu. Now the
> > feature can be enabled by "-M virt,accel=kvm -cpu host,el2=on" when
> > starting a VM.
> 
> Why are we making the UI for "enable EL2 guest with KVM" different
> from that for "enable EL2 guest with TCG" ? Currently an EL2
> TCG guest is set up with "-M virt,virtualization=on", which then
> does everything it needs to enable virtualization on all the
> components on the board including the CPU.
> 
> Unless there's a strong technical reason why KVM EL2 has to
> be different, I think we should use the same switch.

I agree we should use the same switch, but I think I'd prefer it be the
CPU switch instead of the machine switch, as it's a CPU feature. There are
some board properties too, like the maintenance interrupt, but we tend to
call a feature a CPU feature when it shows up in the CPU manual, e.g. the
PMU is also a CPU feature, even though it has a PPI.

Thanks,
drew


