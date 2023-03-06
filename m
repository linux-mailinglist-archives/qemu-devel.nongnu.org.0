Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301B26AD1FA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:50:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJeM-0008GL-Pj; Mon, 06 Mar 2023 17:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pZJeK-0008DA-M7
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:49:44 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pZJeJ-0006L2-Gr
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:49:44 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-536bbef1c5eso211908857b3.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678142982;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=NpMRZIL4cJYk3lF1HjeC/bGUWpDfKlqTZFePKUO86PAbfT/Sd8uWKM2xF8ZYpsSCfr
 qH6vL/d4YNRJxLl7FRFRMyzpcK1Kq68Pg6DL4Sk72m+37laXpUd63pahoR9ASNcadLJ+
 gnOAkJXlhdGKJhDxZuRkuFakgvoJpeCgSl9RxKtLIJEdJL9G7A1vtJAXIlBJkpuXCusr
 u25G1zhatvEOfXqn1i5m7AyPlsuMT2yxWO9n1DnSwRiUQo3gJOZry+Hgq8d8i5GZW6PM
 Ksj276bJIxpb7x1nBCKI/n8Swldxh3zTfZ2y+jKkeHKXDkTdk7ZIoFqNp9flc/Dr70+j
 31+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678142982;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=39Z9GJw9wsbCV0pfAUa0tvBEFwKW9iuWucOwQ/yToJgYLX5SXcuwgU4c7mfhUBSv9z
 wkiXyDysSjqKWQTDzlUGlwOB593PcBnRbk+6UzaeF2KwebB84GGDFXB0y+oCleocF/+H
 cqV37kb15KNciViOGY012XdlDLH16+5FeYdlnLHpNLofxZLiHDiYAOc+Gwl8fr2o+dGU
 Hvcv75UScTw4rd07ncrmC3+GwZaOhl1Duky+FsW5psi5bHL4M3ReotX+gP+CvOG3WqEY
 nZlE2n5vhuCZ/eUmSC9+DYN1pBZYUCKZs4UMa365EjW+lJnX4mao75YdK8YG3iqKENJA
 xvUA==
X-Gm-Message-State: AO0yUKXLc3cPseYhNVE+AFGoMh2lzMjDJmQ+XnB6JqGCJ/Dwon8ONAic
 wnZ2wXQAJ9LmwmPLGgEGgBhBrxW0t9N5ryI5t3LIRUnw
X-Google-Smtp-Source: AK7set/NcoXnq8H7rbvQoHKt9r96ChSNTVZyHc2fvcQdixc8yoxLDHa4GXp12B/S4U5xox04IW87J6T/aK0ofsU2siQ=
X-Received: by 2002:a81:ac21:0:b0:534:2d49:7912 with SMTP id
 k33-20020a81ac21000000b005342d497912mr7817908ywh.6.1678142982365; Mon, 06 Mar
 2023 14:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20230306223306.84383-1-pbonzini@redhat.com>
 <20230306223306.84383-10-pbonzini@redhat.com>
In-Reply-To: <20230306223306.84383-10-pbonzini@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 6 Mar 2023 17:49:30 -0500
Message-ID: <CAJSP0QV_5gTLbYStfOv4tJaYNToO6YUmOSpkmD+QoaXZK9ktPA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] async: clarify usage of barriers in the polling
 case
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, gshan@redhat.com, eesposit@redhat.com, 
 david@redhat.com, stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

