Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F2A64EE05
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:37:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Cle-0000Rm-1I; Fri, 16 Dec 2022 10:36:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6Clc-0000RU-Fi
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:36:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6Cla-0004N8-Kq
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671205012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2uSyRPzY6lfh0PEa7ZTN0/Z3mCpxgPvumXlYGcbd7/s=;
 b=CRjuBini3isK9yhE24HAXEhVIcPhdSmO/Tx3K7gZ++QqKIPBdwzq8rw2ph29N00XyuxlZd
 ThhCXtAMiWcWf7MjQrmRy5VpeVTllgD9xZU1y8cxMHH6nU/XNV3fmnYe5UBYMM7dlfEw27
 M+BxWH7zST4KkNVTfOSb4wWPQzfwA0U=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-92-6V6PRLOLMfWl1zua8GYIJA-1; Fri, 16 Dec 2022 10:36:51 -0500
X-MC-Unique: 6V6PRLOLMfWl1zua8GYIJA-1
Received: by mail-vs1-f70.google.com with SMTP id
 q125-20020a675c83000000b003b160795974so667350vsb.18
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 07:36:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2uSyRPzY6lfh0PEa7ZTN0/Z3mCpxgPvumXlYGcbd7/s=;
 b=TRByGXNm3GLy3elyAgDryGw/CjGx68SxTlu+PfATDphL7mlILf1m5tL6ybStCzlNRx
 LSj0DJQ2srgpt7YquQb8lPwz/IQUsFMxYZyl0+iC0uCnkTsrnQy7tyi6wfbwum6T6DO/
 tvvJRpNM23VA5hhZ4Szymzc1JyiswLMzAjQW7gtS4C553DDsWKIg8/1wl5T9jyt9UUgt
 IufwBIj2DA94Mf4fRLF+34IhrwdTpN2yA0RqtwOQ+/IrVWss/7rJMu7xAUEVgNn+N4dP
 Ix7b/863ti0+oEJMDPNkYEBF1yuLhd41dZFvxx9HgarG3h/SUJyWPWn2p6nGsLoWfPZ5
 LU7g==
X-Gm-Message-State: ANoB5pmEMWQW+CtJJaijPFnBpKqlruNRO/KKu42S3+WX1FiK9Y/TrQ9K
 sT/1uxqj5hTT1+EVVqrVs5vEvhyG6e2ISwjYKsqVKDiDqFrK9UHE3UZgrI0m1JjGvDttX6rOdmP
 W1c7UxemTYO9ntv7MkT9pz38A6JPXYiI=
X-Received: by 2002:a67:f908:0:b0:3b2:f5f2:7a83 with SMTP id
 t8-20020a67f908000000b003b2f5f27a83mr7154981vsq.74.1671205010583; 
 Fri, 16 Dec 2022 07:36:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6qylyzguaozLeQQKEjzfc6S0neI2SvhM7QkxXUQtjVh33WVE/lpx145H+HvwoifFjRVHh1fLUKZUOPIrbB+A4=
X-Received: by 2002:a67:f908:0:b0:3b2:f5f2:7a83 with SMTP id
 t8-20020a67f908000000b003b2f5f27a83mr7154977vsq.74.1671205010276; Fri, 16 Dec
 2022 07:36:50 -0800 (PST)
MIME-Version: 1.0
References: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
 <a0d15083-c257-6170-a3c7-2baf1ec58a9a@virtuozzo.com>
 <CAPMcbCoEfeZW0YQRN1To6zdGEP4g4GV3PBS9EDGqs_dYFNTF4g@mail.gmail.com>
 <CAPMcbCp0Q9v5vfPXLyHoacQqcXrYLKb=jWmT4mX9krr02CkQaA@mail.gmail.com>
 <6730d84c-5b2b-d902-9f17-16ef33708544@virtuozzo.com>
In-Reply-To: <6730d84c-5b2b-d902-9f17-16ef33708544@virtuozzo.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Fri, 16 Dec 2022 17:36:39 +0200
Message-ID: <CAPMcbCq+omZgpouJ-hbescMe+PSk4wFaxtaPb2Zyob2L12dEfg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] qga: improve "syslog" domain logging
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, marcandre.lureau@gmail.com, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="000000000000fc21b205eff3bc9c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

--000000000000fc21b205eff3bc9c
Content-Type: text/plain; charset="UTF-8"

Thanks.

You are right. I tested another command and don't see logs in the event
viewer.

PR was sent.

On Fri, Dec 16, 2022 at 5:27 PM Andrey Drobyshev <
andrey.drobyshev@virtuozzo.com> wrote:

> On 12/16/22 12:01, Konstantin Kostiuk wrote:
> > Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com
> > <mailto:kkostiuk@redhat.com>>
> > Tested-by: Konstantin Kostiuk <kkostiuk@redhat.com
> > <mailto:kkostiuk@redhat.com>>
> >
> >
> > Hi Andrey,
> > Do you expect Event Viewer to be empty by default in the current
> > implementation?
> > Currently, all logs that we write in the guest agent do not have
> > "syslog" domain
> > so we will have logs only in file.
> >
> > [...]
>
> Do they not really?  For instance, I see quite a few such calls in the
> implementation of guest commands:
>
> # grep 'slog(' qga/commands-win32.c | wc -l
> 21
>
> They just need to be triggered.  For instance, if I build QGA with these
> patches applied, run it in a VM make a fsfreeze call:
>
> # virsh domfsfreeze win2k16-qga-win
> Froze 2 filesystem(s)
>
> then I see the message "guest-fsfreeze called" in the event log.
>
>

--000000000000fc21b205eff3bc9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks.</div><div><br></div><div>You are right. I tes=
ted another command and don&#39;t see logs in the event viewer. <br></div><=
div><br></div><div>PR was sent.<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 16, 2022 at 5:27 PM An=
drey Drobyshev &lt;<a href=3D"mailto:andrey.drobyshev@virtuozzo.com">andrey=
.drobyshev@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 12/16/22 12:01, Konstantin Kostiuk wrote:<br>
&gt; Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.=
com" target=3D"_blank">kkostiuk@redhat.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kk=
ostiuk@redhat.com</a>&gt;&gt;<br>
&gt; Tested-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.co=
m" target=3D"_blank">kkostiuk@redhat.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kk=
ostiuk@redhat.com</a>&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; Hi Andrey,<br>
&gt; Do you expect Event Viewer to be empty by default in the current<br>
&gt; implementation?<br>
&gt; Currently, all logs that we write in the guest agent do not have<br>
&gt; &quot;syslog&quot; domain<br>
&gt; so we will have logs only in file.<br>
&gt; <br>
&gt; [...]<br>
<br>
Do they not really?=C2=A0 For instance, I see quite a few such calls in the=
<br>
implementation of guest commands:<br>
<br>
# grep &#39;slog(&#39; qga/commands-win32.c | wc -l<br>
21<br>
<br>
They just need to be triggered.=C2=A0 For instance, if I build QGA with the=
se<br>
patches applied, run it in a VM make a fsfreeze call:<br>
<br>
# virsh domfsfreeze win2k16-qga-win<br>
Froze 2 filesystem(s)<br>
<br>
then I see the message &quot;guest-fsfreeze called&quot; in the event log.<=
br>
<br>
</blockquote></div>

--000000000000fc21b205eff3bc9c--


