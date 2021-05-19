Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E5238896C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 10:28:42 +0200 (CEST)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljHZJ-0007l7-3b
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 04:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ljHYR-0006s2-Sc
 for qemu-devel@nongnu.org; Wed, 19 May 2021 04:27:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ljHYQ-00080d-6X
 for qemu-devel@nongnu.org; Wed, 19 May 2021 04:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621412865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8GvIeLiZMyRSu2tS3bjDWRNnWJnkqgZWC/Dr+1tRcPQ=;
 b=Ybz4vk9UsfRqrOe74NEfWqElRKToTexl18TXbxqiRKPagGVsLmPEjV9SaNrbjGhUNnqEZV
 jDuquw+e0ia81390LEz5hoTdlFl5KAk1domxoIR3Uswf56yT453s5IfJ6J6FsVITvGTYEi
 erdVZMh8PjKS5XNCLoWmnlTjnzoMU0E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-Fb7eEzS2PlO0ZTUytoN3Yg-1; Wed, 19 May 2021 04:27:44 -0400
X-MC-Unique: Fb7eEzS2PlO0ZTUytoN3Yg-1
Received: by mail-ed1-f70.google.com with SMTP id
 h16-20020a0564020950b029038cbdae8cbaso7218293edz.6
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 01:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8GvIeLiZMyRSu2tS3bjDWRNnWJnkqgZWC/Dr+1tRcPQ=;
 b=j1zD1KwsIPPHu74tTnsl39C0D3n/XJ1zfiXHsUtn2QwPO4R0n1yCCnwVjf2VNyALpF
 IdFXyBWtFT3Mc0tjcta49RyZlfrz9f0gl4pIgIOzcBiCEPAi60JZzhJH+Da15haym0mD
 KO4f60jedzDHVUtvekr33YRmuV1TTrzdQmq5FKlYp2lZIu1o9gV8kaCC+ghyKm30WEyB
 x43AiyCEqlflL3Us51GAbwCph4mNeLpgnc9DWDzzQkHh+5QgoxxLTAgSsERDCHHu7HSd
 vepUrGaUZRgjVjvkGo9UQiUI/jMRlxqmRGYDOQNuPZ5iWKXt8Us5zxveu6XEmfK8V0Z1
 JmcQ==
X-Gm-Message-State: AOAM533Jw6XPoEl6PM+ql4oMBl3O4LaqDNJawjkV0QC9drVsMj+cTZQh
 Zp35gjT2z9DBh2u0ncFVqPyMnuWmTv45fi/npih5rMKtcPzdC97bkLgYZX8Dg6rKjsa1or6QKT8
 /lIX1hyocbxcR+u4=
X-Received: by 2002:a17:906:18b2:: with SMTP id
 c18mr11199348ejf.160.1621412863054; 
 Wed, 19 May 2021 01:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznNKEIadq3cwBNhxXWViyF/1b+CzmnDfYWEKLYolWylIEnrqWYPWlr7YPwx5RBjbPbZjU37A==
X-Received: by 2002:a17:906:18b2:: with SMTP id
 c18mr11199325ejf.160.1621412862856; 
 Wed, 19 May 2021 01:27:42 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id bh2sm11027216ejb.80.2021.05.19.01.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 01:27:42 -0700 (PDT)
Date: Wed, 19 May 2021 10:27:35 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210519082735.yru7wpusq7lnmgj5@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
 <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
MIME-Version: 1.0
In-Reply-To: <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong <yangyicong@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>, "lijiajie \(H\)" <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 18, 2021 at 09:05:39PM +0200, Andrew Jones wrote:
> The problem is that -smp 4,maxcpus=8 doesn't error out today, even though
> it doesn't do anything. OTOH, -smp 4,cores=2 doesn't error out either, but
> we're proposing that it should. Maybe we can start erroring out when
> cpus != maxcpus until hot plug is supported?
>

The more I think about this, the more I think we're in a bit of pickle and
need Peter Maydell to chime in. While we may want to make our -smp command
line option parsing more strict in order to bring some sanity to it, if
we do, then we'll break existing command lines, which, while may be
specifying useless inputs, have always gotten away with it. We probably
can't just change that now without forcing the user to opt into it.
Maybe we need to add another -smp parameter like 'strict' that has to
be set to 'on' in order to get this new behavior.

Peter, do you have some suggestions for this? A summary of the problem
we'd like to solve is as follows:

 We'd like to start describing CPU topology to guests when provided
 topology information with the '-smp ...' command line option. Currently,
 a user may provide nearly whatever it wants on that command line option
 and not get an error, even though the guest will not get a topology
 description. When building the topology its important to know what
 the user actually wants, so we're proposing to require both sockets
 and cores be given if one of them is given. Also, since we don't yet
 support hot plug for AArch64, we're proposing to enforce cpus == maxcpus.

Is it fine to make those changes to the parsing for 6.1 and later? (Note,
mach-virt will override the default smp_parse with its own, so this is
mach-virt specific.) Or, should we only do this if a new parameter is
also given, e.g. 'strict'. Something like

  -smp strict=on,cpus=4,sockets=2,cores=2

would be needed by users who want to describe cpu topologies. Without
a strict description, then they get what they get today for their
DT/ACPI topology description, nothing.

Thanks,
drew


