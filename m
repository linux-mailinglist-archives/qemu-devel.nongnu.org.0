Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517876F5C1D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 18:35:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puFRE-0002eP-Cp; Wed, 03 May 2023 12:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsun@junsun.net>) id 1puFRB-0002XB-SG
 for qemu-devel@nongnu.org; Wed, 03 May 2023 12:34:41 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jsun@junsun.net>) id 1puFR9-0003De-KU
 for qemu-devel@nongnu.org; Wed, 03 May 2023 12:34:41 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-187df75c901so2079644fac.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 09:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=junsun-net.20221208.gappssmtp.com; s=20221208; t=1683131678; x=1685723678;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Uf/++BxaFhRoEEFiAqjquO8aOcqpvaohfOMbUbp1cNY=;
 b=VZxmBSGlVUeNIkzfC8aMOBx5V5mxlgTi+AUx27eoXs8CoSjuQVN+SV0SbWTBTkRXLA
 +9prqK+2P3KXiu9N1d/6XTNf4HX7TagMngL4sdsFqenX5vrbJh+Sy1wIT+ZM3ilige1Q
 V2v+q9rwx5UMfAH6MZ3veODjxVUZ5TNhEARmsuTFUtjWvhE4NGqtQbaO1SLUbEPZ58Jq
 k+3XVfGjLAyuPgDMfMpa5DerdQzUybuZVWWT/mJSlIgzvslMUnDhxd5q++Hn2FQmQm50
 dgBYHN11VWjy6vN9sBKTnZJGOxL2gx0L5ML7jCtrcoSFHH1Mnz9OAl5K0MsyVnONJesB
 jMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683131678; x=1685723678;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uf/++BxaFhRoEEFiAqjquO8aOcqpvaohfOMbUbp1cNY=;
 b=hCunvDEIpHaL0Xmw6E4AqgE+ztoBYICOvmtCRlpb5jnoJVDFjMRZQQ2iC6hT2ApNZ2
 6/zvtNm7/RSp8SbUTGf7DnAdCWjOEjadESL0Uk/PiTFYwai8GdxlxYRMJFVnkLrA8nSY
 rPVJXJXBE9Hw9jHg+hAVyi3O0FEvg3wJWbV5Py0jTKII9eT3qAeQn7BK5YnIHx8vWox+
 JGGy5eA3m9KVxfCoLdm+Tqda/7uCAvAsm823m74hQ3y68mk0GXAusGHKlrI92s62KTGi
 5F6s0GMX3rsLEhONxhwe6FIxkXR42foA6bNhNNmgd9ADjc/NlWN4d72dFgXe8lpZMGAI
 kOzw==
X-Gm-Message-State: AC+VfDw1kDfkG+vYm+x7ugjqfh2QcWa8C1E4BN+t4+UgSDIcsI8hJQAa
 GM07TxwpYvZqYQok7swnUMI47rLjqNmcmKnxH5oDfADFu48BL2zgQHE=
X-Google-Smtp-Source: ACHHUZ478tuDcaaO1tgtavrs4wbIEKA17jQgemuFTdOEPJQVBNl0TcZK7/Fxi8AYQKG3Akr7l6hZ4aIOLWFVhgG8d4w=
X-Received: by 2002:a05:6808:1382:b0:384:4e2d:81e9 with SMTP id
 c2-20020a056808138200b003844e2d81e9mr345015oiw.34.1683131677717; Wed, 03 May
 2023 09:34:37 -0700 (PDT)
MIME-Version: 1.0
From: Jun Sun <jsun@junsun.net>
Date: Wed, 3 May 2023 09:34:26 -0700
Message-ID: <CAP5Nno6LjKpvwmvFXoAo3bNpCSkVJTKe+ENxjGf8kt4ENAEMyg@mail.gmail.com>
Subject: [PATCH risu] --group option to allow all instructions in the
 specified groups.
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c2d02605facca1f7"
Received-SPF: none client-ip=2001:4860:4864:20::35;
 envelope-from=jsun@junsun.net; helo=mail-oa1-x35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000c2d02605facca1f7
Content-Type: text/plain; charset="UTF-8"

Current semantic is a little strange when multiple --group options are
specified.
In this case,  only instructions in *all* these groups (i.e., intersection)
are used for
generation, which is not very useful at all.  This patch changes the
semantic to
include all instructions in these groups (i.e., union) for sequence
generation.

Signed-off-by: Jun Sun <jsun@junsun.net>
---
 risugen                | 4 ++--
 risugen_arm.pm         | 1 +
 risugen_loongarch64.pm | 1 +
 risugen_m68k.pm        | 1 +
 risugen_ppc64.pm       | 1 +
 5 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/risugen b/risugen
index 360112f..f88c22a 100755
--- a/risugen
+++ b/risugen
@@ -264,7 +264,7 @@ sub select_insn_keys ()
     if (@groups) {
         @insn_keys = grep {
             defined($insn_details{$_}->{groups}) &&
-                scalar @groups ==
get_intersection([$insn_details{$_}->{groups}, \@groups])
+                0 != scalar(get_intersection([$insn_details{$_}->{groups},
\@groups]))
         } @insn_keys
     }
     # Get a list of the insn keys which are permitted by the re patterns
@@ -297,7 +297,7 @@ Valid options:
     --fpscr n    : set initial FPSCR (arm) or FPCR (aarch64) value
(default is 0)
     --condprob p : [ARM only] make instructions conditional with
probability p
                    (default is 0, ie all instructions are always executed)
-    --group name[,name..]: only use instructions in all defined groups
+    --group name[,name..]: only use instructions in the specified groups
     --pattern re[,re...] : only use instructions matching regular
expression
                    Each re must match a full word (that is, we match on
                    the perl regex '\\b((re)|(re))\\b'). This means that
diff --git a/risugen_arm.pm b/risugen_arm.pm
index 2dc144d..dc08ec0 100644
--- a/risugen_arm.pm
+++ b/risugen_arm.pm
@@ -1112,6 +1112,7 @@ sub write_test_code($$$$$$$$$)
     }

     print "Generating code using patterns: @keys...\n";
+    print "Total insn patterns : " . $#keys . "\n";
     progress_start(78, $numinsns);

     if ($fp_enabled) {
diff --git a/risugen_loongarch64.pm b/risugen_loongarch64.pm
index 3b1b4f9..f2a6fe7 100644
--- a/risugen_loongarch64.pm
+++ b/risugen_loongarch64.pm
@@ -482,6 +482,7 @@ sub write_test_code($)
     }

     print "Generating code using patterns: @keys...\n";
+    print "Total insn patterns : " . $#keys . "\n";
     progress_start(78, $numinsns);

     if ($fp_enabled) {
diff --git a/risugen_m68k.pm b/risugen_m68k.pm
index 85fc3da..76af84b 100644
--- a/risugen_m68k.pm
+++ b/risugen_m68k.pm
@@ -181,6 +181,7 @@ sub write_test_code($)
     }

     print "Generating code using patterns: @keys...\n";
+    print "Total insn patterns : " . $#keys . "\n";
     progress_start(78, $numinsns);

     if (grep { defined($insn_details{$_}->{blocks}->{"memory"}) } @keys) {
diff --git a/risugen_ppc64.pm b/risugen_ppc64.pm
index 4bc2d62..e6d0456 100644
--- a/risugen_ppc64.pm
+++ b/risugen_ppc64.pm
@@ -392,6 +392,7 @@ sub write_test_code($)
     }

     print "Generating code using patterns: @keys...\n";
+    print "Total insn patterns : " . $#keys . "\n";
     progress_start(78, $numinsns);

     if (grep { defined($insn_details{$_}->{blocks}->{"memory"}) } @keys) {
-- 
2.34.1

--000000000000c2d02605facca1f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Current=C2=A0semantic is a little strange when multipl=
e --group=C2=A0options are specified.<br>In this case,=C2=A0 only instructi=
ons in *all* these groups (i.e., intersection) are used for<br>generation, =
which is not very useful at all.=C2=A0 This patch changes the semantic to=
=C2=A0<div>include all instructions in these groups (i.e., union) for seque=
nce generation.<br><br>Signed-off-by: Jun Sun &lt;<a href=3D"mailto:jsun@ju=
nsun.net">jsun@junsun.net</a>&gt;<br>---<br>=C2=A0risugen =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>=C2=A0<a href=3D"http://r=
isugen_arm.pm">risugen_arm.pm</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>=C2=
=A0<a href=3D"http://risugen_loongarch64.pm">risugen_loongarch64.pm</a> | 1=
 +<br>=C2=A0<a href=3D"http://risugen_m68k.pm">risugen_m68k.pm</a> =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 1 +<br>=C2=A0<a href=3D"http://risugen_ppc64.pm">risu=
gen_ppc64.pm</a> =C2=A0 =C2=A0 =C2=A0 | 1 +<br>=C2=A05 files changed, 6 ins=
ertions(+), 2 deletions(-)<br><br>diff --git a/risugen b/risugen<br>index 3=
60112f..f88c22a 100755<br>--- a/risugen<br>+++ b/risugen<br>@@ -264,7 +264,=
7 @@ sub select_insn_keys ()<br>=C2=A0 =C2=A0 =C2=A0if (@groups) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@insn_keys =3D grep {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defined($insn_details{$_}-&gt;{groups}) &amp=
;&amp;<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scalar @=
groups =3D=3D get_intersection([$insn_details{$_}-&gt;{groups}, \@groups])<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 !=3D scalar(g=
et_intersection([$insn_details{$_}-&gt;{groups}, \@groups]))<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0} @insn_keys<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=
=A0 =C2=A0# Get a list of the insn keys which are permitted by the re patte=
rns<br>@@ -297,7 +297,7 @@ Valid options:<br>=C2=A0 =C2=A0 =C2=A0--fpscr n =
=C2=A0 =C2=A0: set initial FPSCR (arm) or FPCR (aarch64) value (default is =
0)<br>=C2=A0 =C2=A0 =C2=A0--condprob p : [ARM only] make instructions condi=
tional with probability p<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (default is 0, ie all instructions are always exec=
uted)<br>- =C2=A0 =C2=A0--group name[,name..]: only use instructions in all=
 defined groups<br>+ =C2=A0 =C2=A0--group name[,name..]: only use instructi=
ons in the specified groups<br>=C2=A0 =C2=A0 =C2=A0--pattern re[,re...] : o=
nly use instructions matching regular expression<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Each re must match a full =
word (that is, we match on<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 the perl regex &#39;\\b((re)|(re))\\b&#39;). This =
means that<br>diff --git a/<a href=3D"http://risugen_arm.pm">risugen_arm.pm=
</a> b/<a href=3D"http://risugen_arm.pm">risugen_arm.pm</a><br>index 2dc144=
d..dc08ec0 100644<br>--- a/<a href=3D"http://risugen_arm.pm">risugen_arm.pm=
</a><br>+++ b/<a href=3D"http://risugen_arm.pm">risugen_arm.pm</a><br>@@ -1=
112,6 +1112,7 @@ sub write_test_code($$$$$$$$$)<br>=C2=A0 =C2=A0 =C2=A0}<br=
>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0print &quot;Generating code using patterns: =
@keys...\n&quot;;<br>+ =C2=A0 =C2=A0print &quot;Total insn patterns : &quot=
; . $#keys . &quot;\n&quot;;<br>=C2=A0 =C2=A0 =C2=A0progress_start(78, $num=
insns);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if ($fp_enabled) {<br>diff --git a=
/<a href=3D"http://risugen_loongarch64.pm">risugen_loongarch64.pm</a> b/<a =
href=3D"http://risugen_loongarch64.pm">risugen_loongarch64.pm</a><br>index =
3b1b4f9..f2a6fe7 100644<br>--- a/<a href=3D"http://risugen_loongarch64.pm">=
risugen_loongarch64.pm</a><br>+++ b/<a href=3D"http://risugen_loongarch64.p=
m">risugen_loongarch64.pm</a><br>@@ -482,6 +482,7 @@ sub write_test_code($)=
<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0print &quot;Gene=
rating code using patterns: @keys...\n&quot;;<br>+ =C2=A0 =C2=A0print &quot=
;Total insn patterns : &quot; . $#keys . &quot;\n&quot;;<br>=C2=A0 =C2=A0 =
=C2=A0progress_start(78, $numinsns);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if ($=
fp_enabled) {<br>diff --git a/<a href=3D"http://risugen_m68k.pm">risugen_m6=
8k.pm</a> b/<a href=3D"http://risugen_m68k.pm">risugen_m68k.pm</a><br>index=
 85fc3da..76af84b 100644<br>--- a/<a href=3D"http://risugen_m68k.pm">risuge=
n_m68k.pm</a><br>+++ b/<a href=3D"http://risugen_m68k.pm">risugen_m68k.pm</=
a><br>@@ -181,6 +181,7 @@ sub write_test_code($)<br>=C2=A0 =C2=A0 =C2=A0}<b=
r>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0print &quot;Generating code using patterns:=
 @keys...\n&quot;;<br>+ =C2=A0 =C2=A0print &quot;Total insn patterns : &quo=
t; . $#keys . &quot;\n&quot;;<br>=C2=A0 =C2=A0 =C2=A0progress_start(78, $nu=
minsns);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (grep { defined($insn_details{=
$_}-&gt;{blocks}-&gt;{&quot;memory&quot;}) } @keys) {<br>diff --git a/<a hr=
ef=3D"http://risugen_ppc64.pm">risugen_ppc64.pm</a> b/<a href=3D"http://ris=
ugen_ppc64.pm">risugen_ppc64.pm</a><br>index 4bc2d62..e6d0456 100644<br>---=
 a/<a href=3D"http://risugen_ppc64.pm">risugen_ppc64.pm</a><br>+++ b/<a hre=
f=3D"http://risugen_ppc64.pm">risugen_ppc64.pm</a><br>@@ -392,6 +392,7 @@ s=
ub write_test_code($)<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0<br>=C2=A0 =C2=A0 =
=C2=A0print &quot;Generating code using patterns: @keys...\n&quot;;<br>+ =
=C2=A0 =C2=A0print &quot;Total insn patterns : &quot; . $#keys . &quot;\n&q=
uot;;<br>=C2=A0 =C2=A0 =C2=A0progress_start(78, $numinsns);<br>=C2=A0<br>=
=C2=A0 =C2=A0 =C2=A0if (grep { defined($insn_details{$_}-&gt;{blocks}-&gt;{=
&quot;memory&quot;}) } @keys) {<br>-- <br>2.34.1<br><br></div></div>

--000000000000c2d02605facca1f7--

