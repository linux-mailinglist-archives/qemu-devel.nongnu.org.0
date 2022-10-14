Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299175FEA85
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:28:50 +0200 (CEST)
Received: from localhost ([::1]:53720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojG3l-0000ip-90
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojFp7-0003gW-Ck
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:13:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojFp5-0003nW-Lk
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:13:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id j16so6389925wrh.5
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 01:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25YOUovYgNIRdhOlLNwO0E/UBG0k2sldE8CGMan1J+8=;
 b=JKC7FUMCFDjRBiqr0pTEbLRCdCzX4g72C94GkYanO0RNEfH3xUh0wqvc/H2G6eW+0s
 9b3V25F3MsFgLp4vtSGT85QvfQQrX1NG0FNtG/pZu1Hk8WrSB/5QfHzLDqoVi244tZgP
 B6UZohvfuw3EMsHTi85eFD1UGgBlvHuuBIV5BZGWIMmRBEjPp0KfcA9ZK9k1D8Gjb9HG
 USKFi+Lg2vT7VEzOSIOlvrJsm1EEBZFWTuDi/MGRbDMxC9DRNTrYvzi866wEsOGQgSX+
 UP6ls/didGd44Iyimb+ttbreLE7zJMHrQmuBoJq4tQZQ7bYLeyzLBSExdwx+uzF5VWx/
 riPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=25YOUovYgNIRdhOlLNwO0E/UBG0k2sldE8CGMan1J+8=;
 b=wrqnPPwXXcJ/scLKGdIH5NBBTl3H6a2bfxv0ugr48z4bO1is1S+7cp73yNTcFBf/qa
 tnFD93xbiZEfqp1j5sc5aq9VcaIvPxyvlNGmzMG8Oawd+3Y57qf9EMHvWB/lVRMG/WLP
 hBSIgH/3+7D1koC66xQnwiYZ9G5hekeczeGHnynfFJ29iSrc69yU8vtMTVCBlNbUXu3X
 28RTHenolre7zQd8Gd4QLVlJhKkCnxeVqZd4Troy2kKa2k3azLzENukPBmY536+Wu18g
 f2QMC5mlUOkglM1fESyspn3+bfqG90zNGQqo20nmcO8J6/kI65pi9AQioiHi7xQRFdpb
 ce1Q==
X-Gm-Message-State: ACrzQf1ta0iYfwx3I/GK+XRZhubnHtPy4hCvKP6GWhgwb8AVjwG3PtVI
 Nncf5RkzC5iYCDSNXb0i1RWvGw==
X-Google-Smtp-Source: AMsMyM7fTlOBz7qBkEaSEK7bDSPDMct55viYgXivOILi+Y7CaQ6b9KYx8eFvjhQyca7in9ih2rvumA==
X-Received: by 2002:a5d:5a18:0:b0:22f:4f72:213a with SMTP id
 bq24-20020a5d5a18000000b0022f4f72213amr2503207wrb.57.1665735217430; 
 Fri, 14 Oct 2022 01:13:37 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a7bc4d8000000b003b4935f04a4sm1843835wmk.5.2022.10.14.01.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:13:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 33EDA1FFB7;
 Fri, 14 Oct 2022 09:13:36 +0100 (BST)
References: <20221013154705.1846261-1-alex.bennee@linaro.org>
 <20221013154705.1846261-5-alex.bennee@linaro.org>
 <877d13pkr5.fsf@linaro.org>
 <bcdc0d01-e6a9-27af-2c54-7a789a43f7be@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, stefanha@redhat.com,
 crosa@redhat.com
Subject: Re: [PATCH v2 4/7] configure: don't enable cross compilers unless
 in target_list
Date: Fri, 14 Oct 2022 09:13:19 +0100
In-reply-to: <bcdc0d01-e6a9-27af-2c54-7a789a43f7be@redhat.com>
Message-ID: <87y1tioma7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 10/13/22 21:48, Alex Benn=C3=A9e wrote:
>>> +  case " $target_list " in
>>> +    " $1 ") ;;
>>> +    *) return 1 ;;
>>> +  esac
>>> +
>> this of course prevents building of roms by actually disabling all
>> target compilers...
>
> Yeah, two asterisks are missing.  I'll send out a proper patch.

I tried this:

@@ -1866,6 +1866,15 @@ probe_target_compiler() {
   container_cross_ranlib=3D
   container_cross_strip=3D
=20
+  # We shall skip configuring the target compiler if the user didn't
+  # bother enabling an appropriate guest. This avoids building
+  # extraneous firmware images and tests.
+  if test "${target_list#*$1}" !=3D "$1"; then
+      break;
+  else
+      return 1
+  fi
+
   target_arch=3D${1%%-*}
   case $target_arch in
     aarch64) container_hosts=3D"x86_64 aarch64" ;;

>
> Paolo


--=20
Alex Benn=C3=A9e

