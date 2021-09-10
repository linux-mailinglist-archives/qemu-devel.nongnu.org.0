Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3404D40681F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 10:04:31 +0200 (CEST)
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mObWQ-0001m1-If
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 04:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mObV1-0000tB-8d
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mObUw-00035V-IV
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631260975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BfsN8PszjvzudcWJwAGDXzGLOjxwaz6TX4zyt+YQdYw=;
 b=LD9Z6AvXk8a1MAO5K53f5yXzBUA7zi+OfbOzHB/wBAJZx7za3slNz4H7MedkVdfoB0xuWK
 HvvPTPA/dzvlAywU1YOVvO7oky+KJ2s9z0dmsktNj8H4hxOkqpHxoQbNmPkHFmXvXZuyhn
 AQ5X0wmiKTJZHjIJgGQR2OGPLNyfBu0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-4BQ8PaluMSehdMT8_wKjKw-1; Fri, 10 Sep 2021 04:02:52 -0400
X-MC-Unique: 4BQ8PaluMSehdMT8_wKjKw-1
Received: by mail-wr1-f70.google.com with SMTP id
 a27-20020a5d457b000000b0015b11fccc5eso208891wrc.10
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 01:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BfsN8PszjvzudcWJwAGDXzGLOjxwaz6TX4zyt+YQdYw=;
 b=14y4EYL1DoS3QAZwC2+2Csni/3GoNiKvXLuiR9uNOpHUc/Eq47V6Zw8qh3/QKXbPrb
 FhH5p+nfiE+zHlLPGDpIs8lav/6CnZS8un67JQofVjgIFRZi8eEArIA3EF9vKK9SMPUc
 CX2lBecZCarA5iZb4f58L9G9TGjbBt6lUmZs8GOiAmrrnK4WB6orEFDWwKbjibW1k00H
 ZBJyzIM/3YuFSd935GmSG+Z+qe0a48b6XN/MV2rnAWCeqlyIMTJohHbJ+5Ju7NYTNaam
 0N8Nbw/Hq39bcLSz5DXcbeu37VmF71ArXan9pjiEPVXhC/xhtp1bz9TpK95U79wy4g9H
 THeA==
X-Gm-Message-State: AOAM530FZ25iRPBJLP4SQJgBQYh3uwJ3jUp1ja2npUau2KRDnBS+pnsJ
 tJMsd59ZMviDbxJ/gbBd8Q00Q7cM5NYXa+Ud7eLPP3OAjmUrVh0H22kxNVADiB5t+296c89Jl9Q
 vroE/rYEyaD2NUio=
X-Received: by 2002:a05:600c:3b26:: with SMTP id
 m38mr6877221wms.155.1631260971321; 
 Fri, 10 Sep 2021 01:02:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV3scoeP9TUbV290T/T0GB/wleq+hsvKVNb00Y0AhEPRUg1xkC9+DHc28P2sdbqvf4S2fihQ==
X-Received: by 2002:a05:600c:3b26:: with SMTP id
 m38mr6877183wms.155.1631260970946; 
 Fri, 10 Sep 2021 01:02:50 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id r2sm4264249wrg.31.2021.09.10.01.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:02:50 -0700 (PDT)
Date: Fri, 10 Sep 2021 10:02:43 +0200
From: Andrew Jones <drjones@redhat.com>
To: Jingyi Wang <wangjingyi11@huawei.com>
Subject: Re: Questions on setting guest CPU models with ARM kvm enabled
Message-ID: <20210910080243.p73z46oengdykeae@gator>
References: <440b72ca-01f2-337a-ad00-fd2d73ae4ea7@huawei.com>
MIME-Version: 1.0
In-Reply-To: <440b72ca-01f2-337a-ad00-fd2d73ae4ea7@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, maz@kernel.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 10:40:30AM +0800, Jingyi Wang wrote:
> Hi all,
>     On ARM hardware, as qemu docs describes, "Named CPU models generally
> do not work with KVM." May I ask what is the main obstacle to setting a
> guest CPU model on later host hardware?

Currently KVM does not give the user (QEMU) control over ID registers.
You cannot migrate a model using KVM to another host because you cannot
write the model's ID registers to KVM if they do not exactly match the
destination host's ID registers. Changing that behavior is just a matter
of coding, but at least one register, MIDR, will still cause problems
with guests that use it to modify their behavior, e.g. to enable
workarounds for errata. A general solution to that problem is not
really possible. See [1] for where I wrote more about that.

> 
>     For example, if I want to start Cortex-A57 guest on Cortex-A72 host,
> I noticed that there is not much big difference between these two CPU
> models(Please correct me if I'm wrong), what work should I do?

You may be able to find two systems that you deem "close enough" to
attempt to migrate. [1] has some proposals for attempting to support
"close enough" migrations.

Also, Peng Liang was working on attempting to make ID registers user
controlled [2],[3]. However, I think the approach was trying to do too
much too fast. We need to take baby steps towards CPU models. Also,
I heard somebody from Google might be trying to give users control
over ID registers, but I haven't seen patches.

IMO, a first baby step towards CPU models would be changing the
reject list we currently have in KVM for what features we expose
to the guest (see arch/arm64/kvm/sys_regs.c:read_id_reg) to an allow
list. The second step would be to give user control to ID registers,
which would mean each ID register set_user function would need to
learn how to sanity check its register value, which would probably
need to be done in a some vcpu finalize function, since there can be
inter-register dependencies. KVM will also have to give up control
over registers like MIDR, because the fields are implementation
defined, so there's no way to sanity check them.

Once KVM has these changes, then we'd need to build models in QEMU,
advertise the model capabilities to upper layers, etc. in order for
them to be used. But, we'd still leave a big burden on the users to
determine what safe migrations are, due to the errata problem I
mentioned above.

The last sentence of the last paragraph is why we've never really
considered all the work to be worth it. However, I would welcome
some baby steps, particularly the KVM reject-list to allow-list
change, which would ensure safer execution of guests in general,
not just for migration.

Thanks,
drew

[1] https://yhbt.net/lore/all/CABgNM92-PHWg3X41tCVfErmV9-Hnu5GYpz_pa9-iXfbScFUCZg@mail.gmail.com/T/#ma3475a71f6ad34853470c8b38cd4ff43815b79d9
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg756323.html
[3] https://lists.cs.columbia.edu/pipermail/kvmarm/2020-November/043011.html


