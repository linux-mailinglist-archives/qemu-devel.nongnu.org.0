Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116995F1EFC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 21:25:32 +0200 (CEST)
Received: from localhost ([::1]:46846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oei78-0002Lh-MB
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 15:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oei64-0000v7-HY
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 15:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oei60-0005Gv-2G
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 15:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664652258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BNeWKLB2bo1ku3Cpvj3RwF/+yi87drxHaenYIfcft9o=;
 b=h0zRbn6ZkllyvT/RKahzsw/0Rj2YpkMqpylKJMN7j+LNplXl/irIYLLzXbLCjY3adinXAS
 BuRX64MhBInsGUTd7jSfcazO05C9qZsAAtaAXHZAB5/GNQ483MrFlRq03IweOBmfrYQ1cY
 mH74i//xL0ZlImh51ZYqSHyhHrtap4U=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-512-It-VB7noPKymCQI8lQjpRg-1; Sat, 01 Oct 2022 15:24:16 -0400
X-MC-Unique: It-VB7noPKymCQI8lQjpRg-1
Received: by mail-vk1-f198.google.com with SMTP id
 f197-20020a1f38ce000000b003aa0a881820so57650vka.0
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 12:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BNeWKLB2bo1ku3Cpvj3RwF/+yi87drxHaenYIfcft9o=;
 b=TAGV+SoFqncEBPwlFofGaZxKRznPzYEAQOta3+XMDP/qrbzkpWCVISAtJX3pWBjeB2
 muMG/ksl1JYCoYIHXyrBXEMsg63XUjYAPkqbjob/QEiZ7Ku09TVitQspVhQIEmCYtw9E
 sa4nF1EAqJlQ+FCzaos+1/EYtvNXAs9YklOrbCbnltM6M7t/tTDLQhbZJxWsupmluRJh
 f9ahheU+dhrB+Ze98qe8Yb3JSml58yHztIEXQ4FNn7S31zAxLIFNNPKFCIgQofO1f913
 TtX0X6rD71j2Z2yLztK/E8sOyfFCxAOtrAuvmnrK6/gUwkM8C+qCXhtosFOf1hUFU0EH
 8BqQ==
X-Gm-Message-State: ACrzQf3Vvtrx6pjliu71O6H4WrFEUHwdIvcHrcg6vf5Txwerujc+QjQI
 VWf/y+Jcs1NzhmUWddO505kXz8zz+Gt3bG1BL1yn29hmcBHWAhiDMCcjB3Gfx8NSFbmX7Nq75kr
 vAPsb176D/m4QOZNYxZHBYtHJKH5wMUc=
X-Received: by 2002:a05:6102:348:b0:3a6:4240:6d3e with SMTP id
 e8-20020a056102034800b003a642406d3emr930541vsa.16.1664652256119; 
 Sat, 01 Oct 2022 12:24:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM47N5LLFf7xl0PjCv0URWxuXgte71sL0MpdilKs1r31y2M03VXiaX6KWSycjB1RhE5KG81hwAcIpoMX514HvDE=
X-Received: by 2002:a05:6102:348:b0:3a6:4240:6d3e with SMTP id
 e8-20020a056102034800b003a642406d3emr930539vsa.16.1664652255808; Sat, 01 Oct
 2022 12:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220930091033.34379-1-pbonzini@redhat.com>
 <CAJSP0QUCtok_yXm5T+V7CCo1puznR_qLxuGvT6UXo0WpCo-oow@mail.gmail.com>
In-Reply-To: <CAJSP0QUCtok_yXm5T+V7CCo1puznR_qLxuGvT6UXo0WpCo-oow@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 1 Oct 2022 21:24:04 +0200
Message-ID: <CABgObfb_zH_iBO5BrBa083vh1JkM8TYh+84YMH0oz+S47tnU+Q@mail.gmail.com>
Subject: Re: [PULL v2 00/15] x86 + misc changes for 2022-09-29
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 1, 2022 at 1:01 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> This pull request doesn't build:
>
> ../meson.build:545:95: ERROR: Expecting endif got rparen.
> gdbus_codegen_error = '@0@ uses gdbus-codegen, which does not support
> control flow integrity')
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3112498668

I'm really sorry. :( I have now pushed the delta, but I'll wait for CI
to pass and send a pull request on Monday.

Paolo


