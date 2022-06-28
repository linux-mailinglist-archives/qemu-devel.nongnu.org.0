Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B16C55C02A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:26:57 +0200 (CEST)
Received: from localhost ([::1]:35908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68Qq-0007IF-BJ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68LZ-0007bB-RW
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:21:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68LX-0000Ib-Vb
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656411687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1QRNDI8T6GAKPnl7haDdPW6o2B2xdByEWhdiWQbGek=;
 b=i6JS48uiDko3L3FciKj+2yEx48FGdpptkM9MPe2JxTr9Itwrw9YpYSr4MlMVsPN0Sa+Xm1
 FWfrxOgZY2SjjHuT/apUO7U02PFtDYS3TORkfukmrTX85qmeJ4YBleL4MXs69Jrl4cRHJL
 S/f1PZdk+/GrL2qiOrh5oqpEb0gjxoM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-ljXWCN3YP3uJaSGjN_lMhA-1; Tue, 28 Jun 2022 06:21:26 -0400
X-MC-Unique: ljXWCN3YP3uJaSGjN_lMhA-1
Received: by mail-wr1-f70.google.com with SMTP id
 az28-20020adfe19c000000b0021bc8df3721so1010155wrb.7
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Y1QRNDI8T6GAKPnl7haDdPW6o2B2xdByEWhdiWQbGek=;
 b=1B2B1Z97XJlQHUJzZS6nzVFLds/OhboFujThJBA62rIV0yiucbGwaCorlcCX77zDoA
 cmgyEA/5iF+evBA7q7335p8nnkSNh63J9jzxT/9mJCs3eA2mMQN+QdDuqwsEzKbBu5bq
 czpaMN5iHL3R4f1W6pzvM8iNKjYG/MXk/snLQGwwyuqh6wJd3ia1eYzqDObApzaB32ku
 r2IpPGKQHPnRL7yBEPwbsUvFsJlMQ25xaBl6Vl7Hy5CWRAaLAzQjSfZB9fRN5JxA+Vyc
 45jTrx78Le32MisokdYNBfNA7awDcpYY+5m52PTCgADTYzg/+Z/qltJePgubC921N3fL
 jWkw==
X-Gm-Message-State: AJIora8M81jOlArdF0pQjdqEb7PeUoEyGPWNDX+4O/2yZLNzvzFaDMBj
 ba0Dl2cXeQ9qrGd3UsY8Vfih0ioRq3MpGhfGSTKPpDdTYMKeN6rPUW9lr7Ct3v3DZNTrQXVR8cJ
 BHIasFPmVchG1+IE=
X-Received: by 2002:a5d:4382:0:b0:21b:8c03:639f with SMTP id
 i2-20020a5d4382000000b0021b8c03639fmr17173996wrq.406.1656411684946; 
 Tue, 28 Jun 2022 03:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vAiYrrIgSZZSoEKX/ixKUmXhx6E+yOJSoeptS+cZFuO9MtJjUYxooggLQuXWl/bzu/fcCYdw==
X-Received: by 2002:a5d:4382:0:b0:21b:8c03:639f with SMTP id
 i2-20020a5d4382000000b0021b8c03639fmr17173970wrq.406.1656411684749; 
 Tue, 28 Jun 2022 03:21:24 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 4-20020a1c1904000000b0039c4506bd25sm19585811wmz.14.2022.06.28.03.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:21:24 -0700 (PDT)
Date: Tue, 28 Jun 2022 06:21:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628061749-mutt-send-email-mst@kernel.org>
References: <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <YrrUnfHwmu50JrJD@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrrUnfHwmu50JrJD@redhat.com>
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

On Tue, Jun 28, 2022 at 11:14:53AM +0100, Daniel P. Berrangé wrote:
> Now that you mention it, avocado does feel like a more appropriate fit.
> IIUC the biosbits project appears to be effectively providing a custom
> guest OS ISO image. IOW this testing is quite biased towards being
> integration testing which is the target of avocado, while qtest is much
> more to the unit testing end of the spectrum. This would avoid all the
> discussion and patches around introducing python to qtest
> 
> With regards,
> Daniel

Yes it's an ISO image but not a full OS. So IMHO not really a
integration test, more like  a unit test for ACPI - current
tests we have just compare ACPI to expected file which is
okay but very limited.

-- 
MST


