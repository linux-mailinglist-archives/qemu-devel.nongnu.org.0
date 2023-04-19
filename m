Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEEC6E7FFE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 19:02:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppBAa-0002IV-AJ; Wed, 19 Apr 2023 13:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppBAH-0002Hn-ES
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppBAG-0008Ec-1Q
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681923612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=83B/gbYSh4nEH9mITxLK12kwX0u+TqxmJjFHM4klNWw=;
 b=XwVkDjFsog+Jp+CcwzlD3iHcofORLSq2uzVB2AvWEAlyeMZrQKuiRbeUacgSnXQOlS0iRG
 y5PsLw35bLgA48oQBXBYvMfy1RxYmT/DULW3vkrXe99HQTR0OfuVmkcCAVLJDpgUgK0p94
 cS3ZLZIG38COc3gBGK4Ind0+TDDceMk=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-kTs4_bXfPMqj5PX4m10UGg-1; Wed, 19 Apr 2023 13:00:05 -0400
X-MC-Unique: kTs4_bXfPMqj5PX4m10UGg-1
Received: by mail-vs1-f70.google.com with SMTP id
 d28-20020a67e11c000000b0042e3d044b8bso102234vsl.5
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 10:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681923601; x=1684515601;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=83B/gbYSh4nEH9mITxLK12kwX0u+TqxmJjFHM4klNWw=;
 b=DgJ7CkfY/hON21Ov8VWs01ljlavmQLhiZWFbs2LtsILwUiK8tXaQtf7RsIvDniHwL0
 GPf+OB/glKzFYIj3SsC+hvWJKsKz5CKj6GIGgBeqheWg+PEqvYaQK9yRNfuTHzxJf8Gw
 PFlxNcXhWEGgwURnKUMQ8/E6gF3FIQkK2xVAL8PxAlPpAHbMBtZus4XB5RdDhzPKRr6X
 tyd0UlpPsMMJXKBMkZmCP3KKlU2u0Z3OTmSbER4HaXTYP/aHd8EKNbRPXosUeW6CCujf
 /VRwYSx1KUeXHGdR3uAkR20u1HcVgZxJAp7RDzF+29POD/k5YE15oWdWn276exrqc4mg
 GK3A==
X-Gm-Message-State: AAQBX9eLk5bq5606ZE+nJJAd3BRnBvsa/5BlpqjM9E3q2flh5cA+XD7t
 XZg0SwZ06opKV35ql1OLKGFsYllo10+JQfsOmk/Prdqski80Ep0zXd8sDSUwmQ0aEipUfbZe0EU
 zcAnHGMKm9hEtlGb7WgzIAo2JFFKXCsI=
X-Received: by 2002:ab0:16d4:0:b0:772:730d:3302 with SMTP id
 g20-20020ab016d4000000b00772730d3302mr109253uaf.0.1681923601232; 
 Wed, 19 Apr 2023 10:00:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350bp3M/o878ZGnStSiKpRIkoFb0DQAbdpIdkVuKjIXhYszgHXJ2EjiD1kNYV85clL8RthSh2AxH5QKxKXtoQVpQ=
X-Received: by 2002:ab0:16d4:0:b0:772:730d:3302 with SMTP id
 g20-20020ab016d4000000b00772730d3302mr109249uaf.0.1681923601005; Wed, 19 Apr
 2023 10:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com>
In-Reply-To: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 19 Apr 2023 18:59:49 +0200
Message-ID: <CABgObfYOEPbOLvs=AQshA65y8bDw0PMycG1z-yZ+AjuzYtkd2w@mail.gmail.com>
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Content-Type: multipart/alternative; boundary="000000000000c7152c05f9b35afc"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--000000000000c7152c05f9b35afc
Content-Type: text/plain; charset="UTF-8"

Il mer 19 apr 2023, 16:11 Fiona Ebner <f.ebner@proxmox.com> ha scritto:

Hi,
while debugging a completely different issue, I was surprised to see
do_qmp_dispatch_bh being run in a vCPU thread. I was under the
impression that QMP functions are supposed to be executed in the main
thread. Is that wrong



While monitor commands in general start only in the main thread, bottom
halves can also run (via aio_poll) in the vCPU threads, always under the
BQL.

If that's not valid, perhaps you can schedule the monitor's bottom half in
iohandler_get_aio_context() instead?

Paolo


>
>

--000000000000c7152c05f9b35afc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><div dir=3D"ltr">Il mer 19 apr 2023, 16=
:11 Fiona Ebner &lt;<a href=3D"mailto:f.ebner@proxmox.com">f.ebner@proxmox.=
com</a>&gt; ha scritto:<br></div><blockquote style=3D"min-width:150px;margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi,<br>while debugging a completely different issue, I was surprised to s=
ee<br>do_qmp_dispatch_bh being run in a vCPU thread. I was under the<br>imp=
ression that QMP functions are supposed to be executed in the main<br>threa=
d. Is that wrong</blockquote><blockquote style=3D"min-width:150px;margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r></blockquote></div><div dir=3D"auto"><br></div>While monitor commands in =
general start only in the main thread, bottom halves can also run (via aio_=
poll) in the vCPU threads, always under the BQL.<div dir=3D"auto"><br></div=
><div dir=3D"auto">If that&#39;s not valid, perhaps you can schedule the mo=
nitor&#39;s bottom half=C2=A0in iohandler_get_aio_context() instead?</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Paolo<br><br><div class=3D"gma=
il_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br><br></blockquote>=
</div></div></div>

--000000000000c7152c05f9b35afc--


