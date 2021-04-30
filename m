Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD5A36FAFE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:56:05 +0200 (CEST)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSgf-0002WV-0A
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcRry-0003MG-N9
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:03:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcRrv-0007sn-Hf
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619784217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiAkpJW93+MX1mVE4XsTdp5oPt/9r6mhWU2ej/6t+r8=;
 b=Yg4BQirKzZZSG+MZtkeOPd2SiF118sKYlQuWeg1OqnKkaV9NHN2U8lp8xlMDYjiXLKMnsB
 Y4dpSLiVrZMy4JzEm7NIW2xFLPYHvull3fODCierNXCFA96i2wKtbbWmKBigyTlapEWLMk
 YRK8lyzcsu2I/ufRSS5o4OjuAvFBKIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-EKAkxtUaO8q9Oi6QIVrtjA-1; Fri, 30 Apr 2021 08:03:35 -0400
X-MC-Unique: EKAkxtUaO8q9Oi6QIVrtjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 677D1801106;
 Fri, 30 Apr 2021 12:03:34 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 912A21007607;
 Fri, 30 Apr 2021 12:03:32 +0000 (UTC)
Subject: Re: [PATCH v3 04/15] qemu-iotests: add option to attach gdbserver
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-5-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c9833e25-6d96-3e24-57c7-39ced685864b@redhat.com>
Date: Fri, 30 Apr 2021 14:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
> Add -gdb flag and GDB_QEMU environmental variable
> to python tests to attach a gdbserver to each qemu instance.
> 
> if -gdb is not provided but $GDB_QEMU is set, ignore the
> environmental variable.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/check      |  6 +++++-
>   tests/qemu-iotests/iotests.py |  4 ++++
>   tests/qemu-iotests/testenv.py | 15 ++++++++++++---
>   3 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index d1c87ceaf1..6186495eee 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -33,6 +33,9 @@ def make_argparser() -> argparse.ArgumentParser:
>                      help='pretty print output for make check')
>   
>       p.add_argument('-d', dest='debug', action='store_true', help='debug')
> +    p.add_argument('-gdb', action='store_true',
> +                   help="start gdbserver with $GDB_QEMU options. \
> +                         Default is localhost:12345")
>       p.add_argument('-misalign', action='store_true',
>                      help='misalign memory allocations')
>       p.add_argument('--color', choices=['on', 'off', 'auto'],
> @@ -112,7 +115,8 @@ if __name__ == '__main__':
>       env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
>                     aiomode=args.aiomode, cachemode=args.cachemode,
>                     imgopts=args.imgopts, misalign=args.misalign,
> -                  debug=args.debug, valgrind=args.valgrind)
> +                  debug=args.debug, valgrind=args.valgrind,
> +                  gdb=args.gdb)
>   
>       testfinder = TestFinder(test_dir=env.source_iotests)
>   
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 90d0b62523..05d0dc0751 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -75,6 +75,10 @@
>   qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
>   qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
>   
> +qemu_gdb = []
> +if os.environ.get('GDB_QEMU'):
> +    qemu_gdb = ['gdbserver'] + os.environ.get('GDB_QEMU').strip().split(' ')

os.environ.get('GDB_QEMU') returns an Option[str], so mypy complains 
about the .strip() (thus failing iotest 297).

(That can be fixed for example by either using os.environ['GDB_QEMU'] 
here, like most other places here do, or by something like:

gdb_qemu_env = os.environ.get('GDB_QEMU')
if gdb_qemu_env:
     qemu_gdb = ['gdbserver'] + gdb_qemu_env.strip().split(' ')
)

Max

> +
>   imgfmt = os.environ.get('IMGFMT', 'raw')
>   imgproto = os.environ.get('IMGPROTO', 'file')
>   output_dir = os.environ.get('OUTPUT_DIR', '.')
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 1fbec854c1..e131ff42cb 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -72,7 +72,8 @@ class TestEnv(ContextManager['TestEnv']):
>                        'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 'IMGPROTO',
>                        'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
>                        'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
> -                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_']
> +                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
> +                     'GDB_QEMU']
>   
>       def get_env(self) -> Dict[str, str]:
>           env = {}
> @@ -163,7 +164,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>                    imgopts: Optional[str] = None,
>                    misalign: bool = False,
>                    debug: bool = False,
> -                 valgrind: bool = False) -> None:
> +                 valgrind: bool = False,
> +                 gdb: bool = False) -> None:
>           self.imgfmt = imgfmt
>           self.imgproto = imgproto
>           self.aiomode = aiomode
> @@ -171,6 +173,11 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>           self.misalign = misalign
>           self.debug = debug
>   
> +        if gdb:
> +            self.gdb_qemu = os.environ.get('GDB_QEMU', 'localhost:12345')
> +        elif 'GDB_QEMU' in os.environ:
> +            del os.environ['GDB_QEMU']
> +
>           if valgrind:
>               self.valgrind_qemu = 'y'
>   
> @@ -268,7 +275,9 @@ def print_env(self) -> None:
>   PLATFORM      -- {platform}
>   TEST_DIR      -- {TEST_DIR}
>   SOCK_DIR      -- {SOCK_DIR}
> -SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
> +SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
> +GDB_QEMU      -- "{GDB_QEMU}"
> +"""
>   
>           args = collections.defaultdict(str, self.get_env())
>   
> 


