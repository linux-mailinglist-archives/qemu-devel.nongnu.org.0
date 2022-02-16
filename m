Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E094B86E6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:41:29 +0100 (CET)
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKIga-00060u-UG
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:41:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKIeV-0004Nr-TM
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:39:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKIeQ-0002w6-Ty
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645011554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=un7ijYkMdm5WYwbtL+q6VJAmrwwhpq+/z1XEm2/KKQE=;
 b=fDTm4O+j2ekpI8ZMCUh93efwymNJFCYKY0Di0pYEbfb9CcwPTsPFRZZ6HIuXZ62+qxdehF
 Zw0MxLsOGxattt4TJxY1JVFl4opYGIJMhteJnZvg2OoUITlQz1RoFE+fOWLdBoeJ9A5FeS
 7QESTFF6PCYjMYP5blIuNpgqquRJLdU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-HPTbQmEIPyW7qlFPuFtVnQ-1; Wed, 16 Feb 2022 06:39:10 -0500
X-MC-Unique: HPTbQmEIPyW7qlFPuFtVnQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adfa34d000000b001e33a1c56f3so969907wrb.20
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 03:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=un7ijYkMdm5WYwbtL+q6VJAmrwwhpq+/z1XEm2/KKQE=;
 b=G59RBTHTZn0ouDWauo/h79i/i7UGV/KoRwp7OxXoEPslZrSAAHi3RJSdYjUw6D/N0E
 A2RNATIe80GYqWZTmr2Z2WxgQnNfPXZbc8lpHNjQi7iSTAaKaA993+T0SertqPDSLU8B
 b1orvYBmPRv9wOux2jiYO5Oqm4qwkaoxmv1r5X4Oh5ISV4DQqqMS2YxG3iG3A/tdWHMs
 IKNko2SGkOvDOpnOsWAmf2NBN1dhqBrsLLWZM1qEe+UIrY0fE6ySdi/lfrRWI/xbccBz
 eFmp7egCaYn/zOu9aZn8sYlZfY6A/pPGiY78Dn8MsYwvPoTl2AZnxn5b1tNeNjs6o+t1
 Ly1w==
X-Gm-Message-State: AOAM533ZhBoH4dG/cwGfrunv6/ERF+64OW5/1uQHD7OcYenYaRrPBtob
 NK2tw/AyLQvK7yZez2hXzmIDN4yqh1SjbXuk68BEGWM7fKHh3qE3RdKv1ThmOnX0ZebFO1IpHYd
 BQwedPVJak2rCQWk=
X-Received: by 2002:a5d:64e6:0:b0:1e4:a576:5800 with SMTP id
 g6-20020a5d64e6000000b001e4a5765800mr1965662wri.49.1645011549046; 
 Wed, 16 Feb 2022 03:39:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQ6ZZAuWr7cgQWVG5SGSPRAwCTXns2MokupSQk+4D1MyPSXGZqmqw4J7TMxrmLmwlH3g38GQ==
X-Received: by 2002:a5d:64e6:0:b0:1e4:a576:5800 with SMTP id
 g6-20020a5d64e6000000b001e4a5765800mr1965640wri.49.1645011548642; 
 Wed, 16 Feb 2022 03:39:08 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id z2sm17626211wrn.60.2022.02.16.03.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 03:39:08 -0800 (PST)
Message-ID: <88014d58-90cb-022a-b666-5fb985da2052@redhat.com>
Date: Wed, 16 Feb 2022 12:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/qemu-iotests: Rework the checks and spots using GNU
 sed
To: Eric Blake <eblake@redhat.com>
References: <20220215132031.293563-1-thuth@redhat.com>
 <20220215221027.tpmbyk7rkmuf6lit@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220215221027.tpmbyk7rkmuf6lit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On 15/02/2022 23.10, Eric Blake wrote:
> On Tue, Feb 15, 2022 at 02:20:31PM +0100, Thomas Huth wrote:
>> Instead of failing the iotests if GNU sed is not available (or skipping
>> them completely in the check-block.sh script), it would be better to
>> simply skip the bash-based tests that rely on GNU sed, so that the other
>> tests could still be run. Thus we now explicitely use "gsed" (either as
>> direct program or as a wrapper around "sed" if it's the GNU version)
>> in the spots that rely on the GNU sed behavior. Then we also remove the
>> sed checks from the check-block.sh script, so that "make check-block"
>> can now be run on systems without GNU sed, too.
...
>> diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
>> index 935217aa65..a3b1708adc 100644
>> --- a/tests/qemu-iotests/common.filter
>> +++ b/tests/qemu-iotests/common.filter
>> @@ -21,58 +21,58 @@
>>   
>>   _filter_date()
>>   {
>> -    $SED -re 's/[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/yyyy-mm-dd hh:mm:ss/'
>> +    gsed -re 's/[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/yyyy-mm-dd hh:mm:ss/'
> 
> GNU sed recommends spelling it 'sed -E', not 'sed -r', when using
> extended regex.  Older POSIX did not support either spelling, but the
> next version will require -E, as many implementations have it now:
> https://www.austingroupbugs.net/view.php?id=528

Thanks for the pointer ... I originally checked "man 1p sed" on
my system and did not see -r or -E in there, so I thought that
this must be really something specific to GNU sed. But now that
you've mentioned this, I just double-checked the build environments
that we support with QEMU, and seems like -E should be supported
everywhere:

macOS 11:

$ sed --help
sed: illegal option -- -
usage: sed script [-Ealnru] [-i extension] [file ...]
	sed [-Ealnu] [-i extension] [-e script] ... [-f script_file] ... [file ...]


NetBSD 9.2:

$ sed --help
sed: unknown option -- -
Usage:  sed [-aElnru] command [file ...]
         sed [-aElnru] [-e command] [-f command_file] [-I[extension]]
             [-i[extension]] [file ...]


FreeBSD 12.3:

$ sed --help
sed: illegal option -- -
usage: sed script [-Ealnru] [-i extension] [file ...]
	sed [-Ealnu] [-i extension] [-e script] ... [-f script_file] ... [file ...]


OpenBSD 7.0:

$ sed --help
sed: unknown option -- -
usage: sed [-aEnru] [-i[extension]] command [file ...]
        sed [-aEnru] [-e command] [-f command_file] [-i[extension]] [file ...]


Illumos:

Has -E according to https://illumos.org/man/1/sed


Busybox:

Has -E according to https://www.commandlinux.com/man-page/man1/busybox.1.html


Haiku:

Seems to use GNU sed, so -E is available.


We likely never will run the iotests on Windows, so I did not check
those (but I assume MSYS and friends are using GNU sed, too).


So I think it should be safe to change these spots that are
using "-r" to "sed -E" (and not use gsed here).

> Other than the fact that this was easier to write with ERE, I'm not
> seeing any other GNU-only extensions in use here; but I'd recommend
> that as long as we're touching the line, we spell it 'gsed -Ee'
> instead of -re (here, and in several other places).
> 
>>   _filter_qom_path()
>>   {
>> -    $SED -e '/Attached to:/s/\device[[0-9]\+\]/device[N]/g'
>> +    gsed -e '/Attached to:/s/\device[[0-9]\+\]/device[N]/g'
> 
> Here, it is our use of \+ that is a GNU sed extension, although it is
> fairly easy (but verbose) to translate that one to portable sed
> (<PAT>\+ is the same as <PAT><PAT>*).  So gsed is correct.  On the
> other hand, the use of [[0-9]\+\] looks ugly - it probably does NOT
> match what we meant (we have a bracket expression '[...]' that matches
> the 11 characters [ and 0-9, then '\+' to match that bracket
> expression 1 or more times, then '\]' which in its context is
> identical to ']' to match a closing ], since only opening [ needs \
> escaping for literal treatment).  What we probably meant is:
> 
> '/Attached to:/s/\device\[[0-9][0-9]*]/device[N]/g'
> 
> at which point normal sed would do.

Ok ... but I'd prefer to clean such spots rather in a second step,
to make sure not to introduce bugs and to make the review easier.

>>   # Removes \r from messages
>>   _filter_win32()
>>   {
>> -    $SED -e 's/\r//g'
>> +    gsed -e 's/\r//g'
> 
> Yep, \r is another GNU sed extension.
> 
>>   }
>>   
>>   # sanitize qemu-io output
>>   _filter_qemu_io()
>>   {
>> -    _filter_win32 | $SED -e "s/[0-9]* ops\; [0-9/:. sec]* ([0-9/.inf]* [EPTGMKiBbytes]*\/sec and [0-9/.inf]* ops\/sec)/X ops\; XX:XX:XX.X (XXX YYY\/sec and XXX ops\/sec)/" \
>> +    _filter_win32 | gsed -e "s/[0-9]* ops\; [0-9/:. sec]* ([0-9/.inf]* [EPTGMKiBbytes]*\/sec and [0-9/.inf]* ops\/sec)/X ops\; XX:XX:XX.X (XXX YYY\/sec and XXX ops\/sec)/" \
>>           -e "s/: line [0-9][0-9]*:  *[0-9][0-9]*\( Aborted\| Killed\)/:\1/" \
>>           -e "s/qemu-io> //g"
> 
> I'm not seeing anything specific to GNU sed in this (long) sed script;
> can we relax this one to plain 'sed'?  Use of s#some/text## might be
> easier than having to s/some\/text//, but that's not essential.

If I switch that to plain sed, I'm getting errors like this on NetBSD:

--- /home/qemu/qemu-test.is2SLq/src/tests/qemu-iotests/046.out
+++ 11296-046.out.bad
@@ -66,6 +66,7 @@
  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
  wrote 65536/65536 bytes at offset 2031616
  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
  Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT

  == Some concurrent requests touching the same cluster ==

So I'll keep gsed here for now - we need it for _filter_qemu_io
anyway since it's calling _filter_win32 that currently needs
gsed, too.

>> @@ -142,7 +142,7 @@ _do_filter_img_create()
>>       # precedes ", fmt=") and the options part ($options, which starts
>>       # with "fmt=")
>>       # (And just echo everything before the first "^Formatting")
>> -    readarray formatting_line < <($SED -e 's/, fmt=/\n/')
>> +    readarray formatting_line < <(gsed -e 's/, fmt=/\n/')
> 
> This one looks like it should work with plain 'sed'.

Using normal sed does not really work for me here. For example
with NetBSD, I get errors like this:

--- /home/qemu/qemu-test.cSYvEb/src/tests/qemu-iotests/027.out
+++ 13694-027.out.bad
@@ -1,5 +1,5 @@
  QA output created by 027
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
+Formatting 'TEST_DIR/t.IMGFMT'nIMGFMT cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16, fmt=

  == writing first cluster to populate metadata ==
  wrote 65536/65536 bytes at offset 65536

>> @@ -209,7 +209,7 @@ _filter_img_create()
>>   
>>   _filter_img_create_size()
>>   {
>> -    $SED -e "s# size=[0-9]\\+# size=SIZE#g"
>> +    sed -e "s# size=[0-9]\\+# size=SIZE#g"
> 
> The use of "\\+" here either needs gsed, or respelling as [0-9][0-9]*.

I'll change it to gsed for now ... we can update the \+ spots in a
second patch later if we think that it helps to make the iotests run
on more systems.

>>   }
>>   
>>   _filter_img_info()
>> @@ -223,7 +223,7 @@ _filter_img_info()
>>   
>>       discard=0
>>       regex_json_spec_start='^ *"format-specific": \{'
>> -    $SED -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
>> +    gsed -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
>>           -e "s#$IMGPROTO:$TEST_DIR#TEST_DIR#g" \
>>           -e "s#$TEST_DIR#TEST_DIR#g" \
>>           -e "s#$SOCK_DIR#SOCK_DIR#g" \
> 
> I didn't check context for whether this one needs to be gsed, or could
> be plain sed.

Complete statement looks like this:

  gsed -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
    -e "s#$IMGPROTO:$TEST_DIR#TEST_DIR#g" \
    -e "s#$TEST_DIR#TEST_DIR#g" \
    -e "s#$SOCK_DIR#SOCK_DIR#g" \
    -e "s#$IMGFMT#IMGFMT#g" \
    -e 's#nbd://127.0.0.1:[0-9]\\+$#TEST_DIR/t.IMGFMT#g' \
    -e 's#nbd+unix:///\??socket=SOCK_DIR/nbd#TEST_DIR/t.IMGFMT#g'\
    -e 's#SOCK_DIR/fuse-#TEST_DIR/#g' \
    -e "/encrypted: yes/d" \
    -e "/cluster_size: [0-9]\\+/d" \
    -e "/table_size: [0-9]\\+/d" \
    -e "/compat: '[^']*'/d" \
    -e "/compat6: \\(on\\|off\\)/d" \
    -e "s/cid: [0-9]\+/cid: XXXXXXXXXX/" \
    -e "/static: \\(on\\|off\\)/d" \
    -e "/zeroed_grain: \\(on\\|off\\)/d" \
    -e "/subformat: '[^']*'/d" \
    -e "/adapter_type: '[^']*'/d" \
    -e "/hwversion: '[^']*'/d" \
    -e "/lazy_refcounts: \\(on\\|off\\)/d" \
    -e "/extended_l2=\\(on\\|off\\)/d" \
    -e "/block_size: [0-9]\\+/d" \
    -e "/block_state_zero: \\(on\\|off\\)/d" \
    -e "/log_size: [0-9]\\+/d" \
    -e "s/iters: [0-9]\\+/iters: 1024/" \
    -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
    -e "s/uuid: [-a-f0-9]\\+/uuid: 00000000-0000-0000-0000-000000000000/" | \

There are some \\+ in here, so I think this needs gsed for now.

>> +++ b/tests/qemu-iotests/common.rc
>> @@ -17,17 +17,28 @@
>>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>   #
>>   
>> -SED=
>> -for sed in sed gsed; do
>> -    ($sed --version | grep 'GNU sed') > /dev/null 2>&1
>> -    if [ "$?" -eq 0 ]; then
>> -        SED=$sed
>> -        break
>> -    fi
>> -done
>> -if [ -z "$SED" ]; then
>> -    echo "$0: GNU sed not found"
>> -    exit 1
>> +# bail out, setting up .notrun file
>> +_notrun()
>> +{
>> +    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
>> +    echo "$seq not run: $*"
>> +    status=0
>> +    exit
>> +}
>> +
>> +if ! command -v gsed >/dev/null 2>&1; then
>> +    if sed --version 2>&1 | grep -v 'not GNU sed' | grep 'GNU sed' > /dev/null;
>> +    then
>> +        gsed()
>> +        {
>> +            sed "$@"
>> +        }
>> +    else
>> +        gsed()
>> +        {
>> +            _notrun "GNU sed not available"
>> +        }
>> +    fi
>>   fi
> 
> This one looks good.
> 
> I found one or two issues that need to be fixed, and a couple of
> "might as well improve them while touching the line anyway", but
> overall I like where this is headed.

Thanks a lot of your review and suggestions, I'll respin a v2 with the updates...

  Thomas


