Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DD7632637
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 15:38:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox7v8-0007Da-Fa; Mon, 21 Nov 2022 09:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox7v6-0007Ce-1B
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 09:37:12 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox7v3-0004LX-4T
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 09:37:11 -0500
Received: by mail-pg1-x534.google.com with SMTP id f3so11350858pgc.2
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 06:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MF0QvKrp6hOQBtpvzpbZb9Nyv7bn72nzIE9/cJbusOs=;
 b=gAF9+h1FXftdn93KZTEjjDjaUCyTsHBSfToTrxl4r+YHMi8217bNdmt8rUp15v69yz
 pJobNxAirgRt/WgG8aM2N9KWOH38GLcekaDFXyvNucTfg3VMCIR1/wW3ZD1A1EQTFOXa
 HJFiAiKwOwDK2L1loNXFrILdB6Cl+9GipWvvJ4ALhi/BT/LMmi0yoXZzfHbUb2H0Z+0x
 OyJ+cTLxJi1qhIBIRGnUuNIpd1czWWcgm58y1co5I0A44i9Y5aIgPBhIwo4fdBEp0u0o
 Lb/JRsVglFquVnJi6KlZXPCmzemQRNxdpoNdo6U7Qng0qy1m+qjI8IFNczK7FKNs1Bva
 R7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MF0QvKrp6hOQBtpvzpbZb9Nyv7bn72nzIE9/cJbusOs=;
 b=gPpp8nP9seM903003WAG0jcBv6hqloMcl6IAYfFg4BPaNwZzWCXFWNEiH4Ius4NHfz
 IFo0ZdEjYPHmXF/P1+OsIcVf2TxAtemIkML0eNXBi2Ri1x4s5Fg22WtCxMT7JsTAlZqF
 0PpjXV4SzkGHw6G0SdNGKDzcyuWfNdbu2yq5mydyhC7OHZLt6oWf3I0UoATexlViTXrw
 Sq+NmPb/Lb/7hm/pVXlpynCnIfB9uQhZLaSKAjSOfKDYVmQ8/49BBLN/D/rCf/6m2nc0
 QoyDybws9b3OzOpcWXXxsgwdI8xKpX6qfLQ60+1Ou4xb9Aej2FoYCgkNJ46/eeeIgwg6
 9oSw==
X-Gm-Message-State: ANoB5plJhgG3/LEprpOLalZUHAo2QJdltRe9ZLUtrgXYCfQ7xFteQVFI
 paf/OA4BaAsDaxzKGguR28JTw6JXsuWc0D3P1/zrbg==
X-Google-Smtp-Source: AA0mqf7XWU9N5SiHEU9iGBhv7ygjljT7Go21HzZUO70MXU3z+uR5++ls9lOhi4M698xezvBVrH05aD10d6fkEhiYkHE=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr1819319pgr.192.1669041427555; Mon, 21
 Nov 2022 06:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20221121140121.1079100-1-armbru@redhat.com>
In-Reply-To: <20221121140121.1079100-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 14:36:56 +0000
Message-ID: <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, Alistair.Francis@wdc.com, 
 bin.meng@windriver.com, palmer@dabbelt.com, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com, 
 mst@redhat.com, quintela@redhat.com, dgilbert@redhat.com, 
 pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org, peterx@redhat.com, 
 david@redhat.com, philmd@linaro.org, mrolnik@gmail.com, gaosong@loongson.cn, 
 yangxiaojuan@loongson.cn, aurelien@aurel32.net, jiaxun.yang@flygoat.com, 
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, berrange@redhat.com, 
 thuth@redhat.com, lvivier@redhat.com, suhang16@mails.ucas.ac.cn, 
 chen.zhang@intel.com, lizhijian@fujitsu.com, stefanha@redhat.com, 
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, 
 virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 21 Nov 2022 at 14:03, Markus Armbruster <armbru@redhat.com> wrote:
>
> Tweak the semantic patch to drop redundant parenthesis around the
> return expression.
>
> Coccinelle drops comments in hw/rdma/vmw/pvrdma_cmd.c; restored
> manually.
>
> Coccinelle messes up vmdk_co_create(), not sure why.  Transformed
> manually.
>
> Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
> manually.
>
> Whitespace in fuse_reply_iov() tidied up manually.
>
> checkpatch.pl complains "return of an errno should typically be -ve"
> two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
> it visible to checkpatch.pl.
>
> checkpatch.pl complains "return is not a function, parentheses are not
> required" three times for target/mips/tcg/dsp_helper.c.  False
> positives.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

>  .../user/ase/msa/bit-count/test_msa_nloc_b.c  |   9 +-
>  .../user/ase/msa/bit-count/test_msa_nloc_d.c  |   9 +-
[snip long list of other mips test files]

>  328 files changed, 989 insertions(+), 2099 deletions(-)

This patch seems to almost entirely be huge because of these
mips test case files. Are they specific to QEMU or are they
effectively a 3rd-party import that it doesn't make sense
to make local changes to?

I definitely don't think you should put manual tidying changes
in the same patch as 3000 lines of automated changes: that
is in my opinion un-reviewable.

thanks
-- PMM

