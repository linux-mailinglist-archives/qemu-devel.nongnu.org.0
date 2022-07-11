Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF2A570736
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:37:56 +0200 (CEST)
Received: from localhost ([::1]:60038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAvTv-0004yp-P4
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oAvKb-0004rC-SA
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:28:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oAvKY-0001S1-7P
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657553292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AQ9AFgjAq9AFWyJhWhhuGWEoRzdPmRiYM2CqArRFNmo=;
 b=Wf/TFkDuVQkBRCCIe2UDlc4aBvJptqF6Zd07l+dmPgdEpWbc8t2/qG6U3yUOMRYfSRJJBl
 gw2rmDd6gpO0X4Rs5G+QewDqzmYeOAVs3iwTJz7RqjUdI0VlhJdEe7f1Itvrq1bmrlicb1
 3Q6WHvN85ak9BSvEUXectOBhZDDQOpk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-Ct43ce96NluM5UDf7g85VQ-1; Mon, 11 Jul 2022 11:28:11 -0400
X-MC-Unique: Ct43ce96NluM5UDf7g85VQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 t13-20020adfe10d000000b0021bae3def1eso736099wrz.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 08:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AQ9AFgjAq9AFWyJhWhhuGWEoRzdPmRiYM2CqArRFNmo=;
 b=ryV8MqTsjZ0BiRFlWJm3cEM5820krPlJLnsGTptyHK+9Yecl1w3CvPkh4UgYAyB61W
 SkTnimVV48Cv90h+Hsz0X+zal2aK7nBTJUX/HZpXda363I2akING9BVquk96S89UI7Lm
 Y9UOMJ/ifdZmp8zTnaqMYpsBE/4cqA78Nx6u41uqG5aBy3nM/wYgnD5tnZY6qSV8LegV
 mlbmzTGyqfglZ7koC0et78ltNCRF6BfU+sULNFWKR+8KoK8+koas4GuEqMbqyaZIcCNX
 gnDCgcx7hyQt6CattXK8BLM2Vp2WjGx05EE/nVReA4bXOjhRaKjcvhSHmsvZlqgCU/DB
 KUkQ==
X-Gm-Message-State: AJIora/wYE+JGNNzjbsZWHaAnvWzr1Kmx1X+Klv3pefp7mCl1syhj6BW
 +RBpVocCj6G/dvZPqQtRnC5eLu+RHkK/hoesWV3W84Rs58DbfIsf5NyZyZihq1D+MV7v536TVD2
 vPmVb0aJ/RnFrneg=
X-Received: by 2002:a5d:47a8:0:b0:21b:a318:2c31 with SMTP id
 8-20020a5d47a8000000b0021ba3182c31mr17271991wrb.463.1657553290655; 
 Mon, 11 Jul 2022 08:28:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umoOE6F3TF/C4rCdhEN4YxFLp/CjqND8ZeK2+w2mCDb4Dh3IREsmxv9tEeCNjhbEJdT4uSfw==
X-Received: by 2002:a5d:47a8:0:b0:21b:a318:2c31 with SMTP id
 8-20020a5d47a8000000b0021ba3182c31mr17271965wrb.463.1657553290404; 
 Mon, 11 Jul 2022 08:28:10 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j16-20020adfff90000000b0021d76a1b0e3sm6039975wrr.6.2022.07.11.08.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 08:28:09 -0700 (PDT)
Date: Mon, 11 Jul 2022 16:28:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
Message-ID: <YsxBh3bJmbF8MvsJ@work-vm>
References: <20220707161656.41664-1-cohuck@redhat.com>
 <YswkdVeESqf5sknQ@work-vm> <87o7xv660k.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7xv660k.fsf@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

* Cornelia Huck (cohuck@redhat.com) wrote:
> On Mon, Jul 11 2022, "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Cornelia Huck (cohuck@redhat.com) wrote:
> >> For kvm, mte stays off by default; this is because migration is not yet
> >> supported (postcopy will need an extension of the kernel interface, possibly
> >> an extension of the userfaultfd interface), and turning on mte will add a
> >> migration blocker.
> >
> > My assumption was that a normal migration would need something as well
> > to retrieve and place the MTE flags; albeit not atomically.
> 
> There's KVM_ARM_MTE_COPY_TAGS, which should be sufficient to move tags
> around for normal migration.
> 
> >
> >> My biggest question going forward is actually concerning migration; I gather
> >> that we should not bother adding something unless postcopy is working as well?
> >
> > I don't think that restriction is fair on you; just make sure
> > postcopy_ram_supported_by_host gains an arch call and fails cleanly;
> > that way if anyone tries to enable postcopy they'll find out with a
> > clean fail.
> 
> Ok, if simply fencing off postcopy is fine, we can try to move forward
> with what we have now. The original attempt at
> https://lore.kernel.org/all/881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org/
> hooked itself directly into common code; maybe we should rather copy the
> approach used for s390 storage keys (extra "device") instead?

I don't understand how a separate device would keep the idea of page
changed flags coherent with the main RAM that the tags correspond to.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


