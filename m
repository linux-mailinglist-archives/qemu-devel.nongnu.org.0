Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB826DDC3B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 15:35:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmE97-0004wi-CX; Tue, 11 Apr 2023 09:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE95-0004wZ-P6
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:34:51 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE94-0007mW-6m
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:34:51 -0400
Received: by mail-ej1-x635.google.com with SMTP id ga37so20751826ejc.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 06:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681220086; x=1683812086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vEjD6Mu8E4fXqpJcdbx3H8j3uoxX0Hz3Hf4sS0tSXXU=;
 b=cO0uhv8LRPExosNSyNqDYaY7h4AjNh1qdO6vm65QOCNPbug/N1D/qZDAt5vHHY2Vig
 PwAG6wYeJr9fvvSJd36kAC3q3+D94QWoM8WR6lzkFAyggn/m9No5/gd5Zg0xxNrUfIlQ
 RDqUwVxab2bjMGquRancGkY801LYYPqmZ30uiFvb1xaq/7UsGmpRLXt4khd55EpWnLYH
 H7jsKX2BlBrjaQXgfDy3Dd8KCFld4ouGdQw+QuWS0jNsfALEP0YG7OsISaaqQb5uGmgx
 9O8u2cwoXnaDLpI+FW/Htr3r9trMZEX31u4JNFUeUHldt0oPoISol6/CMI7Ct728hDm8
 lpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681220086; x=1683812086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vEjD6Mu8E4fXqpJcdbx3H8j3uoxX0Hz3Hf4sS0tSXXU=;
 b=Ltv8YIlq+4c14VzmYXnSU5ogei5BbDWvbZH7GmQAJi4s2Q1+1QiLxnd8MMMv7TH+fw
 3i3AEufkQGEHAo7YlSS2jTzJFLsx/+IhxrnkRvQiqEbx1motnvtGRwRrfWAZvVVbPOiM
 PNj6cNGxTZOnvY3PLZFmvYt+sdd+u7bMF17z6mj5YrrC3EFWsvO9LqaoWxI3fM+rBtyz
 yGj+6N2J8fVfhPkfPhoPULlAAA+Co93POrZXC0yc09FJ1yNDgu07VxrK3dXNkLH4+qBg
 nYS/ZsptOpZwaUdpjz8Kf605YjUyalDBMG2iTdh5UJ+81FcZE44Zu8uPkuJxwy1lpg+Q
 /xDQ==
X-Gm-Message-State: AAQBX9cMo0SfJ+Cn+K3xiqOTZDr/GW1JqiR3uTQ3skpUk37OSH7aWn28
 4a6517xDJZ+3vFh3qJwpI7zWmZsolTvo5cJOEoQK8w==
X-Google-Smtp-Source: AKy350agboMmVsBlwYIiMn4PhK+bQXq5Rbsf4MeQVXeAIEw90Ha57WMkgi70v/fhg58eWrZDi8KMdqUNVb+d4oRkp0c=
X-Received: by 2002:a17:907:1628:b0:92f:41e4:e48b with SMTP id
 hb40-20020a170907162800b0092f41e4e48bmr5028596ejc.6.1681220086118; Tue, 11
 Apr 2023 06:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230410033208.54663-1-jasowang@redhat.com>
In-Reply-To: <20230410033208.54663-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 14:34:34 +0100
Message-ID: <CAFEAcA_=EAiZyjEEcun3aScwDQZem35bxKPdrAXpf5C0vY7-dg@mail.gmail.com>
Subject: Re: [PATCH for 8.1] intel_iommu: refine iotlb hash calculation
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Mon, 10 Apr 2023 at 04:32, Jason Wang <jasowang@redhat.com> wrote:
>
> Commit 1b2b12376c8 ("intel-iommu: PASID support") takes PASID into
> account when calculating iotlb hash like:
>
> static guint vtd_iotlb_hash(gconstpointer v)
> {
>     const struct vtd_iotlb_key *key = v;
>
>     return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
>            (key->level) << VTD_IOTLB_LVL_SHIFT |
>            (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> }
>
> This turns out to be problematic since:
>
> - the shift will lose bits if not converting to uint64_t
> - level should be off by one in order to fit into 2 bits
> - VTD_IOTLB_PASID_SHIFT is 30 but PASID is 20 bits which will waste
>   some bits
>
> So this patch fixes them by
>
> - converting the keys into uint64_t before doing the shift
> - off level by one to make it fit into two bits
> - change the sid, lvl and pasid shift to 26, 42 and 44 in order to
>   take the full width of uint64_t if possible
>
> Fixes: Coverity CID 1508100
> Fixes: 1b2b12376c8 ("intel-iommu: PASID support")
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

