Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75482581968
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 20:08:23 +0200 (CEST)
Received: from localhost ([::1]:36806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGOyj-0002bQ-CX
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 14:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oGOvQ-0007BA-AR
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oGOvO-000739-6i
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658858693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eEiKdAE+tYBQsytOrgV+rWDB54Inc+RfIIeLVf9pmcA=;
 b=Us3fSD5WK1YRY15s6X7YyR40FzccoaR4GMf2r9B+6bEiFNx+BRYFaPp95QTte15kZIwfwL
 EFchEGM6Hb1rMfneTuhT91rMv63jhPtgZH4U4fQ1ExfCt0NB9luqDTjL1d0H4sAWf119Uf
 MoW9qi7mU37Pm/h/QWsn6880S7iaXno=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-D93Gj_5sPXeabU4GZ_FhGw-1; Tue, 26 Jul 2022 14:04:51 -0400
X-MC-Unique: D93Gj_5sPXeabU4GZ_FhGw-1
Received: by mail-vs1-f72.google.com with SMTP id
 i124-20020a672282000000b00356ffcd3e9dso1078163vsi.13
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 11:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEiKdAE+tYBQsytOrgV+rWDB54Inc+RfIIeLVf9pmcA=;
 b=jHwg1iBFz5394zwM6F+M4dMEi4Diq2bATCvlC5IGUgZbTW17D3YjKpgsJXckDgRqgD
 9hKJJMR0esfiJoqifb58p08env5HJfM07B3/tnQR0k5ocfxjkSLXbxYH9h0eKCM1Xi1Z
 G6MLSafwGVaJ82bjvFBINxhT00UqDttW2+myLQL8z8ZrtbEq0gckadwkIB8KkETTJocW
 gO5Ddf+RPnLV8GP3BgbOIldiHPfDQlqkgFXHtVCENu/GdbgGvVTY1bPzyO0Imas9YWFX
 aaxBTorYiu5jopHAYbJhJDjf1pw2L5LqOlzSNY4Pmf4A9EvNpjy/WRjzcGZXaUfbTTKy
 +XQw==
X-Gm-Message-State: AJIora+FiLSahSW5XB6GX6y8zNC+SjXQgPs9XdoxGYIp2o3k+Kghb1uW
 EPInJHSliIZWJhfPJqftrefL7Q5FQ+AkYBk9yfP1ylt15ihAazYtGItYV2WFzEA/1I+8zTRAnv5
 HeJPmUXcXmMaCHI7W3EaiwMdu6tSZP44=
X-Received: by 2002:a9f:3ec6:0:b0:384:ca54:c984 with SMTP id
 n6-20020a9f3ec6000000b00384ca54c984mr1910026uaj.42.1658858691100; 
 Tue, 26 Jul 2022 11:04:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tkSS4wdFmMHKOFt2L3a1Ig2ZVHxEY4uY9YWSYDW3YdIAYB/+fdc2lerHnxBGiT4ftckK3VcaZt9kx6jZVDJf8=
X-Received: by 2002:a9f:3ec6:0:b0:384:ca54:c984 with SMTP id
 n6-20020a9f3ec6000000b00384ca54c984mr1909983uaj.42.1658858690780; Tue, 26 Jul
 2022 11:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
 <1658851843-236870-42-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1658851843-236870-42-git-send-email-steven.sistare@oracle.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Jul 2022 14:04:39 -0400
Message-ID: <CAFn=p-bEO7wHG7ci7uveR_J9fJwXyPw_0k3mf-mpOseCdJhMWA@mail.gmail.com>
Subject: Re: [PATCH V9 41/46] python/machine: QEMUMachine reopen_qmp_connection
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan <zhengchuan@huawei.com>, 
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Tue, Jul 26, 2022 at 12:12 PM Steve Sistare
<steven.sistare@oracle.com> wrote:
>
> Provide reopen_qmp_connection() to reopen a closed monitor connection.
> This is needed by cpr, because qemu exec closes the monitor socket.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  python/qemu/machine/machine.py | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index d05950e..60b934d 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -491,6 +491,15 @@ def _close_qmp_connection(self) -> None:
>          finally:
>              self._qmp_connection = None
>
> +    def reopen_qmp_connection(self):

def reopen_qmp_connection(self) -> None:
    """Close and re-open the QMP connection."""
    ...

> +        self._close_qmp_connection()
> +        self._qmp_connection = QEMUMonitorProtocol(
> +            self._monitor_address,
> +            server=True,
> +            nickname=self._name
> +        )
> +        self._qmp.accept(self._qmp_timer)
> +
>      def _early_cleanup(self) -> None:
>          """
>          Perform any cleanup that needs to happen before the VM exits.
> --
> 1.8.3.1
>

With applied fixup:

Reviewed-by: John Snow <jsnow@redhat.com>


