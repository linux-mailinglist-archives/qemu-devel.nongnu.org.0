Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAA74B7A78
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:32:16 +0100 (CET)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6Mp-0008Ee-M9
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:32:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK625-000724-2Y
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:10:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK622-0006th-Re
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644963046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W1ssod4uMT1x94ux2S7Pqt4eXFHD5ZOHRgvcDXHQVTU=;
 b=PM5fcpRkLGxLA4rUZTeGXZtGxRieARa1luZ2g3Z9pJZkyBCh3p0MqkjYFsyF2tSIzEdM8R
 JERFOCvN+pWCPR6cXgRuj4PIG4K5weEGoUInyORoSt/q0JC9se1srcrZQ7f3xy4VaEzdgS
 v58nGGQ/enbEuxG/+3Ror5V4I9i7wWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-g-Ix4e2oM6uwcErs5PkS5g-1; Tue, 15 Feb 2022 17:10:39 -0500
X-MC-Unique: g-Ix4e2oM6uwcErs5PkS5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE3A11006AA9;
 Tue, 15 Feb 2022 22:10:38 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED8555E275;
 Tue, 15 Feb 2022 22:10:29 +0000 (UTC)
Date: Tue, 15 Feb 2022 16:10:27 -0600
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qemu-iotests: Rework the checks and spots using
 GNU sed
Message-ID: <20220215221027.tpmbyk7rkmuf6lit@redhat.com>
References: <20220215132031.293563-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220215132031.293563-1-thuth@redhat.com>
User-Agent: NeoMutt/20211029-322-5436a9
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 02:20:31PM +0100, Thomas Huth wrote:
> Instead of failing the iotests if GNU sed is not available (or skipping
> them completely in the check-block.sh script), it would be better to
> simply skip the bash-based tests that rely on GNU sed, so that the other
> tests could still be run. Thus we now explicitely use "gsed" (either as
> direct program or as a wrapper around "sed" if it's the GNU version)
> in the spots that rely on the GNU sed behavior. Then we also remove the
> sed checks from the check-block.sh script, so that "make check-block"
> can now be run on systems without GNU sed, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  I've checked that this works fine with:
>  make vm-build-netbsd TARGET_LIST=x86_64-softmmu BUILD_TARGET=check-block
>  make vm-build-freebsd TARGET_LIST=x86_64-softmmu BUILD_TARGET=check-block
>  and with the macOS targets in our CI.
> 
>  tests/check-block.sh             | 12 ------
>  tests/qemu-iotests/271           |  2 +-
>  tests/qemu-iotests/common.filter | 74 ++++++++++++++++----------------
>  tests/qemu-iotests/common.rc     | 45 +++++++++----------
>  4 files changed, 61 insertions(+), 72 deletions(-)
> 

> +++ b/tests/qemu-iotests/271
> @@ -896,7 +896,7 @@ _make_test_img -o extended_l2=on 1M
>  # Second and third writes in _concurrent_io() are independent and may finish in
>  # different order. So, filter offset out to match both possible variants.
>  _concurrent_io     | $QEMU_IO | _filter_qemu_io | \
> -    $SED -e 's/\(20480\|40960\)/OFFSET/'
> +    sed -e 's/\(20480\|40960\)/OFFSET/'

Looks like a portable sed script, so 'sed' instead of 'gsed' here is fine.

>  _concurrent_verify | $QEMU_IO | _filter_qemu_io
>  
>  # success, all done
> diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
> index 935217aa65..a3b1708adc 100644
> --- a/tests/qemu-iotests/common.filter
> +++ b/tests/qemu-iotests/common.filter
> @@ -21,58 +21,58 @@
>  
>  _filter_date()
>  {
> -    $SED -re 's/[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/yyyy-mm-dd hh:mm:ss/'
> +    gsed -re 's/[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/yyyy-mm-dd hh:mm:ss/'

GNU sed recommends spelling it 'sed -E', not 'sed -r', when using
extended regex.  Older POSIX did not support either spelling, but the
next version will require -E, as many implementations have it now:
https://www.austingroupbugs.net/view.php?id=528

Other than the fact that this was easier to write with ERE, I'm not
seeing any other GNU-only extensions in use here; but I'd recommend
that as long as we're touching the line, we spell it 'gsed -Ee'
instead of -re (here, and in several other places).

>  _filter_qom_path()
>  {
> -    $SED -e '/Attached to:/s/\device[[0-9]\+\]/device[N]/g'
> +    gsed -e '/Attached to:/s/\device[[0-9]\+\]/device[N]/g'

Here, it is our use of \+ that is a GNU sed extension, although it is
fairly easy (but verbose) to translate that one to portable sed
(<PAT>\+ is the same as <PAT><PAT>*).  So gsed is correct.  On the
other hand, the use of [[0-9]\+\] looks ugly - it probably does NOT
match what we meant (we have a bracket expression '[...]' that matches
the 11 characters [ and 0-9, then '\+' to match that bracket
expression 1 or more times, then '\]' which in its context is
identical to ']' to match a closing ], since only opening [ needs \
escaping for literal treatment).  What we probably meant is:

'/Attached to:/s/\device\[[0-9][0-9]*]/device[N]/g'

at which point normal sed would do.

>  }
>  
>  # replace occurrences of the actual TEST_DIR value with TEST_DIR
>  _filter_testdir()
>  {
> -    $SED -e "s#$TEST_DIR/#TEST_DIR/#g" \
> -         -e "s#$SOCK_DIR/#SOCK_DIR/#g" \
> -         -e "s#SOCK_DIR/fuse-#TEST_DIR/#g"
> +    sed -e "s#$TEST_DIR/#TEST_DIR/#g" \
> +        -e "s#$SOCK_DIR/#SOCK_DIR/#g" \
> +        -e "s#SOCK_DIR/fuse-#TEST_DIR/#g"

And this one indeed looks portable to POSIX (unless $TEST_DIR contains
weird stuff by accident).

>  # Removes \r from messages
>  _filter_win32()
>  {
> -    $SED -e 's/\r//g'
> +    gsed -e 's/\r//g'

Yep, \r is another GNU sed extension.

>  }
>  
>  # sanitize qemu-io output
>  _filter_qemu_io()
>  {
> -    _filter_win32 | $SED -e "s/[0-9]* ops\; [0-9/:. sec]* ([0-9/.inf]* [EPTGMKiBbytes]*\/sec and [0-9/.inf]* ops\/sec)/X ops\; XX:XX:XX.X (XXX YYY\/sec and XXX ops\/sec)/" \
> +    _filter_win32 | gsed -e "s/[0-9]* ops\; [0-9/:. sec]* ([0-9/.inf]* [EPTGMKiBbytes]*\/sec and [0-9/.inf]* ops\/sec)/X ops\; XX:XX:XX.X (XXX YYY\/sec and XXX ops\/sec)/" \
>          -e "s/: line [0-9][0-9]*:  *[0-9][0-9]*\( Aborted\| Killed\)/:\1/" \
>          -e "s/qemu-io> //g"

I'm not seeing anything specific to GNU sed in this (long) sed script;
can we relax this one to plain 'sed'?  Use of s#some/text## might be
easier than having to s/some\/text//, but that's not essential.

>  }
> @@ -80,7 +80,7 @@ _filter_qemu_io()
>  # replace occurrences of QEMU_PROG with "qemu"
>  _filter_qemu()
>  {
> -    $SED -e "s#\\(^\\|(qemu) \\)$(basename $QEMU_PROG):#\1QEMU_PROG:#" \
> +    gsed -e "s#\\(^\\|(qemu) \\)$(basename $QEMU_PROG):#\1QEMU_PROG:#" \
>          -e 's#^QEMU [0-9]\+\.[0-9]\+\.[0-9]\+ monitor#QEMU X.Y.Z monitor#' \

More uses of \+ explaining why gsed is nicer.

>          -e 's#I/O error#Input/output error#' \
>          -e $'s#\r##' # QEMU monitor uses \r\n line endings
> @@ -90,41 +90,41 @@ _filter_qemu()
>  _filter_qmp()
>  {
>      _filter_win32 | \
> -    $SED -e 's#\("\(micro\)\?seconds": \)[0-9]\+#\1 TIMESTAMP#g' \
> -        -e 's#^{"QMP":.*}$#QMP_VERSION#' \
> -        -e '/^    "QMP": {\s*$/, /^    }\s*$/ c\' \
> -        -e '    QMP_VERSION'
> +    gsed -e 's#\("\(micro\)\?seconds": \)[0-9]\+#\1 TIMESTAMP#g' \
> +         -e 's#^{"QMP":.*}$#QMP_VERSION#' \
> +         -e '/^    "QMP": {\s*$/, /^    }\s*$/ c\' \
> +         -e '    QMP_VERSION'

In addition to the \+, this one has a c\ command split across two -e
parameters.  Not portable to really ancient sed, but recently
standardized by POSIX:
https://www.austingroupbugs.net/view.php?id=262.  I'm happy with
requiring gsed instead of trying to rewrite \+ and assuming that -e
'c\' -e 'text' is portable.

>  }
>  
>  # readline makes HMP command strings so long that git complains
>  _filter_hmp()
>  {
> -    $SED -e $'s/^\\((qemu) \\)\\?.*\e\\[D/\\1/g' \
> -        -e $'s/\e\\[K//g'
> +    gsed -e $'s/^\\((qemu) \\)\\?.*\e\\[D/\\1/g' \
> +         -e $'s/\e\\[K//g'

\e is indeed GNU sed.  There are other was to spell ESC in portable
sed, but not worth the bother compared to just using gsed.

> @@ -142,7 +142,7 @@ _do_filter_img_create()
>      # precedes ", fmt=") and the options part ($options, which starts
>      # with "fmt=")
>      # (And just echo everything before the first "^Formatting")
> -    readarray formatting_line < <($SED -e 's/, fmt=/\n/')
> +    readarray formatting_line < <(gsed -e 's/, fmt=/\n/')

This one looks like it should work with plain 'sed'.

>  
>      filename_part=${formatting_line[0]}
>      unset formatting_line[0]
> @@ -169,11 +169,11 @@ _do_filter_img_create()
>      options=$(
>          echo "$options" \
>          | tr '\n' '\0' \
> -        | $SED -e 's/ \([a-z0-9_.-]*\)=/\n\1=/g' \
> +        | gsed -e 's/ \([a-z0-9_.-]*\)=/\n\1=/g' \

And this one.

>          | grep -a -e '^fmt' -e '^size' -e '^backing' -e '^preallocation' \
>                    -e '^encryption' "${grep_data_file[@]}" \
>          | _filter_img_create_filenames \
> -        | $SED \
> +        | sed \
>              -e 's/^\(fmt\)/0-\1/' \
>              -e 's/^\(size\)/1-\1/' \
>              -e 's/^\(backing\)/2-\1/' \
> @@ -181,9 +181,9 @@ _do_filter_img_create()
>              -e 's/^\(encryption\)/4-\1/' \
>              -e 's/^\(preallocation\)/8-\1/' \

Missing context here, but also probably safe for plain 'sed'.

>          | LC_ALL=C sort \
> -        | $SED -e 's/^[0-9]-//' \
> +        | sed -e 's/^[0-9]-//' \
>          | tr '\n\0' ' \n' \
> -        | $SED -e 's/^ *$//' -e 's/ *$//'
> +        | sed -e 's/^ *$//' -e 's/ *$//'
>      )
>  
>      if [ -n "$options" ]; then
> @@ -209,7 +209,7 @@ _filter_img_create()
>  
>  _filter_img_create_size()
>  {
> -    $SED -e "s# size=[0-9]\\+# size=SIZE#g"
> +    sed -e "s# size=[0-9]\\+# size=SIZE#g"

The use of "\\+" here either needs gsed, or respelling as [0-9][0-9]*.

>  }
>  
>  _filter_img_info()
> @@ -223,7 +223,7 @@ _filter_img_info()
>  
>      discard=0
>      regex_json_spec_start='^ *"format-specific": \{'
> -    $SED -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
> +    gsed -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
>          -e "s#$IMGPROTO:$TEST_DIR#TEST_DIR#g" \
>          -e "s#$TEST_DIR#TEST_DIR#g" \
>          -e "s#$SOCK_DIR#SOCK_DIR#g" \

I didn't check context for whether this one needs to be gsed, or could
be plain sed.

> +++ b/tests/qemu-iotests/common.rc
> @@ -17,17 +17,28 @@
>  # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>  #
>  
> -SED=
> -for sed in sed gsed; do
> -    ($sed --version | grep 'GNU sed') > /dev/null 2>&1
> -    if [ "$?" -eq 0 ]; then
> -        SED=$sed
> -        break
> -    fi
> -done
> -if [ -z "$SED" ]; then
> -    echo "$0: GNU sed not found"
> -    exit 1
> +# bail out, setting up .notrun file
> +_notrun()
> +{
> +    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
> +    echo "$seq not run: $*"
> +    status=0
> +    exit
> +}
> +
> +if ! command -v gsed >/dev/null 2>&1; then
> +    if sed --version 2>&1 | grep -v 'not GNU sed' | grep 'GNU sed' > /dev/null;
> +    then
> +        gsed()
> +        {
> +            sed "$@"
> +        }
> +    else
> +        gsed()
> +        {
> +            _notrun "GNU sed not available"
> +        }
> +    fi
>  fi

This one looks good.

I found one or two issues that need to be fixed, and a couple of
"might as well improve them while touching the line anyway", but
overall I like where this is headed.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


