Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E5727B14
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 12:51:23 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTlJj-0001Rg-4h
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 06:51:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hTl2i-0004LW-Sq
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:33:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hTl2h-0006Zt-05
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:33:48 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52367)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hTl2g-0006YZ-Np
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:33:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id y3so5270645wmm.2
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=51qhdwAV6xax9lXPuidlfodA4doIzJZloRA4iy8CUcw=;
	b=xv9Q4JLkl3F+FEBn90oSI9NE0WaX9WV6XE025Kfxl2mX6T/+pcieNKO/yw65r2i+Gv
	kNyd/ul3WmFUKvCOFyBPfybkhRMGOQ003KFCCq5rMqoj2kfm3OocydZ1C5cICwV3GxSk
	YlLc4Ecq9VpaKX0/gtvf0e3retRGwWxQIUyolUVmybUBJb+xX0gR+g2n/Bok/1e6BDzq
	Ch8xK8cMpXwON20lP92id1mgvNN4oVlX+3fc7w7+8/SlbqyxXllarbxttqL+9Mw2PW+M
	Qku2Jj7myqra+z7Tzmsld0Mf6PMt4lWjEqWuuWm0Nt1ml5x0Bj31miuiPISbb7pHC8Qp
	9yDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=51qhdwAV6xax9lXPuidlfodA4doIzJZloRA4iy8CUcw=;
	b=TAq3Isi0KfimdJHBB/DCnxaElwYIVh5uYUcSHotjnsFc31AOkLKvHs/5e+1HaVBVda
	3rkzJSHfgVsYSwEwEyk4Rlub5FqITchIrdY6Pst/hmuwPzPrPt5yQgfPV9D0mhY+b8ED
	R6M0RYAxmtu+IVDjM5beMPmwqNvZC4J2uHbNoNqruAff5vpCoKMuTmF3gHXYW6dS7QWy
	uXpDI7XwmR0YWyiQ2jVMTPd/U43rozlNDZ0WzcLQSy5YDBpmvBTALwzj8symtyvKdxOp
	YFnzMpRJy5ToMSJekqX+FEmUgUKix1pNS+0g5sinS7P/zVgeYgAtamWqwK9GMpBd5syP
	2YGA==
X-Gm-Message-State: APjAAAXnmUFxX9sPCA+SzixmPLELnBM6Fh0+vZ1oRJldemvUWxRH3nG0
	+79fxo/J6wHQbTVED/8dPwrGGw==
X-Google-Smtp-Source: APXvYqxjcFj0cjiuvNcojhU8PRJofuiR45BO7Ig5DNWgibpulR0ta88i8bG5oKi86Ci+HnCSSXgqOw==
X-Received: by 2002:a1c:f916:: with SMTP id x22mr10550301wmh.81.1558607624059; 
	Thu, 23 May 2019 03:33:44 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	g127sm8495576wme.21.2019.05.23.03.33.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 03:33:42 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D23FD1FFAF;
	Thu, 23 May 2019 11:25:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 11:25:31 +0100
Message-Id: <20190523102532.10486-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523102532.10486-1-alex.bennee@linaro.org>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32d
Subject: [Qemu-devel] [PATCH v2 27/28] tests/qemu-iotests: re-format output
 to for make check-block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This attempts to clean-up the output to better match the output of the
rest of the QEMU check system when called with -makecheck. This includes:

  - formatting as "  TEST    iotest-FMT: nnn"
  - only dumping config on failure (when -makecheck enabled)

The non-make check output has been cleaned up as well:

  - line re-displayed (\r) at the end
  - fancy colours for pass/fail/skip
  - timestamps always printed (option removed)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20190503143904.31211-1-alex.bennee@linaro.org>
Tested-by: Thomas Huth <thuth@redhat.com>

---
v3
  - revert echo to printf
  - add _report_test_start
v4
  - -pretty -> -makecheck
  - keep all output together for makecheck
v5
  - merged in kwolf's pretty printing
  - timestamps always printed in non-makecheck mode
---
 tests/qemu-iotests/check | 179 +++++++++++++++++++++++++--------------
 1 file changed, 116 insertions(+), 63 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 922c5d1d3d3..f46b90dbbf4 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -27,9 +27,7 @@ bad=""
 notrun=""
 casenotrun=""
 interrupt=true
-
-# by default don't output timestamps
-timestamp=${TIMESTAMP:=false}
+makecheck=false
 
 _init_error()
 {
@@ -88,6 +86,22 @@ _full_platform_details()
     echo "$os/$platform $host $kernel"
 }
 
+_full_env_details()
+{
+    cat <<EOF
+QEMU          -- "$QEMU_PROG" $QEMU_OPTIONS
+QEMU_IMG      -- "$QEMU_IMG_PROG" $QEMU_IMG_OPTIONS
+QEMU_IO       -- "$QEMU_IO_PROG" $QEMU_IO_OPTIONS
+QEMU_NBD      -- "$QEMU_NBD_PROG" $QEMU_NBD_OPTIONS
+IMGFMT        -- $FULL_IMGFMT_DETAILS
+IMGPROTO      -- $IMGPROTO
+PLATFORM      -- $FULL_HOST_DETAILS
+TEST_DIR      -- $TEST_DIR
+SOCKET_SCM_HELPER -- $SOCKET_SCM_HELPER
+
+EOF
+}
+
 # $1 = prog to look for
 set_prog_path()
 {
@@ -254,8 +268,8 @@ other options
     -misalign           misalign memory allocations
     -n                  show me, do not run tests
     -o options          -o options to pass to qemu-img create/convert
-    -T                  output timestamps
     -c mode             cache mode
+    -makecheck          pretty print output for make check
 
 testlist options
     -g group[,group...]        include tests from these groups
@@ -403,7 +417,10 @@ testlist options
                 command -v xxdiff >/dev/null 2>&1 && diff=xxdiff
             fi
             ;;
-
+        -makecheck)   # makecheck friendly output
+            makecheck=true
+            xpand=false
+            ;;
         -n)        # show me, don't do it
             showme=true
             xpand=false
@@ -416,11 +433,6 @@ testlist options
             cachemode=true
             xpand=false
             ;;
-        -T)        # turn on timestamp output
-            timestamp=true
-            xpand=false
-            ;;
-
         -v)
             verbose=true
             xpand=false
@@ -633,12 +645,6 @@ _wallclock()
     date "+%H %M %S" | awk '{ print $1*3600 + $2*60 + $3 }'
 }
 
-_timestamp()
-{
-    now=$(date "+%T")
-    printf %s " [$now]"
-}
-
 _wrapup()
 {
     if $showme
@@ -704,23 +710,54 @@ END        { if (NR > 0) {
 
 trap "_wrapup; exit \$status" 0 1 2 3 15
 
+# Report the test start and results. For makecheck we want to pretty
+# print the whole report at the end of the execution.
+# args: $seq, $starttime, $lasttime
+_report_test_start()
+{
+    if ! $makecheck; then
+        if [ -n "$3" ]; then
+            local lasttime=" (last: $3s)"
+        fi
+        printf "%-8s %-10s [%s]            %4s%-14s\r" "$1" "..." "$2" "..." "$lasttime"
+    fi
+}
+# args:$seq $status $starttime $lasttime $thistime $details
+_report_test_result()
+{
+    local status lasttime thistime
+    if $makecheck; then
+        if [ -n "$2" ] && [ "$2" != "pass" ]; then
+            status=" [$2]"
+        fi
+        printf "  TEST    iotest-$IMGFMT: %s%s\n" "$1" "$status"
+        return
+    fi
+
+    if [ -n "$4" ]; then
+        lasttime=" (last: $4s)"
+    fi
+    if [ -n "$5" ]; then
+        thistime=" $5s"
+    fi
+    case "$2" in
+        "pass")     status=$(printf "\e[32m%-10s\e[0m" "$2") ;;
+        "fail")     status=$(printf "\e[1m\e[31m%-10s\e[0m" "$2") ;;
+        "not run")  status=$(printf "\e[33m%-10s\e[0m" "$2") ;;
+        *)          status=$(printf "%-10s" "$2") ;;
+    esac
+
+    printf "%-8s %s [%s] [%s] %4s%-14s %s\n" "$1" "$status" "$3" "$(date '+%T')" "$thistime" "$lasttime" "$6"
+}
+
 [ -f $TIMESTAMP_FILE ] || touch $TIMESTAMP_FILE
 
 FULL_IMGFMT_DETAILS=$(_full_imgfmt_details)
 FULL_HOST_DETAILS=$(_full_platform_details)
 
-cat <<EOF
-QEMU          -- "$QEMU_PROG" $QEMU_OPTIONS
-QEMU_IMG      -- "$QEMU_IMG_PROG" $QEMU_IMG_OPTIONS
-QEMU_IO       -- "$QEMU_IO_PROG" $QEMU_IO_OPTIONS
-QEMU_NBD      -- "$QEMU_NBD_PROG" $QEMU_NBD_OPTIONS
-IMGFMT        -- $FULL_IMGFMT_DETAILS
-IMGPROTO      -- $IMGPROTO
-PLATFORM      -- $FULL_HOST_DETAILS
-TEST_DIR      -- $TEST_DIR
-SOCKET_SCM_HELPER -- $SOCKET_SCM_HELPER
-
-EOF
+if ! $makecheck; then
+    _full_env_details
+fi
 
 seq="check"
 
@@ -728,42 +765,43 @@ seq="check"
 
 for seq in $list
 do
-    err=false
-    printf %s "$seq"
+    err=false       # error flag
+    printdiff=false # show diff to reference output?
+    status=""       # test result summary
+    results=""      # test result details
+
     if [ -n "$TESTS_REMAINING_LOG" ] ; then
         sed -e "s/$seq//" -e 's/  / /' -e 's/^ *//' $TESTS_REMAINING_LOG > $TESTS_REMAINING_LOG.tmp
         mv $TESTS_REMAINING_LOG.tmp $TESTS_REMAINING_LOG
         sync
     fi
 
+    lasttime=$(sed -n -e "/^$seq /s/.* //p" <$TIMESTAMP_FILE)
+    starttime=$(date "+%T")
+    _report_test_start $seq $starttime $lasttime
+
     if $showme
     then
-        echo
-        continue
+        status="not run"
     elif [ -f expunged ] && $expunge && egrep "^$seq([         ]|\$)" expunged >/dev/null
     then
-        echo " - expunged"
+        status="not run"
+        results="expunged"
         rm -f $seq.out.bad
         echo "/^$seq\$/d" >>$tmp.expunged
     elif [ ! -f "$source_iotests/$seq" ]
     then
-        echo " - no such test?"
+        status="not run"
+        results="no such test?"
         echo "/^$seq\$/d" >>$tmp.expunged
     else
         # really going to try and run this one
         #
         rm -f $seq.out.bad
-        lasttime=$(sed -n -e "/^$seq /s/.* //p" <$TIMESTAMP_FILE)
-        if [ "X$lasttime" != X ]; then
-                printf %s " ${lasttime}s ..."
-        else
-                printf "        "        # prettier output with timestamps.
-        fi
         rm -f core $seq.notrun
         rm -f $seq.casenotrun
 
         start=$(_wallclock)
-        $timestamp && printf %s "        [$(date "+%T")]"
 
         if [ "$(head -n 1 "$source_iotests/$seq")" == "#!/usr/bin/env python" ]; then
             run_command="$PYTHON $seq"
@@ -781,26 +819,26 @@ do
                     $run_command >$tmp.out 2>&1)
         fi
         sts=$?
-        $timestamp && _timestamp
         stop=$(_wallclock)
 
         if [ -f core ]
         then
-            printf " [dumped core]"
             mv core $seq.core
+            status="fail"
+            results="[dumped core] $seq.core"
             err=true
         fi
 
         if [ -f $seq.notrun ]
         then
-            $timestamp || printf " [not run] "
-            $timestamp && echo " [not run]" && printf %s "        $seq -- "
-            cat $seq.notrun
-            notrun="$notrun $seq"
+            # overwrites timestamp output
+            status="not run"
+            results="$(cat $seq.notrun)"
         else
             if [ $sts -ne 0 ]
             then
-                printf %s " [failed, exit status $sts]"
+                status="fail"
+                results=$(printf %s "[failed, exit status $sts]")
                 err=true
             fi
 
@@ -821,22 +859,23 @@ do
 
             if [ ! -f "$reference" ]
             then
-                echo " - no qualified output"
+                status="fail"
+                reason="no qualified output"
                 err=true
             else
                 if diff -w "$reference" $tmp.out >/dev/null 2>&1
                 then
-                    echo ""
-                    if $err
-                    then
-                        :
-                    else
-                        echo "$seq $(expr $stop - $start)" >>$tmp.time
+                    if ! $err; then
+                        status="pass"
+                        thistime=$(expr $stop - $start)
+                        echo "$seq $thistime" >>$tmp.time
                     fi
                 else
-                    echo " - output mismatch (see $seq.out.bad)"
                     mv $tmp.out $seq.out.bad
                     $diff -w "$reference" "$PWD"/$seq.out.bad
+                    status="fail"
+                    results="output mismatch (see $seq.out.bad)"
+                    printdiff=true
                     err=true
                 fi
             fi
@@ -850,13 +889,27 @@ do
 
     # come here for each test, except when $showme is true
     #
-    if $err
-    then
-        bad="$bad $seq"
-        n_bad=$(expr $n_bad + 1)
-        quick=false
-    fi
-    [ -f $seq.notrun ] || try=$(expr $try + 1)
+    _report_test_result $seq "$status" "$starttime" "$lasttime" "$thistime" "$results"
+    case "$status" in
+        "pass")
+            try=$(expr $try + 1)
+            ;;
+        "fail")
+            try=$(expr $try + 1)
+            if $makecheck; then
+                _full_env_details
+            fi
+            if $printdiff; then
+                $diff -w "$reference" "$PWD"/$seq.out.bad
+            fi
+            bad="$bad $seq"
+            n_bad=$(expr $n_bad + 1)
+            quick=false
+            ;;
+        "not run")
+            notrun="$notrun $seq"
+            ;;
+    esac
 
     seq="after_$seq"
 done
-- 
2.20.1


