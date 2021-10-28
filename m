Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A869E43E3C8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:31:56 +0200 (CEST)
Received: from localhost ([::1]:49446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6Rf-0005gI-Oq
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mg6OR-0003kj-U0
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:28:35 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mg6OP-0005Nt-2b
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:28:35 -0400
Received: by mail-ed1-x52b.google.com with SMTP id g8so25926294edb.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 07:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U81IzbDIyGmekvfq6EM/Dm5l949v1ekX00r5OD99uFg=;
 b=iB0Cbyxcbu//8LXHs3rUxsRr4c+8FlSC733HdLwoBvpbozFRxssAWsFn7hN8CEGe3C
 ZYz7prOci3Hrovp2ZtoZVTn5ShqZkYicMHnsY3/dEZiwz2qJsA3orf3E4QJD+ySnpjjQ
 aWW0oJJnd/khKwdbgFBMm4vsRpDl/BWhkEUAMQTE+m/LkldxFRmG1VcRFU4NanvIPWYD
 zr1nquIdoCs7fZ20La/M0TRRPLp4v+9JmORaKHUL4xWSCgjb4Z+p6oHAiKgR/PxrIbMS
 qkKYSbo1ssqwbFj5MPTMx5xRbMYaj3bgSVjcLb32n8k9vzKn0cH4s7vxffU9pjDbnZFT
 FygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U81IzbDIyGmekvfq6EM/Dm5l949v1ekX00r5OD99uFg=;
 b=6nKAdsUY3CLAbNN1WtRbjSE2r46HAi5Ar8P4dfArIWCdiUV5i3J8jznkQFQDdJa9Wr
 uPwAldwkCGG6VZu/NCg8kbddVGzJ1/k6xnokwQavJ3KiPlGVvBygekE74EsnKbko9Dyi
 VLAU9Cea3tUmXhHGQQdo+Cw2aBxVvUVLrgdxJyRp+GPN9NafC7l/uSr7bzV7QF21MNFm
 K5przZjbBNAPJat4ASrK/vRctfG2e6njJovdcjzWYlIIMr9f4HPyOgSUnBprsKdMT0oI
 PnQ9onBupgVd5DhdIuH8DInWscfiMMK9uN/Wxdh9X1dMnL2iiCXkwkkApvVkGuqE76P+
 Vngg==
X-Gm-Message-State: AOAM533FZAoOIj5NQVDtIaJc72WA7mg7zQBkmezTFYR+brxAXCSy0Hjn
 yxkD4tIEvBkTvYH80dOoW5dDoGGH/Uo=
X-Google-Smtp-Source: ABdhPJyvuNbVcK82n5ppuSCLZ6xM+NfrBl36xNuHeAOpW9teUcGRDunmao5edymnHYS4fkxRbn5P1w==
X-Received: by 2002:aa7:d497:: with SMTP id b23mr6615362edr.218.1635431310300; 
 Thu, 28 Oct 2021 07:28:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q23sm1517201ejr.0.2021.10.28.07.28.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:28:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] build: use "meson test" as the test harness
Date: Thu, 28 Oct 2021 16:28:26 +0200
Message-Id: <20211028142826.57327-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028142826.57327-1-pbonzini@redhat.com>
References: <20211028142826.57327-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"meson test" starting with version 0.57 is just as capable and easy to
use as QEMU's own TAP driver.  All existing options for "make check"
work.  The only required code change involves how to mark "slow" tests.

The rules for .tap output are replaced by JUnit XML; GitLab is able
to parse that output and present it in the CI pipeline report.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile              |   3 +-
 meson.build           |   5 +-
 scripts/mtest2make.py | 104 ++++--------
 scripts/tap-driver.pl | 379 ------------------------------------------
 scripts/tap-merge.pl  | 111 -------------
 tests/fp/meson.build  |   2 +-
 6 files changed, 41 insertions(+), 563 deletions(-)
 delete mode 100755 scripts/tap-driver.pl
 delete mode 100755 scripts/tap-merge.pl

diff --git a/Makefile b/Makefile
index 74c5b46d38..5d66c35ea5 100644
--- a/Makefile
+++ b/Makefile
@@ -145,7 +145,8 @@ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
 
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
-ninja-cmd-goals += $(foreach t, $(.tests), $(.test.deps.$t))
+ninja-cmd-goals += $(foreach t, $(.check.build-suites), $(.check-$t.deps))
+ninja-cmd-goals += $(foreach t, $(.bench.build-suites), $(.bench-$t.deps))
 
 makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
 # "ninja -t targets" also lists all prerequisites.  If build system
diff --git a/meson.build b/meson.build
index 2c5b53cbe2..9b59436f72 100644
--- a/meson.build
+++ b/meson.build
@@ -1,8 +1,11 @@
 project('qemu', ['c'], meson_version: '>=0.58.2',
         default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
-                          'b_staticpic=false'],
+                          'b_staticpic=false', 'stdsplit=false'],
         version: files('VERSION'))
 
+add_test_setup('quick', exclude_suites: 'slow', is_default: true)
+add_test_setup('slow', env: ['G_TEST_SLOW=1', 'SPEED=slow'])
+
 not_found = dependency('', required: false)
 keyval = import('keyval')
 ss = import('sourceset')
diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 02c0453e67..29625ce8cc 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -13,101 +13,67 @@
 
 class Suite(object):
     def __init__(self):
-        self.tests = list()
-        self.slow_tests = list()
-        self.executables = set()
+        self.deps = set()
 
 print('''
 SPEED = quick
 
-# $1 = environment, $2 = test command, $3 = test name, $4 = dir
-.test-human-tap = $1 $(if $4,(cd $4 && $2),$2) -m $(SPEED) < /dev/null | ./scripts/tap-driver.pl --test-name="$3" $(if $(V),,--show-failures-only)
-.test-human-exitcode = $1 $(PYTHON) scripts/test-driver.py $(if $4,-C$4) $(if $(V),--verbose) -- $2 < /dev/null
-.test-tap-tap = $1 $(if $4,(cd $4 && $2),$2) < /dev/null | sed "s/^[a-z][a-z]* [0-9]*/& $3/" || true
-.test-tap-exitcode = printf "%s\\n" 1..1 "`$1 $(if $4,(cd $4 && $2),$2) < /dev/null > /dev/null || echo "not "`ok 1 $3"
-.test.human-print = echo $(if $(V),'$1 $2','Running test $3') &&
-.test.env = MALLOC_PERTURB_=$${MALLOC_PERTURB_:-$$(( $${RANDOM:-0} % 255 + 1))}
+.mtestargs = --no-rebuild -t 0
+.mtestargs += $(subst -j,--num-processes , $(filter-out -j, $(lastword -j1 $(filter -j%, $(MAKEFLAGS)))))
+ifneq ($(SPEED), quick)
+.mtestargs += --setup $(SPEED)
+endif
 
-# $1 = test name, $2 = test target (human or tap)
-.test.run = $(call .test.$2-print,$(.test.env.$1),$(.test.cmd.$1),$(.test.name.$1)) $(call .test-$2-$(.test.driver.$1),$(.test.env.$1),$(.test.cmd.$1),$(.test.name.$1),$(.test.dir.$1))
-
-.test.output-format = human
+.check.mtestargs = $(MTESTARGS) $(.mtestargs) $(if $(V),--verbose,--print-errorlogs)
+.bench.mtestargs = $(MTESTARGS) $(.mtestargs) --benchmark --verbose
 ''')
 
 introspect = json.load(sys.stdin)
-i = 0
 
 def process_tests(test, targets, suites):
-    global i
-    env = ' '.join(('%s=%s' % (shlex.quote(k), shlex.quote(v))
-                    for k, v in test['env'].items()))
     executable = test['cmd'][0]
     try:
         executable = os.path.relpath(executable)
     except:
         pass
-    if test['workdir'] is not None:
-        try:
-            test['cmd'][0] = os.path.relpath(executable, test['workdir'])
-        except:
-            test['cmd'][0] = executable
-    else:
-        test['cmd'][0] = executable
-    cmd = ' '.join((shlex.quote(x) for x in test['cmd']))
-    driver = test['protocol'] if 'protocol' in test else 'exitcode'
-
-    i += 1
-    if test['workdir'] is not None:
-        print('.test.dir.%d := %s' % (i, shlex.quote(test['workdir'])))
 
     deps = (targets.get(x, []) for x in test['depends'])
     deps = itertools.chain.from_iterable(deps)
-
-    print('.test.name.%d := %s' % (i, test['name']))
-    print('.test.driver.%d := %s' % (i, driver))
-    print('.test.env.%d := $(.test.env) %s' % (i, env))
-    print('.test.cmd.%d := %s' % (i, cmd))
-    print('.test.deps.%d := %s' % (i, ' '.join(deps)))
-    print('.PHONY: run-test-%d' % (i,))
-    print('run-test-%d: $(.test.deps.%d)' % (i,i))
-    print('\t@$(call .test.run,%d,$(.test.output-format))' % (i,))
+    deps = list(deps)
 
     test_suites = test['suite'] or ['default']
-    is_slow = any(s.endswith('-slow') for s in test_suites)
     for s in test_suites:
         # The suite name in the introspection info is "PROJECT:SUITE"
         s = s.split(':')[1]
-        if s.endswith('-slow'):
-            s = s[:-5]
-        if is_slow:
-            suites[s].slow_tests.append(i)
-        else:
-            suites[s].tests.append(i)
-        suites[s].executables.add(executable)
+        if s == 'slow':
+            continue
+        suites[s].deps.update(deps)
 
 def emit_prolog(suites, prefix):
-    all_tap = ' '.join(('%s-report-%s.tap' % (prefix, k) for k in suites.keys()))
-    print('.PHONY: %s %s-report.tap %s' % (prefix, prefix, all_tap))
-    print('%s: run-tests' % (prefix,))
-    print('%s-report.tap %s: %s-report%%.tap: all' % (prefix, all_tap, prefix))
-    print('''\t$(MAKE) .test.output-format=tap --quiet -Otarget V=1 %s$* | ./scripts/tap-merge.pl | tee "$@" \\
-              | ./scripts/tap-driver.pl $(if $(V),, --show-failures-only)''' % (prefix, ))
+    all_targets = ' '.join((f'{prefix}-{k}' for k in suites.keys()))
+    all_xml = ' '.join((f'{prefix}-report-{k}.junit.xml' for k in suites.keys()))
+    print(f'all-{prefix}-targets = {all_targets}')
+    print(f'all-{prefix}-xml = {all_xml}')
+    print(f'.PHONY: {prefix} do-meson-{prefix} {prefix}-report.junit.xml $(all-{prefix}-targets) $(all-{prefix}-xml)')
+    print(f'ifeq ($(filter {prefix}, $(MAKECMDGOALS)),)')
+    print(f'.{prefix}.mtestargs += $(foreach s,$(sort $(.{prefix}.mtest-suites)), --suite $s)')
+    print(f'endif')
+    print(f'{prefix}-build: run-ninja')
+    print(f'{prefix} $(all-{prefix}-targets): do-meson-{prefix}')
+    print(f'do-meson-{prefix}: run-ninja; $(if $(MAKE.n),,+)$(MESON) test $(.{prefix}.mtestargs)')
+    print(f'{prefix}-report.junit.xml $(all-{prefix}-xml): {prefix}-report%.junit.xml: run-ninja')
+    print(f'\t$(MAKE) {prefix}$* MTESTARGS="$(MTESTARGS) --logbase {prefix}-report$*" && ln -f meson-logs/$@ .')
 
 def emit_suite(name, suite, prefix):
-    executables = ' '.join(suite.executables)
-    slow_test_numbers = ' '.join((str(x) for x in suite.slow_tests))
-    test_numbers = ' '.join((str(x) for x in suite.tests))
-    target = '%s-%s' % (prefix, name)
-    print('.test.quick.%s := %s' % (target, test_numbers))
-    print('.test.slow.%s := $(.test.quick.%s) %s' % (target, target, slow_test_numbers))
-    print('%s-build: %s' % (prefix, executables))
-    print('.PHONY: %s' % (target, ))
-    print('.PHONY: %s-report-%s.tap' % (prefix, name))
-    print('%s: run-tests' % (target, ))
-    print('ifneq ($(filter %s %s, $(MAKECMDGOALS)),)' % (target, prefix))
-    print('.tests += $(.test.$(SPEED).%s)' % (target, ))
-    print('endif')
-    print('all-%s-targets += %s' % (prefix, target))
+    deps = ' '.join(suite.deps)
+    targets = f'{prefix}-{name} {prefix}-report-{name}.junit.xml {prefix} {prefix}-report.junit.xml'
+    print(f'.{prefix}-{name}.deps = {deps}')
+    print(f'ifneq ($(filter {prefix}-build {targets}, $(MAKECMDGOALS)),)')
+    print(f'.{prefix}.build-suites += {name}')
+    print(f'endif')
+    print(f'ifneq ($(filter {targets}, $(MAKECMDGOALS)),)')
+    print(f'.{prefix}.mtest-suites += {name}')
+    print(f'endif')
 
 targets = {t['id']: [os.path.relpath(f) for f in t['filename']]
            for t in introspect['targets']}
@@ -125,5 +91,3 @@ def emit_suite(name, suite, prefix):
 emit_prolog(benchsuites, 'bench')
 for name, suite in benchsuites.items():
     emit_suite(name, suite, 'bench')
-
-print('run-tests: $(patsubst %, run-test-%, $(.tests))')
diff --git a/scripts/tap-driver.pl b/scripts/tap-driver.pl
deleted file mode 100755
index b1d3880c50..0000000000
--- a/scripts/tap-driver.pl
+++ /dev/null
@@ -1,379 +0,0 @@
-#! /usr/bin/env perl
-# Copyright (C) 2011-2013 Free Software Foundation, Inc.
-# Copyright (C) 2018 Red Hat, Inc.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2, or (at your option)
-# any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program.  If not, see <https://www.gnu.org/licenses/>.
-
-# As a special exception to the GNU General Public License, if you
-# distribute this file as part of a program that contains a
-# configuration script generated by Autoconf, you may include it under
-# the same distribution terms that you use for the rest of that program.
-
-# ---------------------------------- #
-#  Imports, static data, and setup.  #
-# ---------------------------------- #
-
-use warnings FATAL => 'all';
-use strict;
-use Getopt::Long ();
-use TAP::Parser;
-use Term::ANSIColor qw(:constants);
-
-my $ME = "tap-driver.pl";
-my $VERSION = "2018-11-30";
-
-my $USAGE = <<'END';
-Usage:
-  tap-driver [--test-name=TEST] [--color={always|never|auto}]
-             [--verbose] [--show-failures-only]
-END
-
-my $HELP = "$ME: TAP-aware test driver for QEMU testsuite harness." .
-           "\n" . $USAGE;
-
-# It's important that NO_PLAN evaluates "false" as a boolean.
-use constant NO_PLAN => 0;
-use constant EARLY_PLAN => 1;
-use constant LATE_PLAN => 2;
-
-use constant DIAG_STRING => "#";
-
-# ------------------- #
-#  Global variables.  #
-# ------------------- #
-
-my $testno = 0;     # Number of test results seen so far.
-my $bailed_out = 0; # Whether a "Bail out!" directive has been seen.
-my $failed = 0;     # Final exit code
-
-# Whether the TAP plan has been seen or not, and if yes, which kind
-# it is ("early" is seen before any test result, "late" otherwise).
-my $plan_seen = NO_PLAN;
-
-# ----------------- #
-#  Option parsing.  #
-# ----------------- #
-
-my %cfg = (
-  "color" => 0,
-  "verbose" => 0,
-  "show-failures-only" => 0,
-);
-
-my $color = "auto";
-my $test_name = undef;
-
-# Perl's Getopt::Long allows options to take optional arguments after a space.
-# Prevent --color by itself from consuming other arguments
-foreach (@ARGV) {
-  if ($_ eq "--color" || $_ eq "-color") {
-    $_ = "--color=$color";
-  }
-}
-
-Getopt::Long::GetOptions
-  (
-    'help' => sub { print $HELP; exit 0; },
-    'version' => sub { print "$ME $VERSION\n"; exit 0; },
-    'test-name=s' => \$test_name,
-    'color=s'  => \$color,
-    'show-failures-only' => sub { $cfg{"show-failures-only"} = 1; },
-    'verbose' => sub { $cfg{"verbose"} = 1; },
-  ) or exit 1;
-
-if ($color =~ /^always$/i) {
-  $cfg{'color'} = 1;
-} elsif ($color =~ /^never$/i) {
-  $cfg{'color'} = 0;
-} elsif ($color =~ /^auto$/i) {
-  $cfg{'color'} = (-t STDOUT);
-} else {
-  die "Invalid color mode: $color\n";
-}
-
-# ------------- #
-#  Prototypes.  #
-# ------------- #
-
-sub colored ($$);
-sub decorate_result ($);
-sub extract_tap_comment ($);
-sub handle_tap_bailout ($);
-sub handle_tap_plan ($);
-sub handle_tap_result ($);
-sub is_null_string ($);
-sub main ();
-sub report ($;$);
-sub stringify_result_obj ($);
-sub testsuite_error ($);
-
-# -------------- #
-#  Subroutines.  #
-# -------------- #
-
-# If the given string is undefined or empty, return true, otherwise
-# return false.  This function is useful to avoid pitfalls like:
-#   if ($message) { print "$message\n"; }
-# which wouldn't print anything if $message is the literal "0".
-sub is_null_string ($)
-{
-  my $str = shift;
-  return ! (defined $str and length $str);
-}
-
-sub stringify_result_obj ($)
-{
-  my $result_obj = shift;
-  if ($result_obj->is_unplanned || $result_obj->number != $testno)
-    {
-      return "ERROR";
-    }
-  elsif ($plan_seen == LATE_PLAN)
-    {
-      return "ERROR";
-    }
-  elsif (!$result_obj->directive)
-    {
-      return $result_obj->is_ok ? "PASS" : "FAIL";
-    }
-  elsif ($result_obj->has_todo)
-    {
-      return $result_obj->is_actual_ok ? "XPASS" : "XFAIL";
-    }
-  elsif ($result_obj->has_skip)
-    {
-      return $result_obj->is_ok ? "SKIP" : "FAIL";
-    }
-  die "$ME: INTERNAL ERROR"; # NOTREACHED
-}
-
-sub colored ($$)
-{
-  my ($color_string, $text) = @_;
-  return $color_string . $text . RESET;
-}
-
-sub decorate_result ($)
-{
-  my $result = shift;
-  return $result unless $cfg{"color"};
-  my %color_for_result =
-    (
-      "ERROR" => BOLD.MAGENTA,
-      "PASS"  => GREEN,
-      "XPASS" => BOLD.YELLOW,
-      "FAIL"  => BOLD.RED,
-      "XFAIL" => YELLOW,
-      "SKIP"  => BLUE,
-    );
-  if (my $color = $color_for_result{$result})
-    {
-      return colored ($color, $result);
-    }
-  else
-    {
-      return $result; # Don't colorize unknown stuff.
-    }
-}
-
-sub report ($;$)
-{
-  my ($msg, $result, $explanation) = (undef, @_);
-  if ($result =~ /^(?:X?(?:PASS|FAIL)|SKIP|ERROR)/)
-    {
-      # Output on console might be colorized.
-      $msg = decorate_result($result);
-      if ($result =~ /^(?:PASS|XFAIL|SKIP)/)
-        {
-          return if $cfg{"show-failures-only"};
-        }
-      else
-        {
-          $failed = 1;
-        }
-    }
-  elsif ($result eq "#")
-    {
-      $msg = "  ";
-    }
-  else
-    {
-      die "$ME: INTERNAL ERROR"; # NOTREACHED
-    }
-  $msg .= " $explanation" if defined $explanation;
-  print $msg . "\n";
-}
-
-sub testsuite_error ($)
-{
-  report "ERROR", "$test_name - $_[0]";
-}
-
-sub handle_tap_result ($)
-{
-  $testno++;
-  my $result_obj = shift;
-
-  my $test_result = stringify_result_obj $result_obj;
-  my $string = $result_obj->number;
-
-  my $description = $result_obj->description;
-  $string .= " $test_name" unless is_null_string $test_name;
-  $string .= " $description" unless is_null_string $description;
-
-  if ($plan_seen == LATE_PLAN)
-    {
-      $string .= " # AFTER LATE PLAN";
-    }
-  elsif ($result_obj->is_unplanned)
-    {
-      $string .= " # UNPLANNED";
-    }
-  elsif ($result_obj->number != $testno)
-    {
-      $string .= " # OUT-OF-ORDER (expecting $testno)";
-    }
-  elsif (my $directive = $result_obj->directive)
-    {
-      $string .= " # $directive";
-      my $explanation = $result_obj->explanation;
-      $string .= " $explanation"
-        unless is_null_string $explanation;
-    }
-
-  report $test_result, $string;
-}
-
-sub handle_tap_plan ($)
-{
-  my $plan = shift;
-  if ($plan_seen)
-    {
-      # Error, only one plan per stream is acceptable.
-      testsuite_error "multiple test plans";
-      return;
-    }
-  # The TAP plan can come before or after *all* the TAP results; we speak
-  # respectively of an "early" or a "late" plan.  If we see the plan line
-  # after at least one TAP result has been seen, assume we have a late
-  # plan; in this case, any further test result seen after the plan will
-  # be flagged as an error.
-  $plan_seen = ($testno >= 1 ? LATE_PLAN : EARLY_PLAN);
-  # If $testno > 0, we have an error ("too many tests run") that will be
-  # automatically dealt with later, so don't worry about it here.  If
-  # $plan_seen is true, we have an error due to a repeated plan, and that
-  # has already been dealt with above.  Otherwise, we have a valid "plan
-  # with SKIP" specification, and should report it as a particular kind
-  # of SKIP result.
-  if ($plan->directive && $testno == 0)
-    {
-      my $explanation = is_null_string ($plan->explanation) ?
-                        undef : "- " . $plan->explanation;
-      report "SKIP", $explanation;
-    }
-}
-
-sub handle_tap_bailout ($)
-{
-  my ($bailout, $msg) = ($_[0], "Bail out!");
-  $bailed_out = 1;
-  $msg .= " " . $bailout->explanation
-    unless is_null_string $bailout->explanation;
-  testsuite_error $msg;
-}
-
-sub extract_tap_comment ($)
-{
-  my $line = shift;
-  if (index ($line, DIAG_STRING) == 0)
-    {
-      # Strip leading `DIAG_STRING' from `$line'.
-      $line = substr ($line, length (DIAG_STRING));
-      # And strip any leading and trailing whitespace left.
-      $line =~ s/(?:^\s*|\s*$)//g;
-      # Return what is left (if any).
-      return $line;
-    }
-  return "";
-}
-
-sub main ()
-{
-  my $iterator = TAP::Parser::Iterator::Stream->new(\*STDIN);
-  my $parser = TAP::Parser->new ({iterator => $iterator });
-
-  STDOUT->autoflush(1);
-  while (defined (my $cur = $parser->next))
-    {
-      # Parsing of TAP input should stop after a "Bail out!" directive.
-      next if $bailed_out;
-
-      if ($cur->is_plan)
-        {
-          handle_tap_plan ($cur);
-        }
-      elsif ($cur->is_test)
-        {
-          handle_tap_result ($cur);
-        }
-      elsif ($cur->is_bailout)
-        {
-          handle_tap_bailout ($cur);
-        }
-      elsif ($cfg{"verbose"})
-        {
-          my $comment = extract_tap_comment ($cur->raw);
-          report "#", "$comment" if length $comment;
-       }
-    }
-  # A "Bail out!" directive should cause us to ignore any following TAP
-  # error.
-  if (!$bailed_out)
-    {
-      if (!$plan_seen)
-        {
-          testsuite_error "missing test plan";
-        }
-      elsif ($parser->tests_planned != $parser->tests_run)
-        {
-          my ($planned, $run) = ($parser->tests_planned, $parser->tests_run);
-          my $bad_amount = $run > $planned ? "many" : "few";
-          testsuite_error (sprintf "too %s tests run (expected %d, got %d)",
-                                   $bad_amount, $planned, $run);
-        }
-    }
-}
-
-# ----------- #
-#  Main code. #
-# ----------- #
-
-main;
-exit($failed);
-
-# Local Variables:
-# perl-indent-level: 2
-# perl-continued-statement-offset: 2
-# perl-continued-brace-offset: 0
-# perl-brace-offset: 0
-# perl-brace-imaginary-offset: 0
-# perl-label-offset: -2
-# cperl-indent-level: 2
-# cperl-brace-offset: 0
-# cperl-continued-brace-offset: 0
-# cperl-label-offset: -2
-# cperl-extra-newline-before-brace: t
-# cperl-merge-trailing-else: nil
-# cperl-continued-statement-offset: 2
-# End:
diff --git a/scripts/tap-merge.pl b/scripts/tap-merge.pl
deleted file mode 100755
index 10ccf57bb2..0000000000
--- a/scripts/tap-merge.pl
+++ /dev/null
@@ -1,111 +0,0 @@
-#! /usr/bin/env perl
-# Copyright (C) 2018 Red Hat, Inc.
-#
-# Author: Paolo Bonzini <pbonzini@redhat.com>
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2, or (at your option)
-# any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program.  If not, see <https://www.gnu.org/licenses/>.
-
-# ---------------------------------- #
-#  Imports, static data, and setup.  #
-# ---------------------------------- #
-
-use warnings FATAL => 'all';
-use strict;
-use Getopt::Long ();
-use TAP::Parser;
-
-my $ME = "tap-merge.pl";
-my $VERSION = "2018-11-30";
-
-my $HELP = "$ME: merge multiple TAP inputs from stdin.";
-
-use constant DIAG_STRING => "#";
-
-# ----------------- #
-#  Option parsing.  #
-# ----------------- #
-
-Getopt::Long::GetOptions
-  (
-    'help' => sub { print $HELP; exit 0; },
-    'version' => sub { print "$ME $VERSION\n"; exit 0; },
-  );
-
-# -------------- #
-#  Subroutines.  #
-# -------------- #
-
-sub main ()
-{
-  my $iterator = TAP::Parser::Iterator::Stream->new(\*STDIN);
-  my $parser = TAP::Parser->new ({iterator => $iterator });
-  my $testno = 0;     # Number of test results seen so far.
-  my $bailed_out = 0; # Whether a "Bail out!" directive has been seen.
-
-  STDOUT->autoflush(1);
-  while (defined (my $cur = $parser->next))
-    {
-      if ($cur->is_bailout)
-        {
-          $bailed_out = 1;
-          print DIAG_STRING . " " . $cur->as_string . "\n";
-          next;
-        }
-      elsif ($cur->is_plan)
-        {
-          $bailed_out = 0;
-          next;
-        }
-      elsif ($cur->is_test)
-        {
-          $bailed_out = 0 if $cur->number == 1;
-          $testno++;
-          $cur = TAP::Parser::Result::Test->new({
-                          ok => $cur->ok,
-                          test_num => $testno,
-                          directive => $cur->directive,
-                          explanation => $cur->explanation,
-                          description => $cur->description
-                  });
-        }
-      elsif ($cur->is_version)
-        {
-          next if $testno > 0;
-        }
-      print $cur->as_string . "\n" unless $bailed_out;
-    }
-  print "1..$testno\n";
-}
-
-# ----------- #
-#  Main code. #
-# ----------- #
-
-main;
-
-# Local Variables:
-# perl-indent-level: 2
-# perl-continued-statement-offset: 2
-# perl-continued-brace-offset: 0
-# perl-brace-offset: 0
-# perl-brace-imaginary-offset: 0
-# perl-label-offset: -2
-# cperl-indent-level: 2
-# cperl-brace-offset: 0
-# cperl-continued-brace-offset: 0
-# cperl-label-offset: -2
-# cperl-extra-newline-before-brace: t
-# cperl-merge-trailing-else: nil
-# cperl-continued-statement-offset: 2
-# End:
diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 07e2cdc8d2..32d57031fc 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -622,7 +622,7 @@ test('fp-test-mulAdd', fptest,
      # no fptest_rounding_args
      args: fptest_args +
            ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
-     suite: ['softfloat-slow', 'softfloat-ops-slow'], timeout: 90)
+     suite: ['softfloat', 'softfloat-ops', 'slow'], timeout: 90)
 
 fpbench = executable(
   'fp-bench',
-- 
2.31.1


