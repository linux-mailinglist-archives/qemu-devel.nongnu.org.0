Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E6B44EE2A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 21:52:13 +0100 (CET)
Received: from localhost ([::1]:54474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mldWu-0003BK-2Z
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 15:52:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mldW6-0002Vh-Bg
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 15:51:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mldW2-0000gS-Ug
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 15:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636750276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/qZ/A1RB9U0+C1LWH43N2TpRskuE8V1atKbBT+ztdw=;
 b=aDCcCC6eoXSynrqkQSnTRS3KrvvhIEzAoOsEr/XxlwWu9BZnlrNXTZDCL/YcaYhiSANUfV
 ajCbMdV12GyJRmxacwtEdi0CZvy3wVaC0DNKaGIhsUkL/DSRGX4JJBG0f3ks5QXDrr78xW
 1DSGhxU4Y1dnETRQG8OWVRlx15xk5s8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-fLFkuh6qPM-02efteldFPQ-1; Fri, 12 Nov 2021 15:51:14 -0500
X-MC-Unique: fLFkuh6qPM-02efteldFPQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 r25-20020a05640216d900b003dca3501ab4so9211123edx.15
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 12:51:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T/qZ/A1RB9U0+C1LWH43N2TpRskuE8V1atKbBT+ztdw=;
 b=RQflWfrMeQA1abmALRyDQkLrQbdJ/kubHfobDOdYx8iLM+5jpu2REgA2HgCBGIFYj4
 SfImXTGWokhlORGCK5V5TrQsYTnGdOf6ub8RExFmSBtAbTf/TCOMexIPJLJO56yk+Fdv
 V4vNjCkAu+m1GkbCkPnxO66qThLmHR/O1YwUzQCYf+O/BOiY4MjiRyqpFUT5U4KHyqAh
 PMVZzkRLmynyf5no82tKDERwBB4hfqSkU9gGfSA4Spz6gS+W+XHvPIaEeiLwhGuw+gHR
 QWrq0rJ2rBAmHXHB1+ZdkRBwiHKB2bt/mH7xBdW1A+E+sMaxxDdc5OT9XXw+h6GZ+3jr
 Nr3g==
X-Gm-Message-State: AOAM532enUu8wbvQrOZoV2/DacDuJOnPTQA5A+/PJUpt9H2GI8h0bDPL
 O07ON6PamB4EpB7UmAQAZj61hkwoG9An83X6XvUnRuSWW6NtrOCP//3f8D/bj5oDs8oU8RpFDzm
 f7sbvB6PNN3A3EL0=
X-Received: by 2002:aa7:dd47:: with SMTP id o7mr25316355edw.34.1636750273453; 
 Fri, 12 Nov 2021 12:51:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0wkvDt8Vm1QSu8YK4/LZamKXu6aFKeWtGglFBDk6xj/TP8B8ClIv5nuw7bzyv8IYSQOBgpA==
X-Received: by 2002:aa7:dd47:: with SMTP id o7mr25316335edw.34.1636750273288; 
 Fri, 12 Nov 2021 12:51:13 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id sc27sm3120796ejc.125.2021.11.12.12.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 12:51:12 -0800 (PST)
Date: Fri, 12 Nov 2021 21:51:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: Guests wont start with 15 pcie-root-port devices
Message-ID: <20211112215111.6f854f7a@redhat.com>
In-Reply-To: <YY6qJt0lXEc2SAtc@redhat.com>
References: <abff2095-9ac8-c115-bc7f-6a19b9defe51@gameservers.com>
 <YY6qJt0lXEc2SAtc@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: brak@gameservers.com, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Nov 2021 17:53:42 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, Nov 12, 2021 at 12:35:07PM -0500, Brian Rak wrote:
> > In 6.1, a guest with 15 empty pcie-root-port devices will not boot prop=
erly
> > - it just hangs on "Guest has not initialized the display (yet).".=C2=
=A0 As soon
> > as I remove the last pcie-root-port, the guest begins starting up norma=
lly.=C2=A0 =20
>=20
> Yes, QEMU 6.1 has a regression
>=20
>   https://gitlab.com/qemu-project/qemu/-/issues/641=20
>=20
>=20
> > commit e2a6290aab578b2170c1f5909fa556385dc0d820
> > Author: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > Date:=C2=A0=C2=A0 Mon Aug 2 12:00:57 2021 +0300
> >=20
> > =C2=A0=C2=A0=C2=A0 hw/pcie-root-port: Fix hotplug for PCI devices requi=
ring IO
> >=20
> > Although I can't say I really understand why that commit triggered it. =
=20
>=20
> It caused the firmware to always allocate I/O space for every port
> and there's limited total I/O space, so it runs out at 15 devices.

alternatively instead of reverting to native PCIe hotplug as in the issue
Daniel's mentioned, you can apply following fix
 https://patchew.org/QEMU/20211112110857.3116853-1-imammedo@redhat.com/

>=20
> Regards,
> Daniel


