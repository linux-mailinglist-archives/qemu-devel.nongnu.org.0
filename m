Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB3B44B1D5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:17:40 +0100 (CET)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUkd-0005Ym-BU
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:17:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mkUiX-0004DN-MI
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:15:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mkUiU-0007BF-Ie
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636478125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ixQ1Zw5QLFaoZMtKaSnIwHlVBUS9sh3wazsT217jcuI=;
 b=faVO87zUf7OHavo3TXeX55gylxAsIrAr71xYAM7eYuzNlYQKx16FCir4+Q402ba8ESd3Sv
 jxNCHTQFjbhTvF1a0q7FECWxlfiqkoXnJYqWMU9334JlzxrlqdYRokD99tsFiRY8lGZEoI
 sKkkdmTGBcShKTgcZwHqBWOMs8WdtWs=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-r19FPSwdPK6HmiUbWu1R3Q-1; Tue, 09 Nov 2021 12:15:24 -0500
X-MC-Unique: r19FPSwdPK6HmiUbWu1R3Q-1
Received: by mail-vk1-f198.google.com with SMTP id
 s12-20020a1ff40c000000b002fa86937165so2941880vkh.8
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 09:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ixQ1Zw5QLFaoZMtKaSnIwHlVBUS9sh3wazsT217jcuI=;
 b=FeZLHnK7H1CHqiBWjWf/RvYw3hb0BGiqTzCHbYkssBCxvvnztVukD9US/5ijMf/kq+
 qxH408RR+vFGjN7igavSGjugqL51jtt+Oz6jdrLMxvEf9PVLl59VpxGAlzUFHs7D4OYg
 9tS90D4ugz2qrOsX6vjyCeXWfkSZ8i75OD5HttyEU4naayMkqezdRHLBPe/QA2dT/PP1
 17Uo916JVeT1btARjC7vy9mPUAVbS69sy8uMtHt7tT594sZ/d1s9wVVmyF0vpW6SMXab
 eSE0poBQM5fbbEuio/wnaX3GCDOHmVvv8RcWU/l9HVasDi392LHCzIzQynQVF6T/XRt0
 Dxyw==
X-Gm-Message-State: AOAM531+H5xptihOSUQVKF3EbISfI42jlqSfn9SZFpLcFn47LR6yCV9r
 FmmUyG9+jTNBfcUHs9LKNqKCGmkKjHk8VRGu/0WCpwv+/DOG6TAHK7kgs9F873oSoIjvG+usEFe
 D8SboiMaTZCg/ODUBa47KQFnLPKpExH4=
X-Received: by 2002:a67:f685:: with SMTP id n5mr119559073vso.31.1636478123943; 
 Tue, 09 Nov 2021 09:15:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLrb9SOyrIYNndJa6/I3lrBGY7dvN2XKDwdH/IjRS5JQaVF70ur7z06pDWM2iqN+dp/9+LEcetD5o64wRWiGM=
X-Received: by 2002:a67:f685:: with SMTP id n5mr119559031vso.31.1636478123746; 
 Tue, 09 Nov 2021 09:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20211101173006.656673-1-jsnow@redhat.com>
 <20211101173006.656673-23-jsnow@redhat.com>
 <0c924833-c3eb-4fc2-823b-6a0ece658533@redhat.com>
In-Reply-To: <0c924833-c3eb-4fc2-823b-6a0ece658533@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 9 Nov 2021 12:15:12 -0500
Message-ID: <CAFn=p-aTczmhQw2wqc+Tmy_ce--oN3vVZ4RhsALD6zDB3QW0yQ@mail.gmail.com>
Subject: Re: [PULL 22/22] python, iotests: replace qmp with aqmp
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003fbfe505d05e414f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003fbfe505d05e414f
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 9, 2021 at 9:07 AM Thomas Huth <thuth@redhat.com> wrote:

> On 01/11/2021 18.30, John Snow wrote:
> > Swap out the synchronous QEMUMonitorProtocol from qemu.qmp with the sync
> > wrapper from qemu.aqmp instead.
> >
> > Add an escape hatch in the form of the environment variable
> > QEMU_PYTHON_LEGACY_QMP which allows you to cajole QEMUMachine into using
> > the old implementation, proving that both implementations work
> > concurrently.
>
>   Hi John,
>
> seems like this patch broke our device-crash-test script. If I now run
> "scripts/device-crash-test -q" I get lots of error messages... could you
> please have a look?
>
>   Thomas
>

I'm on it, thanks for the report and sorry for the inconvenience.

--js

--0000000000003fbfe505d05e414f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 9, 2021 at 9:07 AM Thomas=
 Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 01/11/2021=
 18.30, John Snow wrote:<br>
&gt; Swap out the synchronous QEMUMonitorProtocol from qemu.qmp with the sy=
nc<br>
&gt; wrapper from qemu.aqmp instead.<br>
&gt; <br>
&gt; Add an escape hatch in the form of the environment variable<br>
&gt; QEMU_PYTHON_LEGACY_QMP which allows you to cajole QEMUMachine into usi=
ng<br>
&gt; the old implementation, proving that both implementations work<br>
&gt; concurrently.<br>
<br>
=C2=A0 Hi John,<br>
<br>
seems like this patch broke our device-crash-test script. If I now run <br>
&quot;scripts/device-crash-test -q&quot; I get lots of error messages... co=
uld you <br>
please have a look?<br>
<br>
=C2=A0 Thomas<br></blockquote><div><br></div><div>I&#39;m on it, thanks for=
 the report and sorry for the inconvenience.</div><div><br></div><div>--js<=
br></div></div></div>

--0000000000003fbfe505d05e414f--


