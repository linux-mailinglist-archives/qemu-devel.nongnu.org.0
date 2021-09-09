Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB2140463F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 09:35:00 +0200 (CEST)
Received: from localhost ([::1]:38298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOEaK-0000ln-T5
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 03:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOEWY-0007cl-Ez
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:31:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOEW7-00088V-Hx
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631172638;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=m+0hXAjDuVXRjidJWy9+wWwbUvpcSMIRDzNu+TWxBUE=;
 b=fyKlBJid2IhdkCdrfzQsVFBVxokRXMBOZUDlc0Eqgx0BwoxvkduDKRXE4h/Lc3EbUhwzcA
 e5LC8/qscaKmDgMp9CYgP+2h36cWY63RY9MBo+u7luNqXCdqp+XLmShFmYwHllvnLCilBh
 lp4bF3ZoVsIDh0KqcjDEVflcy6reXvM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-tX_lxzttNjiLmYaKdNaSTQ-1; Thu, 09 Sep 2021 03:30:37 -0400
X-MC-Unique: tX_lxzttNjiLmYaKdNaSTQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p29-20020a1c545d000000b002f88d28e1f1so413911wmi.7
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 00:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=m+0hXAjDuVXRjidJWy9+wWwbUvpcSMIRDzNu+TWxBUE=;
 b=OxUQtVBzoGaCZq0eKDsRJhdivndsKl4rsn2g9wXysDKHwkuIFB0xCFTn21EqbDS7bv
 XCZk/Xkx9izn9F5kl7Ayi7QtAhWxtcM46+m4e50GXecXMfy0JS5tqpWoZcnzf4fMcIV3
 tVOTNOkOIi6WIEyyC21yiApQ6wIxFWP0XwrG+PIzPUnZThP6hCK705hUNXnkrm+UioUy
 OQPxjwm6jGyzOhf1a9dzehStE+jOxQV9Gw5P+N7A9rucIdLIpHTqJdOHvUdtUojsGl7K
 hWjBef8DoJu0PHlMAOc2sZklocpFwKL1Nz9PS28nnGAThYZwp8m/vo3c1smBVarryRI5
 gYUg==
X-Gm-Message-State: AOAM531LcFnzkTTWKbQhOcTP23pIRYUyYWd1ueETbfLlvAiDIuqeYhFK
 zZLBo1L4weumrYRDmIyNLj7+LAhsmkgSSfgNU19H6jPu/fYnT2N4YPA6ktDcM1K5M2/6K3juM4A
 6oK6JnIRpfTIv/VE=
X-Received: by 2002:a05:600c:215a:: with SMTP id
 v26mr1363920wml.152.1631172635870; 
 Thu, 09 Sep 2021 00:30:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnZlu26fsiD/PlWSA+bf+NTRoMJJzJKH2/PN3c9ksmEiQEoScEpAJb6GwG1CM+PvkUI+UsPg==
X-Received: by 2002:a05:600c:215a:: with SMTP id
 v26mr1363907wml.152.1631172635741; 
 Thu, 09 Sep 2021 00:30:35 -0700 (PDT)
Received: from localhost (static-41-120-85-188.ipcom.comunitel.net.
 [188.85.120.41])
 by smtp.gmail.com with ESMTPSA id c9sm915166wrf.77.2021.09.09.00.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 00:30:35 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH v2 2/2] migration: allow enabling mutilfd for specific
 protocol only
In-Reply-To: <20210731140552.8818-2-lizhijian@cn.fujitsu.com> (Li Zhijian's
 message of "Sat, 31 Jul 2021 22:05:52 +0800")
References: <20210731140552.8818-1-lizhijian@cn.fujitsu.com>
 <20210731140552.8818-2-lizhijian@cn.fujitsu.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 09 Sep 2021 09:30:34 +0200
Message-ID: <87pmtib3z9.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
> And change the default to true so that in '-incoming defer' case, user is able
> to change multifd capability.
>
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


