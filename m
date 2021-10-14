Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B22642D639
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:37:50 +0200 (CEST)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maxBN-0001tx-HD
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1max8Y-0007SU-PO
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:34:54 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1max8X-0001ri-0U
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:34:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r18so17446534wrg.6
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 02:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XmJbL13aKgi3ytB6f5nSpf14vPSDQfz2/Qlsn7P9JSc=;
 b=we8bT6vFniQdcQ31F3BrKHWmg1QkYSM7Wv2jA1hLlKFI6xB45n3MOpxtbb9PAZ2mjp
 n+Hl69jxcKrUyT3xvpQBovfKmNHZM+4fxGvex3UaQaSZIlxWhn8cpNHA8WM1Z2vREbN7
 uso7bry5oC8Eeq4hZappoZ9Mdjbs0nMfLKRz5/GQcCSxFT2hD90nQMVY9oiTNuIYvM5d
 JPxmmos3TllRTlLWaOK90i3Zo+QCYp4o/fhFcXQXPsWdeEzFs+i+/GLKskV3o2vmp4CS
 tZ1dIjFY/+QojjuWg6+XSA64FqisoUTyaLL3ld8Jm9nhqc4fZUDkgUW1nlObr4c0wlub
 DGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XmJbL13aKgi3ytB6f5nSpf14vPSDQfz2/Qlsn7P9JSc=;
 b=ma5H6nppNDSZhUgDwEOlJEN5c7a5/AwBG4U30qLvm29KocPGHK9wCh5XX7Iao1npJN
 vSjK7rHU+1kYViUeOtjRZoTzM7JgOg55ScFUugjoHLmBouc/Vi7q+cKf3S/TRErnwcOf
 eCWcJExtVqtKXr3Nhf8BE83V8jL7jvJgtCeF38a9QqRnkcING3O8GIt18j/opidLgLsu
 2I8leBuaMACM0bf6HtVgUNy+WhjnrClNFGutNLXMwOsJo4MrmkXe/ufpivsYxW/sWvXv
 I4vNgtrJLqmwpaV7UmPBDrmYU5fIwx9i1J/n3p6LXcPHCl0sbZsDPRc5ilZhSD9DY6Wj
 l5nw==
X-Gm-Message-State: AOAM532KuRW8Pq4wJahYSNSBdBown9gVCzxu4o9DZ9bN07tZG6lo31pE
 DoGXABkcQEpzZaht9IdthbVkVg==
X-Google-Smtp-Source: ABdhPJzLPluva6le57EpVAfk45zt1d7Jjs7R4YGlvbRKP6E7IlPpYVhfskAqkbiOuaY8hTWxq3XC0g==
X-Received: by 2002:a5d:6d51:: with SMTP id k17mr5333160wri.233.1634204090571; 
 Thu, 14 Oct 2021 02:34:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g70sm1623059wme.29.2021.10.14.02.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 02:34:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD1861FF96;
 Thu, 14 Oct 2021 10:34:48 +0100 (BST)
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-2-richard.henderson@linaro.org>
 <87h7dmw4kn.fsf@linaro.org>
 <38b675d8-e885-27ef-0feb-8955be0e750f@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/9] tests/docker: Add debian-nios2-cross image
Date: Thu, 14 Oct 2021 10:34:34 +0100
In-reply-to: <38b675d8-e885-27ef-0feb-8955be0e750f@linaro.org>
Message-ID: <87r1coueyv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marex@denx.de, crwulff@gmail.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/12/21 10:03 AM, Alex Benn=C3=A9e wrote:
>> We need to split this like in hexagon and have a second stage which does
>> a:
>>    COPY --from=3D0 /usr/local /usr/local
>> This will limit the size of the final image (and also avoid
>> duplicting
>> the UID in the hexagon build).
>
> Yeah, well, I had to take that out because it errors out.
> I have no idea what that does or means.

Having this worked for me:

modified   tests/docker/dockerfiles/debian-nios2-cross.docker
@@ -31,4 +31,14 @@ ADD build-toolchain.sh /root/build-toolchain.sh
=20
 RUN cd /root && ./build-toolchain.sh
=20
+FROM debian:buster-slim
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sourc=
es.list
+# Install QEMU build deps for use in CI
+RUN apt update && \
+    DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt install -yy git ninja-b=
uild && \
+    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
+    apt build-dep -yy --arch-only qemu
+COPY --from=3D0 /usr/local /usr/local
 ENV PATH $PATH:/usr/local/bin/

--=20
Alex Benn=C3=A9e

