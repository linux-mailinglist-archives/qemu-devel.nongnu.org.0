Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A3758509A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 15:13:43 +0200 (CEST)
Received: from localhost ([::1]:58820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHPoD-0003lg-KW
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 09:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oHPcw-0007c9-DX
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:02:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oHPcj-0000CR-14
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659099708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RjJRL9ZMD4Gcb7S3Fim3915yhE1CVy3SoJuD57X/KbM=;
 b=G1bl5ER9i1SudObpyXhMbCQhqYIi3bAz7d7CW0a2lKBf+413tKsbAc4vikOEe1jU6JShYe
 CMqGmTl2QwqQBs/HU8J8db8sNwGZA2+ikStX0rglu/BRFzahE4ASr4G1MNXE8xJ+lnrFCQ
 C5USG23HzzYpHTvQM2PJAKhv4XnPChI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-hzhfTPsBNCGLwu_2weGmYQ-1; Fri, 29 Jul 2022 09:01:45 -0400
X-MC-Unique: hzhfTPsBNCGLwu_2weGmYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C30073804523;
 Fri, 29 Jul 2022 13:01:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4DF62026D64;
 Fri, 29 Jul 2022 13:01:33 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Hannes Reinecke <hare@suse.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Peter Lieven <pl@kamp.de>, kvm@vger.kernel.org,
 Xie Yongji <xieyongji@bytedance.com>, Eric Auger <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Eric Blake <eblake@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Stefan Weil <sw@weilnetz.de>, Klaus Jensen <its@irrelevant.dk>,
 Laurent Vivier <lvivier@redhat.com>, Alberto Garcia <berto@igalia.com>,
 Michael Roth <michael.roth@amd.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [RFC v2 04/10] static-analyzer: Avoid reanalyzing unmodified
 translation units
Date: Fri, 29 Jul 2022 14:00:33 +0100
Message-Id: <20220729130040.1428779-5-afaria@redhat.com>
In-Reply-To: <20220729130040.1428779-1-afaria@redhat.com>
References: <20220729130040.1428779-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For each translation unit, run each check only if any of the translation
unit's files has been modified since the last time the check ran and
passed without reporting problems.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 static-analyzer.py | 240 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 217 insertions(+), 23 deletions(-)

diff --git a/static-analyzer.py b/static-analyzer.py
index 16e331000d..140760a93e 100755
--- a/static-analyzer.py
+++ b/static-analyzer.py
@@ -25,6 +25,8 @@
 from traceback import print_exc
 from typing import (
     Callable,
+    Dict,
+    FrozenSet,
     Iterable,
     Iterator,
     List,
@@ -32,6 +34,7 @@
     NoReturn,
     Optional,
     Sequence,
+    Tuple,
     Union,
 )
 
@@ -61,9 +64,19 @@ def parse_args() -> Namespace:
             build configuration. Note that a single .c file may give rise to
             several translation units.
 
+            For each translation unit, each check is run only if any its files
+            has been modified since the last time the check ran and passed
+            without reporting problems.
+
             You should build QEMU before running this, since some translation
             units depend on files that are generated during the build. If you
             don't, you'll get errors, but should never get false negatives.
+            Also, translation units that haven't been built will always be
+            reanalyzed, even they haven't been modified, because we cant't know
+            what their dependencies are until they are built. (TODO: This is
+            rather annoying since `make all` does not actually build every
+            translation unit. Should this script trigger an actual full build
+            somehow as a first step?)
             """
         ),
         epilog=textwrap.dedent(
@@ -111,6 +124,16 @@ def parse_args() -> Namespace:
         ),
     )
 
+    parser.add_argument(
+        "-f",
+        "--force",
+        action="store_true",
+        help=(
+            "Analyze translation units even if they haven't been modified since"
+            " the last analysis."
+        ),
+    )
+
     parser.add_argument(
         "-j",
         "--jobs",
@@ -220,12 +243,17 @@ def test() -> int:
 
 def analyze(args: Namespace) -> int:
 
-    tr_units = get_translation_units(args)
+    analysis_timestamp = time.time()
+
+    # load log and get translation units
+
+    log = AnalysisLog.load(args.build_dir)
+    (tr_units, num_up_to_date_tr_units) = get_translation_units(args, log)
 
     # analyze translation units
 
     start_time = time.monotonic()
-    results: List[bool] = []
+    results: List[AnalysisResults] = []
 
     if len(tr_units) == 1:
         progress_suffix = " of 1 translation unit...\033[0m\r"
@@ -237,7 +265,7 @@ def print_progress() -> None:
 
     print_progress()
 
-    def collect_results(results_iter: Iterable[bool]) -> None:
+    def collect_results(results_iter: Iterable[AnalysisResults]) -> None:
         if sys.stdout.isatty():
             for r in results_iter:
                 results.append(r)
@@ -246,27 +274,41 @@ def collect_results(results_iter: Iterable[bool]) -> None:
             for r in results_iter:
                 results.append(r)
 
-    if tr_units:
+    try:
 
-        if args.threads == 1:
+        if tr_units:
 
-            collect_results(map(analyze_translation_unit, tr_units))
+            if args.threads == 1:
 
-        else:
+                collect_results(map(analyze_translation_unit, tr_units))
 
-            # Mimic Python's default pool.map() chunk size, but limit it to
-            # 5 to avoid very big chunks when analyzing thousands of
-            # translation units.
-            chunk_size = min(5, -(-len(tr_units) // (args.threads * 4)))
+            else:
 
-            with Pool(processes=args.threads) as pool:
-                collect_results(
-                    pool.imap_unordered(
-                        analyze_translation_unit, tr_units, chunk_size
+                # Mimic Python's default pool.map() chunk size, but limit it to
+                # 5 to avoid very big chunks when analyzing thousands of
+                # translation units.
+                chunk_size = min(5, -(-len(tr_units) // (args.threads * 4)))
+
+                with Pool(processes=args.threads) as pool:
+                    collect_results(
+                        pool.imap_unordered(
+                            analyze_translation_unit, tr_units, chunk_size
+                        )
                     )
-                )
 
-    end_time = time.monotonic()
+        end_time = time.monotonic()
+
+    finally:
+
+        # update analysis timestamps for passed checks for each translation unit
+        # (even if the static analyzer failed or was interrupted)
+
+        for r in results:
+            log.set_last_analysis_time(
+                r.tr_unit_object_file, r.passed_check_names, analysis_timestamp
+            )
+
+        log.save()
 
     # print summary
 
@@ -275,13 +317,18 @@ def collect_results(results_iter: Iterable[bool]) -> None:
     else:
         message = f"Analyzed {len(tr_units)} translation units"
 
+    if num_up_to_date_tr_units == 1:
+        message += " (1 other was up-to-date)"
+    elif num_up_to_date_tr_units > 1:
+        message += f" ({num_up_to_date_tr_units} other were up-to-date)"
+
     message += f" in {end_time - start_time:.1f} seconds."
 
     print(f"\033[0;34m{message}\033[0m")
 
     # exit
 
-    return 0 if all(results) else 3
+    return 0 if all(not r.problems_found for r in results) else 3
 
 
 # ---------------------------------------------------------------------------- #
@@ -293,13 +340,17 @@ class TranslationUnit:
     absolute_path: str
     build_working_dir: str
     build_command: str
+    object_file: str
     system_include_paths: Sequence[str]
     check_names: Sequence[str]
     custom_printer: Optional[Callable[[str], None]]
 
 
-def get_translation_units(args: Namespace) -> Sequence["TranslationUnit"]:
-    """Return a list of translation units to be analyzed."""
+def get_translation_units(
+    args: Namespace, log: "AnalysisLog"
+) -> Tuple[Sequence["TranslationUnit"], int]:
+    """Return a list of translation units to be analyzed, and the number of
+    translation units that were skipped because all checks are up to date."""
 
     system_include_paths = get_clang_system_include_paths()
     compile_commands = load_compilation_database(args.build_dir)
@@ -311,6 +362,7 @@ def get_translation_units(args: Namespace) -> Sequence["TranslationUnit"]:
             absolute_path=str(Path(cmd["directory"], cmd["file"]).resolve()),
             build_working_dir=cmd["directory"],
             build_command=cmd["command"],
+            object_file=cmd["output"],
             system_include_paths=system_include_paths,
             check_names=args.check_names,
             custom_printer=None,
@@ -365,17 +417,25 @@ def get_translation_units(args: Namespace) -> Sequence["TranslationUnit"]:
     # ensure that at least one translation unit is selected
 
     tr_unit_list = list(tr_units)
+    num_selected_tr_units = len(tr_unit_list)
 
     if not tr_unit_list:
         fatal("No translation units to analyze")
 
+    # skip translation units that don't need reanalyzing
+
+    if not args.force:
+        log.drop_up_to_date_checks(tr_unit_list)
+
+    num_up_to_date_tr_units = num_selected_tr_units - len(tr_unit_list)
+
     # disable all checks if --skip-checks was given
 
     if args.skip_checks:
         for context in tr_unit_list:
             context.check_names = []
 
-    return tr_unit_list
+    return (tr_unit_list, num_up_to_date_tr_units)
 
 
 def get_clang_system_include_paths() -> Sequence[str]:
@@ -420,21 +480,154 @@ def load_compilation_database(build_dir: Path) -> Sequence[Mapping[str, str]]:
         fatal(f"{path} does not exist")
 
 
+# ---------------------------------------------------------------------------- #
+# Analysis log
+
+
+@dataclass
+class AnalysisLog:
+
+    build_dir: Path
+    deps_by_object_file: Mapping[str, FrozenSet[str]]
+    last_analysis: Dict[str, Dict[str, float]]
+
+    @classmethod
+    def load(cls, build_dir: Path) -> "AnalysisLog":
+
+        # get dependencies
+
+        result = subprocess.run(
+            ["ninja", "-C", str(build_dir), "-t", "deps"],
+            stdin=subprocess.DEVNULL,
+            stdout=subprocess.PIPE,
+            stderr=subprocess.DEVNULL,
+            universal_newlines=True,  # decode output using default encoding
+            check=True,
+        )
+
+        deps: Dict[str, FrozenSet[str]] = {}
+
+        for group in result.stdout.split("\n\n"):
+            if group:
+                [first_line, *other_lines] = group.splitlines()
+                target = first_line[: first_line.index(":")]
+                deps[target] = frozenset(dep[4:] for dep in other_lines)
+
+        # load log
+
+        try:
+            with (build_dir / "static-analyzer-log.json").open("r") as f:
+                last_analysis: Dict[str, Dict[str, float]] = json.load(f)
+        except FileNotFoundError:
+            last_analysis = {}
+
+        return AnalysisLog(
+            build_dir=build_dir,
+            deps_by_object_file=deps,
+            last_analysis=last_analysis,
+        )
+
+    def drop_up_to_date_checks(self, tr_units: List[TranslationUnit]) -> None:
+        """For each translation unit, removes checks from
+        `TranslationUnit.check_names` that are are up-to-date.
+
+        If a `TranslationUnit` ends up with no checks, it is removed from the
+        list.
+        """
+
+        # deps are output relative to build dir
+        with cwd(self.build_dir):
+
+            def f(tr_unit: TranslationUnit) -> bool:
+                tr_unit.check_names = self._outdated_checks(
+                    tr_unit.object_file, tr_unit.check_names
+                )
+                return bool(tr_unit.check_names)
+
+            tr_units[:] = list(filter(f, tr_units))
+
+    def _outdated_checks(
+        self,
+        tr_unit_object_file: str,
+        candidate_check_names: Sequence[str],
+    ) -> Sequence[str]:
+        """Working directory must be `self.build_dir`."""
+
+        deps = self.deps_by_object_file.get(tr_unit_object_file)
+
+        if deps is None:
+            # This happens when the translation unit hasn't been built. In this
+            # case, we cannot know what its dependencies are, and thus whether
+            # they have been modified, so we must play safe and run all checks.
+            return candidate_check_names
+
+        latest_dep_mtime = max(map(os.path.getmtime, deps), default=0.0)
+
+        d = self.last_analysis.get(tr_unit_object_file, {})
+
+        return [
+            check
+            for check in candidate_check_names
+            if latest_dep_mtime >= d.get(check, 0.0)
+        ]
+
+    def set_last_analysis_time(
+        self,
+        tr_unit_object_file: str,
+        check_names: Iterable[str],
+        time: float,
+    ) -> None:
+
+        d = self.last_analysis.setdefault(tr_unit_object_file, {})
+
+        for check_name in check_names:
+            d[check_name] = time
+
+    def save(self) -> None:
+
+        with (self.build_dir / "static-analyzer-log.json").open("w") as f:
+            json.dump(self.last_analysis, f, indent=2)
+
+
 # ---------------------------------------------------------------------------- #
 # Analysis
 
 
-def analyze_translation_unit(tr_unit: TranslationUnit) -> bool:
+@dataclass
+class AnalysisResults:
+    tr_unit_object_file: str
+    passed_check_names: Sequence[str]
+    problems_found: bool
+
+
+def analyze_translation_unit(tr_unit: TranslationUnit) -> AnalysisResults:
 
     check_context = get_check_context(tr_unit)
 
+    had_diagnostics = check_context._problems_found
+    problems_found = check_context._problems_found
+    passed_check_names: List[str] = []
+
     try:
+
         for name in tr_unit.check_names:
+
+            check_context._problems_found = False
             CHECKS[name].checker(check_context)
+
+            if not had_diagnostics and not check_context._problems_found:
+                passed_check_names.append(name)
+            else:
+                problems_found = True
+
     except Exception as e:
         raise RuntimeError(f"Error analyzing {check_context._rel_path}") from e
 
-    return not check_context._problems_found
+    return AnalysisResults(
+        tr_unit_object_file=tr_unit.object_file,
+        passed_check_names=passed_check_names,
+        problems_found=problems_found,
+    )
 
 
 def get_check_context(tr_unit: TranslationUnit) -> CheckContext:
@@ -530,6 +723,7 @@ def run_test(
             absolute_path=str(input_path),
             build_working_dir=str(input_path.parent),
             build_command=f"cc {shlex.quote(str(input_path))}",
+            object_file="file.o",
             system_include_paths=[],
             check_names=[check_name],
             custom_printer=lambda s: actual_output_list.append(s + "\n"),
-- 
2.37.1


