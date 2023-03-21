Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CD76C3C27
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 21:48:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peiu3-0007td-QG; Tue, 21 Mar 2023 16:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1peitz-0007tL-0e
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:48:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1peitw-0000Ii-L1
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679431691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+hnA6jvWQ6cwOFilhJtv7QQgf8MLnBUMt6DiNcpIPxc=;
 b=QKo5WLoXWne83z1n4Egr98k7VVrGiG5zhK+I+Ev4UXv6oi5oLIkzdDykq70K5L16R2AHOq
 IF0pEcBgptrshz/Ck0fYAx5La56OOjpCu1+sJeM6PARMea3Vy5ACCWLhMEN5eu6guPas+H
 0Wc6tcTjQd6Z6qTI5CMrxyMuINYpftM=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-jWgacPy5MFuoy5OorG_48g-1; Tue, 21 Mar 2023 16:48:09 -0400
X-MC-Unique: jWgacPy5MFuoy5OorG_48g-1
Received: by mail-ua1-f70.google.com with SMTP id
 c18-20020ab030d2000000b00751d7bbfb13so8262485uam.4
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 13:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679431689;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+hnA6jvWQ6cwOFilhJtv7QQgf8MLnBUMt6DiNcpIPxc=;
 b=KJTONAhPxeNX5dUqlZQlrL6YSKYRhgpa72pXZvsAUVKP2o8kYUAHdrMhJAfnQi9sKc
 2a4OKVV488E7xY+49Hv+ilO7/iOOI0WsPd2ze++gCdob+l6HUt6eQhMGlaRNgYz92C7m
 mDy+KFyFI7wMR+w+WgsQNV1vLah+yEX8nr/j+WPhBvikkkP/wXHMUfH4dI1m6Vrlg4lb
 wdJzuIb3njPtf+WmQdZS972EPPUeEQHkxL2Pg8+RFOXYq5EfIWxq/t5WRAa4dRHltsDP
 R2VmrkNxWSg5xE8eZHrToJMdHV1WRwgn4jz8/ssmBKn93xEVv1KfGuumGiq7hhZtQb76
 4k6A==
X-Gm-Message-State: AO0yUKUxJC8R8S3lBKAwX0z1rtVm6M+vWL3+1txeJBAAOKmK2qOUMKjQ
 VamJ1e10FOEaWzRfd2+ObYy4ieZXkg1TbAntaTJsuEGv92iFvs+in3PzATRi2aSXxn1wVT7YZS5
 3Kw7glwOnokmXKxCkIYxT0r6JCalIhok=
X-Received: by 2002:a67:c813:0:b0:425:d4de:718a with SMTP id
 u19-20020a67c813000000b00425d4de718amr2512442vsk.1.1679431688940; 
 Tue, 21 Mar 2023 13:48:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set86guPKgwExEua4FCse6FO1rvhTCeIQNXnjDOWeAD23MTal2zkeD0qkuzX7WZOxHMkaYkghvbj8pTuIkGNi4NQ=
X-Received: by 2002:a67:c813:0:b0:425:d4de:718a with SMTP id
 u19-20020a67c813000000b00425d4de718amr2512423vsk.1.1679431688640; Tue, 21 Mar
 2023 13:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230320131648.61728-1-imbrenda@linux.ibm.com>
 <20230320131648.61728-2-imbrenda@linux.ibm.com> <87v8ivmocr.fsf@pond.sub.org>
 <6a9ef526-1b30-e9a6-37ee-59ca3dadea9d@redhat.com>
In-Reply-To: <6a9ef526-1b30-e9a6-37ee-59ca3dadea9d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 21 Mar 2023 21:47:57 +0100
Message-ID: <CABgObfaN3sLipc2UuoZc2yHP0YK3e59sK5wn8gpkJ8xgNHc7qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] util/async-teardown: wire up
 query-command-line-options
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 qemu-devel <qemu-devel@nongnu.org>, David Hildenbrand <david@redhat.com>, 
 "Borntraeger, Christian" <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, fiuczy@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, "P. Berrange, Daniel" <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000039e9a905f76f298e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

--00000000000039e9a905f76f298e
Content-Type: text/plain; charset="UTF-8"

Il lun 20 mar 2023, 16:42 Thomas Huth <thuth@redhat.com> ha scritto:

> Would it make sense to add it e.g. to "-action" instead, i.e. something
> like
> "-action teardown=async" ?
>

-action is just a wrapper for the action-set QMP command. I don't think it
fits very well; its arguments are only guest actions while asynchronous
tear down happens for example when you issue a quit command on the monitor.

Paolo

  Thomas
>
>

--00000000000039e9a905f76f298e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">Il lun 20 mar 2023, 16:42 Thomas Huth &lt;<a =
href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; ha scritto:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Would it make sense to add it e.g. to &q=
uot;-action&quot; instead, i.e. something like <br>
&quot;-action teardown=3Dasync&quot; ?<br></blockquote></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">-action is just a wrapper for the action-se=
t QMP command. I don&#39;t think it fits very well; its arguments are only =
guest actions while asynchronous tear down happens for example when you iss=
ue a quit command on the monitor.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div class=3D"gmail_quote"=
 dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
=C2=A0 Thomas<br>
<br>
</blockquote></div></div>

--00000000000039e9a905f76f298e--


