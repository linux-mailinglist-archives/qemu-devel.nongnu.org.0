Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866916B7FFC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 19:10:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbmbF-0004yq-4L; Mon, 13 Mar 2023 14:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbmb7-0004uG-Ln
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:08:39 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbmb6-0003rZ-33
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:08:37 -0400
Received: by mail-pl1-x62b.google.com with SMTP id y11so13936828plg.1
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 11:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678730911;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UchdR41GGGsjV9M/bLgsRU97vcok19P93n1AF7kvcOo=;
 b=d63cBzDj9gGVqCJvoVn52/LWbOQ5/drzRMVva/zqI5SWJJh7sE0RRddLvaA2It2zwD
 +72soNm+AXgwokTL7O/AQfUctr5LU4ZKNqCjSuwEzfWPOV51Qat9CZkaHO4mD77IP4Ku
 Srf1Scq8bvJSGUZWVKlfLwujmjpaNIS3Gfo53ZvGPZHEo5KZ+r146KTIm0vLZAqNtYRS
 Q3DUaizU8o1Fp/xyviLFQ8POuBqpCoFDvNY+Y9Ymk7h9MB1WR6in52A5oriKzhVKzZuQ
 86W07dbNogmEZ0dp+ngLjgRsm1OlezaoAYY7Tl94C329klp3wxx6TMIKCTbFV8Z7PiSc
 RF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678730911;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UchdR41GGGsjV9M/bLgsRU97vcok19P93n1AF7kvcOo=;
 b=dpPENCHa80xrkBPq6qvBt7m/hE98E0KX2FZFPyzmu+fgSiRDbI+NXtm/y3y26h8VNE
 VDfSk7lrQE5hYUeoN0/0iypaiNbRGcz7yXYrwzhXnv/vFXtEwnigkEmwfsZ8p2VsB1KP
 L8EmJRUpXI37Zu58Z56K+NVTqY+Vm83I1nqp5qi8StU2C8+cr0ve0Bbm5C8kvY+KLoys
 sVedijYkmMArTecfaNR6FV+uVz2qCZN8ioUwtrwor4CiPsQuPYzsUCbDRE8skzAns+q1
 VJk78faXs1t5r+TRv3jNmmvlDCyw341eVh7Z/HGWChBPEBsAnVckhVLyfT+QgjVB5UVu
 646g==
X-Gm-Message-State: AO0yUKU+Mfbuje20Pm578juVZBTu89Dzc8ZmpCrpTphyYz2LjgFx9Niq
 tj9kHvfCYVP2eg2dl3u8Yu18pxNEQbzO+Sn/CAZe/Q==
X-Google-Smtp-Source: AK7set8EqpIA0Xay2r2SwSJSxruU56ZSogFvvWn5nHaxx820dFQ5YUtxo0Ys4nq4NvI001JM9P7uBmelupR1P98QhlM=
X-Received: by 2002:a17:903:1388:b0:1a0:4be5:ccea with SMTP id
 jx8-20020a170903138800b001a04be5cceamr1480759plb.9.1678730911035; Mon, 13 Mar
 2023 11:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org>
 <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
 <CAFEAcA94DQ9rhCwhXHUKQQG6QdWTVOLNEUcKk12t=_WVMtG--A@mail.gmail.com>
 <b23fcfab-cc1b-a861-94ed-217af69f1ef8@redhat.com>
 <CAFEAcA9gdHi0QV1zj7nMNz1=NQjPyMisqU_Wqdc-HaLZg45HYA@mail.gmail.com>
In-Reply-To: <CAFEAcA9gdHi0QV1zj7nMNz1=NQjPyMisqU_Wqdc-HaLZg45HYA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 18:08:19 +0000
Message-ID: <CAFEAcA_-zbfHkHQqQHyv9EESkv1Xo2=exs2iGvZa_Up+9UPajw@mail.gmail.com>
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Mar 2023 at 17:30, Peter Maydell <peter.maydell@linaro.org> wrote:
> So I think the problem here is not with Sphinx, but with the
> kernel-doc script. That script has an option "-Werror" which
> turns its warnings into errors, but our Sphinx extension
> docs/sphinx/kerneldoc.py does not set it. I think we need to
> have the extension say "if Sphinx was run with -W then
> pass this flag along" (hopefully Sphinx lets us find out...)

This works:

--- a/docs/sphinx/kerneldoc.py
+++ b/docs/sphinx/kerneldoc.py
@@ -74,6 +74,10 @@ def run(self):
         # Sphinx versions
         cmd += ['-sphinx-version', sphinx.__version__]

+        # Pass through the warnings-as-errors flag if appropriate
+        if env.app.warningiserror:
+            cmd += ['-Werror']
+
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
         export_file_patterns = []


but I think it's prodding undocumented Sphinx internals, so
I'm going to check whether there's a better way to do this.
It might be more robust to have meson create a commandline
with a -Dkerneldoc_werror option that we then pick up in
the extension code, rather than trying to find out whether
-W was passed.

-- PMM

