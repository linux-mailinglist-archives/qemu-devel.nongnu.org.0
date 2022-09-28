Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FD25EDB9D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:21:53 +0200 (CEST)
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odV8S-0006qr-8d
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTey-00050z-09
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:47:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTev-0004ll-2q
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664358436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iAMdyYrkHoEf6kQI2ktjdEyibiNtjYQujLoUUCyp+I=;
 b=fxURGC5HIC86Fgi3uCrVJwz93ecydHloX9AU9QRwQZPaFfr2MfmcMuWBXnRH/9jdjspjiO
 Ct1rMfFsoj/jmfsXArwPBhX52E0Lv6jobY9uZJuM1fUreSqHR54bI2WXZ3Y0fXlD3Mb69i
 t601ehhsT7dzgPfCnGVCl1JOU0B2eic=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-543-Dmz9Q9dcOamRQtqz8-nsGQ-1; Wed, 28 Sep 2022 05:47:14 -0400
X-MC-Unique: Dmz9Q9dcOamRQtqz8-nsGQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 e3-20020a05600c218300b003b4e4582006so385005wme.6
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4iAMdyYrkHoEf6kQI2ktjdEyibiNtjYQujLoUUCyp+I=;
 b=XuTToSmw5Ic8oRTgS3Nyl8Yb5EUfLd/WAgoCcWNZdYtL4BwVSsp7K7Px4ADCAHovKJ
 Cv6mH0XUnJIfV3xUVvfojse1qR2VwIeu3JUien+H5Ezj4pgO5C+fzyoaj8nGkTDz62Mu
 /n/lPqAKZbFEyoIaq3kunoxAolpIORBIbkceZf9FNtRzB2aLAh5tqGM+RxX9EH7MrjEh
 yxXcC0/5CGlcLGWU2DJwT45QD9A1MKJl+K2UKF7ONGO1MBA5XI8m1+L0rKwJGWjzXeml
 B9M2md5MJxl1NRwMN+dNwSNIt6w68PzK0aSnnAad9OdE4SVKpbqpKH3a2ESRXyPQW8+l
 cCNA==
X-Gm-Message-State: ACrzQf0cAc6pitkqAwobZwc6tPCP4j5MrZTLAv1icLNWOr3a7KtBtZae
 Co6StYPB7KrjTbiUlh/6UoRN85GZIcj7NT5isV72/hEhd8Jg7xPiS2nTl2buaxQB/lbrEl42jMd
 baFEPxj5VXOyZ8qs=
X-Received: by 2002:adf:fb50:0:b0:22a:e4e9:a6b3 with SMTP id
 c16-20020adffb50000000b0022ae4e9a6b3mr19620044wrs.467.1664358433412; 
 Wed, 28 Sep 2022 02:47:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jLDuyeQ460UC80tw+0Og6FXkZYpaDM93OjzKdi+6gdm4SNWRT84VEq1DKV12SgCe4J1yflA==
X-Received: by 2002:adf:fb50:0:b0:22a:e4e9:a6b3 with SMTP id
 c16-20020adffb50000000b0022ae4e9a6b3mr19620019wrs.467.1664358433171; 
 Wed, 28 Sep 2022 02:47:13 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 j8-20020a5d6188000000b0022cc3e67fc5sm2479294wru.65.2022.09.28.02.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 02:47:12 -0700 (PDT)
Date: Wed, 28 Sep 2022 05:47:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com, jsnow@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220928053729-mutt-send-email-mst@kernel.org>
References: <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
 <YzLN3Y1pNO8SVn9M@redhat.com>
 <CAARzgwx+ZitnYKvmkDGA1+Aq3_yPQFSs5GfTvGaAeNmHxUSNOQ@mail.gmail.com>
 <CAARzgwwLXp9rDkQ4OTW2TUgnp_XDyMTXf6OhsKE9qAL1HTuMRQ@mail.gmail.com>
 <YzMahUpNtsas18rN@redhat.com>
 <20220927172044-mutt-send-email-mst@kernel.org>
 <2a5c6c18-e0b1-aaf8-78fa-5a12396fef87@redhat.com>
 <YzQHb35ANVR9bHFj@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzQHb35ANVR9bHFj@redhat.com>
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

On Wed, Sep 28, 2022 at 09:35:59AM +0100, Daniel P. Berrangé wrote:
> On Wed, Sep 28, 2022 at 10:31:39AM +0200, Thomas Huth wrote:
> > On 27/09/2022 23.21, Michael S. Tsirkin wrote:
> > > On Tue, Sep 27, 2022 at 04:45:09PM +0100, Daniel P. Berrangé wrote:
> > > > On Tue, Sep 27, 2022 at 07:35:13PM +0530, Ani Sinha wrote:
> > ...
> > > > > Alright, .gitlab-ci.yml is produced and the pipeline succeeds.
> > > > > However, the question still remains, where do we keep the generated
> > > > > artifacts?
> > > > 
> > > > The following link will always reflect the published artifacts from
> > > > the most recently fully successful CI pipeline, on the 'qemu-bits'
> > > > branch, and 'qemu-bits-build' CI job:
> > > > 
> > > > https://gitlab.com/qemu-project/biosbits-bits/-/jobs/artifacts/qemu-bits/download?job=qemu-bits-build
> > > > 
> > > > Tweak as needed if you push the CI to master branch instead. This
> > > > link can be considered the permanent home of the artifact. I'd just
> > > > suggest that the QEMU job automatically skip if it fails to download
> > > > the artifact, as occassionally transient infra errors can impact
> > > > it.
> > > 
> > > This just means once we change the test old qemu source can no longer use it.
> > > Why is this a good idea? Are we so short on disk space? I thought CPU
> > > is the limiting factor?
> > 
> > FYI, we'll soon be short on disk space, gitlab plans to introduce storage
> > limits:
> > 
> >  https://about.gitlab.com/pricing/faq-paid-storage-transfer/
> 
> That's the key reason I prefer the binary as CI artifact rather than
> in Git. Once checked into git, you can never reclaim that storage
> usage, as the git repo is append only, only option is to delete the
> repo and recreate.  With CI artifacts we can control exactly which
> binaries consume storage quota at any time.
> 
> With regards,
> Daniel

I agree binaries in git are a bit of a hack.
But I also feel managing files as part of a test tool is a hack too,
it's an SCM issue.  How about e.g. git-lfs? Seems to be reasonably well
supported on gitlab. There's also gitlab but that seems to be older.


> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


