Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F9D514392
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 10:01:42 +0200 (CEST)
Received: from localhost ([::1]:50472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkLZI-000318-4A
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 04:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkLUY-0001YK-Sp
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:56:42 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkLUX-0007Zh-2w
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:56:42 -0400
Received: by mail-ej1-x62d.google.com with SMTP id y3so13845308ejo.12
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 00:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LcO8eJqt4VnwpYg+YZ+rkslX3rbQyj9mQBoj7rJf9XA=;
 b=kUvs3wresZmFpSNi2pS4iAgnmUnzb6DLua5zLDj12SmIoXa0ad+kVRXvxtuYKsJIpj
 VxAPraaGT3PSeTduhlTw+QeNhcJ0bure4WQAechsO5IK6PvhvuZE4DZP7aXdnsNkvt2v
 rJQt3M5E/DUdaRRDA5lrGMG+l0Ft07xtYJsNP8bJeLqvwBmebGAUqMkxy1t3gQJdQxfj
 KEARL0TjO3nR99fxKn7KU90o+PlkZfIXS3jrWACV+363Wcl9mGXXQY30r+K0TvPjauGa
 e38rdb2pQdS/sdQwlriJfWix/uZxc+icy8WCPrMN89PMfUyYS/ZQGZ8SdYHXtmnDpvPq
 zheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LcO8eJqt4VnwpYg+YZ+rkslX3rbQyj9mQBoj7rJf9XA=;
 b=hlUPvsnPs0pc5CJ7mT0S2vwUAFI4bMVyUhO0+sDnX7vBfq2Qgr5bAci7CAcaWJWHVm
 ZcvlurFHLg3kSSMDdtLDDh4IvOiCXqOemeiYszrmj/v/urLnjfG0R0/R0R1LsLNgjKzF
 r9HHqdS5oX9U8goLQ1XyU9oY2igw5WL2yMhUvoTCdn3E1IIEw+qEIWnhNI+TV+OiUihU
 ZUJTcuoiYk6LMgnvgXpH+YAZ6Ns4APvPhAg6RuFGMBAxEkN29aTL9bsYqHL5JyWvag5w
 3OwL9Llmqn7rUiSbYhawCHTJ2/0PcF1tij/WRcJxjOPZiqlzCHoAl0MO1OJ2rTlhMOiE
 89hA==
X-Gm-Message-State: AOAM532IR5EHDoZdj+NWRxktGzzARjygVMcwWDthTrL0ofOuLnLI49PP
 m/Sn7DECb65kP668vAYu2ws=
X-Google-Smtp-Source: ABdhPJy6Ruk8IUSjID3XC7pl+RTmL5u45cszcaNT8i+gjqTKn0No6HrQuSaKycu+KSVvR9k5ENpNMA==
X-Received: by 2002:a17:906:8a79:b0:6f3:c84b:42f2 with SMTP id
 hy25-20020a1709068a7900b006f3c84b42f2mr10923818ejc.499.1651218999489; 
 Fri, 29 Apr 2022 00:56:39 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ze12-20020a170906ef8c00b006f3ef214e68sm394196ejb.206.2022.04.29.00.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 00:56:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v3 0/5] i386: Enable newly introduced KVM Hyper-V
 enlightenments
Date: Fri, 29 Apr 2022 09:54:52 +0200
Message-Id: <20220429075451.292638-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419144803.1698337-1-vkuznets@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> This series enables four new KVM Hyper-V enlightenmtes [...]
>
> docs/hyperv.txt                | 34 ++++++++++++++++++++++

Queued, thanks.  Would you please convert hyperv.txt to rST in docs/system/i386?
The various enlightenments can be converted to a definition list.

Paolo



