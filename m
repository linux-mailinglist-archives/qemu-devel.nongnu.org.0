Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B4C3B44E2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:55:04 +0200 (CEST)
Received: from localhost ([::1]:37902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmIR-0007hn-Er
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmFV-00053V-QH; Fri, 25 Jun 2021 09:52:01 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:45598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmFR-0006z5-1U; Fri, 25 Jun 2021 09:52:01 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id d76so4713907ybc.12;
 Fri, 25 Jun 2021 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/8CIMdaC3yf4UPCaVTjuZVUMzZBRu0tY3Eg8WNaCeI4=;
 b=agVQnvLMFgrPj4KIeyF0zTZTNnf7NWc3ELQeglItdfRSOodJ/dA5HQCUHc3869Rze0
 ykh3WT8d6r0O0L99D7nSKexLmhHZwEUlxccFuixVq9t2BYWwT988d+yssDoAfnJ7nVeJ
 RD2kRA3uCFlyYDUX87aTKciG0X9WoycvoQYsFs9bXrsbDR+U4EndEZrDJZjo4950fhdf
 zsUFt9Vn9Z4jkIjuc75UGfsLOMhgcco8esvc6WbGH9bx5b/L9G+rrn7Yj7iBwrQ1LDiJ
 O/hv5B4gt4gNajsm1pjPGd3TWU5EKPIYad6K5yjN0TOrFgKx7UxtrLlBFKlynhqLHA2a
 ECKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/8CIMdaC3yf4UPCaVTjuZVUMzZBRu0tY3Eg8WNaCeI4=;
 b=dCe3EFViHG5FEptAUW2IcuS9t1nM9fXRC6uS3Jk4r06C15feocdwlxHpZesgL/NIkp
 2VPxrQun6j6aJG+gfKQKA0V+4W3CVxIYHMUWn6sGDq7G0M9liTh7WEKfOuf7Q5p90Nn8
 ShkB7AjJNhht4lRHmEumqutZLNhpjf6UTb3mP0pwKeeSiXS/ZIa8vIKfQ4UKaGJEyiDx
 YgfGMXeU6lcnXzGgJOf3K//8OdA8kaKmVzus5yKi23gD1GKpKWWDWKhiSf2qOaI9eBRF
 w1DOiTFI0ejCMb+81bBOH+GLcVtmAL7CLfAbeTAUHHNp26qSFeefLEwH68JBHwLbBrpO
 m5dg==
X-Gm-Message-State: AOAM5329dsiwbWUxB5Qvz47t70eCSJ+bPHEQD57d0U05U0fzlrwN5+Md
 D0FcR/8Ji/tSlsuVxv+YpanL6PZ4QIjecuIUl9Y=
X-Google-Smtp-Source: ABdhPJzYrfrky5T8CVHR/AFjOOMnTZ3zaCHmulHLHjjM5jqF0925/NPxawjpYOzbTzXGw6nXIk75TvHW9Xa/KTBLSNM=
X-Received: by 2002:a25:b222:: with SMTP id i34mr12157743ybj.152.1624629115933; 
 Fri, 25 Jun 2021 06:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-11-f4bug@amsat.org>
In-Reply-To: <20210624142209.1193073-11-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Jun 2021 21:51:45 +0800
Message-ID: <CAEUhbmXXGpKET62cnB8m+TFqTgoSOzMs+MfwU__y+vZEKw2p3Q@mail.gmail.com>
Subject: Re: [RFC PATCH 10/10] hw/sd: Add sd_cmd_SEND_RELATIVE_ADDR() handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 10:28 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

