Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E66C3C1D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 21:46:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peiqT-0006j7-UC; Tue, 21 Mar 2023 16:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1peiqR-0006iy-ID
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:44:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1peiqP-0005nZ-TO
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679431472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CbTCkIUFFkquebjDLjh5SiuEwrQc4iSlRVW6Lfwg480=;
 b=ESGA7vnkoFcawwzQk5l+lHdeH2FnTP//ZmRTRBEbI5bz3uqnVoMoyoQG5oGOgNgaQzMPxE
 aW9fjqjgTAfx+PTsaDO89xgbo2SvxvXE8XIzU/U0O1KT9MAXfrTthA4MPULd85gC728lM2
 fVhaUlFQBAGvqJ05+HKMIQpoVJul9P4=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-efSbPq6SN6-7xZEHW15emQ-1; Tue, 21 Mar 2023 16:44:31 -0400
X-MC-Unique: efSbPq6SN6-7xZEHW15emQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 n10-20020a67d60a000000b004262c85831cso1971841vsj.5
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 13:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679431470;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CbTCkIUFFkquebjDLjh5SiuEwrQc4iSlRVW6Lfwg480=;
 b=OI0cbNwJXW7RK3cswa1/sJ2/2OUtW0tcYhIueb+9NcqpDlXCCbh9yKcj4PkmEZ1HbS
 uZ1x+FTlHUZ2lG8sfvk1tajX9OdGG2nv3QOP8wJ3Noe47LtKcCgUXi5eLUN+/KLFeVmD
 J/94OSVblY13htYNxZR9Hn6C4uiqy4tmGBkXxOEx4bEu5+uwVMUWWddZtIubLkPAUWaW
 Vq1BFt6snXkHEnRREJYN2ls9kt8ZqVaMvAOn7Deg+P2+wJXmxMk/YTiKtJvZJkjwSjI4
 g7YOSVXdwQd1yq/g9Lq2xbamucMau11IF+UTcLta99f1+otWEaD5EwQGQXirYukTn8pC
 EGdA==
X-Gm-Message-State: AO0yUKUoSzmdrzPlVyQC44OP2JDM3YJGkD2/wxLE/VB3qNLdp1Bi9uQk
 bdNMSvL7rhicgVwA2NEbYhEuJdPzCS7lOmzAEeGWzOyx6Hz6m+R1azAOhjJ5aWnketdcizNGxpZ
 WW10YBq4WAfBvgEpzA55Vl3DFNMBna/G7O4suNPc=
X-Received: by 2002:a67:d499:0:b0:425:f1d7:79f7 with SMTP id
 g25-20020a67d499000000b00425f1d779f7mr2572091vsj.1.1679431470349; 
 Tue, 21 Mar 2023 13:44:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set9sdJc36MxIAcH8VQCK90EphFDRphdyLenKcBPleO+XMPU/tGNuAt7zYib2yd65k8dvTtLZJAzFmqWT2azgJ/o=
X-Received: by 2002:a67:d499:0:b0:425:f1d7:79f7 with SMTP id
 g25-20020a67d499000000b00425f1d779f7mr2572081vsj.1.1679431470059; Tue, 21 Mar
 2023 13:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <ZBgn90bjw9iRaTrw@yangzhon>
 <1d364b78-3dbb-87cb-daff-e92f40444ab7@kaod.org>
In-Reply-To: <1d364b78-3dbb-87cb-daff-e92f40444ab7@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 21 Mar 2023 21:44:18 +0100
Message-ID: <CABgObfb8yFNX=HFiGiM8bUXoDccz+RRkfQE2168ioh3FdMygEQ@mail.gmail.com>
Subject: Re: About the instance_finalize callback in VFIO PCI
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Yang Zhong <yang.zhong@linux.intel.com>, 
 Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000032a6bb05f76f1cf6"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000032a6bb05f76f1cf6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mar 21 mar 2023, 18:30 C=C3=A9dric Le Goater <clg@kaod.org> ha scritto:

> I would have thought that user_creatable_cleanup would have taken care
> of it. But it's not. This needs some digging.
>

user_creatable_cleanup is only for -object, not for -device.

Paolo


> C.
>
>
> > By the way, i also debugged other instance_finalize callback functions,
> > if my understanding is right, all instance_finalize callback should be
> > called from object_unref(object) from qemu_cleanup(void) in
> > ./softmmu/runstate.c. But there is no VFIO related object_unref() call =
in
> > this cleanup function, So the instance_finalize callback in vfio pci
> > should be useless? thanks!
> >
> > Regards,
> > Yang
> >
> >
>
>

--00000000000032a6bb05f76f1cf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 21 mar 2023, 18:30 C=C3=A9dric Le Goater &lt;<a=
 href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; ha scritto:</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
I would have thought that user_creatable_cleanup would have taken care<br>
of it. But it&#39;s not. This needs some digging.<br></blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">user_creatable_cleanup is =
only for -object, not for -device.<br></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
C.<br>
<br>
<br>
&gt; By the way, i also debugged other instance_finalize callback functions=
,<br>
&gt; if my understanding is right, all instance_finalize callback should be=
<br>
&gt; called from object_unref(object) from qemu_cleanup(void) in<br>
&gt; ./softmmu/runstate.c. But there is no VFIO related object_unref() call=
 in<br>
&gt; this cleanup function, So the instance_finalize callback in vfio pci<b=
r>
&gt; should be useless? thanks!<br>
&gt; <br>
&gt; Regards,<br>
&gt; Yang<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div></div>

--00000000000032a6bb05f76f1cf6--


