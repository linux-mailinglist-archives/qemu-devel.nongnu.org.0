Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6EA5EDC55
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 14:10:16 +0200 (CEST)
Received: from localhost ([::1]:33938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVtG-0002jt-Tk
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 08:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTTL-00076P-Mf
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:35:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTTJ-00031T-N7
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664357716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LeeP3118rr1o0fWxrKseei7gPdWiupDPuhVBZf+B5CY=;
 b=UH4EXeSTtE7Z8sq4bNg8GqFfTsyzPcOQebJpaesXQlFAyZjSRxE161OU1ThPiSIEUelsl5
 ZjeRuHomllJtidjdfzLmMQTdNEA70MPkxytiUJBVZ+cwO6lBYO+165zjUuYW360dBo5Agu
 E9zgWd9SZFwM+BdvTsh+gA06BDv7+mU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-8_mSUREDMh26bzijo0AO8w-1; Wed, 28 Sep 2022 05:35:15 -0400
X-MC-Unique: 8_mSUREDMh26bzijo0AO8w-1
Received: by mail-wm1-f72.google.com with SMTP id
 f25-20020a7bc8d9000000b003b4768dcd9cso375425wml.9
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=LeeP3118rr1o0fWxrKseei7gPdWiupDPuhVBZf+B5CY=;
 b=DJ2OpYBSO8dOCfERzYAs0NA73iskZ1n2EY24q1rS4U6AYKjN3nTF1htqWRbS0VYBGm
 PdaWfyjvv68ZRas/Ec4sl898yeh3dcB38r+O6HgykFvcbdD+iKDjR0YT/Twy4cfKKgX1
 NGypBMoy/1gKqwaOq7H1wXHekeDEmgeVbFCiYnHaahVPqbrAnMZOrLO5rLQhV/+rIAB9
 FAwpmlJmvmyTRLqZT38MfLPSFULSGBKbXfOOPcFzxdpEWdSq0f9SZKlid6Wl13NcG7Or
 Q0Emssd+5xgS+ePCdGtuX67j8FZdiDdq234v/eVQgnP/8pdylfiawYRm1gJnywhRQ+6x
 NHKA==
X-Gm-Message-State: ACrzQf1QxwRNCnQqQgpVcbhL+gJzUHrBFtaCs6bh98lb/7OI4pMqqlbN
 j7PWY8bicCvMrNFb8mqFAIqFzUfpdwf6vEV83Sc36+CTVNEV4Jmqp+uAJ9FM4xOMUMPovZE2iKT
 9tzlnId3633zbR98=
X-Received: by 2002:a5d:460f:0:b0:22c:c851:40d4 with SMTP id
 t15-20020a5d460f000000b0022cc85140d4mr1458713wrq.130.1664357714213; 
 Wed, 28 Sep 2022 02:35:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4x1ueU+sD7k3y9WjOg8rKFtElg82d/LV9b9RgMhkyTdeVSnv6eDtxJMNVGUCvV87BBKz/O3Q==
X-Received: by 2002:a5d:460f:0:b0:22c:c851:40d4 with SMTP id
 t15-20020a5d460f000000b0022cc85140d4mr1458694wrq.130.1664357714019; 
 Wed, 28 Sep 2022 02:35:14 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 a22-20020a05600c2d5600b003b332a7b898sm1106774wmg.45.2022.09.28.02.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 02:35:13 -0700 (PDT)
Date: Wed, 28 Sep 2022 05:35:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, jsnow@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220928053421-mutt-send-email-mst@kernel.org>
References: <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
 <YzLN3Y1pNO8SVn9M@redhat.com>
 <CAARzgwx+ZitnYKvmkDGA1+Aq3_yPQFSs5GfTvGaAeNmHxUSNOQ@mail.gmail.com>
 <CAARzgwwLXp9rDkQ4OTW2TUgnp_XDyMTXf6OhsKE9qAL1HTuMRQ@mail.gmail.com>
 <YzMahUpNtsas18rN@redhat.com>
 <20220927172044-mutt-send-email-mst@kernel.org>
 <2a5c6c18-e0b1-aaf8-78fa-5a12396fef87@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a5c6c18-e0b1-aaf8-78fa-5a12396fef87@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Wed, Sep 28, 2022 at 10:31:39AM +0200, Thomas Huth wrote:
> On 27/09/2022 23.21, Michael S. Tsirkin wrote:
> > On Tue, Sep 27, 2022 at 04:45:09PM +0100, Daniel P. Berrangé wrote:
> > > On Tue, Sep 27, 2022 at 07:35:13PM +0530, Ani Sinha wrote:
> ...
> > > > Alright, .gitlab-ci.yml is produced and the pipeline succeeds.
> > > > However, the question still remains, where do we keep the generated
> > > > artifacts?
> > > 
> > > The following link will always reflect the published artifacts from
> > > the most recently fully successful CI pipeline, on the 'qemu-bits'
> > > branch, and 'qemu-bits-build' CI job:
> > > 
> > > https://gitlab.com/qemu-project/biosbits-bits/-/jobs/artifacts/qemu-bits/download?job=qemu-bits-build
> > > 
> > > Tweak as needed if you push the CI to master branch instead. This
> > > link can be considered the permanent home of the artifact. I'd just
> > > suggest that the QEMU job automatically skip if it fails to download
> > > the artifact, as occassionally transient infra errors can impact
> > > it.
> > 
> > This just means once we change the test old qemu source can no longer use it.
> > Why is this a good idea? Are we so short on disk space? I thought CPU
> > is the limiting factor?
> 
> FYI, we'll soon be short on disk space, gitlab plans to introduce storage
> limits:
> 
>  https://about.gitlab.com/pricing/faq-paid-storage-transfer/
> 
>  Thomas

A good reason not to use CI artifacts to store images maybe?
I was proposing storing binaries on qemu.org not on gitlab.

-- 
MST


