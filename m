Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E171536F62A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:07:47 +0200 (CEST)
Received: from localhost ([::1]:48510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNFa-0003Ef-HA
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lcNBp-0000yZ-7s
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:03:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lcNBn-0003ca-GE
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:03:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619766230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QpyiuJnMVvqqiaEBQGKuhT50y3H1YqT+DDb2GukLK4A=;
 b=HZwjkOJMcj3DfWHkshC8xP68LTDsh2eX7OEdog3jIcYupCFEk5gWq5myGRhGSd9CY/MKBf
 lyrphBNkQxQ2aUzVtbdq7Rr4Ob85jhBapwDqCW2jt/n4EI3b/GRlRt9olL3rdg2uyWY5lP
 bp8PwpiKRakZ1qgaMvs3agNZvgb1fic=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-umGCO_VgMwuBF9aSZUp5rQ-1; Fri, 30 Apr 2021 03:03:48 -0400
X-MC-Unique: umGCO_VgMwuBF9aSZUp5rQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 ne22-20020a1709077b96b02903803a047edeso13255299ejc.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 00:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QpyiuJnMVvqqiaEBQGKuhT50y3H1YqT+DDb2GukLK4A=;
 b=q0ocWEwPWxesnbYPzDDYqldGRC4Af5G5Ri0F1ziVmCNrjMZuWI/p4X/Cytps+A2g1z
 YsNvrGw8JrRiFbTqppFg4Fhrhb1txmUI4tLvVyFrsI2bmYrdQU6eEevpLVAnS+IYH/Tl
 Ut0inOyKvgor2fvzUFlVDp/RCoQ3n9EOFDe2b7xnLbsY2ZkLQ7nw5uBNUaC7UbPs8k54
 rYeprXlw5QH0Z0EYc5WiYY/iWcHSfGOd/odRgiJmi4roF/qtH9uc4r9cY0iK0NQrIkAn
 bwiQHkeGHPbMIpVDsnyjPaVNXXiGghcSFQj9UIMLUJvoqSNSyeLE4SEEASOs95bBNHf7
 cAoA==
X-Gm-Message-State: AOAM533IToXKOZZNMuRNq1FhibmC4IysBx6P+WeLQABhpQk7C1LsW8ms
 WbjlVq0skWdsww4px/QyjCDjVSK9qvbmzF3IwaZ4bJWlHvfDRAzkPiBTkntpAM4lgqwDf8aoqAx
 UURtazfI7VGB7KOs=
X-Received: by 2002:aa7:cb48:: with SMTP id w8mr3941678edt.55.1619766226710;
 Fri, 30 Apr 2021 00:03:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyttCYHN/9P2taVkl9O19ct216AYKFlsftJQvzcLAuwsLwsNsoiZNVS7PxFkvq8KUyd1MB44A==
X-Received: by 2002:aa7:cb48:: with SMTP id w8mr3941662edt.55.1619766226488;
 Fri, 30 Apr 2021 00:03:46 -0700 (PDT)
Received: from steredhat (host-79-46-211-24.retail.telecomitalia.it.
 [79.46.211.24])
 by smtp.gmail.com with ESMTPSA id e16sm1394706ejr.33.2021.04.30.00.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:03:46 -0700 (PDT)
Date: Fri, 30 Apr 2021 09:03:43 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 3/3] hw/core/loader: clear uninitialized ROM space
Message-ID: <20210430070343.5eswejwbfrhng6wk@steredhat>
References: <20210429141326.69245-1-laurent@vivier.eu>
 <20210429141326.69245-4-laurent@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <20210429141326.69245-4-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 04:13:26PM +0200, Laurent Vivier wrote:
>As for "hw/elf_ops: clear uninitialized segment space" we need to
>clear the uninitialized space when the ELF is set in ROM.
>
>Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


