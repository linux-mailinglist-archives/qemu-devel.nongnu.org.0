Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC1E60F335
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:07:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onymu-0004i5-5Z; Thu, 27 Oct 2022 05:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyms-0004f7-LA
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:02:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onymq-0002zE-0U
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:02:54 -0400
Received: by mail-wr1-x433.google.com with SMTP id bs21so1057113wrb.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 02:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gM2J/iqTtZ3YgqXFapPxeERaDYDYuEVYIvE6ZdrIy9I=;
 b=P4fzATqIK/XTtT0SwdCeHEj68hQhUg6RdI7HtcK6qMvs3dSGlkaBr6LEX77yl6EI/r
 XO/5KunxRBzjWMkWmdkKf/WwNI9tZ9W/b7Z3/aWOyfSzbfiM6CX3ug05Z3nXrothXzM2
 RuIwj0wqxdAp6EHFTKqMF2xJdTaRwuigrZkWuCoZIUPME+kCc8BigF7wsGdnQMQIxzir
 SzEFto+/8kk/zLkHHpEGIB955GgC4FddAqh68uYAk1Q3kKBwcT8QZuRk27twW0L7641T
 JsvpV4MZe6GwYGPDf2nnP0ZVoYxe6ggIEjZg4C4dL/uiDk744UjhCKNaUkX7zh0I92UE
 uG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gM2J/iqTtZ3YgqXFapPxeERaDYDYuEVYIvE6ZdrIy9I=;
 b=09/y/ysqLZYgDP3zs/QQ7m67VyJ7GOXo5g8IcwGDjK3EebHL98T9QEMH6vG+X+Q1hD
 0p3cJAkn33KYIqlGEOoZ/aHQ/h4He9rNfSeyBE82d374+r2WgUH0XCYEAc9yAm2IcUPS
 r9JkaFWJfPvTwAUQ5SlE/Q7aDSgtqucosZmV/VMPWGD223a6rS4yg66t7xz8CCTAuPs6
 Ruh0IaoynYJfFkmEHIrxkvSYCfLNanMis2OQhyKt3pHW2YdcY6+pQpgOLxYXmmXbU+HS
 cfR3zzuVzjeYNQKAK/P+DErbb836E4rvsjYBsFRsIHQW1MAyXHXMBEMQtBTj7AMFxyUS
 EGxg==
X-Gm-Message-State: ACrzQf3598sJVhM1LF26FVBt/YnZ/ERvSetyRw2iHZve6WMjEQFZ2TBF
 YeHjfECbszPfLIvEwbpeQE7w+g==
X-Google-Smtp-Source: AMsMyM7NiReiU4Tji7TAd7yKY3oQyuqn7T2/B8HNKEp77ib6k8oevwdOdjLwtI1IR331sr0dKLUHQQ==
X-Received: by 2002:a5d:58d7:0:b0:236:6c53:6123 with SMTP id
 o23-20020a5d58d7000000b002366c536123mr15253547wrf.719.1666861370324; 
 Thu, 27 Oct 2022 02:02:50 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c314900b003c6f3e5ba42sm4398779wmo.46.2022.10.27.02.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 02:02:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 35F5B1FFB7;
 Thu, 27 Oct 2022 10:02:49 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-6-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 05/12] hw/i386/xen/xen-hvm: create arch_handle_ioreq
 and arch_xen_set_memory
Date: Thu, 27 Oct 2022 10:02:04 +0100
In-reply-to: <20221015050750.4185-6-vikram.garhwal@amd.com>
Message-ID: <8735b93ah2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> In preparation to moving most of xen-hvm code to an arch-neutral location,
> move the x86-specific portion of xen_set_memory to arch_xen_set_memory.
>
> Also move handle_vmport_ioreq to arch_handle_ioreq.
>
> NOTE: This patch breaks the build. Next patch fixes the build issue.
> Reason behind creating this patch is because there is lot of new code add=
ition
> and pure code movement done for enabling Xen on ARM. Keeping the this pat=
ch
> separate is done to make it easier to review.

But you do intend to squash the patches for the final version? We don't
want to intentionally break bisection.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

