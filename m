Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E816690F92
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 18:52:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQB4n-0007gL-TU; Thu, 09 Feb 2023 12:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1pQB4m-0007g4-Jk
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 12:51:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1pQB4k-00088K-S1
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 12:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675965073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+kN2aFXDSSBP6S4iHQjHpXUazwz7YLXYCtr3jhQPCbs=;
 b=T5LdLqIrtZHODqU3GgWed7pdc4oikvSVrvqsmR9cNK2Gv1Bk9ubv/GRqCCvy9hWmdl6LcL
 MlbK7TjqiPOPA68hggQmriJvCw3PbJLVF9KMDoT0GuxnoK0i6zEJJMjWmzp0nt6TWAh/oi
 bpZApORDnRIv7r9KzlKplQGcf97YE4I=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-434-1LaW9W8iO_W4uj5Y1sxMNw-1; Thu, 09 Feb 2023 12:49:06 -0500
X-MC-Unique: 1LaW9W8iO_W4uj5Y1sxMNw-1
Received: by mail-ot1-f69.google.com with SMTP id
 l26-20020a9d7a9a000000b0068bdd21c8d7so1128219otn.2
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 09:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+kN2aFXDSSBP6S4iHQjHpXUazwz7YLXYCtr3jhQPCbs=;
 b=n+3sBd/wr9ea+H7yFdyrHIZfCZWRa6wQtdyJz4Q40eJnLqspXaGbZK488Z6GdlDunR
 AqRGMZy80vDJKD+lvpAUMGq3uXYU01Ao4XH0Wzr3kjE8mWQldWA41L+aixoGvTn/h+4A
 uikkQ9jXa2QMPGsQ6vrDp9hjTjT/L2p8sh4aclsT9WwxGosEuADXPFpS0pqeYC6DSkbD
 VrNlDrtmafEhu8j+R5+Pn3Dkt2/gOLeLhpzqhIOPGoP89Uy16YAHw173qigniNiJci0p
 ceqqRMW/4OS/hO2fP/NxyhgyZDKKAfYEaIqlp6YPuYHeXanUuD9qXQ8tLY2za5B8HmW4
 LUVw==
X-Gm-Message-State: AO0yUKXWk74U1Ub0tzENcMsDqvyXQFrvoEFuiRrtanqF9MPa4s1qwm4A
 rnTMHImu01d3XMeCEnVFXnoZLm/5orr9wPpRZN9yojYyaLsfcy45uBSZBXIi8MNkNWFqp3sZM1D
 qLHdLKLObIGt/zMA=
X-Received: by 2002:a05:6870:b292:b0:16a:af99:c3a7 with SMTP id
 c18-20020a056870b29200b0016aaf99c3a7mr2809664oao.54.1675964945559; 
 Thu, 09 Feb 2023 09:49:05 -0800 (PST)
X-Google-Smtp-Source: AK7set+H+mZuIrRLq1p2qt6hFmb7qXgofb96kt7LLNsIJ6FxBv03uNnWDtwiUQxm2nnzbzY55HF3+g==
X-Received: by 2002:a05:6870:b292:b0:16a:af99:c3a7 with SMTP id
 c18-20020a056870b29200b0016aaf99c3a7mr2809644oao.54.1675964945294; 
 Thu, 09 Feb 2023 09:49:05 -0800 (PST)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05687004c100b0016aaa65d955sm932907oam.51.2023.02.09.09.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 09:49:04 -0800 (PST)
Date: Thu, 9 Feb 2023 14:49:01 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/7] python: support pylint 2.16
Message-ID: <20230209174901.i72xi5t2uc6ecd25@laptop.redhat>
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-2-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209154034.983044-2-jsnow@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
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

On Thu, Feb 09, 2023 at 10:40:28AM -0500, John Snow wrote:
> Pylint 2.16 adds a few new checks that cause the optional check-tox CI
> job to fail.
> 
> 1. The superfluous-parens check seems to be a bit more aggressive,
> 2. broad-exception-raised is new; it discourages "raise Exception".
> 
> Fix these minor issues and turn the lights green.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/qmp/protocol.py                            | 2 +-
>  python/qemu/qmp/qmp_client.py                          | 2 +-
>  python/qemu/utils/qemu_ga_client.py                    | 6 +++---
>  tests/qemu-iotests/iotests.py                          | 4 ++--
>  tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
> index 6d3d739daa7..22e60298d28 100644
> --- a/python/qemu/qmp/protocol.py
> +++ b/python/qemu/qmp/protocol.py
> @@ -207,7 +207,7 @@ class AsyncProtocol(Generic[T]):
>      logger = logging.getLogger(__name__)
>  
>      # Maximum allowable size of read buffer
> -    _limit = (64 * 1024)
> +    _limit = 64 * 1024
>  
>      # -------------------------
>      # Section: Public interface
> diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
> index b5772e7f32b..9d73ae6e7ad 100644
> --- a/python/qemu/qmp/qmp_client.py
> +++ b/python/qemu/qmp/qmp_client.py
> @@ -198,7 +198,7 @@ async def run(self, address='/tmp/qemu.socket'):
>      logger = logging.getLogger(__name__)
>  
>      # Read buffer limit; 10MB like libvirt default
> -    _limit = (10 * 1024 * 1024)
> +    _limit = 10 * 1024 * 1024
>  
>      # Type alias for pending execute() result items
>      _PendingT = Union[Message, ExecInterruptedError]
> diff --git a/python/qemu/utils/qemu_ga_client.py b/python/qemu/utils/qemu_ga_client.py
> index 8c38a7ac9c0..d8411bb2d0b 100644
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
> index 94aeb3f3b20..3e82c634cfe 100644
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
> diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> index fc9c4b4ef41..dda55fad284 100755
> --- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> +++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> @@ -84,7 +84,7 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
>                  e['vm'] = 'SRC'
>              for e in self.vm_b_events:
>                  e['vm'] = 'DST'
> -            events = (self.vm_a_events + self.vm_b_events)
> +            events = self.vm_a_events + self.vm_b_events
>              events = [(e['timestamp']['seconds'],
>                         e['timestamp']['microseconds'],
>                         e['vm'],
> -- 
> 2.39.0
>

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


