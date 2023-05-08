Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D406FB939
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 23:16:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw8Cl-0003gs-4i; Mon, 08 May 2023 17:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw8Ci-0003gI-C8
 for qemu-devel@nongnu.org; Mon, 08 May 2023 17:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw8Cg-00068L-Od
 for qemu-devel@nongnu.org; Mon, 08 May 2023 17:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683580529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m2NxcKQilumwAgK8Qt8bM2fBEoT5RjhF5U6gaXg2x9Y=;
 b=En46a+uig/XClS1js1NnOumFsFdkJCK/t74602+nU4+ypdKspGFFdK1l3GpY1FJuz4lNNr
 o++LQ+ry+EKtSDv5gkDdSA3p99XdJxbpPTAlSDaMkF25py/Xl2mvqYjfqugfa8MhUqlokG
 mynkNP1TO98qdUNtDXgVASg5GvFMmPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-3qOHSHpeMIOwS5OZ_4EVww-1; Mon, 08 May 2023 17:15:24 -0400
X-MC-Unique: 3qOHSHpeMIOwS5OZ_4EVww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C72E1185A790;
 Mon,  8 May 2023 21:15:23 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39E5B40C6F41;
 Mon,  8 May 2023 21:15:23 +0000 (UTC)
Date: Mon, 8 May 2023 16:15:21 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 07/11] numa: Check for qemu_strtosz_MiB error
Message-ID: <cpnkg7tbc3b3rx2dibz72ayin3qrpzznebhdc3tdga2mxccn4w@gmahxychmiwk>
References: <20230508200343.791450-1-eblake@redhat.com>
 <20230508200343.791450-8-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508200343.791450-8-eblake@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 08, 2023 at 03:03:39PM -0500, Eric Blake wrote:
> As shown in the previous commit, qemu_strtosz_MiB sometimes leaves the
> result value untoutched (we have to audit further to learn that in

untouched

> that case, the QAPI generator says that visit_type_NumaOptions() will
> have zero-initialized it), and sometimes leaves it with the value of a
> partial parse before -EINVAL occurs because of trailing garbage.
> Rather than blindly treating any string the user may throw at us as
> valid, we should check for parse failures.
> 
> Fiuxes: cc001888 ("numa: fixup parsed NumaNodeOptions earlier", v2.11.0)
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


