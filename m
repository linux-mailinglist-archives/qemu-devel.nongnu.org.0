Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC6304B9B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 22:42:19 +0100 (CET)
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4W6M-0003Yf-Ot
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 16:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l4W5F-00031k-22; Tue, 26 Jan 2021 16:41:09 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l4W5C-0005NH-QD; Tue, 26 Jan 2021 16:41:08 -0500
Received: by mail-pj1-x102d.google.com with SMTP id cq1so6676pjb.4;
 Tue, 26 Jan 2021 13:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6YWADwHDWRAfhQYbROH3bGEbXRENAzjBuke3glHyNtg=;
 b=igmwHC1L0i0JVY2Bzj3uWpPBd39v9akXd3jOaXbIu7Lx72r1D0pBzRdSxzxBiuwDGF
 /DXvQ0qpsEdWT9prVD1zPO3VrmkPBd/r41GOBk2hguMYtb1Qwp2gUuYw+q4EGiyce8jf
 pkRyRfmWwh342BwZtdYcZf8LFbYq/O4LyZ+LIkES1CEjWMW3uOYjBTm6XpNcbdOdJClx
 f3nLBe+chA5PRpkW/Ov4DxYBZ6OJMebJFfdLOn9oNMuO6SgZwfGN/p0uoZBInltSDnku
 rBZ6G7VB+PX6r27vDEE0PuJ5aHwxxZuwAZkU6hMMFHw08TuMg1ii2PatFGsBOXXNv/Pf
 3nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6YWADwHDWRAfhQYbROH3bGEbXRENAzjBuke3glHyNtg=;
 b=tcxYCqpj2bE9DHLh+Q3mMtog3T9zucObUFHkS9LEi3ma1yYT+S/lymeahkfAXaZzY0
 HxktjXuXT8V2L/dCdW8cr0tFb6Uu4wSUuesRTtswCaU4p6Ek8fr4RaoIC/NnP2CK4nl7
 c+kOd0GGEfFH4SNIkGfEd1c5SJznabmCTwqNajhNtJPmauhJ3kjEXy/T1au3yIzf3NYh
 sJlCpYYEhsI/DqbRrTt28K+GZWIVdz4uUtK6bG093yK3FdPHsOEUoJ5iLW+HSyUS2kwC
 riLS50B9WJBRQK6OUD/UgKI6Jbtb7FTlIElwHTTj8UWLOPcjvNYRjZ7BjMqJNKpsa3eG
 T8uA==
X-Gm-Message-State: AOAM533GBfb2mvtQcmAhgQpfmK1PlVzwpn83fldbjET3Dzp2a6RW/ju6
 2aGSViK7ntbwsSpChlxiUW0=
X-Google-Smtp-Source: ABdhPJxgME94uqLTzzeYIjrGS0rxjeQxZFrPVUez2pZFrU/wDF41TQc1F2724/EGUIdY34t+4qiBBw==
X-Received: by 2002:a17:902:8a8c:b029:e0:138b:da07 with SMTP id
 p12-20020a1709028a8cb02900e0138bda07mr3712021plo.53.1611697264902; 
 Tue, 26 Jan 2021 13:41:04 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id md7sm3036738pjb.52.2021.01.26.13.41.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 26 Jan 2021 13:41:04 -0800 (PST)
Date: Wed, 27 Jan 2021 06:41:02 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH V6 0/6] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <20210126214102.GC3564@localhost.localdomain>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
 <20210126203929.GB23059@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210126203929.GB23059@redsun51.ssa.fujisawa.hgst.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102d.google.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-27 05:39:29, Keith Busch wrote:
> This came out looking cleaner than I had initially expected. Thanks for
> seeing this feature through!
> 
> Reviewed-by: Keith Busch <kbusch@kernel.org>

Thanks Keith for the review!

