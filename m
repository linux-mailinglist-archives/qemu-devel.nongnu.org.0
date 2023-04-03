Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADA56D42E1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 13:04:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjHzA-0002zj-0k; Mon, 03 Apr 2023 07:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pjHz0-0002xS-BC
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 07:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pjHyw-0003G4-P8
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 07:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680519854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sAxYdPwQmY6qjt1qcXjJPeKGUALD+YWn+JnpUmxxw/M=;
 b=L2M+wuMDYHaVrBr54iWNRlSlkuv2BrCpUliexv/y5xztzHL0IQ3v9Zf+AZFpYpEY2IJqhx
 FzyASJ26ukVJFsuhJa8i+XcjJvpr3iryRdQRcWj/rY+5vmfWyiK1kuJOXhgGmMeYa0KKbL
 XYUkeZD/9PPQlvc7y68Zrficf+RIm6A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-20Wsy4FKOjW20LGAI7IkAg-1; Mon, 03 Apr 2023 07:04:08 -0400
X-MC-Unique: 20Wsy4FKOjW20LGAI7IkAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5114C3C18340;
 Mon,  3 Apr 2023 11:04:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04D302166B26;
 Mon,  3 Apr 2023 11:04:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A445C1800393; Mon,  3 Apr 2023 13:04:06 +0200 (CEST)
Date: Mon, 3 Apr 2023 13:04:06 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: devel@edk2.groups.io, mcb30@ipxe.org
Cc: lichao@loongson.cn, maobibo@loongson.cn, 
 WANG Xuerui <i.qemu@xen0n.name>, qemu-devel <qemu-devel@nongnu.org>, 
 Song Gao <gaosong@loongson.cn>,
 =?utf-8?B?5p2o5bCP5aif?= <yangxiaojuan@loongson.cn>
Subject: Re: [edk2-devel] On integrating LoongArch EDK2 firmware into QEMU
 build process
Message-ID: <wkju3vayu3e2wtqmxakigrliv7ifj4ecd7ympkgwlacf7h4ckx@jnkqqqujdycf>
References: <1f1d3d9f-c3df-4f29-df66-886410994cc3@xen0n.name>
 <67517424-0f32-09f8-6446-53f71ebd59b5@loongson.cn>
 <x5vbhjcyc3jl5u3qdjg2dq2znwhdq7ordmbjm6s2hftwyusqp2@r6smasorrjor>
 <317e3008-e2bd-8af6-2cf5-dad49d98cb8d@loongson.cn>
 <acbba848-d770-2d17-f3eb-60b87bfa9447@loongson.cn>
 <aa56f4de-e50e-7a7f-3e0e-39e5fa20df29@loongson.cn>
 <0102018746aa8382-eabf5475-59a6-4741-a8b1-ca3d5b49da92-000000@eu-west-1.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0102018746aa8382-eabf5475-59a6-4741-a8b1-ca3d5b49da92-000000@eu-west-1.amazonses.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Apr 03, 2023 at 10:29:52AM +0000, Michael Brown wrote:
> On 03/04/2023 11:13, Chao Li wrote:
> > This problem is because the gcc-12 does not yet to support the option
> > 'mno-explicit-reloc', this option is used to open the new reloaction
> > type for LoongArch, this new feature is very important for LoongArch,
> > because it can reduce the binary size and improve code execution
> > efficiency, so we turn it on when submitting the code to the EDK2 repo.
> 
> Is it possible to produce a _functional_ LoongArch64 EDK2 binary without
> this option, even if the resulting binary is less efficient?

MdePkg/Include/IndustryStandard/PeImage.h lists a single loongarch
relocation type only, which I expect being the new type.  So I suspect
the answer is "no" because the edk2 pe loader isn't able to handle the
old relocation type(s).

take care,
  Gerd


