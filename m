Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D096FEBFF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 08:54:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px0At-0006Oi-Qr; Thu, 11 May 2023 02:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px0Ar-0006OK-RB
 for qemu-devel@nongnu.org; Thu, 11 May 2023 02:53:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px0An-0005Lh-CD
 for qemu-devel@nongnu.org; Thu, 11 May 2023 02:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683787985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SKgw5mADfbHjXOp/f6hkHH5M3ZNCWWvVsb9sKh0szm4=;
 b=fnF5S/pG+IV/OyquYBuHg21dsTZc/JH46n/keiaKitp4wWCngfHwx82mDKHdUc7T8SjNqr
 KQrf2mul/TlJ4dDH8ulS3MTQpU3JuggBrK6vGgrUC5X/+AMR5Vc4hQrdIYC/rG+GRR0F8M
 sfdU6XP8qbziEkLw3a9ZN7AZOYClOhI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-JFGAvmoiOI6daceF2SP8ZA-1; Thu, 11 May 2023 02:53:03 -0400
X-MC-Unique: JFGAvmoiOI6daceF2SP8ZA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3078df8ae31so3172933f8f.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 23:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683787982; x=1686379982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKgw5mADfbHjXOp/f6hkHH5M3ZNCWWvVsb9sKh0szm4=;
 b=KaeSnqQs1K6CnsY8eKllw5waI0igQtFyDWl2KLDnT8AJ5gq6GarWqWqaoNFxLco1kb
 5wubinsObq+8744EojGYyAt1DSR0fUvDP7vy1L1GQRLKaLoMIlStR/KqXt/snB5LYZNy
 aYOa+0wjQsgMgLpgD4d1CpJ2RvXbbfEhEdTjEMhFVDVHyeMkKuCNK9UdpEYfSG/m/nSN
 iOrYLVu4kmdv5hXF4HcIyO/IKsZJIIoIOvLugPwx/Ia/D3sPA1+i11N317VFNHPvGgpy
 R3cEEaHJiPXr0Y1rxA6DTIM4MFmfRG10KHbov6OT2AE9cszUmXHqb2NSDE+Zdgy0vQqE
 YgOg==
X-Gm-Message-State: AC+VfDxNhVlPWm1+a2Y+2AaV/6NaJdBtP4FtJOaaRY+6ESMCQEH2f9v/
 SSs86i5KOFO7+Uciykw6YPFRCxXpQYdA69t2lITCOteTCSGLcuZC6xmTy5b3nBDtN8i5Ajjxnrf
 GXa118iW5KGTFOro=
X-Received: by 2002:a5d:68ce:0:b0:307:88ff:ea26 with SMTP id
 p14-20020a5d68ce000000b0030788ffea26mr11783783wrw.25.1683787982654; 
 Wed, 10 May 2023 23:53:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4lOY4aRdUXY1SdPhnhW9cHuPUWjbRyn/H2lPotmQvYQbHnnO+YcSsgG5smRLXIn5SwYKmaZg==
X-Received: by 2002:a5d:68ce:0:b0:307:88ff:ea26 with SMTP id
 p14-20020a5d68ce000000b0030788ffea26mr11783756wrw.25.1683787982288; 
 Wed, 10 May 2023 23:53:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 z8-20020adfec88000000b003062675d4c9sm19298298wrn.39.2023.05.10.23.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 23:53:01 -0700 (PDT)
Message-ID: <e9f60dff-0cc5-82c9-cb68-8c43b7de80a4@redhat.com>
Date: Thu, 11 May 2023 08:53:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 07/27] mkvenv: add diagnose() method for ensure() failures
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kyle Evans <kevans@freebsd.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Michael Roth <michael.roth@amd.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
 <20230511035435.734312-8-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230511035435.734312-8-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/11/23 05:54, John Snow wrote:
> This is a routine that is designed to print some usable info for human
> beings back out to the terminal if/when "mkvenv ensure" fails to locate
> or install a package during configure time, such as meson or sphinx.
> 
> Since we are requiring that "meson" and "sphinx" are installed to the
> same Python environment as QEMU is configured to build with, this can
> produce some surprising failures when things are mismatched. This method
> is here to try and ease that sting by offering some actionable
> diagnosis.

I think this is a bit too verbose/scary, especially the "Ouch" for
what was a totally normal occurrence before (no "--enable-docs" and sphinx
absent or too old) and the "ERROR" from "pip install --no-index".

Here is an attempt to tone it down:

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index 8e097e4759e3..5d30174a9aff 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -74,6 +74,7 @@
      Iterator,
      Optional,
      Sequence,
+    Tuple,
      Union,
  )
  import venv
@@ -594,7 +595,7 @@ def diagnose(
      online: bool,
      wheels_dir: Optional[Union[str, Path]],
      prog: Optional[str],
-) -> str:
+) -> Tuple[str, bool]:
      """
      Offer a summary to the user as to why a package failed to be installed.
  
@@ -610,6 +611,9 @@ def diagnose(
      """
      # pylint: disable=too-many-branches
  
+    # Some errors are not particularly serious
+    bad = False
+
      pkg_name = pkgname_from_depspec(dep_spec)
      pkg_version = None
  
@@ -654,11 +658,11 @@ def diagnose(
              "No suitable version found in, or failed to install from"
              f" '{wheels_dir}'."
          )
-    else:
-        lines.append("No local package directory was searched.")
+        bad = True
  
      if online:
          lines.append("A suitable version could not be obtained from PyPI.")
+        bad = True
      else:
          lines.append(
              "mkvenv was configured to operate offline and did not check PyPI."
@@ -675,10 +679,14 @@ def diagnose(
                  f"Typically this means that '{prog}' has been installed "
                  "against a different Python interpreter on your system."
              )
+            bad = True
  
      lines = [f" • {line}" for line in lines]
-    lines.insert(0, f"Could not ensure availability of '{dep_spec}':")
-    return os.linesep.join(lines)
+    if bad:
+        lines.insert(0, f"Could not ensure availability of '{dep_spec}':")
+    else:
+        lines.insert(0, f"'{dep_spec}' not found:")
+    return os.linesep.join(lines), bad
  
  
  def pip_install(
@@ -731,7 +739,7 @@ def _do_ensure(
              dep_specs,
              online=False,
              wheels_dir=wheels_dir,
-            devnull=online and not wheels_dir,
+            devnull=not wheels_dir,
          )
          # (A) or (B) happened. Success.
      except subprocess.CalledProcessError:
@@ -778,7 +786,10 @@ def ensure(
          _do_ensure(dep_specs, online, wheels_dir)
      except subprocess.CalledProcessError as exc:
          # Well, that's not good.
-        raise Ouch(diagnose(dep_specs[0], online, wheels_dir, prog)) from exc
+        msg, bad = diagnose(dep_specs[0], online, wheels_dir, prog)
+        if bad:
+            raise Ouch(msg) from exc
+        print("", msg, "\n", sep="\n", file=sys.stderr)
  
  
  def post_venv_setup() -> None:


Paolo


