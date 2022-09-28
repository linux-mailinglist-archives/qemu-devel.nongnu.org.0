Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F6A5EDBE6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:38:15 +0200 (CEST)
Received: from localhost ([::1]:36632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVOI-0006tu-6x
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odSY9-0005CI-Cs
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:36:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odSY5-00031D-JH
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664354167;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZaEjQesn4XYv513VP97X+CjyiaUo1u5G7XLc/Pplgk=;
 b=TRsBlkrULC3hBd3GGlhq80k2yQRqn2VIY8pX1+iB0vXKoxy+EuxX93DO4E5OrXZFrHrNFL
 FLURQZf+4JlwUBGvg6u8zoLe4+u3beiikQC9xeyccdscv8M1+eDZSmUE20q0Q7D07w2Yca
 TGaHZ4l5cQDspMttlhYWKv4YgGlLC94=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-H2JmkPOEN7qPR36wgdvQcQ-1; Wed, 28 Sep 2022 04:36:03 -0400
X-MC-Unique: H2JmkPOEN7qPR36wgdvQcQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35D44381494C;
 Wed, 28 Sep 2022 08:36:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BEC3492B04;
 Wed, 28 Sep 2022 08:36:01 +0000 (UTC)
Date: Wed, 28 Sep 2022 09:35:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com, jsnow@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <YzQHb35ANVR9bHFj@redhat.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a5c6c18-e0b1-aaf8-78fa-5a12396fef87@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
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

That's the key reason I prefer the binary as CI artifact rather than
in Git. Once checked into git, you can never reclaim that storage
usage, as the git repo is append only, only option is to delete the
repo and recreate.  With CI artifacts we can control exactly which
binaries consume storage quota at any time.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


