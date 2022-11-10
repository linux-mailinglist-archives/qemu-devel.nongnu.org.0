Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5E1624C60
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 22:04:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otEgv-0004CJ-0Z; Thu, 10 Nov 2022 16:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otEgS-00040T-UY; Thu, 10 Nov 2022 16:02:01 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otEgR-0003A9-CJ; Thu, 10 Nov 2022 16:02:00 -0500
Received: by mail-yb1-xb32.google.com with SMTP id i131so3627084ybc.9;
 Thu, 10 Nov 2022 13:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SueSv62Nq5cmnQfH7QS8mmjad0aH8tzEfx6XhtNYviY=;
 b=jX0n6bcqijnLYkFLtlLZzP+Ln59K5X8uHsXYpoprP3/KAa200q87zUlZPHlGhC3FqQ
 lPMmnIoZnHyTfFQLBQ7DCmxjBdcGHja0qAUs+Mi2oiAzgn2VSUpS2Fr/6EqIs1rT1rn8
 ajAjmhhMLqbiMrlStv9UtZ9gTzS04WbBnjJtrGsMa45zzYI/+UuGBxKuAMLngN1aiWmG
 TIKxAEYMcDH9YUI2jTFJJyhaoKvCj7KpZwiOxtXhaji9zw4skLrFDb6cbEiogZ2zKsMT
 nf0CEqIuS6jFZvtGUBRyRNYT+v/TcQrhSa4AAOTB0SruYy4syhrbo/+CgmHg0SycyJUD
 nUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SueSv62Nq5cmnQfH7QS8mmjad0aH8tzEfx6XhtNYviY=;
 b=LZ3WIdrUVYxpwduBQcH/7ioqMnhZbGBjww2zCec7WICot6NlD4ISQQ+znbqInY/eUT
 fIrv+vIiDFnbhbseO3/+S9wwk0YdboiFAK+H3p9ZQHukzWlkV2ul4E7khBCJDjJIexAA
 m2ORGETTJ4NgJOOXRhWCYGt+F+e2KldoAKxh09IW57/Mbg55ohGDDkxNe1wDQ3JdbI1G
 gs7ysJaVc+TdDFI/iScuiSwbS8F8af0crGbfLXfDlbmrvFO6ErHpUorRRUwmy1KF/DkH
 Y4NtB/GcUzEJQ+/f11trCYhhJb9aQMJpSQPSAb/M5c73xhQKwv3T+b877y4ZN2jmK7MD
 sMcA==
X-Gm-Message-State: ACrzQf3Q5Dpk5ZiTrTiry7FTXzFVHoFgr/5NineHW83oOjbH7oGJ3N2m
 4tW7+WGONVmf43Dxas2NHRhorvx3schng8P8zn8=
X-Google-Smtp-Source: AMsMyM6x0E7EMQ09CaJIpZvLgJuDnED8xGqO2NEib628fMvTEF/m5CJpMnmNOZz8CRzMHB6Swm+qDUyt8UdPZFrID3k=
X-Received: by 2002:a05:6902:191:b0:6cd:3a43:cda3 with SMTP id
 t17-20020a056902019100b006cd3a43cda3mr53030195ybh.207.1668114117844; Thu, 10
 Nov 2022 13:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20221108144433.1334074-1-afaria@redhat.com>
In-Reply-To: <20221108144433.1334074-1-afaria@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 10 Nov 2022 16:01:46 -0500
Message-ID: <CAJSP0QXrPfjJn+KcSTLoED6DGnZZpzDM-F6ZhwHs_08m-zAqBw@mail.gmail.com>
Subject: Re: [PATCH for-7.2] block/blkio: Set BlockDriver::has_variable_length
 to false
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb32.google.com
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

On Tue, 8 Nov 2022 at 09:45, Alberto Faria <afaria@redhat.com> wrote:
>
> Setting it to true can cause the device size to be queried from libblkio
> in otherwise fast paths, degrading performance. Set it to false and
> require users to refresh the device size explicitly instead.
>
> Fixes: 4c8f4fda0504 ("block/blkio: Tolerate device size changes")
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Alberto Faria <afaria@redhat.com>

If it's okay to set it to false then that makes me wonder why this
undocumented field exists at all. Can you or Kevin explain and
possibly follow up with a patch that documents the field?

Thanks,
Stefan

