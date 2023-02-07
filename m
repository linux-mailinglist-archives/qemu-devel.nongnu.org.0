Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D727068DDEE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:28:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQny-0007Ds-DN; Tue, 07 Feb 2023 11:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pPQnw-0007DL-9G
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:26:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pPQnu-0006tJ-Lb
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675787205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/zvo/P3drxGjZio9MXuIw1gChfjHCElltvwNUnge9qQ=;
 b=RjHQS8Y4pnCXabT/+nuye64ur+7W4i+OnExOUQLryWUKDXzECp/OVbCaqlCKlV6bkuXFHC
 46AmmZKoTzLsOnhgjtQFC6cJwun6OkBaQxt6sSxhHyJhRJk/HQ223BWXDUGCfL+FllcCR6
 AlgiWDBpa6qyvEcmZXZ0I6zIsnAvIJw=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-8FAFMBRBMj2-ntlHA8OQeA-1; Tue, 07 Feb 2023 11:26:42 -0500
X-MC-Unique: 8FAFMBRBMj2-ntlHA8OQeA-1
Received: by mail-ua1-f70.google.com with SMTP id
 s6-20020a9f2986000000b00683c94d9881so1801817uas.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 08:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/zvo/P3drxGjZio9MXuIw1gChfjHCElltvwNUnge9qQ=;
 b=NQReWXnSI+ZCK65wmufi/QyQS0+sMXhnE4y1wNLqSOC4hmETK1pgHG3ig1lXSzOkqI
 N7pxmupFQEMHGvNvtCHRskwAOzYh6Rd+wQn3JAXGJvSiH1WiqW2v+j8bPG6M5GACJvdG
 uSAW8F6GrI45La7niMIdFG/a/yqmoYow0D4gXrova1+BeN+OBCQ7ekZY1ACTaqmyVGVx
 4StAH9N7tGKQThC1w0VQh1o2B/52/1IwB4lXnGFKPz5JhPN7bJ9lUKeC3wm9B/j8S3Wl
 rj/DTPphkuC+MG8WS5srQeDu4kIE7vfrMt1YjUdQchmXdMBejN+jiDbHDdtFSb7/x/mG
 IaxA==
X-Gm-Message-State: AO0yUKWwHXlR7PTAsa+u3XXI0pk1PHlRmnhBNiIJ0/TeExohWH5Bjc9c
 S3jm4woizzMMv3au+r7xz8XN3ka2rC9N0Gw80copEv3seeudGKlOb+EzI0bmhWpeB45un8w8wGr
 Em2unk1Fd0Du7PzDuOWzBKE2waWg2FCg=
X-Received: by 2002:a05:6102:4411:b0:411:7cf7:8b52 with SMTP id
 df17-20020a056102441100b004117cf78b52mr495619vsb.40.1675787201685; 
 Tue, 07 Feb 2023 08:26:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9vbKlULSFphrURMibwXqgvM3BH2u5kmS8Gwbfi6rDl2pTD1z7YYSyItSlgbgIZj+tWA9kP9BWsYu835v1KgLg=
X-Received: by 2002:a05:6102:4411:b0:411:7cf7:8b52 with SMTP id
 df17-20020a056102441100b004117cf78b52mr495613vsb.40.1675787201490; Tue, 07
 Feb 2023 08:26:41 -0800 (PST)
MIME-Version: 1.0
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-9-armbru@redhat.com>
 <874jrxc0vd.fsf@secure.mitica>
In-Reply-To: <874jrxc0vd.fsf@secure.mitica>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 7 Feb 2023 18:26:30 +0200
Message-ID: <CAPMcbCpqus7pCPMiGwwvZQ6c29MPwRoZWVW2ePJGCYEGhJux-g@mail.gmail.com>
Subject: Re: [PATCH 08/12] qga: Drop dangling reference to
 QERR_QGA_LOGGING_DISABLED
To: quintela@redhat.com
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com, 
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 jiri@resnulli.us, jasowang@redhat.com, pavel.dovgaluk@ispras.ru, 
 pbonzini@redhat.com, zhanghailiang@xfusion.com, dgilbert@redhat.com, 
 michael.roth@amd.com
Content-Type: multipart/alternative; boundary="000000000000dd4a1105f41e9c09"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

--000000000000dd4a1105f41e9c09
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Tue, Feb 7, 2023 at 10:53 AM Juan Quintela <quintela@redhat.com> wrote:

> Markus Armbruster <armbru@redhat.com> wrote:
> > slog()'s function comment advises to use QERR_QGA_LOGGING_DISABLED.
> > This macro never existed.  The reference got added in commit
> > e3d4d25206a "guest agent: add guest agent RPCs/commands" along with
> > QERR_QGA_LOGGING_FAILED, so maybe that one was meant.  However,
> > QERR_QGA_LOGGING_FAILED was never actually used, and was removed in
> > commit d73f0beadb5 "qerror.h: Remove unused error classes".
> >
> > Drop the dangling reference.
> >
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
>

--000000000000dd4a1105f41e9c09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 7=
, 2023 at 10:53 AM Juan Quintela &lt;<a href=3D"mailto:quintela@redhat.com"=
>quintela@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.c=
om" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt; slog()&#39;s function comment advises to use QERR_QGA_LOGGING_DISABLED=
.<br>
&gt; This macro never existed.=C2=A0 The reference got added in commit<br>
&gt; e3d4d25206a &quot;guest agent: add guest agent RPCs/commands&quot; alo=
ng with<br>
&gt; QERR_QGA_LOGGING_FAILED, so maybe that one was meant.=C2=A0 However,<b=
r>
&gt; QERR_QGA_LOGGING_FAILED was never actually used, and was removed in<br=
>
&gt; commit d73f0beadb5 &quot;qerror.h: Remove unused error classes&quot;.<=
br>
&gt;<br>
&gt; Drop the dangling reference.<br>
&gt;<br>
&gt; Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.c=
om" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
<br>
Reviewed-by: Juan Quintela &lt;<a href=3D"mailto:quintela@redhat.com" targe=
t=3D"_blank">quintela@redhat.com</a>&gt;<br>
<br>
</blockquote></div>

--000000000000dd4a1105f41e9c09--


