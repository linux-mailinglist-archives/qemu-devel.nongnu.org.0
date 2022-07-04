Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC556577D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:36:26 +0200 (CEST)
Received: from localhost ([::1]:41588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MFV-0001d8-DV
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lk1-0008TR-RZ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:03:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Ljz-0008OH-HK
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CTbao4t+F4SCuJQ1B6pR5OPhoswvjDOgkJuiy2GokWg=;
 b=cEyiXR3DPk2uHbC6WSd3eW0MX77rayKAZKS0+Jaz0uxN7bqlFbsLIXOb084leMqPkJ6uHs
 3Q/bC25sYAB/vxZx6z9Y5SlN5nLGb5Q1VOZ00U6CAxbnY4c86QstvbyBNNyo0WOW7pyoXL
 bc1M2pjksswxq7vt/sQu3peibssh7qo=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-IN0wK7JkMp6u_A7Rp1bQfg-1; Mon, 04 Jul 2022 09:03:49 -0400
X-MC-Unique: IN0wK7JkMp6u_A7Rp1bQfg-1
Received: by mail-il1-f199.google.com with SMTP id
 z18-20020a056e02089200b002dab7cef3d2so4188651ils.16
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTbao4t+F4SCuJQ1B6pR5OPhoswvjDOgkJuiy2GokWg=;
 b=G3NH5kfaa0DZ0iZ2fhL8VNKt26Zet5RoJpzcl4k5k8c1Grsyw9UM/vzoS/j5XFunS5
 X3gXnF/j0wuowVsNCz3ltOjU/1Bcpy2/iA83N934qZHWBB0+8xCkmFDikSGVk+xJWjI9
 Wdgbgf8Ub3jvfMX4KDHFWPEVMkRTLqURyDiAdQS/t9RBA1ATn2CYqxKYjU1owMXMAbNX
 7xMGVqJ0jTtrh4iYy1FOKfrnl2tBzLIEssOeN0sjNCUOhrheh5bEdW39dAvV1fO8YpII
 Wjgs2REij8MdYGRehvBf/7DvDqA94MXA0XY+YRZvsg1YjTOLApjk2hK0on2gLX4qGI+5
 GJMg==
X-Gm-Message-State: AJIora+wk+oxrjbRcV2Ze/4FEYPp9qn+hPW14Sw669hjedHdjVgbsPYn
 Wu4jth090HQAt/DC7Kk3mEjRQh4XAWuu/Ie02osaS6qvN+YSeTfmCT4sDgNJABbCy2gmdgnyzYv
 7273PhR1aWQdGZ7zCUCtpW8bEoHCDIuI=
X-Received: by 2002:a05:6e02:f92:b0:2da:6799:789 with SMTP id
 v18-20020a056e020f9200b002da67990789mr16757711ilo.3.1656939828952; 
 Mon, 04 Jul 2022 06:03:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uKTP/lxZkGPP8Yto5waofnut4TTi+XneWbqBB/KBz/5zuE+JE/wfYuCVSUN3t6suypV7Bbg/obn3Bkg5afipk=
X-Received: by 2002:a05:6e02:f92:b0:2da:6799:789 with SMTP id
 v18-20020a056e020f9200b002da67990789mr16757704ilo.3.1656939828746; Mon, 04
 Jul 2022 06:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-23-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-23-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 14:03:13 +0100
Message-ID: <CAELaAXwEX4DJzO1=1ZCTdgkZ+U9fB_FLqYgBVj4+G7ZeQY9DiA@mail.gmail.com>
Subject: Re: [PATCH v2 22/26] coroutine-lock: add missing coroutine_fn
 annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 9, 2022 at 12:13 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-coroutine-lock.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


