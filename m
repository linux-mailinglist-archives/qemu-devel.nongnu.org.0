Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDE0633AF9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 12:15:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxREq-0006vV-0x; Tue, 22 Nov 2022 06:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bakulinm@ispras.ru>)
 id 1oxREn-0006vD-68
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:14:49 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bakulinm@ispras.ru>)
 id 1oxREk-0001uo-KC
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:14:48 -0500
Received: from rainloop.ispras.ru (unknown [83.149.199.84])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3AD3C419E9F0;
 Tue, 22 Nov 2022 11:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 3AD3C419E9F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1669115657;
 bh=2e1zf6NY3saiI7Ou3EzSCaqLOs0P7cDi6bJZqRxybWM=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=bOHNxXgXWyhDn6dE+hXv1XExuDF2nC5BHoVEvW9PWipawinivgoRndmf826f0tCIU
 tXfXJKUodWlGHtpld1+3RPTQjR3QI+poRXrBWGfWpEeawI5DORrKxpSLR0Mu8d9p2Q
 PcJ+wIJR1r9ZnmrB7gD3niStGpDGS7tVWFUuQ4q0=
MIME-Version: 1.0
Date: Tue, 22 Nov 2022 11:14:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.14.0
From: bakulinm@ispras.ru
Message-ID: <5080ffd09cfee32c9bb10bc64f20d062@ispras.ru>
Subject: Re: [PATCH] tests/avocado: using several workers while testing
To: "=?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?=" <berrange@redhat.com>
Cc: "Pavel Dovgalyuk" <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, crosa@redhat.com,
 wainersm@redhat.com, bleal@redhat.com
In-Reply-To: <Y3T26+ZNRsd7ELbB@redhat.com>
References: <Y3T26+ZNRsd7ELbB@redhat.com> <Y3TuYPX/RFLgbLRC@redhat.com>
 <166860649008.1258000.17066080427505400235.stgit@pasha-ThinkPad-X280>
 <99df713da53c1f8b726a1fdb63c8473f@ispras.ru>
Received-SPF: pass client-ip=83.149.199.84; envelope-from=bakulinm@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Version of patch that uses sh script to parse MAKEFLAGS and set --nrunner=
-max-parallel-tasks accordingly. As already mentioned, works with Make 4.=
2 or newer, otherwise only single thread or all cores can be used.=0A=0Ad=
iff --git a/tests/Makefile.include b/tests/Makefile.include=0Aindex 9422d=
daece..ee059dc135 100644=0A--- a/tests/Makefile.include=0A+++ b/tests/Mak=
efile.include=0A@@ -93,6 +93,9 @@ TESTS_VENV_DIR=3D$(BUILD_DIR)/tests/ven=
v=0A TESTS_VENV_REQ=3D$(SRC_PATH)/tests/requirements.txt=0A TESTS_RESULTS=
_DIR=3D$(BUILD_DIR)/tests/results=0A TESTS_PYTHON=3D$(TESTS_VENV_DIR)/bin=
/python3=0A+# 1 task is used by default=0A+NRUNNER_MAX_TASKS=3D--nrunner-=
max-parallel-tasks 1=0A+=0A ifndef AVOCADO_TESTS=0A 	AVOCADO_TESTS=3Dtest=
s/avocado=0A endif=0A@@ -111,6 +114,21 @@ quiet-venv-pip =3D $(quiet-@)$(=
call quiet-command-run, \=0A     $(TESTS_PYTHON) -m pip -q --disable-pip-=
version-check $1, \=0A     "VENVPIP","$1")=0A =0A+get_avocado_max_tasks:=
=0A+# make 4.2 and later provide number of jobs in MAKEFLAGS=0A+# in earl=
ier versions only -j can be used=0A+# Use N jobs if -jN isprovided. Use $=
(nproc) jobs if only -j is provided,=0A+# Use 1 job if no -j is found in =
MAKEFLAGS string.=0A+	$(eval MAKE_JOBS=3D$(shell (if (echo $(MAKEFLAGS) |=
 grep -Eq ^.*-j\([0-9]+\).*$$); then \=0A+		(echo $(MAKEFLAGS) | sed -r '=
s/.*-j([0-9]+).*/\1/'); \=0A+	elif (echo $(MAKEFLAGS) | grep -Eq ^.*-j.*$=
$); then \=0A+		nproc; \=0A+	else \=0A+		echo 1; \=0A+	fi)))=0A+=0A+	$(ev=
al NRUNNER_MAX_TASKS=3D--nrunner-max-parallel-tasks $$(MAKE_JOBS))=0A+=0A=
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)=0A 	$(call quiet-command, $(PYTHON)=
 -m venv $@, VENV, $@)=0A 	$(call quiet-venv-pip,install -e "$(SRC_PATH)/=
python/")=0A@@ -138,14 +156,14 @@ get-vm-image-fedora-31-%: check-venv=0A=
 # download all vm images, according to defined targets=0A get-vm-images:=
 check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))=
=0A =0A-check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images=0A+c=
heck-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images get_avocado_m=
ax_tasks=0A 	$(call quiet-command, \=0A             $(TESTS_PYTHON) -m av=
ocado \=0A             --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$=
(TESTS_RESULTS_DIR) \=0A             $(if $(AVOCADO_TAGS),, --filter-by-t=
ags-include-empty \=0A 			--filter-by-tags-include-empty-key) \=0A       =
      $(AVOCADO_CMDLINE_TAGS) \=0A-            $(if $(GITLAB_CI),,--failf=
ast) $(AVOCADO_TESTS), \=0A+            $(if $(GITLAB_CI),,--failfast) $(=
AVOCADO_TESTS) $(NRUNNER_MAX_TASKS), \=0A             "AVOCADO", "tests/a=
vocado")=0A =0A check-acceptance-deprecated-warning:=0Adiff --git a/tests=
/requirements.txt b/tests/requirements.txt=0Aindex 0ba561b6bd..3b8c4d4706=
 100644=0A--- a/tests/requirements.txt=0A+++ b/tests/requirements.txt=0A@=
@ -2,5 +2,5 @@=0A # in the tests/venv Python virtual environment. For mor=
e info,=0A # refer to: https://pip.pypa.io/en/stable/user_guide/#id1=0A #=
 Note that qemu.git/python/ is always implicitly installed.=0A-avocado-fr=
amework=3D=3D88.1=0A+avocado-framework<93=0A pycdlib=3D=3D1.11.0=0A=0A=0A=
November 16, 2022 6:42 PM, "Daniel P. Berrang=C3=A9" <berrange@redhat.com=
> wrote:=0A=0A> On Wed, Nov 16, 2022 at 02:37:43PM +0000, bakulinm@ispras=
.ru wrote:=0A> =0A>> Valid point, thank you.=0A>> =0A>> I can see three o=
ptions what to do:=0A>> e1) Ignore older version of make and assume that =
4.2 or newer is used=0A>> (4.1 is in Ubuntu 18.04 that is no longer suppo=
rted as a build platform=0A>> as I was told; 20.04 has 4.2). In this case=
 make provides number of=0A>> jobs in $MAKEFLAGS and this makes getting i=
t trivial. In case of an=0A>> older make only two options will be availab=
le: (default) single-threaded,=0A>> and using all cores.=0A>> =0A>> Which=
 one should I choose?=0A> =0A> Ignore older make. Ubuntu 18.04 is not a p=
latform we target anymore,=0A> so we shouldn't be writing compat code for=
 handling it, and in any=0A> case degrading to single threaded or all-cor=
es is fine fallback IMHO.=0A> =0A> With regards,=0A> Daniel=0A> --=0A> |:=
 https://berrange.com -o- https://www.flickr.com/photos/dberrange :|=0A> =
|: https://libvirt.org -o- https://fstop138.berrange.com :|=0A> |: https:=
//entangle-photo.org -o- https://www.instagram.com/dberrange :|

