Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46015879ED
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:35:33 +0200 (CEST)
Received: from localhost ([::1]:52336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoJI-0005nV-F8
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oInrt-0002It-6B
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:07:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oInrr-0004DQ-7j
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659431230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VtCNqejqMQXvDmahwk1Wxkn4iLGWkKAtHNb/99Vr8ZI=;
 b=IKx9cKxzc3WMsab8US1Sxj7fNIrsvuhIzCAe7nObqc57uNnTQ2AEEnnytYZ38SCXAZ7IqJ
 8/0d88n3v0mRrFtDM8/ZIgaAdy/oqvUEcn83a/lSK77xSWQs0izbvLUEEmL5Yq41tOAulf
 mERIzEl4WuGgwgXYnsZpcIab9r5Tk3k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-ZoSXw80MMXGSM1VkQ2XwmA-1; Tue, 02 Aug 2022 05:07:07 -0400
X-MC-Unique: ZoSXw80MMXGSM1VkQ2XwmA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFA643826245;
 Tue,  2 Aug 2022 09:07:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8150403166;
 Tue,  2 Aug 2022 09:07:05 +0000 (UTC)
Date: Tue, 2 Aug 2022 11:07:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: stefanha@redhat.com, armbru@redhat.com, richard.henderson@linaro.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/3] Fix some coverity issues on VDUSE
Message-ID: <YujpOEwIpOcryVij@redhat.com>
References: <20220706095624.328-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706095624.328-1-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.07.2022 um 11:56 hat Xie Yongji geschrieben:
> This series fixes some issues reported by coverity.
> 
> Patch 1 fixes a incorrect function name.
> 
> Patch 2 fixes Coverity CID 1490224.
> 
> Patch 3 fixes Coverity CID 1490226, 1490223.
> 
> V1 to V2:
> - Drop the patch to fix Coverity CID 1490222, 1490227 [Markus]
> - Add some commit log to explain why we don't use g_strlcpy() [Markus]

Thanks, applied to the block branch.

Kevin


