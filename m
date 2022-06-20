Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CAA552160
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:41:57 +0200 (CEST)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JXI-0003j3-CG
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JVi-0001b8-0k
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JVg-0005ML-Gx
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655739615;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zT5VeqICiMkBp4cU5Pp++ydjS8eUlo/YJcPxZX39W4c=;
 b=hcy04g8KxSuClET1i1DwgwDQdTmmcpviIWnUDLaRCHAz9ZORwx5LV0qIBU9iKAi2ueXPoK
 6YRPPjcD3Tumfe45C3fENEzERgZqcL48LVRC2oEyRV6EcnXoEIDdxCF9lrOvzNziuRP/p3
 rpL6cZMMCHdVkRLgTldznvj27zF2UXg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-gJa83dlbOaad4grTuwQ_5A-1; Mon, 20 Jun 2022 11:40:12 -0400
X-MC-Unique: gJa83dlbOaad4grTuwQ_5A-1
Received: by mail-wm1-f70.google.com with SMTP id
 k32-20020a05600c1ca000b0039c4cf75023so7027272wms.9
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zT5VeqICiMkBp4cU5Pp++ydjS8eUlo/YJcPxZX39W4c=;
 b=LKq43hDBhU1jezyEtg1bDfC1CopPsFmzuvWlY+mlXuKqSTMtBElaLq0+xarV7t8C1C
 XiL5u2s9LoPBoSfuE8u43s98xJ9ESyo7QKmDJSCk8zb/jNlFCT2OopwJ6yOxDhejRf8h
 IKcPkJPzGJ7gyD/+wYt1s/bbALX3jprVFsVjW+Gvubxj8vq33ys+Kj4wvfPmXagkG1Tl
 m3Gjs846fgk3TocjahK0o2wlT1bJ8kNXq8hWmwdqieZ//ZvlmybVdOI31O48lp2wQt2N
 4h5BqDaHHDXDgdvdkzTfoYKAM1bJ1t3rmAwIPolA776Gp2/V+wFK9FcamgG8hHqoQh/G
 p7ww==
X-Gm-Message-State: AOAM532MylQ/8rNVMGPi1kcA1Bv3Q9QasECPRbJudrjCzdR7UC//vKk1
 PGyQfbphVny/aNfGFpXGVGWOfgtwLf59IYiEaMi2C84sEDDJCr0JQ7dxGn1sE0coN7w6wwxJ0+h
 1B0P1LjJxkCK1lkc=
X-Received: by 2002:a05:600c:500d:b0:39c:5890:7cb3 with SMTP id
 n13-20020a05600c500d00b0039c58907cb3mr36048738wmr.178.1655739611350; 
 Mon, 20 Jun 2022 08:40:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfaeHXtP+MMzsecBHdSR9a9UbNbl7a2UqTLVrKno5BzCwyOvd0MHD8r03RBe2wnPKT4A+uRw==
X-Received: by 2002:a05:600c:500d:b0:39c:5890:7cb3 with SMTP id
 n13-20020a05600c500d00b0039c58907cb3mr36048714wmr.178.1655739611167; 
 Mon, 20 Jun 2022 08:40:11 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 y12-20020a5d620c000000b0021b866397a7sm8001661wru.1.2022.06.20.08.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:40:10 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 17/21] migration: remove the QEMUFileOps 'close'
 callback
In-Reply-To: <20220620110205.1357829-18-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:02:01
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-18-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:40:09 +0200
Message-ID: <87edzj1gyu.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> This directly implements the close logic using QIOChannel APIs.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


