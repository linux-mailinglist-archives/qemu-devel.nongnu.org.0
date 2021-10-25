Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E894439D99
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 19:29:47 +0200 (CEST)
Received: from localhost ([::1]:33654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf3n7-0002vj-Tn
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 13:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mf3kB-0000W1-Kt
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mf3k6-000770-RI
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635182797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+wMrnw3uZwXEh1xDHlB5AOfWDk21PJF9KxVbWGlI04=;
 b=cReMPFBECmynzWlEVJsEt231DoDqq8fs7B7TDZheB4VouREC7saBs9Lr1rwocmNVBZ2/DX
 ncwEvzemROpVRvRg3LZguTG/9T6hWDKenA3k1EubrxT9Ie6W/OoPW2TPjlChq6eF3bwczR
 97QE1FchrU95P2gN8VbTGwyA4qk79vA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-4dXINpUKNZW3Yn7iyTYlvw-1; Mon, 25 Oct 2021 13:26:36 -0400
X-MC-Unique: 4dXINpUKNZW3Yn7iyTYlvw-1
Received: by mail-ed1-f71.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so10533509edl.17
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 10:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j+wMrnw3uZwXEh1xDHlB5AOfWDk21PJF9KxVbWGlI04=;
 b=HQgcr6LbOl+5pINJFB1nPj7M7Q/4e/rWY27S2kpHN7eH/32hXOMF2uub9Mg6htyXkn
 DnA8JJFC8le474ktYB8MVw4jjRgYXO0MpOXdjvZq71LnvX8qBCmbIJorfc9m5iDaif2u
 eWTbytoO97sodYmOt8/xRaCxpucCrfBE3Ouu/MVjN77LRVn7hEurBZdQ1cNcBKZ9BK6U
 KAJJOca1iB4HlgO1VHVYTXdazj+wiWKoH9jqLq9Gy/Li67yLGB+rlUgZ/628le7eGFfQ
 JzzYAhGVGRaHLsg7ZXOk0KaRpFOXmIVd34dbcWu7mcdbowKxtW/jTlcY189Q7e7G1L/i
 B5sw==
X-Gm-Message-State: AOAM530/FnL2IGyHe89dV2aO6DVkOQpqPdGziBAG8Cy7rB9eNl31YNyo
 aRcTLmnrwm0GrgEEduuotbWynV/3Lna7trAaW4db8AV74OJR34vXrtVRoKJev5T7AdHVrgh2bKk
 tjYOKgQ5KM4yUZZM=
X-Received: by 2002:a17:906:269a:: with SMTP id
 t26mr24086299ejc.20.1635182794768; 
 Mon, 25 Oct 2021 10:26:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8IKIRpayT2OPzPsuV7iFgpo5dWHXvK4Tyed3ggpXlJfuuJhCRnJ1UjdrrKNf95fiSHeYxkA==
X-Received: by 2002:a17:906:269a:: with SMTP id
 t26mr24086267ejc.20.1635182794426; 
 Mon, 25 Oct 2021 10:26:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id sb11sm1912178ejc.25.2021.10.25.10.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 10:26:33 -0700 (PDT)
Message-ID: <e5ae0f02-4e21-faa3-7ef1-8e95422be21f@redhat.com>
Date: Mon, 25 Oct 2021 19:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: configure --extra-cflags and --extra-ldflags values not
 propagating to meson?
To: Thomas Huth <thuth@redhat.com>, Owen LaGarde <olagarde@gmail.com>,
 qemu-devel@nongnu.org
References: <CACDcNnWWbzkH5-h6=BoXdA92DyVfTD7Kp=Spoz62yXw5t+tLGw@mail.gmail.com>
 <a105f305-b1e8-f97a-fa09-f083190e34cb@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <a105f305-b1e8-f97a-fa09-f083190e34cb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 25/10/21 15:10, Thomas Huth wrote:
> 
> I see a similar behavior with netmap now - I've got the corresponding 
> header file in a non-standard directory, and up to commit 
> 837b84b1c078bf3e909 it used to work fine to do:
> 
> .../configure --enable-netmap \
>      --extra-cflags=-I/path/to/netmap/sys
> 
> but since the conversion to meson, this does not seem to work anymore.
> 
> Paolo, any ideas?

Meson (intentionally) does not add QEMU_CFLAGS to cc.compiles/cc.links
tests, as they are supposed to be  independent.  This however is not
true of CFLAGS.

The fix should be to add --extra-cflags/--extra-ldflags to the c_args
and c_link_args of config-meson.cross, instead of adding them to
QEMU_CFLAGS/QEMU_LDFLAGS:

diff --git a/configure b/configure
index 99051f3254..94224b9931 100755
--- a/configure
+++ b/configure
@@ -174,14 +174,14 @@ update_cxxflags() {
  
  compile_object() {
    local_cflags="$1"
-  do_cc $CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
+  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
  }
  
  compile_prog() {
    local_cflags="$1"
    local_ldflags="$2"
-  do_cc $CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC \
-      $LDFLAGS $CONFIGURE_LDFLAGS $QEMU_LDFLAGS $local_ldflags
+  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC \
+      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $QEMU_LDFLAGS $local_ldflags
  }
  
  # symbolically link $1 to $2.  Portable version of "ln -sf".
@@ -285,6 +285,9 @@ for opt do
    esac
  done
  
+EXTRA_CFLAGS=""
+EXTRA_LDFLAGS=""
+
  xen_ctrl_version="$default_feature"
  xfs="$default_feature"
  membarrier="$default_feature"
@@ -357,13 +360,11 @@ for opt do
    ;;
    --cpu=*) cpu="$optarg"
    ;;
-  --extra-cflags=*) QEMU_CFLAGS="$QEMU_CFLAGS $optarg"
-                    QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
+  --extra-cflags=*) EXTRA_CFLAGS="$EXTRA_CFLAGS $optarg"
    ;;
    --extra-cxxflags=*) QEMU_CXXFLAGS="$QEMU_CXXFLAGS $optarg"
    ;;
-  --extra-ldflags=*) QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
-                     EXTRA_LDFLAGS="$optarg"
+  --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
    ;;
    --enable-debug-info) debug_info="yes"
    ;;
@@ -3508,10 +3509,10 @@ if test "$skip_meson" = no; then
  
    test -z "$cxx" && echo "link_language = 'c'" >> $cross
    echo "[built-in options]" >> $cross
-  echo "c_args = [${CFLAGS:+$(meson_quote $CFLAGS)}]" >> $cross
-  echo "cpp_args = [${CXXFLAGS:+$(meson_quote $CXXFLAGS)}]" >> $cross
-  echo "c_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
-  echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
+  echo "c_args = [${CFLAGS:+$(meson_quote $CFLAGS $EXTRA_CFLAGS)}]" >> $cross
+  echo "cpp_args = [${CXXFLAGS:+$(meson_quote $CXXFLAGS $EXTRA_CFLAGS)}]" >> $cross
+  echo "c_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS $EXTRA_LDFLAGS)}]" >> $cross
+  echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS $EXTRA_LDFLAGS)}]" >> $cross
    echo "[binaries]" >> $cross
    echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
    test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross

except that I haven't figured out the exact (current) behavior of
--extra-cxxflags.  Also, it would require a re-configure of any tree that
includes --extra-cflags or --extra-ldflags.

Thanks,

Paolo


