Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686966F5C30
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 18:38:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puFUD-0002Eg-Mu; Wed, 03 May 2023 12:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsun@junsun.net>) id 1puFU7-0001ms-F2
 for qemu-devel@nongnu.org; Wed, 03 May 2023 12:37:43 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jsun@junsun.net>) id 1puFU5-00043j-Qq
 for qemu-devel@nongnu.org; Wed, 03 May 2023 12:37:43 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-38ef6217221so3167046b6e.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 09:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=junsun-net.20221208.gappssmtp.com; s=20221208; t=1683131860; x=1685723860;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oBsg9XjdSZ42Gt2w9motxI9YvhFUccWY6ii0NkEQeDA=;
 b=X3VxPqtkaTyMPORp2yyY6iRBNgQ4dLKBuaH2hRzD7Bz4p5vPgvsamoU9ZjW++0hu0l
 BJGptPu823aXcm4QlTmZZ4JkNOEiOaMIMnBe0M7eopCf5sR8FIHxkM+TEGEvHr75uhQm
 RrG1vb3mP0RuwMCHwuk9gTdrFQxH5uN9eBPay+5CJSSEGbO7uLTXcH07eY5jGvcnVDyG
 5/9UT+jSaEeDqqiKOk29YoppwDvymOoQP8pk4vyFOcdLgxcvQPvNYZrnCbXu267NV23f
 420zPJK2tlnHq2SzCQIRISaedQQHHA9baEju7eUqmBhiS7gMA+wOTmH8U/ZCiiNznhLB
 ck8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683131860; x=1685723860;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oBsg9XjdSZ42Gt2w9motxI9YvhFUccWY6ii0NkEQeDA=;
 b=fj/iH07ifPXj2jC9AnGt3xkmxzUeJ866sO0ZjTW98q1Mi49EjVFM2sMFinf6yOZ2jD
 xA33o3QlvrdLwl4P76kDTn51xk1yNNkd+jvI0WI9slx7sEDOkzyw3sYl2Iytw5JG47dI
 NMsjJpNu9ScgRo7pBwMT6ZvfwsLg/uzf67iXwoTsZHneU4k9c5qxH1JqhBn0W26pfowh
 3JB/MgJeYUncD4hymqhEZ5t1fMBXhW4dGMJIujjB2f6Qzv8lIiCgD6R6Sl36+3jD1d9L
 CE1ozXGUidL/ZzgRsYm5OQ4oPCeA5aUbt7/f//XI4QpYQ5IXgksz3N6BcYcnpSGkym9z
 7C3A==
X-Gm-Message-State: AC+VfDwhsleJRXF9UJ/gLxANl7neqGIVfSwZoKjzc8YFbMSwBRwino7f
 ywOUECOvm+ssQK5o4XDMU8jESEqnJ7LHxvkDTrJX+iESi/JYBECoIpA=
X-Google-Smtp-Source: ACHHUZ6dSVKZr+cpbO3XHb9OKEnk3ndHyNLYecrujdSVN45EtjmjpGulhW2v/43F8+QLN28SwdqO9tAHpqEFpa06sUM=
X-Received: by 2002:a05:6808:150a:b0:38e:b92:dbc3 with SMTP id
 u10-20020a056808150a00b0038e0b92dbc3mr387253oiw.49.1683131860197; Wed, 03 May
 2023 09:37:40 -0700 (PDT)
MIME-Version: 1.0
From: Jun Sun <jsun@junsun.net>
Date: Wed, 3 May 2023 09:37:29 -0700
Message-ID: <CAP5Nno4UuN4JfU4uGqVmR8P84v9Cuc4xgYeec=Z1retUcNfbCQ@mail.gmail.com>
Subject: [PATCH risu] Add "--not-group" option to exclude groups of
 instructions.
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a3363905faccacd3"
Received-SPF: none client-ip=2607:f8b0:4864:20::22a;
 envelope-from=jsun@junsun.net; helo=mail-oi1-x22a.google.com
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

--000000000000a3363905faccacd3
Content-Type: text/plain; charset="UTF-8"

This mirrors the "--not-pattern" option and gives complete control over
group-based
instruction selection rules.

Signed-off-by: Jun Sun <jsun@junsun.net>
---
 risugen | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/risugen b/risugen
index f88c22a..f441f06 100755
--- a/risugen
+++ b/risugen
@@ -39,6 +39,7 @@ my $arch = "";
 my @insn_groups;

 my @groups = ();                # include groups
+my @not_groups = ();            # exclude groups
 my @pattern_re = ();            # include pattern
 my @not_pattern_re = ();        # exclude pattern

@@ -272,6 +273,12 @@ sub select_insn_keys ()
         my $re = '\b((' . join(')|(',@pattern_re) . '))\b';
         @insn_keys = grep /$re/, @insn_keys;
     }
+    if (@not_groups) {
+        @insn_keys = grep {
+            defined($insn_details{$_}->{groups}) &&
+                0 == scalar(get_intersection([$insn_details{$_}->{groups},
\@not_groups]))
+        } @insn_keys
+    }
     # exclude any specifics
     if (@not_pattern_re) {
         my $re = '\b((' . join(')|(',@not_pattern_re) . '))\b';
@@ -303,6 +310,7 @@ Valid options:
                    the perl regex '\\b((re)|(re))\\b'). This means that
                    'VMULL' will match 'VMULL A1' and 'VMULL A2' but not
                    'VMULL_scalar A1'. This is generally what you wanted.
+    --not-group name[,name..]: exclude instructions in the specified groups
     --not-pattern re[,re...] : exclude patterns matching regular
expression.
                    These REs are applied after the matching pattern which
                    is useful if you want to exclude a specific instruction
from
@@ -331,6 +339,7 @@ sub main()
                 "randseed=i" => \$randseed,
                 "fpscr=o" => \$fpscr,
                 "group=s" => \@groups,
+                "not-group=s" => \@not_groups,
                 "pattern=s" => \@pattern_re,
                 "not-pattern=s" => \@not_pattern_re,
                 "condprob=f" => sub {
@@ -347,6 +356,7 @@ sub main()
     @pattern_re = split(/,/,join(',',@pattern_re));
     @not_pattern_re = split(/,/,join(',',@not_pattern_re));
     @groups = split(/,/,join(',',@groups));
+    @not_groups = split(/,/,join(',',@not_groups));

     if ($#ARGV != 1) {
         usage();
-- 
2.34.1

--000000000000a3363905faccacd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This mirrors the=C2=A0&quot;--not-pattern&quot; option and=
 gives complete control over group-based<div>instruction selection rules.<b=
r><br>Signed-off-by: Jun Sun &lt;<a href=3D"mailto:jsun@junsun.net">jsun@ju=
nsun.net</a>&gt;<br>---<br>=C2=A0risugen | 10 ++++++++++<br>=C2=A01 file ch=
anged, 10 insertions(+)<br><br>diff --git a/risugen b/risugen<br>index f88c=
22a..f441f06 100755<br>--- a/risugen<br>+++ b/risugen<br>@@ -39,6 +39,7 @@ =
my $arch =3D &quot;&quot;;<br>=C2=A0my @insn_groups;<br>=C2=A0<br>=C2=A0my =
@groups =3D (); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# in=
clude groups<br>+my @not_groups =3D (); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# exclude groups<br>=C2=A0my @pattern_re =3D (); =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0# include pattern<br>=C2=A0my @not_pattern_re =3D (); =
=C2=A0 =C2=A0 =C2=A0 =C2=A0# exclude pattern<br>=C2=A0<br>@@ -272,6 +273,12=
 @@ sub select_insn_keys ()<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $re =3D=
 &#39;\b((&#39; . join(&#39;)|(&#39;,@pattern_re) . &#39;))\b&#39;;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@insn_keys =3D grep /$re/, @insn_keys;<br>=
=C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0if (@not_groups) {<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0@insn_keys =3D grep {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0defined($insn_details{$_}-&gt;{groups}) &amp;&amp;<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =3D=3D scalar(get_interse=
ction([$insn_details{$_}-&gt;{groups}, \@not_groups]))<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0} @insn_keys<br>+ =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0# excl=
ude any specifics<br>=C2=A0 =C2=A0 =C2=A0if (@not_pattern_re) {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0my $re =3D &#39;\b((&#39; . join(&#39;)|(&#39;,@=
not_pattern_re) . &#39;))\b&#39;;<br>@@ -303,6 +310,7 @@ Valid options:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the p=
erl regex &#39;\\b((re)|(re))\\b&#39;). This means that<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;VMULL&#39; wil=
l match &#39;VMULL A1&#39; and &#39;VMULL A2&#39; but not<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;VMULL_scalar A=
1&#39;. This is generally what you wanted.<br>+ =C2=A0 =C2=A0--not-group na=
me[,name..]: exclude instructions in the specified groups<br>=C2=A0 =C2=A0 =
=C2=A0--not-pattern re[,re...] : exclude patterns matching regular expressi=
on.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 These REs are applied after the matching pattern which<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is useful if you w=
ant to exclude a specific instruction from<br>@@ -331,6 +339,7 @@ sub main(=
)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ra=
ndseed=3Di&quot; =3D&gt; \$randseed,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fpscr=3Do&quot; =3D&gt; \$fpscr,<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;group=3Ds&quo=
t; =3D&gt; \@groups,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;not-group=3Ds&quot; =3D&gt; \@not_groups,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pattern=3Ds&quot; =3D&gt=
; \@pattern_re,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;not-pattern=3Ds&quot; =3D&gt; \@not_pattern_re,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;condprob=3Df&quot=
; =3D&gt; sub {<br>@@ -347,6 +356,7 @@ sub main()<br>=C2=A0 =C2=A0 =C2=A0@p=
attern_re =3D split(/,/,join(&#39;,&#39;,@pattern_re));<br>=C2=A0 =C2=A0 =
=C2=A0@not_pattern_re =3D split(/,/,join(&#39;,&#39;,@not_pattern_re));<br>=
=C2=A0 =C2=A0 =C2=A0@groups =3D split(/,/,join(&#39;,&#39;,@groups));<br>+ =
=C2=A0 =C2=A0@not_groups =3D split(/,/,join(&#39;,&#39;,@not_groups));<br>=
=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if ($#ARGV !=3D 1) {<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0usage();<br>-- <br>2.34.1<br><br></div></div>

--000000000000a3363905faccacd3--

