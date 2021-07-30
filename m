Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228193DBE39
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:16:55 +0200 (CEST)
Received: from localhost ([::1]:41012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9X42-0004eG-6z
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m9X2B-0003Al-RU
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m9X29-0001Z0-1l
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627668895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jHbEGFQV9FKpMNBqnQHlCYb5cXEfSMu/IvDihbBEC9Q=;
 b=L15naFTcXjjGV6rEqapEMEmC0mATs3bwgyq93YgBWJ/PgpPLe0FC3nK82BO4fC9nTtiT/k
 U7xvTOBZy1pew+BfGVmdH/kpVBkA8y72T8zNjRyJXkg8LQ9RG9zUMrYTndaW5t9G3HXQcx
 c4XXjLdOPB1Js1FhhYViG88BpP04QK8=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-_PvDmJ3aNWyUY2yMSnFs0A-1; Fri, 30 Jul 2021 14:14:54 -0400
X-MC-Unique: _PvDmJ3aNWyUY2yMSnFs0A-1
Received: by mail-oi1-f197.google.com with SMTP id
 v128-20020aca61860000b029025c02a6228cso4848556oib.21
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding:date
 :message-id:cc:subject:from:to:references:in-reply-to;
 bh=jHbEGFQV9FKpMNBqnQHlCYb5cXEfSMu/IvDihbBEC9Q=;
 b=V5xs+otHr7qdpLJNgE+TcSqLTfsDNJlKnAvuP4e8fhnjku28y1bJh6A68+D+AFYxdD
 ThxUi5PtmxsnttAM1/HGFjDN2Qp4rqkSoN+EzvLuh/qQrCNjFJegLGY2C6HGdsCOMNmw
 zmw18HGVc8lDFHP/fhdLNAFtFw+U5Eoa+2kfZfOaxH7TjuN1ZJCtHZ4zQvBNjGvnVwH8
 FxRcuSJqc8cdzVzjvTF7ydZlfnptx2G0eYshSdkuHysO43WzRHrfd4zOxTxITxrtePkw
 DiYF11bob8sMabDx/t7jrEz9UQR5s25HoiRrKwIUrmCTgxEdOpHFvInc/xi4X+ULyDtx
 a6yA==
X-Gm-Message-State: AOAM531qh6nFJn38AUs9uimviKas1K1E6WENRqSX4iGLMYZq9xJBcRkW
 SessV4afrn/2iNvvI1c3iwawX1fAHDJ2H24M9RWgz+fvHdTFYOZwPz3LVBAum+mDoVL5aoVdIAb
 L7DXEfLLbQvfPgY4=
X-Received: by 2002:a9d:5381:: with SMTP id w1mr3010662otg.259.1627668893459; 
 Fri, 30 Jul 2021 11:14:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziJ7W9TQTGZRTpeleOj0Cz+bbvZ0uyQtCnAjC8zipuPhxDxpKJKDHQ75/bFrFw0K+dueFOTw==
X-Received: by 2002:a9d:5381:: with SMTP id w1mr3010644otg.259.1627668893254; 
 Fri, 30 Jul 2021 11:14:53 -0700 (PDT)
Received: from localhost (ip68-103-222-15.ks.ok.cox.net. [68.103.222.15])
 by smtp.gmail.com with ESMTPSA id t4sm395581oiw.19.2021.07.30.11.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:14:52 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 30 Jul 2021 13:14:51 -0500
Message-Id: <CD6OGU9ZTOBE.2W1TECD9E7IRG@fedora>
Subject: Re: [PATCH v3 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
From: "Connor Kuehl" <ckuehl@redhat.com>
To: "Dov Murik" <dovmurik@linux.ibm.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>
References: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
 <2dc6c60e-48f8-7c6f-6131-0bc1020e106f@redhat.com>
 <fbf2dd1f-150e-beb5-bf17-fc5dc787ab0d@redhat.com>
 <05d0ae90-a45f-157b-d37c-942bc0442449@redhat.com>
 <203b655c-809b-b418-f61c-982e587fa9f2@linux.ibm.com>
 <CD6K1W4R8HRF.3G3JJ2YD4C8I3@fedora>
 <8af634e5-34be-1532-3afb-75ec4306fc87@linux.ibm.com>
In-Reply-To: <8af634e5-34be-1532-3afb-75ec4306fc87@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org, Tobin
 Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri Jul 30, 2021 at 1:02 PM CDT, Dov Murik wrote:
>
>
> > Awesome! Unfortunately, it's looking like we'll have to wait[1] for QEM=
U to
> > thaw before this series goes in.
> >=20
>
> Thanks for explaining this. Do I need to do anything after 6.1 is
> released? Ping? Rebase and re-send?

Rebase and re-send. I think your patches already have the Reviewed-by
tags in the patch descriptions, but if that's not the case, make sure
you add them for the re-send so it's obvious that the patches have
already been reviewed.

Thank you,

Connor


