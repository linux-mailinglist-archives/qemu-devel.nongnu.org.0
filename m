Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC7855C020
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:19:29 +0200 (CEST)
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68Jc-0001MY-6Y
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68GY-000710-1V
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68GU-0007hL-MB
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656411374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GV87i9afZwTGKtaS5DtGyOyhm/9gt/StmJrM3duHQHw=;
 b=gArqTPVXOizRr8RJo65FNFurDElg/mj1avV/o3f/Y0vRNqshEZNe60uR/L1k0xYFsYE7W+
 +lkbmUiQux1zSAvFD5oFWaf1NiO09UXrekvIijgNqL3KAx3lT2VdN0JNjsFi1kh4cZFr7G
 Ool4467C3phOazRCeGrx6gp8FtadTfw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-oIXvD59wP06nJ71-G-TXrg-1; Tue, 28 Jun 2022 06:16:12 -0400
X-MC-Unique: oIXvD59wP06nJ71-G-TXrg-1
Received: by mail-wm1-f70.google.com with SMTP id
 10-20020a1c020a000000b003a03f8cc1acso5352380wmc.6
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GV87i9afZwTGKtaS5DtGyOyhm/9gt/StmJrM3duHQHw=;
 b=ayhpkU8w3KzuGhmT5Ctb/Cgup6IDyTjSQRFrXJMzrUZQRfKnHCSpskkkI7M3HnVksR
 HXEgZuvzdssjAjL+7TQFqk3DGiAIdUXImLWJs3SYy1m5M1qjaA90wGHr+C0SF1ZvXUbH
 LvndXxcuXfyU7w3PC/J3s7bYMw2N1BwTr6qOEKVig4yVYbZE63bJqNayodoF8tC9r/N8
 CfFecp5ygYqUDROW6Ve5w7IBLkHeluW9CN0sR3EUPXeMjbMnnG04s0amosBvZ4R6Ndzs
 gs5rdeZd6LHPQMbOHgbq2cMThR1k0iDWQuwS1PKHf5taUQ8DLEJW+HaLRLutQ4lVBDhM
 CisQ==
X-Gm-Message-State: AJIora9D0tRT2EQcYqoOjAmyiR+Hz4AfElb9UgVt7bmu1PJ/3Dz2UpQq
 zaCN+4qjBSLyhab3YMWhGKBLozLkqTmxwIws+KwStuqCnxJ450Cf55xnrlzRCGyUalU/SGTxTRm
 K3Ns4oqS2ILcJJ2Q=
X-Received: by 2002:adf:ec82:0:b0:21d:20a1:3f6b with SMTP id
 z2-20020adfec82000000b0021d20a13f6bmr1778532wrn.394.1656411371177; 
 Tue, 28 Jun 2022 03:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1txcQvcDp0RWcdvbISe1oYSJB1Hnx15l32gpGJxaiYLUc1UywlQCPsW0sge4xvQ7SlBESsAKA==
X-Received: by 2002:adf:ec82:0:b0:21d:20a1:3f6b with SMTP id
 z2-20020adfec82000000b0021d20a13f6bmr1778512wrn.394.1656411370981; 
 Tue, 28 Jun 2022 03:16:10 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 h13-20020adff4cd000000b002103aebe8absm13141592wrp.93.2022.06.28.03.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:16:10 -0700 (PDT)
Date: Tue, 28 Jun 2022 06:16:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org, imammedo@redhat.com
Subject: Re: [PATCH 00/12] Introduce new acpi/smbios qtests using biosbits
Message-ID: <20220628061307-mutt-send-email-mst@kernel.org>
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <Yrq3HUEghZ7IFh//@redhat.com>
 <CAARzgwzDdQGQ81bNAOg6t=4rhfdkQjunscT+x=sUOEp92R=cmg@mail.gmail.com>
 <YrrSk+HPXqCc/Jz3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrrSk+HPXqCc/Jz3@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 28, 2022 at 11:06:11AM +0100, Daniel P. Berrangé wrote:
> Ok, with that kind of size, it is definitely not something we want to
> be committing to git either,

Not to qemu git I think.

> nor consuming via a submodule since the
> latter would bloat the release tarballs too.

Hmm - why? We don't have to put the submodule in the tarball if we don't
want to. People consuming tarballs probably do not need these tests
anyway - just a basic smoketest is all that is needed.

-- 
MST


