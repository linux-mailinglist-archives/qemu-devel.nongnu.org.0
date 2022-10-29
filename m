Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90560612526
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 21:47:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oorma-0004iX-Mi; Sat, 29 Oct 2022 15:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oormY-0004iE-6L
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 15:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oormW-00077o-BN
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 15:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667072770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NR3j13xejI4mTjrmaAjSUbXcNPzz5QW1s8SAS6SbEK0=;
 b=Q3bcA0lIXMjl2v6wzfKALW6jOqwfmMTkCiLP0LVeIhOrV3V60MEGsO9KUcwfbvdRth6k5P
 5pq20/EU6RO1/Q5w3irml3SqQlVW5TsjHG4UY6x0kTHsvugc8uz26nb1Jz/IJyJbiMn47G
 eFyaNJFnisLRbNbB/rAIF1dYkbMnOJ4=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-660-PHjnbWHzMyKXdqRfkIIsZg-1; Sat, 29 Oct 2022 15:46:03 -0400
X-MC-Unique: PHjnbWHzMyKXdqRfkIIsZg-1
Received: by mail-ua1-f71.google.com with SMTP id
 y10-20020ab0560a000000b003af33bfa8c4so2917844uaa.21
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 12:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NR3j13xejI4mTjrmaAjSUbXcNPzz5QW1s8SAS6SbEK0=;
 b=DQc5v7+EEiHMQG/eFn+cB+Jbnn5pwKwXV5kFgSySQzKbdrlyfvVOlHZ6/WXJ3EM/K3
 Qb2T/opHUFtqPBxJLJVCf0Qvxb/wnUYyOVECYWgcqbMWY1oOawDBTgXmCIvSQ4d8gMTf
 fZ2s3AH0nykkUMYqwKd6RL6SCZww8BmYWJrwpCllBcJIUYK/MZ6G2hI6QnTt0d4tRvTd
 NB7xhVIpJ+DPvQhR7B/Vp1EbpIefFMomfJ6oM0CZiB3OknWLu9zOpGvDA7qRLxcTw9YX
 Z3srpymWQ9ns8XD9dFQDCupGIOHDKGr9eGp+Ms/pQl9ydeCHc7Ad8lC5NDVD+Gz9CPEF
 0peg==
X-Gm-Message-State: ACrzQf3Gemyr3xhiOxZsoeQvtG21k71OO04UZSxgyMLQlFJ5zbyWxTvw
 HPHJoYYF7IpW1ffGQUCliydn5hbFw5TREq0cVkzpjcROIEBfdkYpRTFFwP7RU3Ni8m0vCuavJ6N
 LC/HyQ6OGhXxfTmNNLV/0pFMiTBTz1Pk=
X-Received: by 2002:a1f:7349:0:b0:3b7:5939:3630 with SMTP id
 o70-20020a1f7349000000b003b759393630mr2091726vkc.19.1667072762474; 
 Sat, 29 Oct 2022 12:46:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7+ajL44h0T9fn0wJ5Huvir4AX4nRz4KOSN25qxIHcfdj3xnLKbYMgCytKEztYbNqPR0HFtGbx+ETHWfE6DuKQ=
X-Received: by 2002:a1f:7349:0:b0:3b7:5939:3630 with SMTP id
 o70-20020a1f7349000000b003b759393630mr2091719vkc.19.1667072762224; Sat, 29
 Oct 2022 12:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220627035744.23218-1-akihiko.odaki@gmail.com>
 <f44abcf0-c7f4-b6d9-ff28-6403de0ded1a@weilnetz.de>
In-Reply-To: <f44abcf0-c7f4-b6d9-ff28-6403de0ded1a@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 29 Oct 2022 21:45:50 +0200
Message-ID: <CABgObfafak0=eaNtU__vqM0xGTKJyCONuMTJwbKU=EjuqEBR7w@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] cutils: Introduce bundle mechanism
To: Stefan Weil <sw@weilnetz.de>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ceb51205ec319f79"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000ceb51205ec319f79
Content-Type: text/plain; charset="UTF-8"

Il sab 29 ott 2022, 10:52 Stefan Weil <sw@weilnetz.de> ha scritto:

when I run `wine qemu-system-i386 --version` on Debian GNU Linux stable
in the build directory of a cross build which targets Windows, I now get
an error:

Z:\home\stefan\qemu\bin\ndebug\x86_64-w64-mingw32\qemu-system-i386.exe:
--version: Could not open
'Z:\home\stefan\qemu\bin\ndebug\x86_64-w64-mingw32/qemu-bundle':
Permission denied



Where in the code does it triggers the error?

You could perhaps also try WINEDEBUG=+relay to see what Windows API calls
fail.

Paolo

--000000000000ceb51205ec319f79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"ltr"><div dir=3D"ltr">Il sab 29 ott 2022, 10:=
52 Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt;=
 ha scritto:<br></div><blockquote style=3D"min-width:150px;margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">when I ru=
n `wine qemu-system-i386 --version` on Debian GNU Linux stable<br>in the bu=
ild directory of a cross build which targets Windows, I now get<br>an error=
:<br><br>Z:\home\stefan\qemu\bin\ndebug\x86_64-w64-mingw32\qemu-system-i386=
.exe:<br>--version: Could not open<br>&#39;Z:\home\stefan\qemu\bin\ndebug\x=
86_64-w64-mingw32/qemu-bundle&#39;:<br>Permission denied</blockquote><block=
quote style=3D"min-width:150px;margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br></blockquote></div><div dir=3D"lt=
r"><br></div><div dir=3D"ltr">Where in the code does it triggers the error?=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">You could perhaps also tr=
y WINEDEBUG=3D+relay to see what Windows API calls fail.</div><div dir=3D"l=
tr"><br></div><div dir=3D"ltr">Paolo</div></div>

--000000000000ceb51205ec319f79--


