Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63CC397935
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:38:10 +0200 (CEST)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8LB-0005ex-H6
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lo8K4-0004vK-LH
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 13:37:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lo8K2-00083T-0P
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 13:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622569016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eyzfPliTRzFik28SmAuKxbox1oqAGx/rTcN4uyKfhZI=;
 b=NcxLa95Ij3WrSIqd27j4HLTXY8/9RouZqdHhVwXt9jf3Z6iZtimhVul2kJUUcanQTSu4y/
 05JX0TWGGDy4TI8ynvU1GhWebZHoF76pVUsWmypDkBXZuxYnPV4CgR0R8EN3iIp7Obufy/
 yvm9kMNjhpMswq/Sj0T+8ScHY9EgDxc=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-jvksd94QPB2AZYB8ps3o_A-1; Tue, 01 Jun 2021 13:36:55 -0400
X-MC-Unique: jvksd94QPB2AZYB8ps3o_A-1
Received: by mail-vs1-f72.google.com with SMTP id
 a11-20020a67d30b0000b02902363051a2cbso3081944vsj.18
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 10:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eyzfPliTRzFik28SmAuKxbox1oqAGx/rTcN4uyKfhZI=;
 b=UP2GYMwyH8tR3CK1oSmP9AR9J1yMnmaXESM3Qj9BTcXUg2BPAChK8C3XcJlAXF6hzJ
 DW23mCOlJuSmQKDl7Z+j/1lwZVI4G4k7SFg6nMXZhp6KwDkekTF6lSRgw/Ivt7evaAS0
 /ll0sJTIcbUs+WDbpW3BVeAFOMM3JAx4sACYLN7fFVUlTR/PjMDW87hqSYQ0a64k9PEn
 f7HSvbgBLhcuGM1o09raB8hGRlm0E2c0RPPnpiEuOL/uHnXkDrXTGnYVtr48trfCq9HI
 tKaIn0OUQw265QCvGXQxHDiuov2USNzPhCUVkMYQMFz+lCU/vZpqrJ9KZf1qJpF9ppH+
 vTqA==
X-Gm-Message-State: AOAM533csIYVQ9Dh944Ilw/OOqFSuqPfxYLaKW/XObJwmT9XBu3bGz7z
 ii5fWRbgdk+fjn/n/ePcTYwn+0px1ccDKNDSld+DZNhaRWHKL3HyaHHxYc7T/iJdcCclpDaEr6w
 frS9vek8f6sderp1PbOln/jgkH703+L8=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr16772191uap.113.1622569014463; 
 Tue, 01 Jun 2021 10:36:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze9qBhUBXQ/9DomI+Em16h0Rw7cTMUfEfGSk3Jo9nNrmy4XRO1oCZrmj/GrY4h2KPTy8VKkzhRuCOHL14IG6k=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr16772154uap.113.1622569014220; 
 Tue, 01 Jun 2021 10:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210528023220.417057-1-jsnow@redhat.com>
 <20210601154546.130870-1-crosa@redhat.com>
 <20210601154546.130870-2-crosa@redhat.com>
In-Reply-To: <20210601154546.130870-2-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 1 Jun 2021 14:36:28 -0300
Message-ID: <CAKJDGDbK40mcg4n7KMNymAhv=q2R+mbGzT+NC3_OgA3a7mn6_g@mail.gmail.com>
Subject: Re: [PATCH 1/1] VM tests: account for changes in
 qemu.utils.get_info_usernet_hostfwd_port()
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 1, 2021 at 12:46 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> The utility function actually accepts a string, and not the raw
> dictionary response from QMP.  Also, it returns (optionally) an
> integer, so that must also be accounted for.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/vm/basevm.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 6f4f0fc95e..0f2e436ed3 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -227,7 +227,7 @@ def _ssh_do(self, user, cmd, check):
>                     "-o", "UserKnownHostsFile=" + os.devnull,
>                     "-o",
>                     "ConnectTimeout={}".format(self._config["ssh_timeout"]),
> -                   "-p", self.ssh_port, "-i", self._ssh_tmp_key_file]
> +                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file]
>          # If not in debug mode, set ssh to quiet mode to
>          # avoid printing the results of commands.
>          if not self.debug:
> @@ -305,7 +305,7 @@ def boot(self, img, extra_args=[]):
>          # Init console so we can start consuming the chars.
>          self.console_init()
>          usernet_info = guest.qmp("human-monitor-command",
> -                                 command_line="info usernet")
> +                                 command_line="info usernet").get("return")
>          self.ssh_port = get_info_usernet_hostfwd_port(usernet_info)

From here, your file differs from the upstream and your patch does not
work. I'm trying on commit 52848929b70dcf92a68aedcfd90207be81ba3274.

>          if not self.ssh_port:
>              raise Exception("Cannot find ssh port from 'info usernet':\n%s" % \
> --
> 2.25.4
>


