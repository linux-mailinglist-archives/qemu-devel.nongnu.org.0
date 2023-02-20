Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7787969D513
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 21:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUCwP-000464-1b; Mon, 20 Feb 2023 15:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUCwM-00044V-J2
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 15:39:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUCwK-0001Pv-Ur
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 15:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676925552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4k05y7Vb+udQkzoh7TrzEsQwIKhVA+5xEHLpDRN+WBE=;
 b=DXX5kDNvY6PbubjU/zfYqsE8AXLx4VLnCTJlCGCXHx1S4DKSlydLNIdTFwu/0fhFFHQdXT
 igwARtJ9Apjb+d85aL2VhgMZVz9duK0GQHL43uveeeofdOx+fczF71OHwC7jOO0nCWnO4q
 q3onhCAjsdRw0mJLG2DH0QJu8GtA3es=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-MOwFLVRZOBWNZ_7flq4ZXw-1; Mon, 20 Feb 2023 15:39:10 -0500
X-MC-Unique: MOwFLVRZOBWNZ_7flq4ZXw-1
Received: by mail-pg1-f200.google.com with SMTP id
 r16-20020a632b10000000b004fb5e56e652so966490pgr.9
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 12:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676925549;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4k05y7Vb+udQkzoh7TrzEsQwIKhVA+5xEHLpDRN+WBE=;
 b=LPSi1PG1jYZ5A2ZU1nc1P2pFP2Vnwz5XE7CGywimQs5Yx1NAXIiaOwMKu30hYSihVW
 jHzwfJxaVJbQJAalKkXCU3zsQRbFzbo3N3xc3FwSUZphSHKZ8y8FegUBY8TIdOOEhRbB
 Kjf831FMfKs0uHWo213c4ahMbYl5FPtG4dCvIEUotGpBnTUkYCVlay2cqKiI5rO0rWm/
 Pl65Lv1PonT3i0EEjlWZy/nH6VOls0KHUv7hC8AOVctBRiBIfGnRGJ3QHc5nuKEKHhi1
 xkt6GIGoL76h61HLUQUZmQUu71pwSNYwcRVGkhSf9k98mJl+Xl5DAv0MLX3LqTtsZS+T
 sNfA==
X-Gm-Message-State: AO0yUKVMmB3w8HDUpZ4sLN9P7dvq+NTGWDgf372qO3DsRdJYqeJZ6mt0
 FCGSjL0fBaz1nNJxzVCUKu7majeloHaXgoLyAlcqTbvJzay3q+dbec0gXEH6NEryJsS5WpwcEKA
 TftRmTidJ94bD9pW0Deh8Um4yvML4LvE=
X-Received: by 2002:a62:ceca:0:b0:592:503a:8f06 with SMTP id
 y193-20020a62ceca000000b00592503a8f06mr207715pfg.52.1676925549109; 
 Mon, 20 Feb 2023 12:39:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/OZMGW7doRfmHIGQERtR1Op0hnP2/PbbNTOm2rjAVmq2VQ18GLi0lT7IJj+RFPBAOMKqX2+dTCkE0TBElP4vM=
X-Received: by 2002:a62:ceca:0:b0:592:503a:8f06 with SMTP id
 y193-20020a62ceca000000b00592503a8f06mr207709pfg.52.1676925548787; Mon, 20
 Feb 2023 12:39:08 -0800 (PST)
MIME-Version: 1.0
References: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
 <20230215132547.1620575-3-vsementsov@yandex-team.ru>
In-Reply-To: <20230215132547.1620575-3-vsementsov@yandex-team.ru>
From: John Snow <jsnow@redhat.com>
Date: Mon, 20 Feb 2023 15:38:56 -0500
Message-ID: <CAFn=p-aEy5Ue0LvHJ47itMgq5V2tCe5Tt=jFJQO0DsqvJ2G-QA@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] python: fix broad-exception-raised pylint error
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, crosa@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Wed, Feb 15, 2023 at 8:26 AM Vladimir Sementsov-Ogievskiy
<vsementsov@yandex-team.ru> wrote:
>
> Now 'make check-dev' called in python/ directory raises several
>
> W0719: Raising too general exception: Exception (broad-exception-raised)
>
> Let's fix.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

I think I came to the same conclusions:
https://gitlab.com/jsnow/qemu/-/commit/19bac2ea70cbb5ada4f94d6223cdc96f51a2b3d9

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>  python/qemu/utils/qemu_ga_client.py | 6 +++---
>  tests/qemu-iotests/iotests.py       | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/python/qemu/utils/qemu_ga_client.py b/python/qemu/utils/qemu_ga_client.py
> index 8c38a7ac9c..d8411bb2d0 100644
> --- a/python/qemu/utils/qemu_ga_client.py
> +++ b/python/qemu/utils/qemu_ga_client.py
> @@ -155,7 +155,7 @@ def ping(self, timeout: Optional[float]) -> bool:
>
>      def fsfreeze(self, cmd: str) -> object:
>          if cmd not in ['status', 'freeze', 'thaw']:
> -            raise Exception('Invalid command: ' + cmd)
> +            raise ValueError('Invalid command: ' + cmd)
>          # Can be int (freeze, thaw) or GuestFsfreezeStatus (status)
>          return getattr(self.qga, 'fsfreeze' + '_' + cmd)()
>
> @@ -167,7 +167,7 @@ def fstrim(self, minimum: int) -> Dict[str, object]:
>
>      def suspend(self, mode: str) -> None:
>          if mode not in ['disk', 'ram', 'hybrid']:
> -            raise Exception('Invalid mode: ' + mode)
> +            raise ValueError('Invalid mode: ' + mode)
>
>          try:
>              getattr(self.qga, 'suspend' + '_' + mode)()
> @@ -178,7 +178,7 @@ def suspend(self, mode: str) -> None:
>
>      def shutdown(self, mode: str = 'powerdown') -> None:
>          if mode not in ['powerdown', 'halt', 'reboot']:
> -            raise Exception('Invalid mode: ' + mode)
> +            raise ValueError('Invalid mode: ' + mode)
>
>          try:
>              self.qga.shutdown(mode=mode)
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 94aeb3f3b2..3e82c634cf 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -720,7 +720,7 @@ def __exit__(self, exc_type, value, traceback):
>          signal.setitimer(signal.ITIMER_REAL, 0)
>          return False
>      def timeout(self, signum, frame):
> -        raise Exception(self.errmsg)
> +        raise TimeoutError(self.errmsg)
>
>  def file_pattern(name):
>      return "{0}-{1}".format(os.getpid(), name)
> @@ -804,7 +804,7 @@ def remote_filename(path):
>      elif imgproto == 'ssh':
>          return "ssh://%s@127.0.0.1:22%s" % (os.environ.get('USER'), path)
>      else:
> -        raise Exception("Protocol %s not supported" % (imgproto))
> +        raise ValueError("Protocol %s not supported" % (imgproto))
>
>  class VM(qtest.QEMUQtestMachine):
>      '''A QEMU VM'''
> --
> 2.34.1
>


