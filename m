Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0914F664C52
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:22:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFK4Y-00006d-UI; Tue, 10 Jan 2023 14:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFK4W-000051-A1
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFK4U-0005sU-MM
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673378045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lQLG8GM53zggMM4FH+rlY9clC503d9Yhm0xC6ySnNYg=;
 b=B7fXzftPkty9iVD5ccuwVsYshKC88Yo+6qqaqpuACZ9TGl5KxRiUxPi1N0TRtkX5N4zoey
 8Ej67pTSownGijTGPl9YI/K8eSVNHacCMtVqn9IhLOUztXKFwfsbyj60t+287rUDh7wEvj
 4HpGTstUrJMI0nhyuJ/sBjPZkQgizJg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-lGOtU4tKN3q_JFdOIIj5Og-1; Tue, 10 Jan 2023 14:14:04 -0500
X-MC-Unique: lGOtU4tKN3q_JFdOIIj5Og-1
Received: by mail-lj1-f197.google.com with SMTP id
 r20-20020a2e8e34000000b002838fc9f1feso2201855ljk.9
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 11:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lQLG8GM53zggMM4FH+rlY9clC503d9Yhm0xC6ySnNYg=;
 b=aiYtnEvcIGw2j5/8v/bDU3/An7rr638NmMbphIioU/QKPkA6QAN7v9cUv7D4UfDjTc
 Y92fB0ZEbI1hYoOyS7055NxGIlRM1lufZEL5KT+gT/8GFGj8OBn+9FPt+0ktxMdawl54
 KQqil7soXPKFDauU+3You+Tdjz/A0JCklauuZD5Qz66tRSTrnLFQGl54AzVLSIP9NzRN
 6WFOU8xABSxinMYT92tVl7YP5sBzf0wLTC+jdZGHtSD7G35jetCkbyRrg2qWsAR7NaKJ
 pB/hONzxFYM7Qf3im6JUmKjrah94a5Q4Wzf6tI/0ExSX3PqhyRKg7U744MNWf5WkqpMs
 hY6Q==
X-Gm-Message-State: AFqh2krhNcWPIH43jZc/dQgnsYB8O4l6gM7IWjPW19c+39xGmJvU7pYS
 SvIR1QYpWcL59XeFAm23syjW5AfVwXHxzVA+Li2tgp29rvOA+/RbcSPtvaOcK3ICZuprPG/MHF9
 FMd0wiSbQF13wfP975t4QOO9kfokB1gw=
X-Received: by 2002:a2e:9f06:0:b0:281:980:a708 with SMTP id
 u6-20020a2e9f06000000b002810980a708mr1399233ljk.354.1673378042798; 
 Tue, 10 Jan 2023 11:14:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXve8cBhqI5vtd94BNCWrt/DHHnfm4Al9TZZh/ayLonRGr1WAJ5A5oo0orr6BVLE4XpdL03iF8x5DkVtMfGD76c=
X-Received: by 2002:a2e:9f06:0:b0:281:980:a708 with SMTP id
 u6-20020a2e9f06000000b002810980a708mr1399227ljk.354.1673378042470; Tue, 10
 Jan 2023 11:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20230110083758.161201-1-vsementsov@yandex-team.ru>
 <20230110083758.161201-5-vsementsov@yandex-team.ru>
In-Reply-To: <20230110083758.161201-5-vsementsov@yandex-team.ru>
From: John Snow <jsnow@redhat.com>
Date: Tue, 10 Jan 2023 14:13:51 -0500
Message-ID: <CAFn=p-YdwFMv6-N3icKDHzjvoXSSrxrghEgAd43fVj9tjzRx0A@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] iotests: QemuStorageDaemon: add cmd() method
 like in QEMUMachine.
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, crosa@redhat.com, kwolf@redhat.com, 
 hreitz@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 10, 2023 at 3:38 AM Vladimir Sementsov-Ogievskiy
<vsementsov@yandex-team.ru> wrote:
>
> Add similar method for consistency.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  tests/qemu-iotests/iotests.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index c69b10ac82..dd08cd8a2b 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -462,6 +462,10 @@ def qmp(self, cmd: str, args: Optional[Dict[str, object]] = None) \
>          assert self._qmp is not None
>          return self._qmp.cmd_raw(cmd, args)
>
> +    def cmd(self, cmd: str, args: Optional[Dict[str, object]] = None) \
> +            -> QMPMessage:
> +        return self._qmp.cmd(cmd, **args)
> +

The typing of this is off -- try "make check-dev" in qemu.git/python to see:

iotests.py:467: error: Item "None" of "Optional[QEMUMonitorProtocol]"
has no attribute "cmd"  [union-attr]
iotests.py:467: error: Argument after ** must be a mapping, not
"Optional[Dict[str, object]]"  [arg-type]
iotests.py:467: error: Incompatible return value type (got
"Union[object, Any]", expected "Dict[str, Any]")  [return-value]
Found 3 errors in 1 file (checked 32 source files)

You need to assert that self._qmp is not None for the first; the
second seems to do with a potentially "None" argument for args, and
the third has to do with the difference between returning the entire
raw response and just the return value.

I started making a fixup branch, but I stopped around here.
https://gitlab.com/jsnow/qemu/-/commits/vlad-iotest-patches

>      def stop(self, kill_signal=15):
>          self._p.send_signal(kill_signal)
>          self._p.wait()
> --
> 2.34.1
>


