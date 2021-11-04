Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308EE444FDA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 08:57:55 +0100 (CET)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miXdC-000416-4y
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 03:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1miXcA-0003K5-6V
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1miXc6-0004mj-L2
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636012605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9uzYspcK0OD/nx9eDDu0e+7v95LW3UBbGTWMxsiyh5s=;
 b=RMU0Tr68lwwl7WFPCZu/Cs1fta1QOw0ECSz11fcbBRXEFsy4AfWux36ShgHyu/xEW40VVk
 QoBhPnu1WDyBzp62Yz0XnWhNAmJ+60JyQBKeS85zdSaHCh3hKzPfkaUZxNa+vIQVvPy1op
 4QJudlN2HvScANBrC8TYNcxE0mOSAiA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-RINYlJ76Me239gLhngyzxg-1; Thu, 04 Nov 2021 03:56:44 -0400
X-MC-Unique: RINYlJ76Me239gLhngyzxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so2172069wmc.2
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 00:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9uzYspcK0OD/nx9eDDu0e+7v95LW3UBbGTWMxsiyh5s=;
 b=Te6xXixzEG0T13hZKbPP8y6Ir+uR+a0EUee0IWVQFg3khs9asME+1FVGXZBAbJcmT0
 xDeYOh/GDSriqYcXuJdfnGHhOcPk7yCtxJ1kzEcYrLbFI4CNQwODPyOoAbr6UzFsH1Xh
 ksBqcla/rRyVAknt44gjgyMMGUTf9BISzPVcoqif0BNZUGQkHt2qX0SFScEKV+ngs0Pl
 AlnRe1CX7JhslOn9pJh4ga2doJ9cNHFVGMcYPkSsKU/3ndZVddcA2xfwk+c5MYKFywvz
 +qETwFwS3zb7yWJamY8XThK3KDTAMSxV9uGaiAcmRUUfeAiG09y68p+dQeNDQWKBZrS4
 J34w==
X-Gm-Message-State: AOAM532kipfX/2+q85LH0276LC/9YkIztNr9HigOuGRPVp2wkukQokmE
 6CQGKelS2KTQoeJM7sYRhb7pBO3gC2xLxQvaHnicB7viO1hBNcFS1coCWKAGzf8TMgHl8McSZXE
 fw3de7w3PtmIa85Q=
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr27658274wrs.270.1636012603095; 
 Thu, 04 Nov 2021 00:56:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg8TIqCfm8dYK9EX9JLyDoYHv4OTh1gER4Giefs9poffvJu6/bCsoNQPBliQbT2j3kc7lmHA==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr27658238wrs.270.1636012602857; 
 Thu, 04 Nov 2021 00:56:42 -0700 (PDT)
Received: from redhat.com ([2.55.13.185])
 by smtp.gmail.com with ESMTPSA id c79sm4454945wme.43.2021.11.04.00.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 00:56:42 -0700 (PDT)
Date: Thu, 4 Nov 2021 03:56:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v6 6/7] tests/acpi: add test case for VIOT on q35 machine
Message-ID: <20211104035525-mutt-send-email-mst@kernel.org>
References: <20211026182024.2642038-1-jean-philippe@linaro.org>
 <20211026182024.2642038-7-jean-philippe@linaro.org>
 <20211101193358-mutt-send-email-mst@kernel.org>
 <YYOQkbtkfIgfYltF@myrica>
MIME-Version: 1.0
In-Reply-To: <YYOQkbtkfIgfYltF@myrica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, eric.auger@redhat.com,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 04, 2021 at 07:49:37AM +0000, Jean-Philippe Brucker wrote:
> Hi Michael,
> 
> On Mon, Nov 01, 2021 at 07:35:04PM -0400, Michael S. Tsirkin wrote:
> > On Tue, Oct 26, 2021 at 07:20:25PM +0100, Jean-Philippe Brucker wrote:
> > > Add a test case for VIOT on the q35 machine. To test complex topologies
> > > it has two PCIe buses that bypass the IOMMU (and are therefore not
> > > described by VIOT), and two buses that are translated by virtio-iommu.
> > > 
> > > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > seems to need the bypass property patch
> > 
> > qemu-system-x86_64: Property 'pc-q35-6.2-machine.default-bus-bypass-iommu' not found
> > 
> > given Paolo decided to pick that one up, pls ping me
> > once that one is merged.
> 
> That patch has now been merged
> 
> Thanks,
> Jean

Right but OTOH we are in freeze now. Will try to keep it queued,
but it'd be nice if you can repost it after the release.

-- 
MST


