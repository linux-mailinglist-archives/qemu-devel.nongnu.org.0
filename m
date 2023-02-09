Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822D691162
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 20:32:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQCdw-0007S1-Ae; Thu, 09 Feb 2023 14:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQCdu-0007Om-I1
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:31:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQCdt-0008Bb-0l
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675971095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qNw3D23zwRvkskwrNfVvr7C8lV5r1vtw3fgnJq2/GFc=;
 b=SfakNsVsZ7iXTl0o4p07GwPutSfc/BgQrzNNMq3dFfb0++TpOpOgkpcwuLts3ddSB5AdPM
 PH8IK+2lvULSmysyvZMT8QfyWBMx9b+0RKmZGY74ZgoI94vnzjiCUKjqjmmaXlia4reUmR
 Eca7h2s1Qk3mBBEx3hgKpvjkdb7tVfU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-511-qigeXEEhMj-jwYGYCtyq3g-1; Thu, 09 Feb 2023 14:31:34 -0500
X-MC-Unique: qigeXEEhMj-jwYGYCtyq3g-1
Received: by mail-wm1-f70.google.com with SMTP id
 iz20-20020a05600c555400b003dc53fcc88fso1422628wmb.2
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 11:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qNw3D23zwRvkskwrNfVvr7C8lV5r1vtw3fgnJq2/GFc=;
 b=iLP5qP19PakG0OnJeyGXETPtbRml3FiNhy6nkftvrzdu0Ce/wC2XzOY1GOB9ACVMlD
 rJu8JaXrftGZ4SfsYj44HXSxbeRWyyLa/5ST7/S5zDu765LAan6rd6vWpR47Uv5b6l66
 2lWRxDhaYBUPzu79dj/Rpm767/8HmGYSkKDkeLgxBzKDzLU4MjRNfOPQX+vYh646zAcw
 Qcy32zqeJq7PJCzasAaRsrOtDPUDjEvSk9qoXJn8CHgZaQb204eMgpzvVgF8tning3eh
 eomWYNEyiRSsH3yJiElhxDc9WrkBW/TfAVKTHgAneJvKRuekHh8KH008+j5xs4DxCGYS
 YDcg==
X-Gm-Message-State: AO0yUKWq3AU7ziX65LKiZK78uGtPtw0KsUphW/OJLp1sRFkmm/2GkQJy
 BPSlRF12jXfpmk5G1lKWvuQpQgQjvyTytKpU0Oe7umbvTEwTC8Azw7p/fPTKklBsk8q5Vqyglgc
 ib9QjZcFtIyxLwGA=
X-Received: by 2002:a05:600c:4fc8:b0:3df:9858:c03f with SMTP id
 o8-20020a05600c4fc800b003df9858c03fmr7366848wmq.20.1675971093569; 
 Thu, 09 Feb 2023 11:31:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+QPGJTinUZpdFFCJR44y/IMubXxodcswt/7Bo26Ea3qWpKmHcz9/aYC2RvGTkM3OyfuLk2KQ==
X-Received: by 2002:a05:600c:4fc8:b0:3df:9858:c03f with SMTP id
 o8-20020a05600c4fc800b003df9858c03fmr7366830wmq.20.1675971093376; 
 Thu, 09 Feb 2023 11:31:33 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a3-20020a05600c224300b003db01178b62sm5837030wmm.40.2023.02.09.11.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 11:31:32 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: ling xu <ling1.xu@intel.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  Zhou Zhao
 <zhou.zhao@intel.com>,  Jun Jin <jun.i.jin@intel.com>
Subject: Re: [PATCH v7 2/2] Update bench-code for addressing CI problem
In-Reply-To: <20221116152923.1087185-3-ling1.xu@intel.com> (ling xu's message
 of "Wed, 16 Nov 2022 23:29:23 +0800")
References: <20221116152923.1087185-1-ling1.xu@intel.com>
 <20221116152923.1087185-3-ling1.xu@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 20:31:31 +0100
Message-ID: <875yca3ab0.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ling xu <ling1.xu@intel.com> wrote:
> Unit test code is in test-xbzrle.c, and benchmark code is in xbzrle-bench.c
> for performance benchmarking. we have modified xbzrle-bench.c to address
> CI problem.
>
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


