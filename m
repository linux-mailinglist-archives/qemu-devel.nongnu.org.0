Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE55F0E7A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 17:12:28 +0200 (CEST)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHgh-0006QZ-0Z
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 11:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ugbF=2B=zx2c4.com=Jason@kernel.org>)
 id 1oeHbj-0002rM-3l
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:07:31 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:60672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ugbF=2B=zx2c4.com=Jason@kernel.org>)
 id 1oeHbg-0005aM-7H
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:07:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ECA2A62381
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 15:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D6CC433B5
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 15:07:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Xbkpch6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664550428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEyFcgtZGIiGooRpKsvHgtuWFkINKFFg7D7j5zCnnLM=;
 b=Xbkpch6FHkzad7J5YBuweK73ek6IqXOOu/tBfNpsU38+4qziLXSr5eYFTnGam1WQm0M81E
 kc9fKbTCAojf9Ujj28KkX46z/6MhdKcmd8Xd9lsnWYYOWgffsoXNNNjFRRQ9lY09tf5O+Z
 zRY2L6qnKMl/BLmNasYCr1O1HqlULng=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c06c2f44
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Fri, 30 Sep 2022 15:07:08 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id u189so5102543vsb.4
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 08:07:07 -0700 (PDT)
X-Gm-Message-State: ACrzQf2g4f6jXGcXRD63JPKgER2wbD4qPUB6zNpl114e8gl8UlqVrn+5
 k9fqWXCe1R5kA9vgvjNqI/QuU61nfugH1R1tOr0=
X-Google-Smtp-Source: AMsMyM4UksCenNSTEknv4X/R2dX3E1eRDx9zO4fgYlYQIn1QTmYxAj2XjmP1+DJWuCvDw0IxRRsrXVY3+74WIhXmTUg=
X-Received: by 2002:a05:6102:2908:b0:398:ac40:d352 with SMTP id
 cz8-20020a056102290800b00398ac40d352mr3824386vsb.55.1664550425919; Fri, 30
 Sep 2022 08:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220930140520.576374-1-Jason@zx2c4.com>
 <YzcFpYL9W1O6olJ3@redhat.com>
In-Reply-To: <YzcFpYL9W1O6olJ3@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 30 Sep 2022 17:06:54 +0200
X-Gmail-Original-Message-ID: <CAHmME9oapu2OBGuCJ53XnyGd8nFMEWq7K=Nst2kZWa_-oFG1Dw@mail.gmail.com>
Message-ID: <CAHmME9oapu2OBGuCJ53XnyGd8nFMEWq7K=Nst2kZWa_-oFG1Dw@mail.gmail.com>
Subject: Re: [PATCH qemu] mips/malta: pass RNG seed to to kernel via env var
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: f4bug@amsat.org, aurelien@aurel32.net, qemu-devel@nongnu.org, 
 tsbogend@alpha.franken.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=ugbF=2B=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Fri, Sep 30, 2022 at 5:05 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> The +1 suggests you're intending to NUL terminate, but nothing
> in this patch ever initializes this last byte.

Incorrect. sprintf("%02x") writes 3 bytes, the last of which is 0.

