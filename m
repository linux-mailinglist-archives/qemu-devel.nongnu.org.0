Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C5136FB0E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:58:16 +0200 (CEST)
Received: from localhost ([::1]:42438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSil-0006Dn-AA
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcSWn-00078Y-51
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcSWj-00057B-JG
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619786748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wZb49Mb42zgCGj6A0tABfbjWNZA0yFOeuxpynMqWd0=;
 b=if161jujBwUQF+TPPHV/4v/WitC+GDkodSS3RxF0CzBO1cH3AevQexSJAOs7YFjuWJraST
 /MU0rZUf5Q/GaU0lsYA67ksKexoQ1EJ+M7zMz8VgCAYh+hBN5xR769xUv9Wh8ddm1JmQfN
 R34qwkLy4tK51PjDC7qqiomZ0+S1ILs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-uh-_wOreOmasiGKjwNyX6g-1; Fri, 30 Apr 2021 08:45:46 -0400
X-MC-Unique: uh-_wOreOmasiGKjwNyX6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 656538186E9;
 Fri, 30 Apr 2021 12:45:45 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD74F36DE;
 Fri, 30 Apr 2021 12:45:43 +0000 (UTC)
Subject: Re: [PATCH v3 09/15] qemu_iotests: extend the check script to support
 valgrind for python tests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-10-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <50505898-6354-5b67-884b-0cd97138a5c2@redhat.com>
Date: Fri, 30 Apr 2021 14:45:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-10-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
> Currently, the check script only parses the option and sets the
> VALGRIND_QEMU environmental variable to "y".
> Add another local python variable that prepares the command line,
> identical to the one provided in the test scripts.
> 
> Because the python script does not know in advance the valgring
> PID to assign to the log file name, use the "%p" flag in valgrind
> log file name that automatically puts the process PID at runtime.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/check      |  7 ++++---
>   tests/qemu-iotests/iotests.py | 11 +++++++++++
>   tests/qemu-iotests/testenv.py |  1 +
>   3 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 6186495eee..489178d9a4 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -36,6 +36,10 @@ def make_argparser() -> argparse.ArgumentParser:
>       p.add_argument('-gdb', action='store_true',
>                      help="start gdbserver with $GDB_QEMU options. \
>                            Default is localhost:12345")
> +    p.add_argument('-valgrind', action='store_true',
> +                    help='use valgrind, sets VALGRIND_QEMU environment '
> +                    'variable')
> +
>       p.add_argument('-misalign', action='store_true',
>                      help='misalign memory allocations')
>       p.add_argument('--color', choices=['on', 'off', 'auto'],
> @@ -86,9 +90,6 @@ def make_argparser() -> argparse.ArgumentParser:
>       g_bash.add_argument('-o', dest='imgopts',
>                           help='options to pass to qemu-img create/convert, '
>                           'sets IMGOPTS environment variable')
> -    g_bash.add_argument('-valgrind', action='store_true',
> -                        help='use valgrind, sets VALGRIND_QEMU environment '
> -                        'variable')
>   
>       g_sel = p.add_argument_group('test selecting options',
>                                    'The following options specify test set '
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 4f3fb13915..a2e8604674 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -96,6 +96,17 @@
>       sys.stderr.write('Please run this test via the "check" script\n')
>       sys.exit(os.EX_USAGE)
>   
> +qemu_valgrind = []
> +if os.environ.get('VALGRIND_QEMU') == "y" and \
> +    os.environ.get('NO_VALGRIND') != "y":
> +    valgrind_logfile = "--log-file=" + test_dir.strip()
> +    # %p allows to put the valgrind process PID, since
> +    # we don't know it a priori (subprocess.Peopen is

*Popen

> +    # not yet invoked)
> +    valgrind_logfile += "/%p.valgrind"
> +
> +    qemu_valgrind = ['valgrind', valgrind_logfile, '--error-exitcode=99']
> +
>   socket_scm_helper = os.environ.get('SOCKET_SCM_HELPER', 'socket_scm_helper')
>   
>   luks_default_secret_object = 'secret,id=keysec0,data=' + \
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index e131ff42cb..39ae7ace33 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -277,6 +277,7 @@ def print_env(self) -> None:
>   SOCK_DIR      -- {SOCK_DIR}
>   SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
>   GDB_QEMU      -- "{GDB_QEMU}"
> +VALGRIND_QEMU     -- "{VALGRIND_QEMU}"

I don’t think this should be enclosed in quotes (and neither should 
GDB_QEMU be).  AFAIU, only the *_PROG options are quoted to signify that 
they will be executed as a single program, whether they include spaces 
or not.  OTOH, GDB_QEMU is a list of options, so spaces act as 
separators, and VALGRIND_QEMU is just y or not set, so it’s impossible 
for spaces to be in there.

(Also, I think the “--” should be aligned to all the other “--”s.)

Bikeshedding, though, so:

Reviewed-by: Max Reitz <mreitz@redhat.com>

>   """
>   
>           args = collections.defaultdict(str, self.get_env())
> 


